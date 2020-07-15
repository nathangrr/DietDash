import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var Weight: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.Name.text = UserDefaults.standard.string(forKey: "name")
        self.Age.text = UserDefaults.standard.string(forKey: "age")
        self.Weight.text = UserDefaults.standard.string(forKey: "weight")
        
        self.Name.textColor = UIColor.white
        self.Age.textColor = UIColor.white
        self.Weight.textColor = UIColor.white
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        if !UserDefaults.standard.bool(forKey: "login") {
            performSegue(withIdentifier: "segue1", sender: nil)
        }
        
        self.Name.text = UserDefaults.standard.string(forKey: "name")
        self.Age.text = UserDefaults.standard.string(forKey: "age")
        self.Weight.text = UserDefaults.standard.string(forKey: "weight")
        
        self.Name.textColor = UIColor.white
        self.Age.textColor = UIColor.white
        self.Weight.textColor = UIColor.white
        
    }
    @IBAction func EditButton(_ sender: Any) {
        performSegue(withIdentifier: "EditSegue", sender: nil)
    }
    
    
    
}

