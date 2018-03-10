//
//  PartyTableViewController.swift
//  StudyApp
//
//  Created by Christina Knight on 3/1/18.
//  Copyright © 2018 Christina Knight. All rights reserved.
//

import UIKit
import os.log

class PartyTableViewController: UITableViewController, UITextFieldDelegate {

    //MARK: Properties
    
    var parties = [Party]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        loadSampleParties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    //MARK: Actions
    
    @IBAction func unwindToPartyList(sender: UIStoryboardSegue){
        
        if let sourceViewController = sender.source as? PartyViewController, let party = sourceViewController.party {
    
            //Add new party
            
            let newIndexPath = IndexPath(row: parties.count, section: 0)
            parties.append(party)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
  
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PartyTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PartyTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")

        }
        
        let party = parties[indexPath.row]
        
        cell.HostLabel.text = party.host
        cell.AddressLabel.text = party.address
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? ""){
            
        case "AddItem":
            os_log("Adding a new party.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let partyDetailViewController = segue.destination as? PartyViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPartyCell = sender as? PartyTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedPartyCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedParty = parties[indexPath.row]
            partyDetailViewController.party = selectedParty
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    
    //MARK: Private Methods
    
    private func loadSampleParties() {
        guard let party1 = Party(address: "504 Concord Ave", host: "Christina", time: "midnight", addinfo: "yolo", editable: false) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let party2 = Party(address: "125 Rockwood Street", host: "Lucy", time: "8 pm", addinfo: "fun", editable: true) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let party3 = Party(address: "101 Canal Street", host: "Worthy", time: "10 pm", addinfo: "partayyy", editable: true) else {
            fatalError("Unable to instantiate meal1")
        }
        
        parties += [party1, party2, party3]
        
    }

}
