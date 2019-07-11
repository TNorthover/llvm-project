#!/usr/bin/env python3
import os, sys,re

bracket_depth = 0

ADDRSPACE_BACK = re.compile(r'\s*\)(\d+)\(ecapsrdda\s*')
PTR_TAIL = re.compile(r'(\s*(addrspace\(\d+\))?\s*\*\s*)*?(\s*addrspace\((?P<addrspace>\d+)\)\s*\*\s*)?')
TOK = re.compile(r'{{|\[\[|\*')

def find_ptr_end(text, asterisk_pos):
    m = PTR_TAIL.search(text, asterisk_pos + 1)
    addrspace = m.group('addrspace')
    return (m.end(), addrspace)

def find_ptr_start(text, asterisk_pos=None):
    addrspace = 0
    if asterisk_pos == None:
        asterisk_pos = text.rfind('*')

    pos = asterisk_pos - 1

    space_pos = text.rfind('addrspace', 0, pos)
    if space_pos != -1:
        m = ADDRSPACE_BACK.match(text[pos:space_pos-1:-1])
        if m:
            addrspace = m.group(1)[::-1]
            pos -= m.endpos
    
    # Strip trailing spaces
    while text[pos].isspace():
        pos -= 1
    
    if text[pos] in '}]>)':
        bracket_depth = 1
        function_type = text[pos] == ')'

        while bracket_depth != 0:
            pos -= 1

            if text[pos] in '}]>)':
                bracket_depth += 1
                continue
            if text[pos] in '{[<(':
                bracket_depth -= 1
                continue
        if not function_type:
            return pos, addrspace
        # Skip opening paren
        pos -= 1

    while text[pos].isspace():
        pos -= 1

    while text[pos].isalnum() or text[pos] in '%._':
        pos -= 1

    return pos + 1, addrspace

def convert_string(s):
    m = TOK.search(s)
    iter_count = 0
    while m:
        found = m.group()
        if found == '{{':
            pos = s.find('}}', m.end())
        elif found == '[[':
            pos = s.find(']]', m.end())
        else:
            end_pos, addrspace = find_ptr_end(s, m.start())
            start_pos, addrspace_before = find_ptr_start(s, m.start())

            if addrspace == None:
                addrspace = addrspace_before

            s = s[:start_pos] + f'p{addrspace} ' + s[end_pos:]
            pos = start_pos + 3
        
        if pos == -1:
            break

        m = TOK.search(s, pos)
        iter_count += 1
        if iter_count > 1000:
            print(f'INFINITE LOOP: {s}')
            sys.exit(1)
    return s


def main():
    f = open(sys.argv[1], 'r')
    new_file = ''
    
    for line in f.readlines():
        new_file += convert_string(line)

    f.close()
    f = open(sys.argv[1], 'w')
    f.write(new_file)

if __name__ == '__main__':
    main()
