

import Foundation

struct Zoom: Identifiable, Codable {
    let id = UUID()
    var zoom: String
    var weather: String
    var days: Int
    var favorite: Bool
}
