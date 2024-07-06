def hexa_to_decimal(hexnum):
    dec = int(hexnum, 16)
    return dec

def dec_to_binary(decnum):
    return bin(decnum).replace("0b", "").zfill(64)

def binary_to_dec(binnum):
    dec = int(binnum, 2)
    return dec

#******************************Decimal to FP************************************#

# returns binary representation of a fraction(0 < x < 1)
def binaryOfFraction(fraction):
	binary = str()
	while (fraction):
		fraction *= 2
		if (fraction >= 1):
			int_part = 1
			fraction -= 1
		else:
			int_part = 0
		binary += str(int_part)
	return binary

# returns FP representation of real_no
def decimal_to_fp(decimal_num):
	real_no = float(decimal_num)
	sign_bit = 0
	if(real_no < 0):
		sign_bit = 1
	real_no = abs(real_no)
	int_str = bin(int(real_no))[2 : ]
	fraction_str = binaryOfFraction(real_no - int(real_no))
	ind = int_str.index('1')
	exp_str = bin((len(int_str) - ind - 1) + 1023)[2 : ]
	mant_str = int_str[ind + 1 : ] + fraction_str
	mant_str = mant_str + ('0' * (52 - len(mant_str)))
	ieee_rep = (str(sign_bit) + exp_str + mant_str)[0:64]
	return ieee_rep

#*******************************************************************************#


#*******************************FP to Decimal***********************************#

# helper function to convert mantissa to int
def convertToInt(mantissa_str):
	power_count = -1
	mantissa_int = 0
	for i in mantissa_str:
		mantissa_int += (int(i) * pow(2, power_count))
		power_count -= 1
	return (mantissa_int + 1)

# returns decimal representation of IEEE FP number
def fp_to_decimal(ieee_64):
	sign_bit = int(ieee_64[0])
	exponent_bias = int(ieee_64[1 : 12], 2)
	exponent_unbias = exponent_bias - 1023
	mantissa_str = ieee_64[12 : ]
	mantissa_int = convertToInt(mantissa_str)
	real_no = pow(-1, sign_bit) * mantissa_int * pow(2, exponent_unbias)
	return int(real_no)

#*******************************************************************************#

# print((decimal_to_fp(1.5005)))
# print(binary_to_dec(dec_to_binary(10)))

# a = '2,'

# # b = a.replace(',', '')
# print(a[0:len(a)-1])

# def tuple_access():
#     a = (11, 13)
#     for i in range(a[0], a[1]+1):
#         print(i)

# tuple_access()
# if __name__ == '__main__':
#     print(hexa_to_decimal('1000'))
















# # Python program to convert a real value
# # to IEEE 754 Floating Point Representation.

# # Function to convert a
# # fraction to binary form.
# def binaryOfFraction(fraction):

# 	# Declaring an empty string
# 	# to store binary bits.
# 	binary = str()

# 	# Iterating through
# 	# fraction until it
# 	# becomes Zero.
# 	while (fraction):
		
# 		# Multiplying fraction by 2.
# 		fraction *= 2

# 		# Storing Integer Part of
# 		# Fraction in int_part.
# 		if (fraction >= 1):
# 			int_part = 1
# 			fraction -= 1
# 		else:
# 			int_part = 0
	
# 		# Adding int_part to binary
# 		# after every iteration.
# 		binary += str(int_part)

# 	# Returning the binary string.
# 	return binary



# # Function to get sign bit,
# # exp bits and mantissa bits,
# # from given real no.
# def floatingPoint(real_no):

# 	# Setting Sign bit
# 	# default to zero.
# 	sign_bit = 0

# 	# Sign bit will set to
# 	# 1 for negative no.
# 	if(real_no < 0):
# 		sign_bit = 1

# 	# converting given no. to
# 	# absolute value as we have
# 	# already set the sign bit.
# 	real_no = abs(real_no)

# 	# Converting Integer Part
# 	# of Real no to Binary
# 	int_str = bin(int(real_no))[2 : ]

# 	# Function call to convert
# 	# Fraction part of real no
# 	# to Binary.
# 	fraction_str = binaryOfFraction(real_no - int(real_no))

# 	# Getting the index where
# 	# Bit was high for the first
# 	# Time in binary repres
# 	# of Integer part of real no.
# 	ind = int_str.index('1')

# 	# The Exponent is the no.
# 	# By which we have right
# 	# Shifted the decimal and
# 	# it is given below.
# 	# Also converting it to bias
# 	# exp by adding 127.
# 	exp_str = bin((len(int_str) - ind - 1) + 127)[2 : ]

# 	# getting mantissa string
# 	# By adding int_str and fraction_str.
# 	# the zeroes in MSB of int_str
# 	# have no significance so they
# 	# are ignored by slicing.
# 	mant_str = int_str[ind + 1 : ] + fraction_str

# 	# Adding Zeroes in LSB of
# 	# mantissa string so as to make
# 	# it's length of 23 bits.
# 	mant_str = mant_str + ('0' * (23 - len(mant_str)))

# 	# Returning the sign, Exp
# 	# and Mantissa Bit strings.
# 	return sign_bit, exp_str, mant_str

# # Driver Code
# if __name__ == "__main__":

# 	# Function call to get
# 	# Sign, Exponent and
# 	# Mantissa Bit Strings.
# 	sign_bit, exp_str, mant_str = floatingPoint(5.0005)

# 	# Final Floating point Representation.
# 	ieee_32 = str(sign_bit) + '|' + exp_str + '|' + mant_str

# 	# Printing the ieee 32 representation.
# 	print("IEEE 754 representation of -2.250000 is :")
# 	print(ieee_32)
