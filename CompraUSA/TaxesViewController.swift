

import UIKit

class TaxesViewController: UIViewController {

    
    @IBOutlet weak var lbTotalUSD: UILabel!
    @IBOutlet weak var lbStateTaxes: UILabel!
    @IBOutlet weak var lbTotalBRL: UILabel!
    @IBOutlet weak var swWithCreditCard: UISwitch!
    @IBOutlet weak var lbIOF: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateAll()
    }
    
    @IBAction func changeUsingCreditCard(_ sender: UISwitch) {
        let totalBRL = calculator.calculate(useCreditCard: swWithCreditCard.isOn)
        lbTotalBRL.text = calculator.convertToString(from: totalBRL, currencySymbol: "R$ ")
    }
    
    
    func calculateAll() {
        lbStateTaxes.text = calculator.convertToString(from: calculator.stateTaxesValue, currencySymbol: "US$ ")
        lbIOF.text = calculator.convertToString(from: calculator.iofValue, currencySymbol: "US$ ")
        lbTotalUSD.text = calculator.convertToString(from: calculator.shoppingValueUSD, currencySymbol: "US$")
        
        let totalBRL = calculator.calculate(useCreditCard: swWithCreditCard.isOn)
        lbTotalBRL.text = calculator.convertToString(from: totalBRL, currencySymbol: "R$ ")
    }

}
