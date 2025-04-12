#!/bin/bash
echo 'Are U enjoying this course so far?'
echo -n "Enter \"y\" for yes, \"n\" for no: "
read response

if [ "$response" == "y" ] ;then
	echo 'Glad to hear that!'
elif [ "$response" == "n" ] ;then
	echo 'Sorry to hear that'
else
    echo 'Invalid response'
    echo 'Please enter "y" or "n"'
fi
