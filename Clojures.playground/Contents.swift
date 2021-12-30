import Foundation
// normal syntax

func add (no1: Int, no2: Int) -> Int {
    return no1 + no2
}

func calculator(no1: Int, no2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(no1,no2)
}

print(calculator(no1: 2, no2: 2, operation: add))

// passing an anonymous function with no return statement

print(calculator(no1: 2, no2: 2, operation: (no1, no2) -> Int in
    no1 + no2
))


//// using shorthand syntax

print(calculator(no1: 2, no2: 2, operation: {$0 + $1}))

// Syntax ommiting the clojure param
// if last param is a clojure you can also omit the param name
print(calculator(no1: 2, no2: 2) {$0 + $1}))

// Map function

let arr = [1,2,3,4,5]
// full syntax notation
arr.map({(number: Int) -> Int in number + 1})

// type inference 
arr.map({(number) in number + 1})

// omit param
arr.map{$0 + 1}

