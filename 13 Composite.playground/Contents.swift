
// прокол определяет менеджеров
protocol Coworker {
    func hire(coworker: Coworker)
    func getInfo()
    var lvl: Int { get }
}

// branch
class Manager: Coworker {

    private var coworkers = [Coworker]()
    var lvl: Int
    
    init (lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        self.coworkers.append(coworker)
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
        for coworker in coworkers {
            coworker.getInfo()
        }
    }
}

// leaf
class LowLevelManager: Coworker {

    var lvl: Int
    
    init (lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        print("cant hire")
    }
    
    func getInfo() {
        print(self.lvl.description + " level manager")
    }
}

let topManager = Manager(lvl: 1)
let managerlevel2 = Manager(lvl: 2)

let managerLevel3_1 = Manager(lvl: 3)
let managerLevel3_2 = Manager(lvl: 3)

let managerLevel10 = Manager(lvl: 10)

topManager.hire(coworker: managerlevel2)

managerlevel2.hire(coworker: managerLevel3_1)
managerlevel2.hire(coworker: managerLevel3_2)

managerLevel3_1.hire(coworker: managerLevel10)

topManager.getInfo()
