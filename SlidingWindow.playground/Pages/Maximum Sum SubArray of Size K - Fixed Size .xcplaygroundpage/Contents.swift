
import Foundation

class MaximumSumSubArrayOfSizeK {
    
    func solve() {
        print(maximumSumSubArrayOfSizeK(array: [2, 3, 5, 2, 9, 7, 1], k: 3))
    }
    
    private func maximumSumSubArrayOfSizeK(array: [Int], k: Int) -> Int {
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
}

let obj = MaximumSumSubArrayOfSizeK()
print(obj.solve())
