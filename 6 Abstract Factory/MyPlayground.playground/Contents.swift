import UIKit

// легкие автомобили
protocol Car {
    func drive()
}

class LittleSizeCar: Car {
    func drive() {
        print("Drive little car")
    }
}

class MiddleSizeCar: Car {
    func drive() {
        print("Drive middle car")
    }
}

// автобусы
protocol Bus {
    func drive()
}

class LittleSizeBus: Bus {
    func drive() {
        print("Drive little bus")
    }
}

class MiddleSizeBus: Bus {
    func drive() {
        print("Drive middle size bus")
    }
}

// протокол оисывающий фабрику
protocol Factory {
    func produceBus() -> Bus
    func produceCar() -> Car
}

// создаем две фабрики
class LittleSizeFactory: Factory {
    
    func produceBus() -> Bus {
        print("Little bus created")
        return LittleSizeBus()
    }
    
    func produceCar() -> Car {
        print("Little car created")
        return LittleSizeCar()
    }
    
}

class MiddleSizeFactory: Factory {
    
    func produceBus() -> Bus {
        print("Middle bus created")
        return MiddleSizeBus()
    }
    
    func produceCar() -> Car {
        print("Middle car created")
        return MiddleSizeCar()
    }
    
}

let littleFactory = LittleSizeFactory()
littleFactory.produceBus()

let middleSizeFactory = MiddleSizeFactory()
middleSizeFactory.produceBus()

