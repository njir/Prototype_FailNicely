//
//  DataManager.swift
//  BeSoul
//
//  Created by 진형탁 on 2017. 1. 24..
//  Copyright © 2017년 FailNicely. All rights reserved.
//

import Foundation

class DataManager {
    func requestData(offset:Int, size:Int, listener:@escaping ([MyItem]) -> ()) {
        DispatchQueue.global(qos: .background).async {
            //Sleep the Process
            if offset != 0 {
                sleep(2)
            }
            
            //generate items
            var arr = [MyItem]()
            for i in offset...(offset + size) {
                arr.append(MyItem(name: "Item " + String(i)))
            }
            
            print(arr)
            
            //call listener in main thread
            DispatchQueue.main.async {
                listener(arr)
            }
        }
    }
}
