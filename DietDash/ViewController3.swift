import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var Weight: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    @IBAction func SaveSegue(_ sender: Any) {
        UserDefaults.standard.set(Name.text, forKey: "name")
        UserDefaults.standard.set(Age.text, forKey: "age")
        UserDefaults.standard.set(Weight.text, forKey: "weight")
        performSegue(withIdentifier: "SaveSegue", sender: nil)
    }
    
}
