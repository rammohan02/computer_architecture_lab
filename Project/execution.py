import os

from numericals import(
    decimal_to_fp,
    fp_to_decimal,
    dec_to_binary,
    binary_to_dec
)

logic_opde = {
    "AND" : '000',
    "XOR" : '001',
    "NAND" : '010',
    "OR" : '011',
    "NOT" : '100',
    "NOR" : '101',
    "NEG" : '110',
    "XNOR" : '111'
}

# returns the file content based upon the opname
def modified_testbench_content(a, b, sel, opname):
    content = list()
    tmp = 0
    if(opname == 'ADD'):
        content = ['`include "verilog_files/rdca_str.v"\n', 'RCDA rcda1(a, b, 1\'b0, out, carry);\n']
    elif(opname == 'FADD'):
        content = ['`include "verilog_files/fp_adder.v"\n', 'FP_ADDER fpadder1(a, b, out);\n']
    elif(opname == 'MUL'):
        content = ['`include "verilog_files/wallace_64.v"\n', 'WALLACE wallace1(a, b, pro, carry);\n']
    elif(opname == 'FMUL'):
        content = ['`include "verilog_files/fp_multiplier.v"\n', 'FP_MUL fpmul1(a, b, out);\n']
    else:
        content = ['`include "verilog_files/logic_unit.v"\n', 'LOGIC_UNIT logicunit1(a, b, sel, out);\n']
        tmp = 1

    content.append("\ta = 64'b"+ str(a) + ";\n")
    content.append("\tb = 64'b"+ str(b) + ";\n")
    if(tmp==1):
        content.append("\tsel = 3'b"+ str(sel) + ";\n")
    return content

def prepare_testbench(filename, a, b, sel, opname):
    mod_content = modified_testbench_content(a, b, sel, opname)
    # print(mod_content)

    input_file = open(filename, "r")
    input_data = input_file.readlines()

    # for i in range(len(mod_content)):
    #     print(f"I: {str(i)} {mod_content[i]}")

    # for i in range(len(input_data)):
    #     print(f"I: {str(i)} {input_data[i]}")
    
    input_data[0] = mod_content[0]      # headerfile inclusion
    input_data[17] = mod_content[1]     # call the right exec unit
    input_data[21] = mod_content[2]     # change value of a
    input_data[22] = mod_content[3]     # change value of b
    if(sel!=None):
        input_data[23] = mod_content[4]

    if(opname=='MUL'):
        input_data[27] = '$monitor("%b", pro);\n'
    else:
        input_data[27] = '$monitor("%b", out);\n'
    
    input_file = open(filename, "w")
    input_file.writelines(input_data)

# returns the output after execution
def execute(a, b, opname):
    # print(a, b)
    sel = None
    filename = 'testbench.v'
    if(opname == "ADD" or opname == "MUL"):
        a = dec_to_binary(int(a))
        b = dec_to_binary(int(b))
    elif(opname == "FADD" or opname == "FMUL"):
        a = decimal_to_fp(a)
        b = decimal_to_fp(b)
    else:
        a = dec_to_binary(int(a))
        b = dec_to_binary(int(b))
        sel = logic_opde[opname]

    # print(a, b, opname)
    
    prepare_testbench(filename, a, b, sel, opname=opname)
    stream = os.popen('iverilog ' + filename + ' && vvp a.out')
    output = stream.readline().rstrip()

    # print(output)
    if(opname == "ADD" or opname == "MUL"):
        output = binary_to_dec(output)
    elif (opname == "FADD" or opname == "FMUL"):
        output = fp_to_decimal(output)
    else:
        output = binary_to_dec(output)
    # print(f"Executed {opname} {a} {b} = {output}")
    output_write = open('output.txt', 'w')
    output_write.write(str(output))
    return output



# def main():
#     a=-5.0005
#     b=1.5005
#     cin = 0
#     print(execute(a, b, opname='FADD'))

# if __name__=="__main__":
#     main()