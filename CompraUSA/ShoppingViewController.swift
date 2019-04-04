import UIKit

class ShoppingViewController: UIViewController {

    
    @IBOutlet weak var tfUSD: UITextField!

    @IBOutlet weak var tfBRL: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmount()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        setAmount()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAmount()
        
    }
    
    func setAmount() {
        if let shoppingValue = calculator.convertToDouble(tfUSD.text!) {
            calculator.shoppingValueUSD = shoppingValue
            tfBRL.text = "\(calculator.shoppingValueBRL)"
        }
    }

}

