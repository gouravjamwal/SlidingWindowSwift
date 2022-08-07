/*
 Given two strings s and t, return the minimum window in s which will contain all the characters in t. If there is no such window in s that covers all characters in t, return the empty string "".
 
 Note that If there is such a window, it is guaranteed that there will always be only one unique minimum window in s.
 
 
 
 Example 1:
 
 Input: s = "ADOBECODEBANC", t = "BC"
 Output: "BANC"
 Example 2:
 
 Input: s = "a", t = "a"
 Output: "a"
 */

import Foundation

func minumumWindowSubstring(_ sString: String,_ tString: String) -> String {
    let sArray = Array(sString)
    let tArray = Array(tString)
    var hashMap = [Character: Int]()
    var windowStart = 0
    var windowEnd = 0
    var counter = 0
    var minLength = Int.max
    var minStart = Int.max
    
    for i in 0..<tArray.count {
        hashMap[tArray[i], default: 0] += 1
    }
    
    for c in sArray {
        
       if hashMap[c] != nil {
            hashMap[c]! -= 1
            if hashMap[c]! == 0 {
                counter += 1
            }
        }

        while counter == hashMap.count {
            if minLength > windowEnd - windowStart + 1 {
                minLength = windowEnd - windowStart + 1
                minStart = windowStart
            }
            
            if let _ = hashMap[sArray[windowStart]] {
                hashMap[sArray[windowStart]]! += 1
                if hashMap[sArray[windowStart]]! > 0 {
                    counter -= 1
                }
            }
        
            windowStart += 1
        }
        windowEnd += 1
    }
    return minLength == Int.max ? "": String(sArray[minStart..<minStart+minLength])
}

print(minumumWindowSubstring("ADOBECODEBANC", "ABC"))
