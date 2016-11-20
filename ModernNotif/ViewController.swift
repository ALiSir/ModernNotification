//
//  ViewController.swift
//  ModernNotif
//
//  Created by Shengkun Wei on 11/19/16.
//
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    @IBOutlet weak var tfDelay: UITextField!
    
    var delayTime: Int {
        if let txt = tfDelay.text?.trimmingCharacters(in: CharacterSet.whitespaces), let delay = Int(txt) {
            return delay
        }
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNotificaitonAuthorization()
        
        
    }
    
    private func requestNotificaitonAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if (granted) {
                print("granted")
            } else {
                print("error: \(error?.localizedDescription)")
            }
        }
    }


    @IBAction func showNotification1(_ sender: UIButton) {
        showNotification()
        
    }

    @IBAction func showNotification2(_ sender: UIButton) {
        showNotification2()
        
    }
    
    private func showNotification() {
        let notif = UNMutableNotificationContent()
        notif.title = "This a niubi notification"
        notif.body = "This is the body of the notification. This is the body of the notification. This is the body of the notification. This is the body of the notification. This is the body of the notification. This is the body of the notification. This is the body of the notification."
        notif.subtitle = "This is a subtitle"
        
        notif.categoryIdentifier = "category1"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delayTime), repeats: false)
        
        print("Delayed time: \(delayTime)")
        
        
        let request = UNNotificationRequest(identifier: "nnnnn1", content: notif, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    private func showNotification2() {
        let notif = UNMutableNotificationContent()
        notif.title = "123123123123"
        notif.body = "OOOOOOOOoooooOOOOooooOOOOooOOOoooOOOooOOOOooOOOOooOOOOooOOOO"
        notif.categoryIdentifier = "category2"
        let request = UNNotificationRequest(identifier: "nnnnn2", content: notif, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}


