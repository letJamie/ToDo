//
//  AppDelegate.swift
//  ToDo
//
//  Created by Jamie on 2020/07/26.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
       
    
        do {
            _ = try Realm()
           
        } catch {
            print("error realm")
        }
        
        
        return true
    }
    
    
    
    
}
