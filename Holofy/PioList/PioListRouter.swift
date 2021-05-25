//
//  PioListRouter.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class PioListRouter: PioListWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = PioListViewController(nibName: "PioListViewController", bundle: nil)
        let interactor = PioListInteractor()
        let router = PioListRouter()
        let presenter = PioListPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func goToDetailMapVC(_ city:String,_ viewController:UIViewController ){
        AppNavigationHandler.goMapViewScreen(from:viewController, with: city)
    }

}
