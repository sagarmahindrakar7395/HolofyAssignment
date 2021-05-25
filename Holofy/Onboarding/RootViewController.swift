//
//  RootViewController.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        getMap()
    }
    
    func getMap(){
        AppNavigationHandler.goListViewScreen(from: self)
    }
}


