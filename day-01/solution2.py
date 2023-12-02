def findDigits(input_string):
    digits = []
    for character in input_string:
        if character.isdigit():
            digits.append(character)
    
    
    firstLast = [digits[0], digits[-1]]
    return int(''.join(firstLast))
            
            
file1 = open("input_file.txt")

summa = 0
linesList = file1.readlines()

for line in linesList:
    summa += findDigits(line)
    
print(summa)
