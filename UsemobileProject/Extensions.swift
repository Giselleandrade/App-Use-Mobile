//
//  Extensions.swift
//  UsemobileProject
//
//  Created by Giselle Andrade on 29/06/22.
//

import UIKit
class UiImageView: UIImageView {
    
    
    
}

extension UIImageView {
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
