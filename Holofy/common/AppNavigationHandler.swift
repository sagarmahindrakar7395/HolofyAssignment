//
//  AppNavigationHandler.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//

import Foundation
import UIKit

class AppNavigationHandler {
    
    static func removeBackButtonTitle(from: UIViewController?) {
        let emptyBackButton = UIBarButtonItem.init(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        from?.navigationController?.navigationBar.topItem?.backBarButtonItem = emptyBackButton
    }
    
    public static func goMapViewScreen(from:UIViewController, with city: String?){
        if let city = city{
        let vc = MapRouter.createModule(city)
        vc.hidesBottomBarWhenPushed = true
        let emptyBackButton = UIBarButtonItem.init(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        from.navigationController?.navigationBar.topItem?.backBarButtonItem = emptyBackButton
        from.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    public static func goListViewScreen(from:UIViewController){
    let vc = PioListRouter.createModule()
    vc.hidesBottomBarWhenPushed = true
    vc.navigationItem.setHidesBackButton(true, animated: true)
    from.navigationController?.pushViewController(vc, animated: true)
    }
}
