---
layout: post
title: Top Frequent K Elements
categories: [logs]
toc: true
description: >
  Breaking down LeetCode's Top K Frequent Elements problem using HashMap and bucket sort.
  Complete solution with step-by-step breakdown and Big O analysis.
---

# Top K Frequent Elements – Bucket Sort

<!-- TOC - DO NOT AUTO-FORMAT -->

- toc
{:toc}
<!-- END TOC -->

## Problem

Given an integer array nums and an integer k, return the k most frequent elements.

We’ll use a HashMap for counting and a bucket-sort style array for organizing frequencies.

## Solution

Here’s the complete solution in Java:

```java
public class Solution {
public int[] topKFrequent(int[] nums, int k) {

        Map<Integer, Integer> count = new HashMap<>();
        List<Integer>[] freq = new List[nums.length + 1];

        for (int i = 0; i < freq.length; i++) {
            freq[i] = new ArrayList<>();
        }

        for (int n : nums) {
            count.put(n, count.getOrDefault(n, 0) + 1);
        }
        for (Map.Entry<Integer, Integer> entry : count.entrySet()) {
            freq[entry.getValue()].add(entry.getKey());
        }

        int[] res = new int[k];
        int index = 0;
        for (int i = freq.length - 1; i > 0 && index < k; i--) {
            for (int n : freq[i]) {
                res[index++] = n;
                if (index == k) {
                    return res;
                }
            }
        }
        return res;
    }

}
```

## Step-by-Step Breakdown

### Step 1: Count Frequencies

```java
Map<Integer, Integer> count = new HashMap<>();
```

A HashMap called count stores each number as a key and its frequency as the value.

| Key|Value
| 1|3
| 2|2
| 3|1

_Example for nums = [1,1,1,2,2,3]_

### Step 2: Prepare Buckets

freq is an array of lists, where index i stores numbers appearing exactly i times.

```java
List<Integer>[] freq = new List[nums.length + 1];
for (int i = 0; i < freq.length; i++) {
freq[i] = new ArrayList<>();
}
```

Empty buckets visual:

```java
Index:   0  1  2  3  4  5  6
Bucket: [] [] [] [] [] [] []
```

### Step 3: Count Occurrences

Loop through each number n in nums.  
Increment its frequency in the count map.

```java
for (int n : nums) {
count.put(n, count.getOrDefault(n, 0) + 1);
}
```

```java
After loop (nums = [1,1,1,2,2,3]):
count = {1=3, 2=2, 3=1}
```

### Step 4: Fill Buckets by Frequency

Place each number into the bucket corresponding to its frequency

```java

for (Map.Entry<Integer, Integer> entry : count.entrySet()) {
freq[entry.getValue()].add(entry.getKey());
}
```

```java
Buckets visual:

Index:   0  1   2   3
Bucket: [] [3] [2] [1]
```

### Step 5: Collect Top K Frequent Elements

Initialize the result array res.  
Loop backwards through freq (from high to low frequency).  
Add numbers to res until we have k elements.

```java
int[] res = new int[k];
int index = 0;

for (int i = freq.length - 1; i > 0 && index < k; i--) {
  for (int n : freq[i]) {
    res[index++] = n;
    if (index == k) {
    return res;
    }
  }
}
```

```java
Iteration example for k = 2:

Buckets: [ [], [3], [2], [1] ]
i=3 → add 1 → res = [1]
i=2 → add 2 → res = [1,2]
Reached k → return res
```

### Step 6: Whiteboard-Style Visual

```java
nums = [1,1,1,2,2,3]

Step 1: Count
count = {1=3, 2=2, 3=1}

Step 2: Buckets
freq[1] = [3]
freq[2] = [2]
freq[3] = [1]

Step 3: Collect top k
Start from highest freq → 3 → 2 → 1
res = [1,2] (for k=2)

Flow Diagram:

 nums          →  HashMap(count) →  Bucket Array(freq)    →  Top K result(res)
 [1,1,1,2,2,3] →  {1=3,2=2,3=1}  →  [ [], [3], [2], [1] ] →  [1,2]
```

### Step 7: Dry Run with Another Example

```java
Input: nums = [4,1,1,2,2,2,3], k = 2

Step 1: Count
count = {1=2, 2=3, 3=1, 4=1}

Step 2: Buckets
Index: 0 1 2 3 4 5 6 7
Bucket: [] [3,4] [1] [2] [] [] [] []

Step 3: Collect top k

• Start from i = 7 → empty
• i = 6 → empty
• i = 5 → empty
• i = 4 → empty
• i = 3 → add 2 → res = [2]
• i = 2 → add 1 → res = [2,1] → done

Output: [2,1]
```

## Big O Analysis (Beginner-Friendly)

### Time Complexity

1. **Counting with HashMap → O(n)**

   - We iterate through all n elements once
   - HashMap operations (put/get) are O(1) average case
   - Total: n × O(1) = O(n)

2. **Filling buckets → O(n)**

   - We iterate through each unique element in the HashMap
   - In worst case, all elements are unique = n iterations
   - Adding to ArrayList is O(1)
   - Total: n × O(1) = O(n)

3. **Collecting top k → O(n)**
   - We iterate through buckets (max n+1 buckets)
   - In worst case, we visit all n elements once
   - Each element is processed exactly once
   - Total: O(n)

✅ **Total Time Complexity: O(n)**

### Space Complexity

1. **count map → O(n)**

   - Stores at most n unique elements
   - Each entry takes constant space
   - Worst case: all elements are unique

2. **freq buckets → O(n)**

   - Array size is (n+1) for possible frequencies 0 to n
   - Each bucket stores elements, total elements = n
   - Array space: O(n), elements space: O(n)

3. **res array → O(k)**
   - Stores exactly k elements
   - k ≤ n, so this doesn't dominate

✅ **Total Space Complexity: O(n)**

### 🔑 Key Insight for Big O

Even though we have nested loops in the final step, each element is processed **exactly once**. The outer loop goes through buckets, the inner loop goes through elements, but no element appears in multiple buckets. This prevents O(n²) time!

**Why not O(n log n) like sorting?**
Because we use bucket sort principles - we know the range of frequencies (0 to n), so we can place elements directly in their frequency bucket without comparisons.

## ✅ Key Takeaways

- Use HashMap for frequency counting.
- Use bucket sort to efficiently organize by frequency.
- Iterating backwards through buckets retrieves top k elements without full sorting.
- Understanding Big O ensures your solution is scalable.
