import UIKit

func printSomething() -> Int {
    print("repeated action")
    return 1
}

let data = printSomething()
print("result of printSomething \(data)")


/**
 Syntax:
 
 func keyword + nameofTheFunction + () {
 // commands
 }
*/

//Don't change this code:
func calculator() {
  let a = Int(readLine()!)! //First input
  let b = Int(readLine()!)! //Second input
  
  func add(n1, n2) {
      return n1 + n2
  }
  
  func subtract(n1, n2) {
      return n1 * n2
  }
  
  func divide(n1, n2) {
      return n1 / n2
  }
  
  func multiply(n1, n2) Int {
      return n1 * n2
  }
  
  add(n1: a, n2: b)
  subtract(n1: a, n2: b)
  multiply(n1: a, n2: b)
  divide(n1: a, n2: b)
}

//Write your code below this line to make the above function calls work.


