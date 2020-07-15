import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var AgeField: UITextField!
    @IBOutlet weak var WeightField: UITextField!
    @IBOutlet weak var Login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        NameField.layer.shadowColor = UIColor.gray.cgColor
        NameField.layer.shadowOffset = CGSize(width: 5, height: 5)
        NameField.layer.shadowRadius = 5
        NameField.layer.shadowOpacity = 1.0
        
        AgeField.layer.shadowColor = UIColor.gray.cgColor
        AgeField.layer.shadowOffset = CGSize(width: 5, height: 5)
        AgeField.layer.shadowRadius = 5
        AgeField.layer.shadowOpacity = 1.0
        
        WeightField.layer.shadowColor = UIColor.gray.cgColor
        WeightField.layer.shadowOffset = CGSize(width: 5, height: 5)
        WeightField.layer.shadowRadius = 5
        WeightField.layer.shadowOpacity = 1.0
        
    }

    @IBAction func LoginButton(_ sender: UIButton) {
        let textfieldInt: Int? = Int(WeightField.text!)
        if NameField.text!.count > 0 && AgeField.text!.count > 0 && WeightField.text!.count > 0 {
        UserDefaults.standard.set(NameField.text, forKey: "name")
        UserDefaults.standard.set(AgeField.text, forKey: "age")
        UserDefaults.standard.set(WeightField.text, forKey: "weight")
        UserDefaults.standard.set(true, forKey: "login")
        performSegue(withIdentifier: "loginSegue", sender: nil)
        //dismiss(animated: true, completion: nil)
        }
    }
    
    
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
