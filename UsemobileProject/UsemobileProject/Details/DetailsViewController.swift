//
//  DetailsViewController.swift
//  UsemobileProject
//
//  Created by Maria Alice Rodrigues Fortunato on 18/06/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var colorBlue: UIColor = UIColor(red: 0.27, green: 0.733, blue: 0.938, alpha: 1)
    
    @IBOutlet weak var imageAnimal: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var descriptionsLabel: UILabel!
    
    let nameAnimal: String?
//    let ageAnimal: Int
    let descriptions: String?
    let specie: String?
    let image: String?
    
    init(nameAnimal: String, descriptions: String, specie: String, image: String) {
        self.nameAnimal = nameAnimal
//        self.ageAnimal = ageAnimal
        self.descriptions = descriptions
        self.specie = specie
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        fullInfos()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Detalhes"
        navigationController?.navigationBar.tintColor = colorBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: colorBlue]
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.title = ""
    }
    private func fullInfos() {
        
        titleLabel.text =  nameAnimal
        specieLabel.text = specie
        descriptionsLabel.text = descriptions
        
        guard let url = URL(string: image ?? "arara") else { return }
        imageAnimal.loadImage(url: url)
    
    }
    
    private func setupUI() {
        imageAnimal.layer.cornerRadius = 8
    }


}
