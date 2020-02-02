
class Driver {
    let isGoodDriver: Bool
    let name: String
    
    init(isGood: Bool, name: String) {
        self.isGoodDriver = isGood
        self.name = name
    }
}

class Car {
    
    var goodDriverIterator: GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
    
    private let drivers = [
        Driver(isGood: true, name: "Vasya"),
        Driver(isGood: false, name: "Max"),
        Driver(isGood: false, name: "Kot"),
        Driver(isGood: true, name: "Morgan")
    ]
}

// подписываемся по протокол Sequence чтобы создать iterator
extension Car: Sequence {
    func makeIterator() -> GoodDriverIterator {
        return GoodDriverIterator(drivers: drivers)
    }
}

protocol BasicIterator: IteratorProtocol {
    init(drivers: [Driver])
    func allDrivers() -> [Driver]
}

// подписываемся под протокол чтобы реализовать итератор
class GoodDriverIterator: BasicIterator {
    
    private let drivers: [Driver]   // массив который передаем
    private var current = 0         // текущий элемент
    
    
    func next() -> Driver? {
        defer { current += 1 } // прибавляем счетчик при возврате значения чтобы перебрать
        return drivers.count > current ? drivers[current] : nil // если есть след водитель то вернет его
    }
    
    func allDrivers() -> [Driver] {
        return drivers
    }
    
    required init(drivers: [Driver]) {
        self.drivers = drivers.filter{ $0.isGoodDriver } // отфильтровали массив только isGood(true)
    }
    
}


let car = Car()
let goodDriverIterator = car.goodDriverIterator.next()

let goodDriverIteratorViaSequnce = car.makeIterator().allDrivers()


//let array = [1,2,3,4]
//let iterator = array.makeIterator()
