//
//  NetworkManager.swift
//  TataAIGAssignment
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import Foundation

class NetworkManger {
    typealias APIResponseWeatherClosure = (Weather) -> ()
    typealias APIFailResponseClosure = (String) -> ()
    
    static let sharedInstance = NetworkManger()
        
    func fetchWeatherData(url:String?,method:String?,completion: @escaping APIResponseWeatherClosure,failure: @escaping APIFailResponseClosure){
        if let url = url{
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Weather.self, from: data!)
                    completion(responseModel)
                } catch {
                    failure(Constants.errors.networkError)
                }
            }).resume()
        }else{
            failure(Constants.errors.networkError)
        }
    }
}




