//
//  MapViewController.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import GoogleMaps
import UIKit

class MapViewController: UIViewController, MapViewProtocol, GMSMapViewDelegate {
    
    var presenter: MapPresenterProtocol?
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var infoView1: UIView!
    @IBOutlet weak var infoView2: UIView!
    @IBOutlet weak var cloude: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var visibilityLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var gustLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateMapView()
        setupTitleandView()
    }
    func setupTitleandView(){
        self.title = presenter?.city
        mapView.layer.cornerRadius = 8
        self.infoView1.layer.cornerRadius = 8
        self.infoView2.layer.cornerRadius = 8

    }
    //MARK: To show Errors -
    func showError(){
        let alert = UIAlertController(title:Constants.errors.networkTitle, message:Constants.errors.networkTitle, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async(execute: {
        self.present(alert, animated: true, completion: nil)
        })
    }
    
    //MARK: To update view and to show map on screen-
    func updateView(_ weather: Weather?){
        if let weather = weather{
            cloude.text = weather.weather?[0].weatherDescription
            if let tempMin = weather.main?.tempMin{
                self.tempMin.text = String(tempMin)
            }
            if let tempMax = weather.main?.tempMax{
                self.tempMax.text = String(tempMax)
            }
            if let visibility = weather.visibility{
            visibilityLbl.text = "Visibility: \(visibility)"
            }
            if let speed = weather.wind?.speed{
                self.speedLbl.text = String(speed)
            }
            if let gust = weather.wind?.gust{
                gustLbl.text = String(gust)
            }
            if let lat = weather.coord?.lat, let long = weather.coord?.lon {
                let camera = GMSCameraPosition(latitude:lat, longitude:long, zoom:5)
                mapView.camera = camera
            }
        }
    }
}


