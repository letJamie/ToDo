//
//  Data.swift
//  ToDo
//
//  Created by Jamie on 2020/08/07.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
