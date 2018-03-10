//
//  Party.swift
//  StudyApp
//
//  Created by Christina Knight on 3/1/18.
//  Copyright © 2018 Christina Knight. All rights reserved.
//

import UIKit

class Party {
    //Properties
    var address: String
    var host: String
    var time: String
    var addinfo: String
    var editable: Bool // can be updated to Array<String> containing all users who can edit
    
    //Initialization
    
    init?(address: String, host: String, time: String, addinfo: String, editable: Bool){
        
        if address.isEmpty || host.isEmpty {
            return nil
        }
        
        self.address = address
        self.host = host
        self.time = time
        self.addinfo = addinfo
        self.editable = editable
    }
}


