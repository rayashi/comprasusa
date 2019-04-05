

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tfUSDRate: UITextField!
    
    @IBOutlet weak var txIOFRate: UITextField!
    
    @IBOutlet weak var tfStateTaxesRate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfUSDRate.text = String(calculator.usdRate)
        txIOFRate.text = String(calculator.iofRate)
        tfStateTaxesRate.text = String(calculator.stateTaxeRate)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        calculator.usdRate = calculator.convertToDouble(tfUSDRate.text!)!
        calculator.iofRate = calculator.convertToDouble(txIOFRate.text!)!
        calculator.stateTaxeRate = calculator.convertToDouble(tfUSDRate.text!)!
    }

}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        setValues()
    }
}
