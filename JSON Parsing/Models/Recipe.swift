import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name = ""
    var cuisine = ""
    
}
