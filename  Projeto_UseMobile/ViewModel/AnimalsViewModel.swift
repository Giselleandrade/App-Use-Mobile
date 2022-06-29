import Foundation

class AnimalsViewModel {
    
    //MARK: Properties
    
    var animals: Animal?
    var notificacao: ( () -> Void)?
    
    // MARK: Services
    
    func getAnimals() {
        
        
        guard let url = URL(string: "https://bootcamp-ios-api.herokuapp.com/api/v1/animals") else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { [self] data, response, error in
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: ", response.statusCode)
            }
             
            if let data = data {
                            if let decodedResponse = try? JSONDecoder().decode(Animal.self, from: data) {
                                DispatchQueue.main.async {
                                    self.animals = decodedResponse
                                    notificacao?()
                                }
                                return
                            }
                        }
        }.resume()
        
        
        
    }

    func postAnimals(name: String, image: String, description: String, species: String, age: Int) {
        
        guard let url = URL(string: "https://bootcamp-ios-api.herokuapp.com/api/v1/animals") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body = ["name": name,
                    "image": image,
                    "description": description,
                    "species": species,
                    "age": age] as [String : Any]
        
        let jsonBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = jsonBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Status Code:", response.statusCode)
            }
            guard let data = data else { return }
            let stringedData = String(data: data, encoding: .utf8)
            print(stringedData)
            
        }.resume()
    }


}

