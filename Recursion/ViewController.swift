//
//  ViewController.swift
//  Recursion
//
//  Created by Brendon Crowe on 2/13/23.
//


// a recursive function/call is a function that calls itself
// every recursive call needs a base case

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func performOperations(_ sender: UIButton) {
        let result = dynamicFib(20)
        print(result)
    }
    
    
    // example 1
    func recurse(_ n: Int) {
        guard n > 0 else { return } // base case preventing infinite calling
        print("Hi")
        recurse(n - 1) // recursive call with n as '7' = 6, 5, 4, 3, 2, 1
        // the way you make a recursive call smaller is in the argument
    }
    
    // example 2
    func countDownToZero(from num: Int) {
        guard num >= 0 else { return } // base case; num is greater than or equal to 0
        print(num)
        countDownToZero(from: num - 1) // recursive call
        // countDownToZero(from: 20)
        // countDownToZero(from: 19)
        // countDownToZero(from: 18)
        // ...
        // countDownToZero(from: 0)
    }
    
    // example 3 - factorial
    // formula for finding factorial is n * (n - 1)
    // factorial is used to find the number of permutations of a given case number
    func factorial(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
            
        } // base case
        return n * factorial(n - 1) // recursive calls
        // 4 * factorial(3) -> 24 // the final call gets presented in the compiler
        // 3 * factorial(2) -> 6
        // 2 * factorial(1) -> 2
        // factorial(1) -> 1
    }
    
    
    // example 4 - Fibonacci // formula is (n - 1) + (n - 2)
    func fibonacci(_ n: Int) -> Int { // this works, but it will eventually crash as the fib(n) gets bigger
        guard n > 2 else { return 1 } // base case
        return fibonacci(n - 1) + fibonacci(n - 2) // recursive call
    }
    
    // a dynamic function for fibonacci in order to reduce the number of calls
    var fibDictionary = [Int: Int]()
    func dynamicFib(_ n: Int) -> Int {
        // do we already have the fib value; retrieving 
        if let fibResult = fibDictionary[n] { // [n(4): value is "3"]
            return fibResult
        }
        guard n > 2 else { return 1 }
        let fibResult = dynamicFib(n - 1) + dynamicFib(n - 2)
        fibDictionary[n] = fibResult // this line caches the results
        return fibResult
    }
    
}
