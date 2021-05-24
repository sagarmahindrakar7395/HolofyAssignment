//
//  MapProtocols.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation

//MARK: Wireframe -
protocol MapWireframeProtocol: AnyObject {

}
//MARK: Presenter -
protocol MapPresenterProtocol: AnyObject {
    var interactor: MapInteractorInputProtocol? { get set }
    var city:String {get set}
    func updateMapView()
}
//MARK: Interactor -
protocol MapInteractorOutputProtocol: AnyObject {

    /* Interactor -> Presenter */
}

protocol MapInteractorInputProtocol: AnyObject {

    var presenter: MapInteractorOutputProtocol?  { get set }
    func fetchData(url: String, completion: @escaping (Weather) -> (), failure: @escaping (String) -> ()) 


    /* Presenter -> Interactor */
}

//MARK: View -
protocol MapViewProtocol: AnyObject {

    var presenter: MapPresenterProtocol?  { get set }
    func showError()
    func updateView(_ weather: Weather?)
    /* Presenter -> ViewController */
}
