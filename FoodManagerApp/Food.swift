import SwiftData
import SwiftUI

@Model
class Food {
    var name: String
    var icon: String
    var quantity: Int
    var expiryDate: Date
    var storageTemperature: Double
    var dishType: String
    init(name: String, icon: String, quantity: Int, expiryDate: Date, storageTemperature: Double, dishType: String) {
        self.name = name
        self.icon = icon
        self.quantity = quantity
        self.expiryDate = expiryDate
        self.storageTemperature = storageTemperature
        self.dishType = dishType
    }
}
