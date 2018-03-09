//
//  PartyViewController.swift
//  StudyApp
//
//  Created by Christina Knight on 3/6/18.
//  Copyright © 2018 Christina Knight. All rights reserved.
//

import UIKit
import os.log

class PartyViewController: UIViewController, UITextFieldDelegate {

    //MARK: Objects
    
    @IBOutlet weak var HLabel: UILabel!
    @IBOutlet weak var HText: UITextField!
    @IBOutlet weak var AddLabel: UILabel!
    @IBOutlet weak var AText: UITextField!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var TimeText: UITextField!
    @IBOutlet weak var InfoLabel: UILabel!
    @IBOutlet weak var InfoText: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var party: Party?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HText.delegate = self
        AText.delegate = self
        TimeText.delegate = self
        InfoText.delegate = self
        
        if let party = party{
            HText.text = party.host
            AText.text = party.address
            TimeText.text = party.time
            InfoText.text = party.addinfo
        }
        // Do any additional setup after loading the view.
    }
    //MARK: UI Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide keyboard
        textField.resignFirstResponder()
        return true
    }
  //
    func textFieldDidEndEditing(_ textField: UITextField) {
    //    HLabel.text = textField.text
    }
    
    //MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let address = AText.text ?? ""
        let host = HText.text ?? ""
        let time = TimeText.text ?? ""
        let addinfo = InfoText.text ?? ""
        
        party = Party(address: address, host: host, time: time, addinfo: addinfo)
    
        
    }
    
    
    //MARK: Actions
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
