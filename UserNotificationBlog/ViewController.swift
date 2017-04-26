//
//  ViewController.swift
//  UserNotificationBlog
//
//  Created by Erica Millado on 4/25/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

//4 - import the UserNotifications framework in the ViewController
import UserNotifications

//13 -
class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    //5 - Create a result label outlet
    @IBOutlet weak var resultLabel: UILabel!

    //6 - Create a button action
    @IBAction func getProblemBtnTapped(_ sender: Any) {
        
        //7 - 
        let mathContent = UNMutableNotificationContent()
        mathContent.title = "Math Quiz!"
        mathContent.subtitle = "Do you remember high school algebra?"
        mathContent.body = "What is the equation for slope-intercept form?"
        mathContent.badge = 1
        mathContent.categoryIdentifier = "mathQuizCategory"
        
        //8 - 
        let quizTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        //9 - 
        let quizRequestIdentifier = "mathQuiz"
        let request = UNNotificationRequest(identifier: quizRequestIdentifier, content: mathContent, trigger: quizTrigger)
        
        //10 - 
        UNUserNotificationCenter.current().add(request) { (error) in
            //11 -
            print(error as Any)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //12 -
        UNUserNotificationCenter.current().delegate = self
    }
    
    //MARK - UNNotification Delegate Methods
    
    //14 -
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //15 - 
        completionHandler([.alert, .sound])
    }
    
    //16 - 
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        //17 -
        if response.actionIdentifier == "y = mx + b" {
            resultLabel.text = "That's the correct answer!"
        } else if response.actionIdentifier == "Ax + By = C" {
            resultLabel.text = "Sorry, that's the standard form equation."
        } else {
            resultLabel.text = "Keep trying!"
        }
    }

}

