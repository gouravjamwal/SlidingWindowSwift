/*
 Given a word pat and a text txt. Return the count of the occurences of anagrams of the word in the text.
 
 Example 1:
 
 Input:
 txt = forxxorfxdofr
 pat = for
 Output: 3
 Explanation: for, orf and ofr appears
 in the txt, hence answer is 3.
 Example 2:
 
 Input:
 txt = aabaabaa
 pat = aaba
 Output: 4
 Explanation: aaba is present 4 times
 in txt.
 */

import Foundation

func countNumberOfOccurencesOfAnagrams(_ text: String,_ pattern: String) -> Int {
    let textArray = Array(text)
    let patternArray = Array(pattern)
    var patternHashMap = [Character: Int]()
    
    for i in 0..<patternArray.count {
        let char = patternArray[i]
        patternHashMap[char, default: 0] += 1
    }
    
    var windowStart = 0
    var count = 0
    var currentWindowHashMap = [Character: Int]()
    
    for windowEnd in 0..<textArray.count {
        let textChar = textArray[windowEnd]
        currentWindowHashMap[textChar, default: 0] += 1
        
        if windowEnd - windowStart + 1 == patternArray.count {
            
            if isAnagram(patternHashMap: patternHashMap, windowHashMap: currentWindowHashMap) {
                count += 1
            }
            
            let valueToBeRemoved = textArray[windowStart]
            
            if currentWindowHashMap[valueToBeRemoved] != nil {
                currentWindowHashMap[valueToBeRemoved]! -= 1
            }
            windowStart += 1
        }
        
    }
    return count
}

func isAnagram(patternHashMap: [Character: Int], windowHashMap: [Character: Int]) -> Bool {
    if patternHashMap.count != windowHashMap.count {
        return false
    }
    for key in patternHashMap.keys {
        if patternHashMap[key] != windowHashMap[key] {
            return false
        }
    }
    return true
}

print(countNumberOfOccurencesOfAnagrams( "aabaabaa", "aaba"))

