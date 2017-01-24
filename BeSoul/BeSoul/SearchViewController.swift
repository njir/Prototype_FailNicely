//
//  ViewController.swift
//  BeSoul
//
//  Created by 진형탁 on 2017. 1. 19..
//  Copyright © 2017년 FailNicely. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var SearchTextField: UITextField!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the TextField delegates
        self.SearchTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.SearchTextField.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Delegates Function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Construct the text that will be in the field if this change is accepted
        let newText = textField.text! as NSString
        searchTextFieldWord(searchWord: newText as String)
        
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func searchTextFieldWord(searchWord: String) {
        /*
        // Change view to ResultViewController programmatically
        let controller: ResultViewController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.searchWord = searchWord
        present(controller, animated: true, completion: nil)
        */
        
        // For Navigation View Controller
        let resultTableVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultTableViewController") as! ResultTableViewController
        resultTableVC.searchWord = searchWord
        self.navigationController?.pushViewController(resultTableVC, animated: true)
    }
    
}

