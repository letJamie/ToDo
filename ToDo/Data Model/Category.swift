//
//  Category.swift
//  ToDo
//
//  Created by Jamie on 2020/08/07.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colorCode: String = ""
    let items = List<Item>()
}
