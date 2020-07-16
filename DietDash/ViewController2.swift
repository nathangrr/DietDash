import UIKit

class ViewController2: UIViewController {

    // Connections
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var AgeField: UITextField!
    @IBOutlet weak var WeightField: UITextField!
    @IBOutlet weak var Login: UIButton!
    
    @IBOutlet weak var Obj1: UITextField!
    @IBOutlet weak var Obj2: UITextField!
    @IBOutlet weak var Obj3: UITextField!
    @IBOutlet weak var Obj4: UITextField!
    @IBOutlet weak var Obj5: UITextField!
    @IBOutlet weak var Obj6: UITextField!
    
    @IBOutlet weak var Goal1: UITextField!
    @IBOutlet weak var Goal2: UITextField!
    @IBOutlet weak var Goal3: UITextField!
    @IBOutlet weak var Goal4: UITextField!
    @IBOutlet weak var Goal5: UITextField!
    @IBOutlet weak var Goal6: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        
        var dayNumber = Date().dayNumberOfWeek2()!
        UserDefaults.standard.set(500, forKey: "previousDate")
        UserDefaults.standard.set(dayNumber, forKey: "dayNumber")

        let date = Date()
        UserDefaults.standard.set(date, forKey: "dayOfWeek")
        UserDefaults.standard.set(false, forKey: "boost1")
        UserDefaults.standard.set(false, forKey: "boost2")
        UserDefaults.standard.set(false, forKey: "boost3")
        
        // Keep track of the diet progress
        UserDefaults.standard.set(0, forKey: "progressPoints")
        
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
        
        UserDefaults.standard.set(false, forKey: "finished1")
        UserDefaults.standard.set(false, forKey: "finished2")
        UserDefaults.standard.set(false, forKey: "finished3")
        UserDefaults.standard.set(false, forKey: "finished4")
        UserDefaults.standard.set(false, forKey: "finished5")
        UserDefaults.standard.set(false, forKey: "finished6")

        
    }

    @IBAction func LoginButton(_ sender: UIButton) {
        let textfieldInt: Int? = Int(WeightField.text!)
        if NameField.text!.count > 0 && AgeField.text!.count > 0 && WeightField.text!.count > 0 {
        UserDefaults.standard.set(NameField.text, forKey: "name")
        UserDefaults.standard.set(AgeField.text, forKey: "age")
        UserDefaults.standard.set(WeightField.text, forKey: "weight")
        UserDefaults.standard.set(true, forKey: "login")
        performSegue(withIdentifier: "loginSegue", sender: nil)
        SetUserData()
        }
    }
    
    func SetUserData(){
        // Objectives
        UserDefaults.standard.set(Obj1.text, forKey: "Obj1")
        UserDefaults.standard.set(Obj2.text, forKey: "Obj2")
        UserDefaults.standard.set(Obj3.text, forKey: "Obj3")
        UserDefaults.standard.set(Obj4.text, forKey: "Obj4")
        UserDefaults.standard.set(Obj5.text, forKey: "Obj5")
        UserDefaults.standard.set(Obj6.text, forKey: "Obj6")
            
        // Goals
        UserDefaults.standard.set(Goal1.text, forKey: "Goal1")
        UserDefaults.standard.set(Goal2.text, forKey: "Goal2")
        UserDefaults.standard.set(Goal3.text, forKey: "Goal3")
        UserDefaults.standard.set(Goal4.text, forKey: "Goal4")
        UserDefaults.standard.set(Goal5.text, forKey: "Goal5")
        UserDefaults.standard.set(Goal6.text, forKey: "Goal6")
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

extension Date {
    func dayNumberOfWeek2() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
