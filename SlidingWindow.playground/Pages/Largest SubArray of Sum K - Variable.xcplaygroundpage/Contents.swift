/*
 Problem Description:

 Given an array containing N positive integers and an integer K. Your task is to find the length of the longest Sub-Array with sum of the elements equal to the given value K.

 For Input:
 array = [4 1 1 1 2 3 5], k = 5
 your output is:
 4
 */

import Foundation

func largestSubArrayOfSumK(array: [Int], k: Int) -> Int {

    var subArrayMaxSize = 0
    var windowStart = 0
    var windowSum = 0
    
    for windowEnd in 0..<array.count {
        windowSum += array[windowEnd]
        
        if windowSum >= k {
            if windowSum == k {
                subArrayMaxSize = max(subArrayMaxSize, windowEnd - windowStart + 1)
            }
            while windowSum >= k {
                windowSum -= array[windowStart]
                windowStart += 1
            }
        }
    }
    return subArrayMaxSize
}

print(largestSubArrayOfSumK(array: [4, 1, 1, 1, 2, 3, 5], k: 5))
