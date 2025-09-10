---
layout: post
title: Valid Sudoku
categories: [logs]
toc: true
description: >
  We use boolean arrays as little checklists to track numbers in each row, column, and box. This follows a validation pattern—as we scan the board, we just mark numbers as “seen” so we can catch duplicates right away.
---

# Valid Sudoku

<!-- TOC - DO NOT AUTO-FORMAT -->

- toc
{:toc}
<!-- END TOC -->

## Problem

Determine if a 9x9 Sudoku board is valid.
Only the filled cells need to be validated according to the following rules:

1. Each row must contain digits 1–9 without repetition.
2. Each column must contain digits 1–9 without repetition.
3. Each of the 9 sub-boxes (3x3 sections) must contain digits 1–9 without repetition.

## Solution

Here’s the complete solution in Java:

```java
class Solution {
    public boolean isValidSudoku(char[][] board) {

        // Step 1 : initialize boolean matrices for rows, columns, and sub-boxes
        boolean[][] rows = new boolean[9][9];
        boolean[][] columns = new boolean[9][9];
        boolean[][] subBoxes = new boolean[9][9];

        // Step 2 : iterate over each cell in the 9x9 board
        for(int row=0;row<board.length; row++) {
            for(int column=0;board.length; column++) {

                if(board[row][column] != '.') {
                    int num = board[row][column] - '1';

                    // Step 3 : calculate sub-box index
                    int boxIndex = (row/3)*3 + (column/3);

                    // Step 4 : check for duplicates
                    if(rows[row][num] || columns[column][num] || subBoxes[boxIndex][num]) {
                        return false;
                    }

                    // Step 5 : mark the digit as seen
                    rows[row][num] = true;
                    columns[column][num] = true;
                    subBoxes[boxIndex][num] = true;
                }
            }
        }
        return true;
    }
}
```

## Step-by-Step Breakdown

### Step 1: Initialize Tracking Structures

```java
boolean[][] rows = new boolean[9][9];
boolean[][] columns = new boolean[9][9];
boolean[][] subBoxes = new boolean[9][9];
```

    • We create three 9x9 boolean matrices:
    • rows[row][num] → has number num been seen in row i?
    • columns[column][num] → has number num been seen in column j?
    • subBoxes[boxIndex][num] → has number num been seen in 3x3 sub-box boxIndex?

### Step 2: Iterate Over the Grid

```java
for(int row=0;row<board.length;row++) {
    for(int column=0;column<board.length;column++) {
```

    • Loop through each cell in the 9x9 board.
    • If the cell is empty (.), skip it.

```java
if(board[row][column] != '.') {
    int num = board[row][column] - '1';
```

### Step 3: Convert Digit into Index

```java
int num = board[row][column] - '1';
```

    • Characters '1' to '9' are converted to indices 0 to 8.
    • Example: if board[row][column] = '5', then num = 4.

#### Whats going on here?

    1. board[row][column] → gives us a character like '1', '5', or '9'.
      • Remember, the Sudoku board is a char[][], not an int[][].
    2. Characters in Java are stored as ASCII (or Unicode) codes.
      • '1' has a code of 49.
      • '2' has a code of 50.
      • ... up to '9' with code 57.

#### Why do this?

Because our boolean arrays are indexed from 0 to 8, not 1 to 9.
• Index 0 means “digit 1 is present.”
• Index 1 means “digit 2 is present.”
• ...
• Index 8 means “digit 9 is present.”

So this line basically converts the character digit into the correct array index.

### Step 4: Calculate Sub-Box Index

```java
int boxIndex = (row/3)*3 + (column/3);
```

    • The board is divided into 9 sub-boxes (3x3 each).
    • Formula assigns each cell to its corresponding sub-box.

### Visual: Sub-box indexing

```java
    0       1       2
+-------+-------+-------+
|   0   |   1   |   2   | 0
+-------+-------+-------+
|   3   |   4   |   5   | 1
+-------+-------+-------+
|   6   |   7   |   8   | 2
+-------+-------+-------+
```

Example: Cell (4,5) → (row/3)*3 + (column/3) = (4/3)*3 + (5/3) = 1\*3 + 1 = 4 → Sub-box 4.

## Step 5: Check for Duplicates

```java
if(rows[row][num] || columns[column][num] || subBoxes[boxIndex][num]) {
    return false;
}
```

    • If the digit already exists in:
    • The same row, OR
    • The same column, OR
    • The same sub-box → ❌ Invalid Sudoku.

## Step 6: Mark the Digit as Seen

```java
rows[row][num] = true;
columns[column][num] = true;
subBoxes[boxIndex][num] = true;
```

    • Otherwise, mark this number as seen for row, column, and box.

## Step 7: Return True

```java
return true;
```

    • If no duplicates are found after scanning the entire board → ✅ Valid Sudoku.

## Dry Run Example

Board Input (simplified):

```java
[
  ['5','3','.','.','7','.','.','.','.'],
  ['6','.','.','1','9','5','.','.','.'],
  ['.','9','8','.','.','.','.','6','.'],
  ...
]
```

Tracking Flow:

```java
1. (0,0) → ‘5’ → row[0][4] = true, col[0][4] = true, subBox[0][4] = true
2. (0,1) → ‘3’ → row[0][2] = true, col[1][2] = true, subBox[0][2] = true
3. (1,3) → ‘1’ → row[1][0] = true, col[3][0] = true, subBox[1][0] = true
    ...
```

If a duplicate is found at any point → return false.

## Whiteboard Visual Flow

```java
Cell → Convert to num → Find sub-box → Check rows, cols, sub-box
   ↓         ↓               ↓                 ↓
 [5] →       4        →   subBox 0   →    not seen   →   mark as true
```

## Big O Analysis (Beginner-Friendly)

### Time Complexity

- The algorithm scans each cell once → 9x9 = 81 cells → O(1).
- Generalized: O(n²) for an n x n Sudoku grid.

### Space Complexity

- Three 9x9 boolean arrays → O(1) fixed size (does not grow with input).

✅ Result:

- Time: O(1) (since Sudoku size is fixed).
- Space: O(1).

### Why is it O(n²)

Sudoku is a grid problem. In the standard puzzle:
• n = 9 (a 9x9 board).
• That means there are n × n = 81 cells to check.

Our algorithm looks at every single cell once:

```java
for (int row = 0; row < n; row++) {
    for (int col = 0; col < n; col++) {
        // work = constant time
    }
}
```

    • Two nested loops → n × n iterations.
    • Each step does constant-time work (array lookups and boolean updates).

So:

Time Complexity = O(n \* n) = O(n²)

The algorithm checks every cell once. If we define n as the grid size (rows or columns), it’s O(n²). If we define n as the total number of cells, it’s O(n). For a standard 9x9 Sudoku, both simply mean **it scales linearly with the number of cells.**

```
Sudoku Board: 9 x 9 = 81 cells
```

Interpretation 1: n = grid size (rows/columns)

```
n = 9
Total cells = n × n = 9 × 9 = 81
Time complexity = O(n²)
➡️ Each step = “look at 1 cell”
➡️ Total = 81 steps ≈ O(n²)
```

Interpretation 2: n = total number of cells

```
n = 81
Time complexity = O(n)
➡️ Each step = “look at 1 cell”
➡️ Total = 81 steps ≈ O(n)
```

## Key Takeaways

- Use boolean matrices to track seen numbers across rows, columns, and sub-boxes.
- The formula (i/3)\*3 + (j/3) maps a cell to its sub-box.
- Efficient validation → scans board once, constant time complexity.
- This approach teaches the importance of state tracking in multi-dimensional problems.
