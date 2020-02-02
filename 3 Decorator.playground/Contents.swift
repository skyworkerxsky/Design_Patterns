import UIKit


protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxter: Porsche {
    
    func getPrice() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porsche Boxter"
    }
    
}

class PorscheDecorator: Porsche {

    private let decoratedPorsche: Porsche
    
    required init(dp: Porsche) {
        self.decoratedPorsche = dp
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
    
}

class PremiumAudioSystem: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with premium audio system"
    }
    
}

class PanoramicSunroof: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 100
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }

}

var porscheBoxter: Porsche = Boxter()
porscheBoxter.getDescription()
porscheBoxter.getPrice()

porscheBoxter = PremiumAudioSystem(dp: porscheBoxter)
porscheBoxter.getDescription()
porscheBoxter.getPrice()

porscheBoxter = PanoramicSunroof(dp: porscheBoxter)
porscheBoxter.getDescription()
porscheBoxter.getPrice()
