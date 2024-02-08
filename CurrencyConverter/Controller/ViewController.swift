//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by yekta on 8.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbtLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.layer.cornerRadius = 20
        checkButton.layer.masksToBounds = true
    }
    
    @IBAction func checkButtonClick(_ sender: Any) {
        let url = URL(string: "ENTER_URL")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            else{
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary <String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String:Any]{
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let gbt = rates["GBP"] as? Double{
                                    self.gbtLabel.text = "GBP: \(gbt)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let trylira = rates["TRY"] as? Double{
                                    self.tryLabel.text = "TRY: \(trylira)"
                                }
                            }
                            
                        }
                    }
                    catch{
                        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        alert.addAction(okButton)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            
        }
        task.resume()
    }
    
    
    
}
