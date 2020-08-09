//
//  Item.swift
//  ToDo
//
//  Created by Jamie on 2020/08/07.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
