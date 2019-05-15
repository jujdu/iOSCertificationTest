//
//  StorageManager.swift
//  iOSCertificationTest
//
//  Created by Michael Sidoruk on 14/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ questions: Questions) {
        try! realm.write {
            realm.add(questions)
        }
    }
}
