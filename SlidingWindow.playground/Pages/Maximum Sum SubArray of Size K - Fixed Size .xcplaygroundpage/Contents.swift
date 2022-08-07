/*
 Problem Description: https://practice.geeksforgeeks.org/problems/max-sum-subarray-of-size-k5313/1

 Given an array of integers Arr of size N and a number K. Return the maximum sum of a subarray of size K.

 Example:

 Input:
 N = 4, K = 2
 Arr = [100, 200, 300, 400]
 Output:
 700
 Explanation:
 Arr3  + Arr4 =700,
 which is maximum. .
 */
import Foundation

func maximumSumSubArrayOfSizeK(array: [Int], k: Int) -> Int {
    var windowStart = 0
    let windowSize = k
    var sum = 0
    var maxSum = Int.max
    for windowEnd in 0..<array.count {
        sum += array[windowEnd]
        
        if windowEnd - windowStart + 1 == windowSize {
            maxSum = max(maxSum, sum)
            sum -= array[windowStart]
            windowStart += 1
        }
    }
    return maxSum
}

print(maximumSumSubArrayOfSizeK(array: [2, 3, 5, 2, 9, 7, 1], k: 3))

