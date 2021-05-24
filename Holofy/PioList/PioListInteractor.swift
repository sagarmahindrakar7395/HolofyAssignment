//
//  PioListInteractor.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class PioListInteractor: PioListInteractorInputProtocol {
    
        weak var presenter: PioListInteractorOutputProtocol?
        var networkManger = NetworkManger()


    
    func getCityData(query: String? = nil,completion: @escaping (Category) -> (), failure: @escaping (String) -> ()) {
        if let path = Bundle.main.path(forResource: Constants.LocalJSONFile.Name, ofType: Constants.LocalJSONFile.Extension) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let decoder = JSONDecoder()
                let resp = try decoder.decode(Category.self, from: data)
                completion(resp)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
}
