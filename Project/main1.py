import imp
import memory
from numericals import (
    hexa_to_decimal
)
import reservation_station
from dictionaries import(
    opcode,
    reservation_banks_range,
    cycles_required
)
from execution import execute


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

# opcode = {
#     'ADD' : '000000',
#     'SUB' : '000001',
#     'MUL' : '000010',
#     'FADD' : '000011',
#     'FSUB' : '000100',
#     'FMUL' : '000101',
#     'LD' : '000110',
#     'ST' : '000110',
#     'AND' : '001000',
#     'XOR' : '001001',
#     'NAND' : '001010',
#     'OR' : '001011',
#     'NOT' : '001100',
#     'NOR' : '001101',
#     'NEG' : '001110',
#     'XNOR' : '001111'
# }
# opcode_key_list = list(opcode.keys())
# opcode_val_list = list(opcode.values())

# Getting the available reservation bank for the corresponding operation/functional unit
def get_available_bank(opname):
    for i in range(reservation_banks_range[opname][0], reservation_banks_range[opname][1]+1):
        # print("i: " + str(i))
        if(not(reservationStations.list[i].is_occupied)):
            return reservationStations.list[i]

# self.num = num       # the reservation station number
# self.instruction_no = 0  # instruction currently being executed
# self.tag1 = -1
# self.source1 = 0
# self.tag2 = -1
# self.source2 = 0
# self.destination = 0
# self.finish_time = -1
# self.is_occupied = False
# self.result = 0           # answer of computation
# self.is_executing = False
# Filling details to the allocated reservation bank

