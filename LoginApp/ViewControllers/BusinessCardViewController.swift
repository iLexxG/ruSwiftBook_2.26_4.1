//
//  BusinessCardViewController.swift
//  LoginApp
//
//  Created by Alex Golyshkov on 12.03.2022.
//

import UIKit

class BusinessCardViewController: UIViewController {

    @IBOutlet var businessCardLabels: [UILabel]!
    
    var userProfile: UserProfile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.systemFill.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        businessCardLabels[0].text = "\(userProfile.userPersonalData.personName) \(userProfile.userPersonalData.personSurname)"
        businessCardLabels[1].text = "Email: \(userProfile.userPersonalData.personEmail)"
        businessCardLabels[2].text = "Phone: \(userProfile.userPersonalData.personPhoneNumber)"
        businessCardLabels[3].text = "CodeWars \(userProfile.userPersonalData.personCodeWarsKyu) Kyu"
    }
}
