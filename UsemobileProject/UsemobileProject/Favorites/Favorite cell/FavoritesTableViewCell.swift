//
//  FavoritesTableViewCell.swift
//  UsemobileProject
//
//  Created by Maria Alice Rodrigues Fortunato on 18/06/22.
//

import UIKit



class FavoritesTableViewCell: UITableViewCell {
    
    var imageString: String?
    var isFavorited: Bool = false
    private let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starButtonOutlet: UIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
//        setupUI()  só esta sendo chamado uma vez 

    }
    
    @IBAction func starButtonAction(_ sender: Any) {

        if isFavorited {
            buttonStarNoColor()
            removeFavorites()

        } else {
            buttonStarColor()
            saveFavorites()
        }
    }
    private func buttonStarColor() {
        
        guard let imageColor: UIImage = UIImage(named: "Vector") else { return }
        
        starButtonOutlet.setImage(imageColor, for: .normal)
        isFavorited = true
        
    }
    private func buttonStarNoColor() {

        guard let imageNoColor: UIImage = UIImage(named: "Vector-2") else { return }
        
        starButtonOutlet.setImage(imageNoColor, for: .normal)
        isFavorited = false
    }
    
    // não to passando nada dessa preencher label 
    
//    func preencherLabels(items: Items)  {
//
//        titleLabel.text = items.name
//        descriptionLabel.text = items.description
//
//        guard let url = URL(string: items.image ?? "fotoBranca") else { return }
//        animalImage.loadImage(url: url)
//        imageString = items.image // atualizando a imagem
//
//    }
    func loadImage(image: String) {
        guard let url = URL(string: image) else { return }
        animalImage.loadImage(url: url)
        imageString = image

    }
    
    func setupUI() {
        
        animalImage.layer.cornerRadius = 8
        buttonStarColor()
    }
    
    private func removeFavorites() {
        
        var favoritesArray = userDefaults.value(forKey: "favoritesArray") as? [[String: Any]] ?? []
        
        favoritesArray.removeAll { name in
           
           return name["name"] as? String == titleLabel.text
        }
        userDefaults.set(favoritesArray, forKey: "favoritesArray")
    }
    
    private func saveFavorites() {
        
        guard let name = titleLabel.text, let description = descriptionLabel.text else { return }
        var favoritesArray = userDefaults.value(forKey: "favoritesArray") as? [[String: Any]] ?? []
        let favoritesDict = ["name": name, "description": description, "image": imageString] //EStou contruindo o dicionário para salvar. Não está pegando a image
        favoritesArray.append(favoritesDict)
        userDefaults.set(favoritesArray, forKey: "favoritesArray") // pra salvar mesmo os favoritos com a chave
//        print(userDefaults.value(forKey: "favoritesArray"))
    }
    
 
}
