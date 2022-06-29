//
//  HomeViewController.swift
//  Projeto_UseMobile
//
//  Created by Giselle Andrade on 29/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var animalsViewModel = AnimalsViewModel()
    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configuraTableView()
        bindEvents()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        animalsViewModel.getAnimals()
        
        
        
        navigationController?.navigationBar.tintColor = UIColor(red: 0.27, green: 0.733, blue: 0.938, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 0.27, green: 0.733, blue: 0.938, alpha: 1)]
        navigationController?.navigationBar.topItem?.title = "Home"
        
        super.viewWillAppear(animated)
        homeTableView.reloadData()
        
        
        
    }
    
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    private func configuraTableView(){
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.showsVerticalScrollIndicator = false // a barra lateral
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let details = DetailsViewController(nameAnimal: animalsViewModel.animals?.items[indexPath.row]?.name ?? "" ,
                                            descriptions: animalsViewModel.animals?.items[indexPath.row]?.description ?? "",
                                            specie: animalsViewModel.animals?.items[indexPath.row]?.species ?? "",
                                            image: animalsViewModel.animals?.items[indexPath.row]?.image ?? "")
        
        
        
        navigationController?.pushViewController(details, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return  animalsViewModel.animals?.items.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        guard let items = animalsViewModel.animals?.items[indexPath.row] else {return UITableViewCell()}
        cell.setupUI(items: items)
        
        
        return cell
    }
    
    
    func bindEvents(){
        animalsViewModel.notificacao = {
            self.homeTableView.reloadData()
        }
        
    }
    
    
    
}

