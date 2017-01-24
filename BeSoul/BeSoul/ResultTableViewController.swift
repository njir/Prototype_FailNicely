//
//  MyTableViewController.swift
//  BeSoul
//
//  Created by 진형탁 on 2017. 1. 24..
//  Copyright © 2017년 FailNicely. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {
    let PageSize = 20
    var items = [MyItem]()
    var isLoading = false
    var searchWord: String?

    @IBOutlet weak var MyFooterView: UIView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(searchWord ?? "")
        loadSegment(offset: 0, size: 20)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 85;// custom row height
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ResultTableViewCell

        // Configure the cell...
        let imagename = getRandomNumberBetween(From: 1, To: 10).description + ".png"
        cell.img.image = UIImage(named:imagename)! as UIImage
        cell.lbl.text = items[indexPath.row].name as String
        cell.desLabel.text = randomString(length: getRandomNumberBetween(From: 10, To: 30))
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let maxOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if (maxOffset - offset) <= 40 {
            loadSegment(offset: items.count, size: PageSize-1)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadSegment(offset:Int, size:Int) {
        if (!self.isLoading) {
            self.isLoading = true
            self.MyFooterView.isHidden = (offset==0) ? true : false
            
            let manager = DataManager()
            manager.requestData(offset: offset, size: size, listener: {(items: [MyItem])-> () in
                /*
                 Add Rows at indexpath
                 */
                for item in items {
                    let row = self.items.count
                    let indexPath = NSIndexPath(row: row, section: 0)
                    self.items.append(item)
                    self.tableView?.insertRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
                }
                self.isLoading = false
                self.MyFooterView.isHidden = true
            }
            )
        }
        
    }
    
    func getRandomNumberBetween (From: Int , To: Int) -> Int {
        return From + Int(arc4random_uniform(UInt32(To - From + 1)))
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}




