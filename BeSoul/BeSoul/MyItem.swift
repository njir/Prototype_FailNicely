//
//  MyItem.swift
//  BeSoul
//
//  Created by 진형탁 on 2017. 1. 24..
//  Copyright © 2017년 FailNicely. All rights reserved.
//

import Foundation

class MyItem {
    let name:String!
    
    init(name:String) {
        self.name = name
    }
    
    var description: String {
        return name
    }
}
