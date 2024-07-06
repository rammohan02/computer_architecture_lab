# Main memory
class mainMemory:
    def __init__(self) :
        # 21bit memory address. So 2^21 memory locations are possible
        self.list = ["0"]*2097151
    
    def write_into_memory(self, address, data):
        self.list[int(address)] = str(data)
    
    def read_from_memory(self, address):
        return self.list[int(address)]

    def print_memory(self, start, end):
        for i in range(start, end):
            print('Memory[' + str(i) + ']: ' + str(self.list[i]))

# Content of single register
class Register:
    def __init__(self, num) :
        self.num = num
        self.data = "0"
        self.busy = False
        self.tag = 0

# Declaring all registers
class Registers:
    def __init__(self) :
        self.list = [Register(i) for i in range(32)]

    def write_into_register(self, reg_num, data):
        self.list[reg_num] = str(data)
    
    def read_from_registers(self, reg_num):
        return self.list[reg_num].data

    def print_registers(self, start, end):
        for i in range(start, end):
            print('Register[' + str(i) + ']: ' + str(self.list[i].data))
        
    




# def main():
#     return len(MainMemory().list)

# if __name__ == "__main__":
#     print(main())