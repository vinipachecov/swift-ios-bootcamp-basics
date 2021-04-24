import UIKit

var arr = [1,2,3,4,5,6]

/**
    Arrays starts index count from 0 to end
 */

/**
    Arrays can be accessed with notation array[index_value]
 */
//print(arr[2])

// simple mapping
arr.map({(val) in
    return val + 1
})

// mapping with indexes
arr = arr.enumerated().map({ (index, element) in
    if (index + 1 < arr.count) {
        return element * arr[index+1]
    }
    return element * arr[0]
})

// Arrays can be printed directly from print function without running through it
print(arr)

// returns the length of the array
arr.count

