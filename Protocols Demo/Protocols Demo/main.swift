protocol CanFly {
    func fly()
}

class Bird {
    var isFemiale = true
    
    
    func layEgg() {
        if isFemiale {
            print("Lay eggs!")
        }
    }
}

class Eagle: Bird, CanFly {
    func fly() {
        print("Eagle flies")
    }
    
    func soar() {
        print("Eagle soar")
    }
}


class Penguin: Bird {
    func swim() {
        print("peguin swims!")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

// Even though Structs cannot use inheritance, they can implement Protocols
struct Airplane: CanFly {
    func fly() {
      print("Plane flies")
    }
    
}

let myEagle = Eagle()
myEagle.fly()
myEagle.layEgg()

let myPenguin = Penguin()

// now penguin can fly??

// hwo about a museum

let myPlane = Airplane()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myPlane) // will raise error if we use Airplane as a struct alone
museum.flyingDemo(flyingObject: myEagle)
