/*
 Problem Description: https://leetcode.com/problems/longest-substring-without-repeating-characters/
 
 Given a string s, find the length of the longest substring without repeating characters.
 
 
 Example:
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring
 */

import Foundation

func longestSubstringWithWithoutRepeatingCharacters(_ string: String) -> Int {
    let array = Array(string)
    var hashMap = [Character: Int]()
    var maxSize = 0
    var windowStart = 0
    
    for windowEnd in 0..<array.count {
        hashMap[array[windowEnd], default: 0] += 1
        
        if hashMap.count == windowEnd - windowStart + 1 {
            maxSize = max(maxSize, windowEnd - windowStart + 1)
        } else if hashMap.count < windowEnd - windowStart + 1 {
            while hashMap.count < windowEnd - windowStart + 1 {
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

print(longestSubstringWithWithoutRepeatingCharacters("pwwkew"))
