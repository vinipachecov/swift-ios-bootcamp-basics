import UIKit

var greeting = "Hello, playground"


class Animal {
    var name: String
    init (n: String) {
        name = n
    }
}

class Human: Animal {
    func code() {
        print("Typing away....")
    }
}


class Fish: Animal {
    func breath() {
        print("Fish breathing")
    }
}


let angela = Human(n: "Vinicius")
let jack = Human(n: "Jack Bauer")
let nemo = Fish(n: "Nemo")

let neighbours = [angela, jack, nemo]

if neighbours[0] is Human {
    print("First neighbour is human!")
}

let oneNeightbour = neighbours[0] as! Human

oneNeightbour.code()


func findNemo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print("animal name is \(animal.name)")
            // set the casted value into a auxiliary variable to use Casted Class properties and methods
            let fish = animal as! Fish
            fish.breath()
            
        }
    }
}

findNemo(from: neighbours)
// Run-time Execution Error!!!
let fish = neighbours[1] as? Fish
print("Is jack Bauer a fish?")
fish?.breath()
