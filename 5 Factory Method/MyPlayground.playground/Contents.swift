import UIKit

protocol Vehicle {
    func drive()
}

class Car: Vehicle {
    func drive() {
        print("Drive a car")
    }
}

class Truck: Vehicle {
    func drive() {
        print("Drive a truck")
    }
}

class Bus: Vehicle {
    func drive() {
        print("Drive a bus")
    }
}

// в отличие от Simple Factory мы создаем фабрику для каждого типа

protocol VehicleFactory { // Нужен для создание фабрики
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Car is created")
        return Car()
    }
}

class TruckFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Truck is created")
        return Truck()
    }
}

class BusFactory: VehicleFactory {
    func produce() -> Vehicle {
        print("Bus is created")
        return Bus()
    }
}

let carFactory = CarFactory()
let car = carFactory.produce()

let truckFactory = TruckFactory()
let truck = truckFactory.produce()

let busFactory = BusFactory()
let bus = busFactory.produce()
