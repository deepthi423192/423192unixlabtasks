#!/bin/bash

# Read input
echo "Enter a number:"
read number

# Check if the number is even or odd
if (( number % 2 == 0 )); then
    echo "$number is Even."
else
    echo "$number is Odd."
fi
#!/bin/bash

# Read input
echo "Enter a year:"
read year

# Check if the year is a leap year
if (( (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) )); then
    echo "$year is a Leap Year."
else
    echo "$year is not a Leap Year."
fi
#!/bin/bash

# Read input
echo "Enter a number:"
read number

# Initialize factorial variable
factorial=1

# Check if the number is negative
if (( number < 0 )); then
    echo "Factorial is not defined for negative numbers."
else
    # Loop to calculate factorial
    for (( i = 1; i <= number; i++ ))
    do
        factorial=$(( factorial * i ))
    done
    echo "The factorial of $number is $factorial."
fi

