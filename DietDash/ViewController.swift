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
    @IBOutlet weak var ProgressDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.integer(forKey: "progressPoints"))
        
        var progress = UserDefaults.standard.integer(forKey: "progressPoints")
        var max = 0
        if UserDefaults.standard.string(forKey: "Obj1") != ""{
            max += 35
        }
        if UserDefaults.standard.string(forKey: "Obj2") != ""{
            max += 35
        }
        if UserDefaults.standard.string(forKey: "Obj3") != ""{
            max += 35
        }
        if UserDefaults.standard.string(forKey: "Obj4") != ""{
            max += 35
        }
        if UserDefaults.standard.string(forKey: "Obj5") != ""{
            max += 35
        }
        if UserDefaults.standard.string(forKey: "Obj6") != ""{
            max += 35
        }
        
        let prog = Float(Float(progress)/Float(max))
        Progress.setProgress(prog, animated: true)
        
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
        
        UserDefaults.standard.set(max, forKey: "max")
        
        let currentDate = Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        
        let df2 = DateFormatter()
        df2.dateFormat = "MM/dd"
        DateLabel.text = df2.string(from: currentDate)
        
        var dayNumber = Date().dayNumberOfWeek()!
        if UserDefaults.standard.integer(forKey: "previousDate") == 7 && dayNumber == 1{
            Progress.setProgress(0, animated: true)
            UserDefaults.standard.set(0, forKey: "progressPoints")
            UserDefaults.standard.set(dayNumber, forKey: "dayNumber")

        }
        UserDefaults.standard.set(dayNumber, forKey: "previousDate")
        var difference = (UserDefaults.standard.integer(forKey: "dayNumber") - dayNumber) + 1
        print(difference)
        
        ProgressDate.text = String(difference)
                
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
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost1")
        BoostButton1.isHidden = true
        
        var max = UserDefaults.standard.integer(forKey: "max")
        var progress = UserDefaults.standard.integer(forKey: "progressPoints")
        let prog = Float(Float(progress)/Float(max))
        Progress.setProgress(prog, animated: true)
    }
    @IBAction func Boost2(_ sender: Any) {
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost2")
        BoostButton2.isHidden = true
        
        var max = UserDefaults.standard.integer(forKey: "max")
        var progress = UserDefaults.standard.integer(forKey: "progressPoints")
        let prog = Float(Float(progress)/Float(max))
        Progress.setProgress(prog, animated: true)
    }
    
    @IBAction func Boost3(_ sender: Any) {
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost3")
        BoostButton3.isHidden = true
        
        var max = UserDefaults.standard.integer(forKey: "max")
        var progress = UserDefaults.standard.integer(forKey: "progressPoints")
        let prog = Float(Float(progress)/Float(max))
        Progress.setProgress(prog, animated: true)
    }
    @IBAction func EditInfoButton(_ sender: Any) {
        performSegue(withIdentifier: "EditDietSegue1", sender: nil)
    }
    @IBAction func GoalsButton(_ sender: Any) {
        performSegue(withIdentifier: "GoalsQueue1", sender: nil)
    }
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
