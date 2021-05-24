//
//  PioListViewController.swift
//  TataAIGAssignment
//
//  Created Sagar Mahindrakar on 27/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PioListViewController: UIViewController, PioListViewProtocol {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var presenter: PioListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        presenter?.getCityData(query: nil)
        registerCell()
    }
    
    func registerCell(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "PoListTableViewCell", bundle: nil), forCellReuseIdentifier: "PoListTableViewCell")
    }
    //MARK: To update map -
    func updateMapView(_ cordinates:[Coordinate]?,_ southwestCoordinate:Coordinate){
    }
    //MARK: To update dataList -
    func updateData(){
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadSections([0], with:UITableView.RowAnimation.middle)
    }
    }
    //MARK: To show Errors -
    func showError(){
        let alert = UIAlertController(title:Constants.errors.networkTitle, message:Constants.errors.networkTitle, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async(execute: {
        self.present(alert, animated: true, completion: nil)
        })
    }
    
    private func hidePaginationIndicator() {
        tableView.tableFooterView = nil
        tableView.tableFooterView?.isHidden = true
    }
    
    private func getSearchText() -> String? {
        return self.searchBar.text != "" ? self.searchBar.text : nil
    }
}
extension PioListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String)
    {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.performSearch), object: nil)
        self.perform(#selector(self.performSearch), with: nil, afterDelay: 0.5)
    }
    
    @objc private func performSearch() {
        if let searchedWord = getSearchText(){
            hidePaginationIndicator()
            print(searchedWord)
            presenter?.searchedContent(searchedWord)
        }else{
            
        }
    }
}

extension PioListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if presenter?.filteredCity.count == 0{
        return presenter?.categories.nodes?.count ?? 0
        }else{
            return presenter?.filteredCity.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:Constants.strings.poCellNibName) as! PoListTableViewCell
        if presenter?.filteredCity.count == 0 {
            if let info = presenter?.categories.nodes?[indexPath.row]{
                cell.displayFleetInfo(info)
            }
        } else{
            if let info = presenter?.filteredCity[indexPath.row]{
                cell.displayFleetInfo(info)
            }
        }
        return cell
    }
    //MARK: To update Selected Item -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if presenter?.filteredCity.count == 0 {
        if let city = presenter?.categories.nodes?[indexPath.row]{
            presenter?.goToDetailMapVC(city)
        }
        }else{
            if let city = presenter?.filteredCity[indexPath.row]{
                presenter?.goToDetailMapVC(city)
            }
        }
    }
}

extension UITableView {
    func reloadData(with animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}


