import UIKit

class ViewController6: UIViewController {

    @IBOutlet weak var L1: UILabel!
    @IBOutlet weak var L2: UILabel!
    @IBOutlet weak var L3: UILabel!
    @IBOutlet weak var L4: UILabel!
    @IBOutlet weak var L5: UILabel!
    @IBOutlet weak var L6: UILabel!
    @IBOutlet weak var L7: UILabel!
    @IBOutlet weak var L8: UILabel!
    @IBOutlet weak var L9: UILabel!
    @IBOutlet weak var L10: UILabel!
    @IBOutlet weak var L11: UILabel!
    @IBOutlet weak var L12: UILabel!
    @IBOutlet weak var L13: UILabel!
    @IBOutlet weak var L14: UILabel!
    @IBOutlet weak var L15: UILabel!
    @IBOutlet weak var L16: UILabel!
    @IBOutlet weak var L17: UILabel!
    @IBOutlet weak var L18: UILabel!
    @IBOutlet weak var L19: UILabel!
    @IBOutlet weak var L20: UILabel!
    @IBOutlet weak var L21: UILabel!
    @IBOutlet weak var L22: UILabel!
    @IBOutlet weak var L23: UILabel!
    @IBOutlet weak var L24: UILabel!
    @IBOutlet weak var L25: UILabel!
    @IBOutlet weak var L26: UILabel!
    @IBOutlet weak var L27: UILabel!
    @IBOutlet weak var L28: UILabel!
    @IBOutlet weak var L29: UILabel!
    @IBOutlet weak var L30: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // the number of weeks successfully completed
        var number = UserDefaults.standard.integer(forKey: "weeklyMap")
        
        // Change the color of the squared based off of the number of points
        L1?.layer.cornerRadius = 40.0
        L1?.layer.masksToBounds = true
        L2?.layer.cornerRadius = 40.0
        L2?.layer.masksToBounds = true
        L3?.layer.cornerRadius = 40.0
        L3?.layer.masksToBounds = true
        L4?.layer.cornerRadius = 40.0
        L4?.layer.masksToBounds = true
        L5?.layer.cornerRadius = 40.0
        L5?.layer.masksToBounds = true
        L6?.layer.cornerRadius = 40.0
        L6?.layer.masksToBounds = true
        L7?.layer.cornerRadius = 40.0
        L7?.layer.masksToBounds = true
        L8?.layer.cornerRadius = 40.0
        L8?.layer.masksToBounds = true
        L9?.layer.cornerRadius = 40.0
        L9?.layer.masksToBounds = true
        L10?.layer.cornerRadius = 40.0
        L10?.layer.masksToBounds = true
        L11?.layer.cornerRadius = 40.0
        L11?.layer.masksToBounds = true
        L12?.layer.cornerRadius = 40.0
        L12?.layer.masksToBounds = true
        L13?.layer.cornerRadius = 40.0
        L13?.layer.masksToBounds = true
        L14?.layer.cornerRadius = 40.0
        L14?.layer.masksToBounds = true
        L15?.layer.cornerRadius = 40.0
        L15?.layer.masksToBounds = true
        L16?.layer.cornerRadius = 40.0
        L16?.layer.masksToBounds = true
        L17?.layer.cornerRadius = 40.0
        L17?.layer.masksToBounds = true
        L18?.layer.cornerRadius = 40.0
        L18?.layer.masksToBounds = true
        L19?.layer.cornerRadius = 40.0
        L19?.layer.masksToBounds = true
        L20?.layer.cornerRadius = 40.0
        L20?.layer.masksToBounds = true
        L21?.layer.cornerRadius = 40.0
        L21?.layer.masksToBounds = true
        L22?.layer.cornerRadius = 40.0
        L22?.layer.masksToBounds = true
        L23?.layer.cornerRadius = 40.0
        L23?.layer.masksToBounds = true
        L24?.layer.cornerRadius = 40.0
        L24?.layer.masksToBounds = true
        L25?.layer.cornerRadius = 40.0
        L25?.layer.masksToBounds = true
        L26?.layer.cornerRadius = 40.0
        L26?.layer.masksToBounds = true
        L27?.layer.cornerRadius = 40.0
        L27?.layer.masksToBounds = true
        L28?.layer.cornerRadius = 40.0
        L28?.layer.masksToBounds = true
        L29?.layer.cornerRadius = 40.0
        L29?.layer.masksToBounds = true
        L30?.layer.cornerRadius = 40.0
        L30?.layer.masksToBounds = true
        
        L1.backgroundColor = UIColor.green
        
        
        print(number)
    }

}
