/*
 Problem Link : https://www.interviewbit.com/problems/sliding-window-maximum/
 Given an array arr[] of size N and an integer K. Find the maximum for each and every contiguous subarray of size K.
 
 Example:
 
 Input 1:
 A = [1, 3, -1, -3, 5, 3, 6, 7]
 B = 3
 Output 1:
 C = [3, 3, 5, 5, 6, 7] .
 */

import Foundation

func maximumOfAllSubarraysOfSizeK(_ nums: [Int],_ k: Int) -> [Int] {
    var resultArray = Array(repeating: Int.min, count: nums.count - k + 1)
    var windowStart = 0
    var windowArray = Array(repeating: Int.min, count: k)
    
    for windowEnd in 0..<nums.count {
        
        if windowArray.isEmpty {
            windowArray.append(nums[windowEnd])
        } else {
            while !windowArray.isEmpty && windowArray.last! < nums[windowEnd]{
                windowArray.removeLast()
            }
            windowArray.append(nums[windowEnd])
        }
        
        if windowEnd - windowStart + 1 == k {
            if !windowArray.isEmpty {
                resultArray[windowStart] = windowArray.first!
                
                if nums[windowStart] == windowArray.first! {
                    windowArray.removeFirst()
                }
                windowStart += 1
            }
        }
    }
    return resultArray
}

print(maximumOfAllSubarraysOfSizeK([1, 3, -1, -3, 5, 3, 6, 7], 3))
print(maximumOfAllSubarraysOfSizeK([3, 2, 1, -1, 2, 4, 1], 3))
//Expected Output1 = [3, 3, 5, 5, 6, 7]
//Expected Output2 = [3, 2, 2, 4, 4]
