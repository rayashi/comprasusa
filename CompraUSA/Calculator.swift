import Foundation

class Calculator {
    
    static let shared = Calculator()
    
    var usdRate: Double = 3.5
    var iofRate: Double = 6.38
    var stateTaxeRate: Double = 7.0
    var shoppingValueUSD: Double = 0.0
    
    let formatter = NumberFormatter()
    
    var shoppingValueBRL: Double {
        return shoppingValueUSD * usdRate
    }
    var stateTaxesValue: Double {
        return stateTaxeRate * shoppingValueUSD / 100
    }
    var iofValue: Double {
        return iofRate * shoppingValueUSD / 100
    }
    
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
    func calculate(useCreditCard: Bool) -> Double {
        let finalValue = shoppingValueUSD + stateTaxeRate
        if useCreditCard {
            return (finalValue + iofValue) * usdRate
        } else {
            return finalValue * usdRate
        }
    }
    
    func convertToDouble(_ string: String) -> Double? {
        formatter.numberStyle = .none
        let vlr = formatter.number(from: string)?.doubleValue
        return vlr
    }
}

