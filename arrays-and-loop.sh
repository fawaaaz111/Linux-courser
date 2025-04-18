#!/bin/bash
# This script demonstrates the use of arrays and loops in bash

# Locate the original CSV file
csv_file="./arrays-table.csv"
updated_csv_file="./updated_arrays-table.csv"

# Parse table columns into 3 arrays, skipping the first line (header)
column_0=($(tail -n +2 $csv_file | cut -d "," -f 1))
column_1=($(tail -n +2 $csv_file | cut -d "," -f 2))
column_2=($(tail -n +2 $csv_file | cut -d "," -f 3))

# Initialize an empty array for the differences
diff_column=()

# Calculate the differences and store them in the diff_column array
for ((i=0; i<${#column_0[@]}; i++)); do
    diff_column[$i]=$((column_2[$i] - column_1[$i]))
done

# Create a new file with the updated CSV structure
{
    # Add the header row to the updated CSV file
    header=$(head -n 1 "$csv_file")
    echo "$header,Difference" > "$updated_csv_file"

    # Append the data rows with the calculated differences
    for ((i=0; i<${#column_0[@]}; i++)); do
        # Get the original row from the file
        row=$(tail -n +2 "$csv_file" | sed -n "$((i + 1))p")

        # Append the difference column value
        echo "$row,${diff_column[$i]}" >> "$updated_csv_file"
    done
} || {
    echo "Error processing the file."
    exit 1
}

# Notify the user
echo "Updated CSV file created: $updated_csv_file"
