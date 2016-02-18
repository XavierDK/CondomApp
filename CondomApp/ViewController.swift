/*
* Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
*
* Unauthorized copying of this file, via any medium is strictly prohibited.
* Proprietary and confidential.
*/

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var testLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(animated: Bool) {

    super.viewDidAppear(animated)
    
    self.testLabel.text = "NOT OK"
    
    if var urlStr = NSUserDefaults.standardUserDefaults().objectForKey("urlDebug") as? String {
      
      if let range = urlStr.rangeOfString("Optional(") {
        urlStr.removeRange(range)
      }
      if let range = urlStr.rangeOfString(")") {
        urlStr.removeRange(range)
      }
      
      self.testLabel.text = urlStr

      let url = NSURL(string: urlStr)
      if let url = url {
        
        dispatch_after(1, dispatch_get_main_queue(), { () -> Void in
          UIApplication.sharedApplication().openURL(url)
        })
      }
      else {
        self.testLabel.text = "URL not created"
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

