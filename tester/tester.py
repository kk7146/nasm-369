def game_369(n):
    result = []
    for i in range(1, n + 1):
        str_i = str(i)
        res = ""
        for char in str_i:
            if char in '369':
                res += '*'
            else:
                res += '-'
        result.append(res)
    return ' '.join(result)

n = int(input())
print(game_369(n))
