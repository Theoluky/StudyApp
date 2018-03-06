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
    
    //Initialization
    
    init?(address: String, host: String, time: String, addinfo: String){
        
        if address.isEmpty || host.isEmpty {
            return nil
        }
        
        self.address = address
        self.host = host
        self.time = time
        self.addinfo = addinfo
    }
}