def source_setter(allocated_bank, opname, src1, src2):
    # Do this after checking whether register is available or not
    if(src2[len(src2)-1]=='H'):
        print('H')

        # if(opname=='LD'):
        #     for each in Registers.list:
        #         if(each.tag==0):
        #             available_reg = each.num
        #             break
            
        #     print('Available Register: ' + str(available_reg))

        #     mem_add = src2[0:len(src2)-1]
        #     Registers.list[int(available_reg)].data = mainMemory.read_from_memory(mem_add)
        #     Registers.list[int(available_reg)].tag = allocated_bank.num

        
        register1 = Registers.list[int(src1)]
        
        if(register1.busy):
            print('Reg1 Busy1')
            allocated_bank.tag1 = register1.tag
            allocated_bank.source1 = None
        else:
            print('Reg1 Not busy1')
            allocated_bank.tag1 = 0
            if(allocated_bank.num >= 11 and allocated_bank.num <= 16):
                allocated_bank.source1 = register1.num
            else:
                allocated_bank.source1 = register1.data
            print(str(opcode[allocated_bank.num]) + ': bank.src1 = ' + str(allocated_bank.source1) + ' register.num = ' + str(register1.num))
        
        allocated_bank.tag2 = 0
        allocated_bank.source2 = src2
        # print(src2)
        
    else:
        print('Not H')
        register1 = Registers.list[int(src1)]
        register2 = Registers.list[int(src2)]
        if(register1.busy):
            print('Reg1 Busy')
            allocated_bank.tag1 = register1.tag
            allocated_bank.source1 = None
        else:
            print('Reg1 Not busy')
            allocated_bank.tag1 = 0
            if(allocated_bank.num >= 11 and allocated_bank.num <= 16):
                allocated_bank.source1 = register1.num
            else:
                allocated_bank.source1 = register1.data
            print(str(opcode[allocated_bank.num]) + ': bank.src1 = ' + str(allocated_bank.source1) + ' register.num = ' + str(register1.num))
                
        if(register2.busy):
            print('Reg2 Busy')
            allocated_bank.tag2 = register2.tag
            allocated_bank.source2 = None
        else:
            print('Reg2 Not bust')
            allocated_bank.tag2 = 0
            if(allocated_bank.num >= 11 and allocated_bank.num <= 16):
                allocated_bank.source2 = register2.num
            else:
                allocated_bank.source2 = register2.data
            print(str(opcode[allocated_bank.num]) + ': bank.src2 = ' + str(allocated_bank.source2) + ' register.num = ' + str(register2.num))


    # if(opname=='LD'):
    #     if(src2[len(src2)-1]=='H'):
    #         pass
    #     else:
    #         register1 = Registers.list[int(src1)]
    #         register2 = Registers.list[int(src2)]
            
    #         if(register1.busy):
    #             allocated_bank.tag1 = register1.tag
    #             allocated_bank.source1 = None
    #         else:
    #             allocated_bank.tag1 = 0
    #             if(allocated_bank.num >= 11 and allocated_bank.num <= 16):
    #                 # print(f'{num_to_opcode[bank.num]} : bank.sr1 = {bank.source1} register.num = {register1.num}')
    #                 allocated_bank.source1 = register1.num
    #             else:
    #                 allocated_bank.source1 = register1.data
    #         if(register2.busy):
    #             allocated_bank.tag2 = register2.tag
    #             allocated_bank.source2 = None
    #         else:
    #             allocated_bank.tag2 = 0
    #             if(allocated_bank.num >= 11 and allocated_bank.num <= 16):
    #                 # print(f'{num_to_opcode[bank.num]} : bank.src2 = {bank.source2} register.num = {register1.num}')
    #                 allocated_bank.source2 = register2.num
    #             else:
    #                 allocated_bank.source2 = register2.data

    # elif(opname=='ST'):
    #     if(src2[len(src2)-1]=='H'):
    #         pass
    #     else:
    #         pass
    # else:
    #     register1 = Registers.list[int(src1)]
    #     register2 = Registers.list[int(src2)]
    #     if(register1.busy):
    #         allocated_bank.tag1 = register1.tag
    #         allocated_bank.source1 = None
    #     else:
    #         allocated_bank.tag1 = 0
    #         if(allocated_bank.num >= 11 and allocated_bank.num <= 16):
    #             # print(f'{num_to_opcode[bank.num]} : bank.sr1 = {bank.source1} register.num = {register1.num}')
    #             allocated_bank.source1 = register1.num
    #         else:
    #             allocated_bank.source1 = register1.data
    #     if(register2.busy):
    #         allocated_bank.tag2 = register2.tag
    #         allocated_bank.source2 = None
    #     else:
    #         allocated_bank.tag2 = 0
    #         if(allocated_bank.num >= 11 and allocated_bank.num <= 16):
    #             # print(f'{num_to_opcode[bank.num]} : bank.src2 = {bank.source2} register.num = {register1.num}')
    #             allocated_bank.source2 = register2.num
    #         else:
    #             allocated_bank.source2 = register2.data


def fill_allocated_reservation_bank(allocated_bank, instruction, no_of_banks_available):
    opname = instruction[0]
    dest = None
    src1 = None
    src2 = None

    # Splitting instruction start
    if(opname=='LD' or opname=='ST'):
        if(instruction[1][0]=='R'):
            src1 = instruction[1][1:]
        else:
            src1 = instruction[1][:]
        
        if(instruction[2][0]=='R'):
            src2 = instruction[2][1:]
        else:
            src2 = instruction[2][:]
        
    elif(opname=='NEG'):
        dest = instruction[1][1:]
        src1 = instruction[2][1:]
    else:
        dest = instruction[1][1:]
        src1 = instruction[2][1:]
        src2 = instruction[3][1:]
    
    # Splitting instruction end
    print('Destination: ' + str(dest) + ' Src1: ' + (src1) + ' Src2: ' + str(src2))

    allocated_bank.is_occupied = True
    setattr(reservationStations, opname + '_available', no_of_banks_available - 1) #decrement available banks
    source_setter(allocated_bank, opname, src1, src2)
    allocated_bank.destination = dest
    
    if(opname=='LD' or opname=='ST'):
        allocated_bank.destination = src1
    
    allocated_bank.instruction_no = programCounter
    return dest


