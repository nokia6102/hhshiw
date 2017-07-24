

import UIKit
import Firebase


class ViewController: UIViewController {
 
    @IBOutlet weak var labelMyText: UILabel!
    @IBOutlet weak var txtInput: UITextField!
  
    var  ref  : DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
  ref = Database.database().reference(fromURL: "https://myfirebase-c064c.firebaseio.com/").child("test")
        
      
      
         ref.observe(DataEventType.value, with: { (snapshot) in
            let postString = snapshot.value as! String
            self.labelMyText.text = postString
         })
    }
 
    @IBAction func pressButton(_ sender: UIButton)
    {
          ref.setValue(txtInput.text)
    }


}

