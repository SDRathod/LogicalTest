//
//  ViewController.swift
//  test
//
//  Created by Samir Rathod on 01/12/17.
//  Copyright © 2017 Samir Rathod. All rights reserved.
//

//https://codility.com/c/feedback/VUCX4C-G69

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Answer 1
        var arrA: [Int] = [0, 1, 3, -2, 0, 1, 0, -3, 2, 3]
        let temp: Int = solution(&arrA)
        print(temp)

        
//        //Answer 2
//        var arrA: [Int] = []
//        var arrB: [Int] = []
//        let temp: Int = solution(&arrA, &arrB)
//        print(temp)
        
        //Answer 3
//        var arrA: [Int] = [-10000, 1000]
//        let temp: Int = solution(&arrA)
//        print(temp)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Answer 1
    public func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 3.0 (Linux)
        
        if (A.count == 0) {
            return 0
        }
        
        var arrDepth: [Int] = [Int]()
        for i in 0 ..< A.count-2 {
            for j in i+1 ..< A.count-1 {
                var isDecSucc = true
                var isIncSucc = true
                
                //check decreasing
                for t in i ..< j {
                    if (A[t] <= A[t+1]) {
                        isDecSucc = false
                    }
                }
                
                if (isDecSucc == false) {
                    break
                }
                
                
                //check increasing
                for k in j+1 ..< A.count {
                    for t in j ..< k {
                        if (A[t] >= A[t+1]) {
                            isIncSucc = false
                        }
                    }
                    
                    if (isIncSucc == false) {
                        break
                    }
                    
                    if (isDecSucc == true && isIncSucc == true) {
                        arrDepth.append(min(A[i] - A[j], A[k] - A[j]))
                    }
                }
            }
        }
        print(arrDepth)
        if (arrDepth.count > 0) {
            return arrDepth.max()!
        }
        else {
            return 0
        }
    }
    
    
//    //Answer 2
//    public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
//        // write your code in Swift 3.0 (Linux)
//        
//        if (A.count == 0 || (A.count != B.count)) {
//            return 0
//        }
//        var C: [Float] = [Float]()
//        //first, fill Array C
//        for i in 0 ..< A.count {
//            C.append(Float(A[i]) + Float(B[i]) / Float(1000000.0))
//        }
//        print(C)
//        
//        //second, find number of multiplicative pairs
//        var intPairs: Int = 0
//        for i in 0 ..< C.count-1 {
//            for j in i+1 ..< C.count {
//                if (C[i] * C[j] >= C[i] + C[j]) {
//                    intPairs = intPairs + 1
//                }
//            }
//        }
//        return intPairs
//    }



//    //Answer 3
//    public func solution(_ A : inout [Int]) -> Int {
//        // write your code in Swift 3.0 (Linux)
//        if (A.count == 0) {
//            return 0
//        }
//        
//        var minSum: Int = Int.max
//        for i in 0 ..< A.count-1 {
//            for j in i+1 ..< A.count {
//                var sum: Int = 0;
//                for k in i ..< j+1 {
//                    sum = sum + A[k]
//                }
//                sum = abs(sum)
//                if (sum < minSum) {
//                    minSum = sum
//                }
//            }
//        }
//        return abs(minSum)
//    }
}

