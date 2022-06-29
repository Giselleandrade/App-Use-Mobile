import Foundation


struct Animal: Decodable{
    var items:[Items?]
}

struct Items: Decodable {
    
    let id: String?
    let name: String?
    let description: String?
    let age: StringOrInt?
    let species: String?
    let image: String?
    let created_at: String?
    let updated_at: String?
    
}

enum StringOrInt: Decodable {
    
    case string(String)
    case int(Int)
    
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        throw Error.couldNotFindStringOrInt
    }
    enum Error: Swift.Error {
        case couldNotFindStringOrInt
    }
}
