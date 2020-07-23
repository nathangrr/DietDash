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
    @IBOutlet weak var Percentage: UILabel!
    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var GreetingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()

        // Get previous Progress Points
        Progress.transform = Progress.transform.scaledBy(x: 1, y: 15)
        let progress = UserDefaults.standard.integer(forKey: "progressPoints")
        
        // Set the maximum of the Progress Bar
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
        
        // Set the progress bar
        let prog = Float(Float(progress)/Float(max))
        Progress.setProgress(prog, animated: true)
        Percentage.text = String(format: "%.01f", prog * 100) + "%"
        
        // Display the 3 boost buttons initially
        BoostButton1.isHidden = false
        BoostButton2.isHidden = false
        BoostButton3.isHidden = false
        
        // Determine the most recent time the app was accessed
        var mostRecentAccess = Date()
        if let temp = UserDefaults.standard.object(forKey: "dayOfWeek") as! Date?{
            mostRecentAccess = temp
        }
        else{
            mostRecentAccess = Date()
        }
        
        // Set the max and the dayOfWeek for future reference
        UserDefaults.standard.set(mostRecentAccess, forKey: "dayOfWeek2")
        UserDefaults.standard.set(mostRecentAccess, forKey: "dayOfWeek")
        UserDefaults.standard.set(max, forKey: "max")
        
        //##############
        // Date Formats
        let currentDate = Date()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        
        let greetingsDate = DateFormatter()
        greetingsDate.dateFormat = "HH"
        let militaryHour = Int(greetingsDate.string(from: currentDate))!
        if militaryHour >= 0 && militaryHour < 12{
            GreetingsLabel.text = "Good Morning!"
        }
        if militaryHour >= 12 && militaryHour <= 17{
            GreetingsLabel.text = "Good Afternoon!"
        }
        if militaryHour > 17{
            GreetingsLabel.text = "Good Evening!"
        }
        
        let df2 = DateFormatter()
        df2.dateFormat = "MM/dd"
        DateLabel.text = df2.string(from: currentDate)
        
        let df3 = DateFormatter()
        df3.dateFormat = "EEEE"
        Day.text = df3.string(from: currentDate)
        //##############
        
        let previousWeekOfYear = UserDefaults.standard.integer(forKey: "weekOfYear")
        let calendar = Calendar.current
        let currentWeekOfYear = calendar.component(.weekOfYear, from: Date.init(timeIntervalSinceNow: 0))
        
        if previousWeekOfYear != currentWeekOfYear{
            if Completed(points: prog) == true{
                
                let previous = UserDefaults.standard.integer(forKey: "weeklyMap")
                UserDefaults.standard.set(previous + 1, forKey: "weeklyMap")
            }
            
            Progress.setProgress(0, animated: true)
            UserDefaults.standard.set(0, forKey: "progressPoints")
            Percentage.text = "0%"
            
        }
        
        UserDefaults.standard.set(currentWeekOfYear, forKey: "weekOfYear")
        
        // If the week has ended, reset the progress bar
        let dayNumber = Date().dayNumberOfWeek()!
        
        UserDefaults.standard.set(dayNumber, forKey: "previousDate")
        UserDefaults.standard.set(dayNumber, forKey: "dayNumber")
        
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
        var boostChoices:[String] = ["1 Vegetable", "1 Fruit", "10 Min Walk", "5 Min Stand", "Skip Snack", "Free Boost!", "15 Min Run", "10 Min Abs", "2 Fruit", "2 vegetables"]
        
        boostChoices = boostChoices.shuffled()
        
        self.BoostButton1.setTitle(boostChoices[0], for: .normal)
        self.BoostButton2.setTitle(boostChoices[1], for: .normal)
        self.BoostButton3.setTitle(boostChoices[2], for: .normal)
        
        self.Name.text = UserDefaults.standard.string(forKey: "name")
        self.Age.text = UserDefaults.standard.string(forKey: "age")
        self.Weight.text = UserDefaults.standard.string(forKey: "weight")
        
        self.Name.textColor = UIColor.white
        
        // If progress is 100%, display message
        if Completed(points: prog) == true {
            Percentage.text = "Dash Complete!"
            Percentage.textColor = UIColor.green
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func viewDidAppear(_ animated: Bool) {
        if !UserDefaults.standard.bool(forKey: "login") {
            performSegue(withIdentifier: "segue1", sender: nil)
        }
        
        self.Name.text = UserDefaults.standard.string(forKey: "name")
        self.Age.text = UserDefaults.standard.string(forKey: "age")
        self.Weight.text = UserDefaults.standard.string(forKey: "weight")
        
        self.Name.textColor = UIColor.white
        
    }
    
    @IBAction func EditButton(_ sender: Any) {
        performSegue(withIdentifier: "EditSegue", sender: nil)
    }
    
    @IBAction func Boost1(_ sender: Any) {
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost1")
        BoostButton1.isHidden = true
        
        let max = UserDefaults.standard.integer(forKey: "max")
        let progress = UserDefaults.standard.integer(forKey: "progressPoints")
        let prog = Float(Float(progress)/Float(max))
        Progress.setProgress(prog, animated: true)
        Percentage.text = String(format: "%.01f", prog * 100) + "%"
        
        // If progress is 100%, display message
        if Completed(points: prog) == true {
            Percentage.text = "Dash Complete!"
            Percentage.textColor = UIColor.green
        }
    }
    @IBAction func Boost2(_ sender: Any) {
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost2")
        BoostButton2.isHidden = true
        
        let max = UserDefaults.standard.integer(forKey: "max")
        let progress = UserDefaults.standard.integer(forKey: "progressPoints")
        let prog = Float(Float(progress)/Float(max))
        Progress.setProgress(prog, animated: true)
        Percentage.text = String(format: "%.01f", prog * 100) + "%"
        
        // If progress is 100%, display message
        if Completed(points: prog) == true {
            Percentage.text = "Dash Complete!"
            Percentage.textColor = UIColor.green
        }
    }
    
    @IBAction func Boost3(_ sender: Any) {
        let current = UserDefaults.standard.integer(forKey: "progressPoints")
        UserDefaults.standard.set(current + 1, forKey: "progressPoints")
        UserDefaults.standard.set(true, forKey: "boost3")
        BoostButton3.isHidden = true
        
        let max = UserDefaults.standard.integer(forKey: "max")
        let progress = UserDefaults.standard.integer(forKey: "progressPoints")
        let prog = Float(Float(progress)/Float(max))
        Progress.setProgress(prog, animated: true)
        Percentage.text = String(format: "%.01f", prog * 100) + "%"
        
        // If progress is 100%, display message
        if Completed(points: prog) == true {
            Percentage.text = "Dash Complete!"
            Percentage.textColor = UIColor.green
        }
    }
    
    @IBAction func EditInfoButton(_ sender: Any) {
        performSegue(withIdentifier: "EditDietSegue1", sender: nil)
    }
    @IBAction func GoalsButton(_ sender: Any) {
        performSegue(withIdentifier: "GoalsQueue1", sender: nil)
    }
    @IBAction func MoreButton(_ sender: Any) {
        performSegue(withIdentifier: "MoreSegue", sender: nil)
    }
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}

func Completed(points: Float) -> Bool? {
    if (points * 100) >= 100{
        return true
    }
    return false
}
