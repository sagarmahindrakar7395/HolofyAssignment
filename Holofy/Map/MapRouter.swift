//
//  MapRouter.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MapRouter: MapWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule(_ city:String) -> UIViewController {
        let view = MapViewController(nibName:"MapViewController", bundle: nil)
        let interactor = MapInteractor()
        let router = MapRouter()
        let presenter = MapPresenter(interface: view, interactor: interactor, router: router, city:city)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
