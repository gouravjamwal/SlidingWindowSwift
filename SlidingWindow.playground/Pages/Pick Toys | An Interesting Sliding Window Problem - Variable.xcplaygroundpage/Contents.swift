/*
 Problem Description: No Where, it was an interview problem

 John is at a toy store help him pick maximum number of toys. He can only select in a continuous manner and he can select only two types of toys.


 Example:
 Input:
 3
 abaccabbababaceaga
 */

import Foundation

func pickToys(string: String, k: Int) -> Int {
    let array = Array(string)
    var windowStart = 0
    var hashmap = [Character: Int]()
    var maxSize = 0
    
    for windowEnd in 0..<array.count {
        hashmap[array[windowEnd], default: 0] += 1
        
        if hashmap.count == k {
            maxSize = max(maxSize, windowEnd - windowStart + 1)
        } else if hashmap.count > k {
            while hashmap.count > k {
                if hashmap[array[windowStart]]! != nil {
                    hashmap[array[windowStart]]! -= 1
                    if hashmap[array[windowStart]]! == 0 {
                        hashmap.removeValue(forKey: array[windowStart])
                    }
                }
                windowStart += 1
            }
        }
    }
    return maxSize
}

print(pickToys(string: "abaccabbababaceaga", k: 2))
