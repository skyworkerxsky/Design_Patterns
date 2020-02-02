
// абстрактный класс/протокол

protocol DriveVehicle {
    
    func startVehicle()
    func haveASeat()
    func closeTheDoor()
    func useProtection()
    func lookAtTheMirror()
    func turnSignal()
    func driveForward()
}

extension DriveVehicle { // дефолтная реализация методов
    
    func startVehicle () {
        haveASeat()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("This method should be overriden") // вызывает ошибку
    }
    
    func closeTheDoor() {
        
    }
    
    func useProtection() {
        preconditionFailure("This method should be overriden") // вызывает ошибку
    }
    
    func lookAtTheMirror() {
        preconditionFailure("This method should be overriden") // вызывает ошибку
    }
    
    func turnSignal() {
        preconditionFailure("This method should be overriden") // вызывает ошибку
    }
    
    func driveForward() {
        preconditionFailure("This method should be overriden") // вызывает ошибку
    }
    
}

class Bicycle: DriveVehicle {
    
    func haveASeat() {
        print("sit down on a bicyle seat")
    }
    
    func useProtection() {
        print("wear a helmet")
    }
    
    func lookAtTheMirror() {
        print("look at the mirror")
    }
    
    func turnSignal() {
        print("show left hand")
    }
    
    func driveForward() {
        print("pedal")
    }
    
}

class Car: DriveVehicle {
    
    func haveASeat() {
        print("sit down on a car seat")
        closeTheDoor()
    }
    
    func closeTheDoor() {
        print("cloose the door")
    }
    
    func useProtection() {
        print("fasten seat belt")
    }
    
    func lookAtTheMirror() {
        print("look at the mirror")
    }
    
    func turnSignal() {
        print("turn on left turn light")
    }
    
    func driveForward() {
        print("push pedal")
    }
    
}

let car = Car()
let bicycle = Bicycle()

car.startVehicle()
print("==========================")
bicycle.startVehicle()

