import UIKit


protocol Car {
    
    func drive()
}

class HugeCar: Car {
    
    func drive() {
        print("you drive huge car")
    }
    
}

class FastCar: Car {
    
    func drive() {
        print("you drive fast car")
    }
    
}

let hugeCar = HugeCar()
hugeCar.drive()

let fastCar = FastCar()
fastCar.drive()

/*===================================================================================*/

// перечисление для определения машины
enum CarType {
    case huge, fast
}

// фабрика
class CarFactory {
    
    static func produceCar(type: CarType) -> Car {
        
        var car: Car
        
        switch type {
            case .fast: car = FastCar()
            case .huge: car = HugeCar()
        }
        
        return car
    }
}

print("===========Factory==========")

let hugeCar1 = CarFactory.produceCar(type: .huge)
let hugeCar2 = CarFactory.produceCar(type: .huge)
hugeCar1.drive()
hugeCar2.drive()

let fastCar1 = CarFactory.produceCar(type: .fast)
let fasCar2 = CarFactory.produceCar(type: .fast)
fastCar1.drive()
fasCar2.drive()



