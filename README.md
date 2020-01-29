# sorer

### Joe Song and Snowy Chen
####ASSIGNMENT 1, PART 1

A Python3 script that takes in a `*.sor` file and interprets it into a columnar format. It takes in the following
 arguments:
 
- `-f`: Path to SoR file that needs to be read. Required.
- `-from`: Starting position in the file (in bytes). Default value is 0.
- `-len`: Number of bytes to read. If not provided, it will read the whole file.
- `-print_col_type`: Print the type of column at specified column number, which is 0-indexed. The output would be one
 of the following:
    - `BOOL`
    - `INT`
    - `FLOAT`
    - `STRING`
- `-print_col_idx`: Print the value at the column index by offset. Takes in 2 values, first one being the column, and
 second being the offset.
- `-is_missing_idx`: Prints whether or not the specified column offset is missing. 0 if false, and 1 if true.

## Assumptions and Decisions

The code makes the following assumptions:
- Malformed data, such as strings with spaces that isn't wrapped with quotations, will be treated as a missing field.
- Data that does not match the rest of the columnar data type schema will be treated as missing fields.
- All indexes start at 0, including column and offsets.

## Design

### Data types

Data types `BOOL`, `INTEGER`, `FLOAT`, and `STRING` is an enumeration class that ranks each type by a number. The
 higher the rank, the less restrictive the data type. A higher data type rank can be referred to as an "upgrade".
- `BOOL`: Rank 0 -- the lowest rank. Can only be represented as `0` or `1`
- `INTEGER`: Rank 1. Can only be represented by digits and an optional leading `+` or `-` sign
- `FLOAT`: Rank 2. Can only be represented by digits, an optional leading `+` or `-` sign, and a decimal point
- `STRING`: Rank 3 -- the highest rank. Can be represented with the following ASCII characters: A-Z, a-z, 0-9, and
 one of `~!@#$%^&*()-_+=[]{}|;:',./?`

### SorInterpreter

The main driver of the code is encapsulated within the class `SorInterpreter`. 

#### Constructor

The constructor takes in the file name of the desired `*.sor` file and then reads the first 500 lines in order to
 interpret the column schema. The private function `__get_column_schema()` interprets the column schema by using a
  regex expression to tokenize each piece of data within each line of the file, and then determines the type by
   seeing what is the lowest ranked data type the data can fit into. The column schema either keeps the currently
    chosen data type at that column, or chooses to upgrade it if the data is determined to have a higher ranked data
     type.
     
The constructor also takes in a start position (int) and length (int) in order to determine the range, in bytes, that
 the interpreter is allowed to access within the file. These two numbers determine the "readable range" of the
  interpreter. By default, the constructor will read the entire file, unless specified not to.

#### `get_value()`     

A publicly available function that allows the script to retrieve the value at the provided column and offset. It will
 base the column and offset by the readable range.
 
#### `get_column_datatype()`

A publicly available function that allows the script to retrieve the determined data type of the specified column
 index, which is 0-indexed.
