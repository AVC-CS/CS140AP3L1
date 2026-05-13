import re

def regex_test(expected, lines):
    i = 0 ; match = 0
    for token in expected:
        # for j in range(i, len(lines)):
        while i < len(lines): 
            res = re.search(token, lines[i])
            if res is not None:
                match += 1
                break
            else:
                i += 1
        else:
            print(f'\033[43m Not Found: {token} \033[0m')
            assert False, f'Expect: {expected}, but got: {lines}'
    else:
        print(f'\033[43m match count: {match} \033[0m')
        assert match == len(expected), f'Expect: {expected}, but got: {lines}'


def test_main_1():
    with open('output.txt', 'r') as f:
        lines = f.readlines()
        lines = [line.strip() for line in lines]
        print(lines)
        match_words = [rf'[\w,\W]*6(?:\s+|$)'] 
        regex_test(match_words, lines)
