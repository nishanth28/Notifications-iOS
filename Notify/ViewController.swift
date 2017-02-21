//
//  ViewController.swift
//  Notify
//
//  Created by Nishanth P on 2/20/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class ViewController: UIViewController {

    
    
    
    @IBAction func localNotification(_ sender: Any) {
        basicNotification()
    }
    
    @IBAction func customSoundNotification(_ sender: Any) {
        customSound()
    }
    
    
    @IBAction func mediaNotification(_ sender: Any) {
        photoAndVideo()
    }
    
   
    
    @IBAction func locationNotification(_ sender: Any) {
        locationBasedNotification()
    }
    
    
    @IBAction func clearNotification(_ sender: Any) {
        removeFromNotificationCenter()
    }
    
    
    @IBAction func calendarNotification(_ sender: Any) {
        
        calendarNotification()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func basicNotification()
    {
        let center = UNUserNotificationCenter.current()
        //trigger -when to show
        //content - content
        
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "Local Notification"
        content.body = "Testing local Notifcation functions"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier:"basic",content:content,trigger:trigger)
        
        center.add(request)
        
        
    }
    
    func calendarNotification(){
        
        let center = UNUserNotificationCenter.current()
        //trigger -when to show
        //content - content
        
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "Calendar-Notificaton"
        content.body = "Testing Calendar Notifcation functions"
        
        var dateComponent = DateComponents()
        dateComponent.hour = 1
        dateComponent.minute = 08
        
        let trigger = UNCalendarNotificationTrigger(dateMatching:dateComponent,repeats:false)
        let request = UNNotificationRequest(identifier:"calendar",content:content,trigger:trigger)
        
        center.add(request)
    }
    
    func customSound(){
        
        let center = UNUserNotificationCenter.current()
        //trigger -when to show
        //content - content
        
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "Sound-Notificaton"
        content.body = "Testing Sound Notifcation functions"
        //content.sound = UNNotificationSound.default()
        content.sound = UNNotificationSound.init(named: "whistle.mp3")
        
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats:false)
        let request = UNNotificationRequest(identifier:"basic", content:content, trigger:trigger)
        
        center.add(request)

        
    }
    
    func photoAndVideo(){
        
        let center = UNUserNotificationCenter.current()
        //trigger -when to show
        //content - content
        
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "Photo/Video-Notificaton"
        content.body = "Testing Photo/Video Notifcation functions"
        content.sound = UNNotificationSound.init(named: "whistle.mp3")
        
        let url = Bundle.main.url(forResource: "BB", withExtension: "jpg")
        if let url = url {
            let video = try? UNNotificationAttachment(identifier: "video", url: url, options: nil)
            if let video = video{
                content.attachments = [video]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats:false)
        let request = UNNotificationRequest(identifier:"basic", content:content, trigger:trigger)
        
        center.add(request)
        
        // get pending notification!
        
        center.getPendingNotificationRequests { (notify) in
            for note in notify{
                print(note.identifier)
            }
        }
        
    }
    
    func removeFromNotificationCenter(){
        
         let center = UNUserNotificationCenter.current()
         center.removeAllDeliveredNotifications()
        
    }
    
    func locationBasedNotification(){
        
        let center = UNUserNotificationCenter.current()
        //trigger -when to show
        //content - content
        
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "Location-Notificaton"
        content.body = "Testing Location Notifcation functions"
        content.sound = UNNotificationSound.init(named: "whistle.mp3")
        
        let coordinates = CLLocationCoordinate2DMake(40.7441, -74.1435)
        let region = CLCircularRegion(center : coordinates, radius:0.15, identifier:"Home")
        region.notifyOnExit = false
        region.notifyOnEntry = true
        
        let trigger = UNLocationNotificationTrigger(region:region, repeats:true)
        let request = UNNotificationRequest(identifier:"location",content:content,trigger:trigger)
        center.add(request ,withCompletionHandler: nil)
        
        
    }
    
    
    

}

