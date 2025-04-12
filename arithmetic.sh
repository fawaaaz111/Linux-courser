#!/bin/bash
# This script demonstrates arithmetic operations in bash

#!/bin/bash
# This script demonstrates arithmetic operations in bash

echo "Please enter two numbers:"
read num1
read num2
echo "You entered: $num1 and $num2"
echo "Performing arithmetic operations..."
sum=$((num1 + num2))

product=$((num1 * num2))

echo "Sum: $sum"
echo "Product: $product"

# Determine the relationship between sum and product
if [ $sum -gt $product ]; then
    echo "The sum is greater than the product."
elif [ $sum -lt $product ]; then
    echo "The sum is less than the product."
else
    echo "The sum is equal to the product."
fi