def destinationSetter(allocated_bank, dest):
    if(dest is not None):
        dest_register = Registers.list[int(dest)]
    
        if(dest_register.busy):
            # WAW hazard
            dest_register.tag = allocated_bank.num
        else:   # the register in FLR is free
            dest_register.busy = True
            dest_register.tag = allocated_bank.num
        
        print('Reservation num: ' + str(allocated_bank.num) + ' Register: ' + str(dest_register.num))

def handle_load_store(bank, opname):
    # print("Inst No: " + str(bank.instruction_no))
    if(opname == "LD"):
        # print("Source2: " + str(bank.source2))
        source2 = str(bank.source2)
        if(source2[len(source2)-1]=='H'):
            # print(mainMemory.read_from_memory(hexa_to_decimal(source2[0:len(source2)-1])))
            Registers.list[int(bank.source1)].data = mainMemory.read_from_memory(hexa_to_decimal(source2[0:len(source2)-1]))
        else:
            Registers.list[int(bank.source1)].data = Registers.read_from_registers(int(bank.source2))
        
        # Registers.print_registers(0, 20)
    if(opname == "ST"):
        # print("Source2: " + str(bank.source2))
        source2 = str(bank.source2)
        if(source2[len(source2)-1]=='H'):
            mainMemory.write_into_memory(hexa_to_decimal(source2[0:len(source2)-1]), Registers.list[int(bank.source1)].data)
        else:
            mainMemory.write_memory(Registers.list[int(bank.source2)].num, Registers.list[int(bank.source1)].data)


def handle_execution():
    for bank in reservationStations.list:
        # print(bank.num, bank.instruction_no, bank.is_occupied, bank.tag1, bank.source1, bank.tag2, bank.source2, bank.is_executing, bank.finish_time, bank.result)
        if(bank.tag1 == 0 and bank.tag2 == 0 and bank.is_executing == False):
            opname = opcode[bank.num]
            bank.is_executing = True
            print("Inst No: " + str(bank.instruction_no) + " Opname: " + opname)
            if(bank.num >= 11 and bank.num<=16): # a LD or ST operation
                handle_load_store(bank, opname)
            else:
                bank.result = execute(bank.source1, bank.source2, opname)
                # print(bank.result)
            
            bank.finish_time = time + cycles_required[opname]
            print("Instruction No: " + str(bank.instruction_no) + " Completed at time: " + str(bank.finish_time))

# Update tags and source in reservation stations setting sources free
def update_tag_values(bank):
    for each_item in reservationStations.list:
        if(each_item.tag1 == bank.num):
            each_item.tag1 = 0
            #changes ALERT
            if(each_item.num >= 11 and each_item.num<=16):
                each_item.source1 = bank.destination
            else:
                each_item.source1 = bank.result

        if(each_item.tag2 == bank.num):
            each_item.tag2 = 0
            #changes ALERT
            if(each_item.num >= 11 and each_item.num<=16):
                each_item.source2 = bank.destination
            else:
                each_item.source2 = bank.result

# Updating register details
def update_register_details(bank):
    for register in Registers.list:
        if(register.tag == bank.num and register.busy == True):
            register.data = bank.result
            register.busy = False
            register.tag = 0
            # print(f"{bank.result} is stored in R{register.num}")
    update_tag_values(bank)

# Handling reservation banks details
def handle_functional_banks():
    for each_bank in reservationStations.list:
        if(each_bank.finish_time==time):
            update_register_details(each_bank)

            each_bank.tag1 = -1
            each_bank.source1 = 0
            each_bank.tag2 = -1
            each_bank.source2 = 0
            each_bank.finish_time = -1
            each_bank.is_occupied = False
            each_bank.is_executing = False
            each_bank.destination = 0
            each_bank.result = 0
            #changes ALERT
            no_of_reservation_banks = getattr(reservationStations, opcode[each_bank.num] + '_available')
            setattr(reservationStations, opcode[each_bank.num] + '_available', no_of_reservation_banks + 1) #INCREMENT

