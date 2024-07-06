reservation_banks_range = {
    "FADD": (1,3),
    "FMUL": (4,5),
    "ADD" : (6,8),
    "MUL" : (9,10),
    "LD" : (11,13),
    "ST" : (14,16),
    "AND" : (17, 18),
    "XOR" : (19, 20),
    "NAND" : (21, 22),
    "OR" : (23, 24),
    "NOT" : (25, 26),
    "NOR" : (27, 28),
    "NEG" : (29, 30),
    "XNOR" : (31, 32),
}

cycles_required = {
    "FADD": 10,
    "FMUL": 20,
    "ADD" : 7,
    "MUL" : 11,
    "LD" :  1,
    "ST" : 1,
    "AND" : 3,
    "XOR" : 3,
    "NAND" : 3,
    "OR" : 3,
    "NOT" : 3,
    "NOR" : 3,
    "NEG" : 3,
    "XNOR" : 3
}

logical_opreations_opcode = {
    "AND" : "000",
    "XOR" : "001",
    "NAND" : "010",
    "OR" : "011",
    "NOT" : "100",
    "NOR" : "101",
    "NEG" : "110",
    "XNOR" : "111"
}


opcode = [
    "Invalid",
    "FADD",
    "FADD",
    "FADD",
    "FMUL",
    "FMUL",
    "ADD",
    "ADD",
    "ADD",
    "MUL",
    "MUL",
    "LD",
    "LD",
    "LD",
    "ST",
    "ST",
    "ST",
    "AND",
    "AND",
    "XOR",
    "XOR",
    "NAND",
    "NAND",
    "OR",
    "OR",
    "NOT",
    "NOT",
    "NOR",
    "NOR",
    "NEG",
    "NEG",
    "XNOR",
    "XNOR"
]










# opcode = {
#     '000000' : 'ADD',
#     '000001' : 'SUB',
#     '000010' : 'MUL',
#     '000011' : 'FADD',
#     '000100' : 'FSUB',
#     '000101' : 'FMUL',
#     '000110' : 'LD',
#     '000111' : 'ST',
#     '001000' : 'AND',
#     '001001' : 'XOR',
#     '001010' : 'NAND',
#     '001011' : 'OR',
#     '001100' : 'NOT',
#     '001101' : 'NOR',
#     '001110' : 'NEG',
#     '001111' : 'XNOR'
# }