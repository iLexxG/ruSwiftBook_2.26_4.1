//
//  PersonalDataViewController.swift
//  LoginApp
//
//  Created by Alex Golyshkov on 12.03.2022.
//

import UIKit

class PersonalDataViewController: UIViewController {

    @IBOutlet var userDataLabels: [UILabel]!
    @IBOutlet var userAboutTextField: UITextView!
    
    var userProfile: UserProfile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.systemFill.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        userDataLabels[0].text = userProfile.userPersonalData.personName
        userDataLabels[1].text = userProfile.userPersonalData.personSurname
        userDataLabels[2].text = userProfile.userPersonalData.personAge
        userDataLabels[3].text = userProfile.userPersonalData.personCity
        userDataLabels[4].text = userProfile.userPersonalData.personEducation
        userDataLabels[5].text = userProfile.userPersonalData.personProfession
        userDataLabels[6].text = userProfile.userPersonalData.personKeySkills
        userDataLabels[7].text = userProfile.userPersonalData.personHobby
        userAboutTextField.text = userProfile.userPersonalData.personAbout
        userAboutTextField.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let businessCardVC = segue.destination as? BusinessCardViewController else { return }
        businessCardVC.userProfile = userProfile
    }
}
