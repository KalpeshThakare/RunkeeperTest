//
//  HomeViewController.swift
//  RunkeeperTest
//
//  Created by Kalpesh Thakare on 2020-08-19.
//  Copyright © 2020 Kalpesh Thakare. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {



    //MARK: VARIABLES

    var personalRecordsArray:[AchievementModel] = [
    AchievementModel(Title: "Longest Run", feet: "00:00", image: #imageLiteral(resourceName: "1")),
    AchievementModel(Title: "Highest Elevation", feet: "2095 ft", image: #imageLiteral(resourceName: "2")),
    AchievementModel(Title: "Fastest 5K", feet: "00:00", image: #imageLiteral(resourceName: "3")),
    AchievementModel(Title: "10K", feet: "00:00:00", image: #imageLiteral(resourceName: "4")),
    AchievementModel(Title: "Half Marathon", feet: "00:00", image: #imageLiteral(resourceName: "5")),
    AchievementModel(Title: "Marathon", feet: "Not Yet", image: #imageLiteral(resourceName: "6"))]

    var virtualRacesArray:[AchievementModel] = [
    AchievementModel(Title: "Virtual Half Marathon Race", feet: "00:00", image: #imageLiteral(resourceName: "7")),
    AchievementModel(Title: "Tokyo-Hakone Ekiden 2020", feet: "00:00:00", image: #imageLiteral(resourceName: "8")),
    AchievementModel(Title: "Virtual 10K Race", feet: "00:00:00", image: #imageLiteral(resourceName: "9")),
    AchievementModel(Title: "Hakone Ekiden", feet: "00:00:00", image: #imageLiteral(resourceName: "10")),
    AchievementModel(Title: "Mizuno Singapore", feet: "00:00:00", image: #imageLiteral(resourceName: "11")),
    AchievementModel(Title: "Virtual 5K Race", feet: "23:07", image: #imageLiteral(resourceName: "12")),]


    //MARK: IBOUTLETS

    @IBOutlet weak var collView_Achievements: UICollectionView!



    //MARK:VIEW METHODS

    override func viewDidLoad()
    {
        super.viewDidLoad()

        collView_Achievements.delegate = self
        collView_Achievements.dataSource = self

    }

}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return (section == 0) ? personalRecordsArray.count : virtualRacesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let collCell = collView_Achievements.dequeueReusableCell(withReuseIdentifier: "achievementCell", for: indexPath)as! AchievementCell

        let achievementModel:AchievementModel = (indexPath.section == 0) ? personalRecordsArray[indexPath.row] : virtualRacesArray[indexPath.row]

        collCell.lbl_Title.text = achievementModel.Title
        collCell.lbl_Time.text = achievementModel.feet
        collCell.imgView_Achievement.image = achievementModel.image

        if(indexPath.section == 0 && indexPath.row == 5){
            collCell.lbl_Title.textColor = UIColor(white: 0, alpha: 0.5)
            collCell.lbl_Time.alpha = 0.5
        }

        return collCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {

        let equalHeight_Width = (collView_Achievements.frame.size.width)/2

        return CGSize(width: equalHeight_Width, height: equalHeight_Width)

    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let sectionView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath)as! SectionHeaderView

        if(indexPath.section == 1) {
            sectionView.lbl_sectionCount.isHidden = true
        } else {
            sectionView.lbl_sectionCount.isHidden = false
        }

        return sectionView
    }

}
