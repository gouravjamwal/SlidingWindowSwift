/*
 Problem Description: https://practice.geeksforgeeks.org/problems/first-negative-integer-in-every-window-of-size-k3345/1

 Given an array and a positive integer k, find the first negative integer for each and every window(contiguous subarray) of size k.

 Example:

 Input:
 2
 5
 -8 2 3 -6 10
 2
 8
 12 -1 -7 8 -15 30 16 28
 3
 */
import Foundation

func firstNegativeNumberInEveryWindow(_ array: [Int],_ k: Int) -> [Int] {
    var resultArray = Array(repeating: 0, count: array.count - k + 1)
    var windowArray = [Int]()
    var windowStart = 0
    
    
    for windowEnd in 0..<array.count {
        if array[windowEnd] < 0 {
            windowArray.append(array[windowEnd] )
        }
        
        if windowEnd - windowStart + 1 == k {
            if !windowArray.isEmpty {
                let value = windowArray[0]
                resultArray[windowStart] = value
                
                if value == array[windowStart] {
                    windowArray.removeFirst()
                }
            } else {
                resultArray[windowStart] = 0
            }
            windowStart += 1
        }
    }
    return resultArray
}

print(firstNegativeNumberInEveryWindow([12, -1, -7, 8, -15, 30, 16, 28], 3))
