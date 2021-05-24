//
//  PioListProtocols.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation
import UIKit

//MARK: Wireframe -
protocol PioListWireframeProtocol: AnyObject {
    func goToDetailMapVC(_ city:String,_ viewController:UIViewController )

}
//MARK: Presenter -
protocol PioListPresenterProtocol: AnyObject {

    var interactor: PioListInteractorInputProtocol? { get set }
    var categories: Category {get set}
    var filteredCity : [String] {get set}
    func goToDetailMapVC(_ city:String)
    func getCityData(query: String?)
    func searchedContent(_ search:String)
}

//MARK: Interactor -
protocol PioListInteractorOutputProtocol: AnyObject {
    /* Interactor -> Presenter */
}

protocol PioListInteractorInputProtocol: AnyObject {

    var presenter: PioListInteractorOutputProtocol?  { get set }
    func getCityData(query: String?,completion: @escaping (Category) -> (), failure: @escaping (String) -> ()) 

    /* Presenter -> Interactor */
}

//MARK: View -
protocol PioListViewProtocol: AnyObject {

    var presenter: PioListPresenterProtocol?  { get set }
    func showError()
    func updateData()
    func updateMapView(_ cordinates:[Coordinate]?,_ southwestCoordinate:Coordinate)

    /* Presenter -> ViewController */
}
