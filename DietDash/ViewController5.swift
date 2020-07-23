import UIKit

class ViewController5: UIViewController {
    @IBOutlet weak var Item1: UILabel!
    @IBOutlet weak var Item2: UILabel!
    @IBOutlet weak var Item3: UILabel!
    @IBOutlet weak var Item4: UILabel!
    @IBOutlet weak var Item5: UILabel!
    @IBOutlet weak var Item6: UILabel!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()

        Item1.text = UserDefaults.standard.string(forKey: "Obj1")
        Item2.text = UserDefaults.standard.string(forKey: "Obj2")
        Item3.text = UserDefaults.standard.string(forKey: "Obj3")
        Item4.text = UserDefaults.standard.string(forKey: "Obj4")
        Item5.text = UserDefaults.standard.string(forKey: "Obj5")
        Item6.text = UserDefaults.standard.string(forKey: "Obj6")
        
        // Check if a day has passed. If so, set all buttons to original state
        var mostRecentAccess = Date()
        if let temp = UserDefaults.standard.object(forKey: "dayOfWeek2") as! Date?{
            mostRecentAccess = temp
        }
        else{
            mostRecentAccess = Date()
        }
        
        let currentDate = Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        
        // Set all default buttons here
        Button1.backgroundColor = UIColor.red
        Button1.isEnabled = true
        Button2.backgroundColor = UIColor.red
        Button2.isEnabled = true
        Button3.backgroundColor = UIColor.red
        Button3.isEnabled = true
        Button4.backgroundColor = UIColor.red
        Button4.isEnabled = true
        Button5.backgroundColor = UIColor.red
        Button5.isEnabled = true
        Button6.backgroundColor = UIColor.red
        Button6.isEnabled = true
        
        if df.string(from: mostRecentAccess) == df.string(from: currentDate){
            print("YES")
            
            if UserDefaults.standard.bool(forKey: "finished1"){
                Button1.backgroundColor = UIColor.green
                Button1.isEnabled = false
            }
            if UserDefaults.standard.bool(forKey: "finished2"){
                Button2.backgroundColor = UIColor.green
                Button2.isEnabled = false
            }
            if UserDefaults.standard.bool(forKey: "finished3"){
                Button3.backgroundColor = UIColor.green
                Button3.isEnabled = false
            }
            if UserDefaults.standard.bool(forKey: "finished4"){
                Button4.backgroundColor = UIColor.green
                Button4.isEnabled = false
            }
            if UserDefaults.standard.bool(forKey: "finished5"){
                Button5.backgroundColor = UIColor.green
                Button5.isEnabled = false
            }
            if UserDefaults.standard.bool(forKey: "finished6"){
                Button6.backgroundColor = UIColor.green
                Button6.isEnabled = false
            }
            
        }
        else{
            print("NO")
            UserDefaults.standard.set(false, forKey: "finished1")
            UserDefaults.standard.set(false, forKey: "finished2")
            UserDefaults.standard.set(false, forKey: "finished3")
            UserDefaults.standard.set(false, forKey: "finished4")
            UserDefaults.standard.set(false, forKey: "finished5")
            UserDefaults.standard.set(false, forKey: "finished6")
        }
        
        if Item1.text == ""{
            Button1.isHidden = true
        }
        if Item2.text == ""{
            Button2.isHidden = true
        }
        if Item3.text == ""{
            Button3.isHidden = true
        }
        if Item4.text == ""{
            Button4.isHidden = true
        }
        if Item5.text == ""{
            Button5.isHidden = true
        }
        if Item6.text == ""{
            Button6.isHidden = true
        }
        
        UserDefaults.standard.set(currentDate, forKey: "dayOfWeek2")
    }
    
    @IBAction func ProfileButton(_ sender: Any) {
        performSegue(withIdentifier: "ProfileQueue2", sender: nil)
    }
    @IBAction func EditButton(_ sender: Any) {
        performSegue(withIdentifier: "EditSegue3", sender: nil)
    }
    @IBAction func B1(_ sender: Any) {
        Button1.backgroundColor = UIColor.green
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 5, forKey: "progressPoints")
        Button1.isEnabled = false
        UserDefaults.standard.set(true, forKey: "finished1")
    }
    @IBAction func B2(_ sender: Any) {
        Button2.backgroundColor = UIColor.green
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 5, forKey: "progressPoints")
        Button1.isEnabled = false
        UserDefaults.standard.set(true, forKey: "finished2")
    }
    @IBAction func B3(_ sender: Any) {
        Button3.backgroundColor = UIColor.green
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 5, forKey: "progressPoints")
        Button1.isEnabled = false
        UserDefaults.standard.set(true, forKey: "finished3")
    }
    @IBAction func B4(_ sender: Any) {
        Button4.backgroundColor = UIColor.green
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 5, forKey: "progressPoints")
        Button1.isEnabled = false
        UserDefaults.standard.set(true, forKey: "finished4")
    }
    @IBAction func B5(_ sender: Any) {
        Button5.backgroundColor = UIColor.green
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 5, forKey: "progressPoints")
        Button1.isEnabled = false
        UserDefaults.standard.set(true, forKey: "finished5")
    }
    @IBAction func B6(_ sender: Any) {
        Button6.backgroundColor = UIColor.green
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 5, forKey: "progressPoints")
        Button1.isEnabled = false
        UserDefaults.standard.set(true, forKey: "finished6")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
}
