//
//  Classes.swift
//  RyanairCodeTest
//
//  Created by Shashank Chandran on 10/4/20.
//  Copyright © 2020 Shashank Chandran. All rights reserved.
//

import Foundation
import UIKit

var BaseURL = "https://tripstest.ryanair.com/static/stations.json"

//Extention for UITextField for datePicker
extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        
        let currentDate = Date()
        var dateComponents = DateComponents()
        let calendar = Calendar.init(identifier: .gregorian)
        dateComponents.year = +1
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 213))
        datePicker.datePickerMode = .date
        self.inputView = datePicker
        //Setting minimum date to Current date
        datePicker.minimumDate = currentDate
        //Setting Maximum date to exact one year from today
        datePicker.maximumDate = calendar.date(byAdding: dateComponents, to: currentDate)
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 42.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(Cancel))
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func Cancel() {
        self.resignFirstResponder()
    }
    
}




