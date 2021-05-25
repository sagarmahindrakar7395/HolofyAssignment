//
//  PioListPresenter.swift
//  Holofy
//
//  Created Sagar Mahindrakar on 24/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class PioListPresenter: PioListPresenterProtocol, PioListInteractorOutputProtocol {
    
    weak private var view: PioListViewProtocol?
    var interactor: PioListInteractorInputProtocol?
    private let router: PioListWireframeProtocol

    init(interface: PioListViewProtocol, interactor: PioListInteractorInputProtocol?, router: PioListWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    var categories = Category()
    var filteredCity = [String]()
    
    func getCityData(query: String? = nil){
        interactor?.getCityData(query: query, completion: { [weak self] (response) in
            if let weakSelf = self{
                weakSelf.categories = response
                weakSelf.updateView()
            }
            
        }, failure: {[weak self] (response) in
            self?.view?.showError()
        })
    }
    
    func searchedContent(_ search: String) {
        if let filteredCity = categories.nodes?.filter({$0.contains(search)}){
            self.filteredCity = filteredCity
            self.updateView()
        }
        
    }
    
    func goToDetailMapVC(_ city:String){
        guard let vc = view as? UIViewController else {
            view?.showError()
            return
        }
        router.goToDetailMapVC(city,vc)
    }
    
    func updateView() {
        view?.updateData()
    }
    
    func showError(){
        view?.showError()
    }
}
