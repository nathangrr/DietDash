import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var Weight: UILabel!
    @IBOutlet weak var BoostButton1: UIButton!
    @IBOutlet weak var BoostButton2: UIButton!
    @IBOutlet weak var BoostButton3: UIButton!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var Progress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.integer(forKey: "progressPoints"))
        
        // Set the progress view
        // For every obj that is filled, increase the maximum by 35 (5 per day, 7 days)
        // After every 7 days, reset the progress to 0
        // Also display what day (of 7) it currently is
        // If a new item is added within 7 days, make sure it does not affect progress
        
        // Display the buttons
        BoostButton1.isHidden = false
        BoostButton2.isHidden = false
        BoostButton3.isHidden = false
        
        var mostRecentAccess = Date()
        if let temp = UserDefaults.standard.object(forKey: "dayOfWeek") as! Date?{
            mostRecentAccess = temp
        }
        else{
            mostRecentAccess = Date()
        }
        
        let currentDate = Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        
        let df2 = DateFormatter()
        df2.dateFormat = "MM/dd"
        DateLabel.text = df2.string(from: currentDate)
        
        if df.string(from: mostRecentAccess) == df.string(from: currentDate){
            let b1 = UserDefaults.standard.bool(forKey: "boost1")
            let b2 = UserDefaults.standard.bool(forKey: "boost2")
            let b3 = UserDefaults.standard.bool(forKey: "boost3")
            
            if b1 == true{
                BoostButton1.isHidden = true
            }
            if b2 == true{
                BoostButton2.isHidden = true
            }
            if b3 == true{
                BoostButton3.isHidden = true
            }
        }
        else{
            UserDefaults.standard.set(false, forKey: "boost1")
            UserDefaults.standard.set(false, forKey: "boost2")
            UserDefaults.standard.set(false, forKey: "boost3")
        }
        
        UserDefaults.standard.set(currentDate, forKey: "dayOfWeek")
        
        // Set text for boost buttons
        var boostChoices:[String] = ["1 Vegetable", "1 Fruit", "10 Min Walk", "10 Min Stand", "Skip Snack", "Free Boost!", "15 Min Run", "10 Min Abs", "2 Fruit", "2 vegetables"]
        
        self.BoostButton1.setTitle(boostChoices.randomElement(), for: .normal)
        self.BoostButton2.setTitle(boostChoices.randomElement(), for: .normal)
        self.BoostButton3.setTitle(boostChoices.randomElement(), for: .normal)
        
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
    
    @IBAction func Boost1(_ sender: Any) {
        // Increase progress points by 1
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost1")

        
        // Hide button
        BoostButton1.isHidden = true
    }
    @IBAction func Boost2(_ sender: Any) {
        // Increase progress points by 1
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost2")
        
        // Hide button
        BoostButton2.isHidden = true
    }
    
    @IBAction func Boost3(_ sender: Any) {
        // Increase progress points by 1
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost3")
        
        // Hide button
        BoostButton3.isHidden = true
    }
    @IBAction func EditInfoButton(_ sender: Any) {
        performSegue(withIdentifier: "EditDietSegue1", sender: nil)
    }
    @IBAction func GoalsButton(_ sender: Any) {
        performSegue(withIdentifier: "GoalsQueue1", sender: nil)
    }
}
