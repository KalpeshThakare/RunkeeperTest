//
//  ModelCass.swift
//  RunkeeperTest
//
//  Created by Kalpesh Thakare on 2020-08-19.
//  Copyright © 2020 Kalpesh Thakare. All rights reserved.
//

import UIKit

struct AchievementModel {
    var Title: String
    var feet: String
    var image: UIImage

    static var empty: AchievementModel {
        return AchievementModel(Title: "", feet: "", image: UIImage())
    }
}
