//
//  MapInteractor.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class MapInteractor: MapInteractorInputProtocol {

    weak var presenter: MapInteractorOutputProtocol?
    var networkManger = NetworkManger()
    
    func fetchData(url: String, completion: @escaping (Weather) -> (), failure: @escaping (String) -> ()) {
        networkManger.fetchWeatherData(url:url,method:nil,completion: {(response) in
        completion(response)
        }, failure: {(err) in
            failure("Something went wrong. Please try again later.")
        })
    }
}
