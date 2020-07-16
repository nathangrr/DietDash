import UIKit

class ViewController4: UIViewController {
    @IBOutlet weak var O1: UITextField!
    @IBOutlet weak var O2: UITextField!
    @IBOutlet weak var O3: UITextField!
    @IBOutlet weak var O4: UITextField!
    @IBOutlet weak var O5: UITextField!
    @IBOutlet weak var O6: UITextField!
    
    @IBOutlet weak var G1: UITextField!
    @IBOutlet weak var G2: UITextField!
    @IBOutlet weak var G3: UITextField!
    @IBOutlet weak var G4: UITextField!
    @IBOutlet weak var G5: UITextField!
    @IBOutlet weak var G6: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        O1.text = UserDefaults.standard.string(forKey: "Obj1")
        G1.text = UserDefaults.standard.string(forKey: "Goal1")
        O2.text = UserDefaults.standard.string(forKey: "Obj2")
        G2.text = UserDefaults.standard.string(forKey: "Goal2")
        O3.text = UserDefaults.standard.string(forKey: "Obj3")
        G3.text = UserDefaults.standard.string(forKey: "Goal3")
        O4.text = UserDefaults.standard.string(forKey: "Obj4")
        G4.text = UserDefaults.standard.string(forKey: "Goal4")
        O5.text = UserDefaults.standard.string(forKey: "Obj5")
        G5.text = UserDefaults.standard.string(forKey: "Goal5")
        O6.text = UserDefaults.standard.string(forKey: "Obj6")
        G6.text = UserDefaults.standard.string(forKey: "Goal6")
    }
    
    @IBAction func BackToProfile(_ sender: Any) {
        performSegue(withIdentifier: "ProfileSegue1", sender: nil)
    }
    @IBAction func SaveChangesButton(_ sender: Any) {
        SetUserData()
    }
    
    func SetUserData(){
        // Objectives
        UserDefaults.standard.set(O1.text, forKey: "Obj1")
        UserDefaults.standard.set(O2.text, forKey: "Obj2")
        UserDefaults.standard.set(O3.text, forKey: "Obj3")
        UserDefaults.standard.set(O4.text, forKey: "Obj4")
        UserDefaults.standard.set(O5.text, forKey: "Obj5")
        UserDefaults.standard.set(O6.text, forKey: "Obj6")
            
        // Goals
        UserDefaults.standard.set(G1.text, forKey: "Goal1")
        UserDefaults.standard.set(G2.text, forKey: "Goal2")
        UserDefaults.standard.set(G3.text, forKey: "Goal3")
        UserDefaults.standard.set(G4.text, forKey: "Goal4")
        UserDefaults.standard.set(G5.text, forKey: "Goal5")
        UserDefaults.standard.set(G6.text, forKey: "Goal6")
    }
    @IBAction func GoalsButton(_ sender: Any) {
        performSegue(withIdentifier: "GoalsSegue3", sender: nil)
    }
    
}


