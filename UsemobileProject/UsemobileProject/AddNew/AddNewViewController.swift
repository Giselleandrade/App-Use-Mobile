import UIKit

struct AddNewSpecies : Decodable {
    let nome: String?
    let image: String?
    let description: String?
    let species: String?
    let age: Int?
}

class AddNewViewController: UIViewController {
    
    var addNewSpecies: AddNewSpecies?
    
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldLink: UITextField!
    @IBOutlet weak var textFieldDescription: UITextField!
    @IBOutlet weak var textFieldSpecies: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    
    
    @IBOutlet weak var buttonAdd: UIButton!
    
    // MARK: Overrides
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            navigationController?.navigationBar.tintColor = UIColor(red: 0.27, green: 0.733, blue: 0.938, alpha: 1)
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 0.27, green: 0.733, blue: 0.938, alpha: 1)]
//            navigationController?.navigationBar.topItem?.title = "Cadastro"
        navigationItem.title = "Cadastro"

        }
        override func viewWillDisappear(_ animated: Bool) {

            navigationController?.navigationBar.topItem?.title = ""
        }
    
    
    
    // MARK: Setups
    private func setupUI() {
        view.backgroundColor = .white
        setupComponents()
        setupConstraints()
    }
    
    private func setupComponents() {
        view.addSubview(textFieldName)
        view.addSubview(textFieldLink)
        view.addSubview(textFieldDescription)
        view.addSubview(textFieldSpecies)
        view.addSubview(textFieldAge)
        
        view.addSubview(buttonAdd)
    }
    
    private func setupConstraints() {
        textFieldName.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textFieldLink.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textFieldDescription.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textFieldSpecies.heightAnchor.constraint(equalToConstant: 56).isActive = true
        textFieldAge.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        buttonAdd.heightAnchor.constraint(equalToConstant: 56).isActive = true
        buttonAdd.layer.cornerRadius = 8.0
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        let model = AnimalsViewModel()
        model.postAnimals(name: textFieldName.text!, image: textFieldLink.text!, description: textFieldDescription.text!, species: textFieldSpecies.text!, age: Int(textFieldAge.text!) ?? 0)
        clearForm()
        disableAddButton()
    }
    

    func setupTextFields() {
        disableAddButton()
        
        textFieldAge.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldLink.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldSpecies.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldName.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        textFieldDescription.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {

        guard !textFieldName.text!.isEmpty else {
            disableAddButton()
            return
        }
        guard !textFieldAge.text!.isEmpty else {
            disableAddButton()
            return
        }
        guard !textFieldLink.text!.isEmpty else {
            disableAddButton()
            return
        }
        guard !textFieldSpecies.text!.isEmpty else {
            disableAddButton()
            return
        }
        guard !textFieldDescription.text!.isEmpty else {
            disableAddButton()
            return
        }
        
        buttonAdd.backgroundColor = UIColor(red: 115/255, green: 49/255, blue: 249/255, alpha:1.0)
        buttonAdd.isUserInteractionEnabled = true
    }
    
    func disableAddButton() {
        buttonAdd.isUserInteractionEnabled = false
        buttonAdd.backgroundColor = UIColor.gray
    }
    
    func clearForm() {
        textFieldName.text = ""
        textFieldLink.text = ""
        textFieldDescription.text = ""
        textFieldAge.text = ""
        textFieldSpecies.text = ""
    }
    
}
