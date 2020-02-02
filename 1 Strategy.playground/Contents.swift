import UIKit

/*
 Стратегия — это поведенческий паттерн проектирования, который определяет семейство схожих алгоритмов и помещает каждый из них в собственный класс, после чего алгоритмы можно взаимозаменять прямо во время исполнения программы.
 */

// protocol one
protocol SwimBehavior {
    func swim()
}

class ProffesionalSwimer: SwimBehavior {
    
    func swim() {
        print("proffesional swim")
    }
}

class NonSwimmer: SwimBehavior {
    
    func swim() {
        print("non swimming")
    }
}

// protocol two
protocol DiveBehavior {
    func dive()
}

class ProffesionalDiver: DiveBehavior {
    
    func dive() {
        print("proffesional diving")
    }
}

class NewbieDiver: DiveBehavior {
    
    func dive() {
        print("newbie diving")
    }
}

class NonDiver: DiveBehavior {
    
    func dive() {
        print("non diving")
    }
}

// class human
class Human {
    
    private var swimBehavior: SwimBehavior!
    private var diveBehavior: DiveBehavior!
    
    func performSwim() {
        swimBehavior.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func setSwimBehavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    
    func setDiveBehavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    
    func run() {
        print("running")
    }
    
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
    
}

let human = Human(swimBehavior: ProffesionalSwimer(), diveBehavior: ProffesionalDiver())
human.setSwimBehavior(sb: NonSwimmer() )
human.performSwim()
human.performDive()



