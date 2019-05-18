//
//  Model.swift
//  iOSCertificationTest
//
//  Created by Michael Sidoruk on 05/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

struct Question {
    var text: String
    var answer: [Answer]
    var image: String
}

struct Answer {
    var text: String
    var type: Bool
}
