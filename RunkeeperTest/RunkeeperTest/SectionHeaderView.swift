//
//  SectionHeaderView.swift
//  RunkeeperTest
//
//  Created by Kalpesh Thakare on 2020-08-19.
//  Copyright © 2020 Kalpesh Thakare. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var lbl_SectionTitle: UILabel!

    var sectionTitle:String! {
        didSet {
            lbl_SectionTitle.text = sectionTitle
        }
    }

    @IBOutlet weak var lbl_sectionCount: UILabel!

    var sectionCount:String! {
        didSet {
            lbl_sectionCount.text = sectionCount
        }
    }
    
}
