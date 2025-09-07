# Solving LeetCode: Top K Frequent Elements – Step by Step

In this post, I’m breaking down a LeetCode problem: Top K Frequent Elements. I’ll go line by line, explain the logic, and include visuals to help you understand the data structures and iterations.

⸻TOC:

- Problem
- Concepts
- Breakdown
  - step1
  - step2
  - step3
  - step4
- BigO

Problem

Given an integer array nums and an integer k, return the k most frequent elements.

We’ll use a HashMap for counting and a bucket-sort style array for organizing frequencies.

⸻

Solution

Here’s the complete solution in Java:

```
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

⸻

Step-by-Step Breakdown

Step 1: Count Frequencies

Map<Integer, Integer> count = new HashMap<>();

    • A HashMap called count stores each number as a key and its frequency as the value.
    • Example for nums = [1,1,1,2,2,3]:

Key Value
1 3
2 2
3 1

⸻

Step 2: Prepare Buckets

List<Integer>[] freq = new List[nums.length + 1];
for (int i = 0; i < freq.length; i++) {
freq[i] = new ArrayList<>();
}

    • freq is an array of lists, where index i stores numbers appearing exactly i times.
    • Empty buckets visual:

Index: 0 1 2 3 4 5 6
Bucket: [] [] [] [] [] [] []

⸻

Step 3: Count Occurrences

for (int n : nums) {
count.put(n, count.getOrDefault(n, 0) + 1);
}

    • Loop through each number n in nums.
    • Increment its frequency in the count map.

After loop (nums = [1,1,1,2,2,3]):

count = {1=3, 2=2, 3=1}

⸻

Step 4: Fill Buckets by Frequency

for (Map.Entry<Integer, Integer> entry : count.entrySet()) {
freq[entry.getValue()].add(entry.getKey());
}

    • Place each number into the bucket corresponding to its frequency.

Buckets visual:

Index: 0 1 2 3
Bucket: [] [3] [2] [1]

⸻

Step 5: Collect Top K Frequent Elements

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

    • Initialize the result array res.
    • Loop backwards through freq (from high to low frequency).
    • Add numbers to res until we have k elements.

Iteration example for k = 2:

Buckets: [ [], [3], [2], [1] ]
i=3 → add 1 → res = [1]
i=2 → add 2 → res = [1,2]
Reached k → return res

⸻

Step 6: Dry Run with Another Example

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

⸻

Step 7: Whiteboard-Style Visual

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

nums → HashMap(count) → Bucket Array(freq) → Top K result(res)
[1,1,1,2,2,3] → {1=3,2=2,3=1} → [ [], [3], [2], [1] ] → [1,2]

⸻

Step 8: Big O Analysis (Beginner-Friendly)

Time Complexity: 1. Counting with HashMap → O(n) 2. Filling buckets → O(n) in worst case 3. Collecting top k → O(n)

✅ Total Time Complexity: O(n)

Space Complexity:
• count map → O(n)
• freq buckets → O(n)
• res array → O(k)

✅ Total Space Complexity: O(n)

Tip for Beginners:

Even though we have nested loops, notice each element is only added once. This prevents O(n²) time.

⸻

✅ Key Takeaways
• Use HashMap for frequency counting.
• Use bucket sort to efficiently organize by frequency.
• Iterating backwards through buckets retrieves top k elements without full sorting.
• Understanding Big O ensures your solution is scalable.

⸻

This structure gives beginners a clear visual and step-by-step understanding, making it easier to approach other frequency/counting problems on LeetCode.

⸻

If you want, I can also create a colored diagram with arrows that you can embed as an image in the blog for an even more visual walkthrough.

Do you want me to make that next?