def pending_instructions():
    tmp = False
    for each_bank in reservationStations.list:
        tmp |= each_bank.is_occupied
    return tmp

def main():
    global time, programCounter, mainMemory, Registers, reservationStations
    
    time = 0
    programCounter = 1
    mainMemory = memory.mainMemory()
    Registers = memory.Registers()
    reservationStations = reservation_station.ReservationStations()

    Registers.list[0].data = '10'
    Registers.list[1].data = '11'
    Registers.list[2].data = '12'
    Registers.list[3].data = '13'
    Registers.list[4].data = '14'
    Registers.list[5].data = '15'
    Registers.list[6].data = '16'
    Registers.list[7].data = '17'
    Registers.list[8].data = '18'
    Registers.list[9].data = '19'
    Registers.list[10].data = '30'

    Registers.print_registers(0, 11)
    # print(type(hexa_to_decimal('1000')))
    mainMemory.write_into_memory(hexa_to_decimal('1000'), 40)
    mainMemory.write_into_memory(hexa_to_decimal('1001'), 42)
    mainMemory.write_into_memory(hexa_to_decimal('1002'), 43)
    mainMemory.write_into_memory(hexa_to_decimal('1003'), 44)
    mainMemory.write_into_memory(hexa_to_decimal('1004'), 820)

    mainMemory.print_memory(hexa_to_decimal('1000'), hexa_to_decimal('1010'))


    with open('instructions.txt', 'r') as file:
        instructions_list = file.readlines()

    
    not_clean_instructions = [line.strip().split(' ') for line in instructions_list]
    not_clean_instructions.reverse()
    
    instructions = []

    for each in not_clean_instructions:
        temp = []
        for i in each:
            if(i[len(i)-1]==','):
                temp.append(i.replace(',', ''))
            else:
                temp.append(i)
        instructions.append(temp)
    
    print('Instructions:' + str(instructions))

    # instructions_file = open('instructions.txt', 'r')
    # instructions_list = instructions_file.readlines()
    
    # instructions = [line.strip().split(' ') for line in instructions_list]
    # instructions.reverse()

    # print(instructions_list)
    # print(instructions)

    while(1):
        if(len(instructions)!=0):
            instruction = instructions.pop()
            # print(instruction)
        
            opname = instruction[0]
            print('Opname: '+ str(opname))
            # print('Opcode: '+ str(opcode.index(opname)))

            no_of_banks_available = getattr(reservationStations, opname+'_available')
            print('Available Banks: ' +str(no_of_banks_available))
            
            if(no_of_banks_available > 0):
                allocated_bank = get_available_bank(opname)
                print('Allocated Reservation bannk: ' + str(allocated_bank.num))
                
                allocated_bank.instruction_no = programCounter
                
                dest = fill_allocated_reservation_bank(allocated_bank, instruction, no_of_banks_available)
                
                print('Destination: ' + str(dest))
                destinationSetter(allocated_bank, dest)
                programCounter += 1
            else:
                instructions.append(instruction)
                print(f"Instrcution added:  {instruction}")
                break

            # print('Opname: '+ str(opname))
            # print('Opcode: '+ str(opcode.index(opname)))
            # position = opcode_val_list.index(opname)
            # print(opcode_key_list[position])
        handle_execution()

        handle_functional_banks()

        time += 1

        if(not(pending_instructions()) and len(instructions)==0):
            break
    
    Registers.print_registers(0, 20)
    mainMemory.print_memory(hexa_to_decimal('1000'), hexa_to_decimal('1010'))
    print("Time taken: " + str(time))



main()

# LD R1, 1000H
# LD R2, 1001H
# LD R3, 1002H
# ADD R4, R1, R2
# ADD R5, R3, R4
# ST R5, 1003H