protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Paramedic performing CPR!")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Doctor performing CPR!")
    }
    
    func doDoctorStuff() {
        print("Do doc stuff.")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Do surgeon stuff while doing CPR!")
    }
}


// let emergencyHandler = EmergencyCallHandler()
// let paramedic = Paramedic(handler: emergencyHandler)
// emergencyHandler.medicalEmergency()

let emergencyHandler = EmergencyCallHandler()
let surgeon = Surgeon(handler: emergencyHandler)
emergencyHandler.medicalEmergency()

