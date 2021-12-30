import UIKit

let fruits = ["Apple", "Pear", "orange"]
let contacts = ["Adam": 123456789, "James": 1234561, "Amy":987654312]
let halfOpenRange = 1 ..< 5 // 1 to 4
let closedRange = 1 ... 5 // includes 5

/*
// Dictionaries
for contact in contacts {
    print (contact.key)
    print (contact.value)
}

for number in halfOpenRange {
    print (number)
}

for number in closedRange {
    print (number)
}
*/

var array: [Int] = []
    var current = 0
    func fibonacci(n: Int) {
        let range = 0 ... n
        for _  in range {
            
            if array.count == 1 {
                array.append(1)
            }
            
            if array.count > 1 {
                array.append(array.last! + array[array.endIndex - 2])
            }
            
            if array.isEmpty == true {
                array.append(0)
            }
            
            
        }
        print (array)
    
    }
fibonacci(n: 5)
