/*
 Problem Description: https://practice.geeksforgeeks.org/problems/longest-k-unique-characters-substring0853/1

 Given a string you need to print the size of the longest possible substring that has exactly k unique characters.


 Example:
 Input:
 2
 aabacbebebe
 3
 aaaa
 1
 Output:
 7
 4 .
 */

import Foundation

func longestSubstringWithKUniqueCharacters(_ string: String,_ k: Int) -> Int {
    let array = Array(string)
    var hashMap = [Character: Int]()
    var maxSize = 0
    var windowStart = 0
    
    for windowEnd in 0..<array.count {
        hashMap[array[windowEnd], default: 0] += 1
        
        if hashMap.count >= k {
            if hashMap.count == k {
                maxSize = max(maxSize, windowEnd - windowStart + 1)
            }
            while hashMap.count > k {
                if hashMap[array[windowStart]] != nil {
                    hashMap[array[windowStart]]! -= 1
                    if hashMap[array[windowStart]]! == 0 {
                        hashMap.removeValue(forKey: array[windowStart])
                    }
                }
                windowStart += 1
            }
        }
    }
    return maxSize
}

print(longestSubstringWithKUniqueCharacters("aabacbebebe", 3))
print(longestSubstringWithKUniqueCharacters("aaaa", 2))
