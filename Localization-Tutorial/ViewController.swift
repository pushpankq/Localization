//
//  ViewController.swift
//  Localization-Tutorial
//
//  Created by Puspank Kumar on 11/11/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var currentLangaugeLabel: UILabel!
    @IBOutlet weak var changeLanguageButton: UIButton!
    
    lazy var currentlanguage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSetUp()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func changeLanguageAction(_ sender: UIButton) {
        
        currentlanguage = LocalizationSystem.sharedInstanse.getLanguage()
        
        if currentlanguage == "ar" {
            LocalizationSystem.sharedInstanse.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        } else {
            LocalizationSystem.sharedInstanse.setLanguage(languageCode: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "vc") as! ViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        
        dataSetUp()
    }
    
    private func dataSetUp() {
        currentlanguage = LocalizationSystem.sharedInstanse.getLanguage()
        headerLabel.text = LocalizationSystem.sharedInstanse.localizedStringForKey(key: "header_text", comment: "")
        changeLanguageButton.setTitle(LocalizationSystem.sharedInstanse.localizedStringForKey(key: "change_language", comment: ""), for: .normal)
        
        currentLangaugeLabel.text = currentlanguage
    }
    
}

