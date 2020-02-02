class Enemy {
    let strength = 1600
}

protocol MilitaryChain {
    var strength: Int { get }
    var nextRank: MilitaryChain? { get set }
    func shouldDefeatWithStrength(amount: Int)
}

class Solder: MilitaryChain {
    
    var strength: Int = 100
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Solder got it")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class Officer: MilitaryChain {
    
    var strength: Int = 500
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Officer got it")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class Rambo: MilitaryChain {
    
    var strength: Int = 1000
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Rambo got it")
        } else {
            print("We cant defeat this enemy")
        }
    }
    
}

let enemy = Enemy()

let solder = Solder()
let officer = Officer()
let rambo = Rambo()

solder.nextRank = officer
officer.nextRank = rambo

solder.shouldDefeatWithStrength(amount: enemy.strength)
