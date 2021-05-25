//
//  MapPresenter.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class MapPresenter: MapPresenterProtocol, MapInteractorOutputProtocol {
    
    weak private var view: MapViewProtocol?
    var interactor: MapInteractorInputProtocol?
    private let router: MapWireframeProtocol
    var weather = Weather()
    var city = ""

    init(interface: MapViewProtocol, interactor: MapInteractorInputProtocol?, router: MapWireframeProtocol, city:String ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.city = city
    }
    
    func updateMapView(){
        interactor?.fetchData(url: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=8b29a6fcc2fda1798b2c4f9e49ea25ee", completion: {[weak self] (response) in
            if let weakSelf = self{
                weakSelf.weather = response
                DispatchQueue.main.async {
                    self?.view?.updateView(weakSelf.weather)
                }
            }
        }, failure: {[weak self] (response) in
            self?.view?.showError()
        })
    }
}
