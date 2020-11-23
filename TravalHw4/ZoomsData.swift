

import Foundation
import Combine

class ZoomsData: ObservableObject{
    var cancellable: AnyCancellable?
    @Published var zooms = [Zoom]()
    
    init() {
        if let zoomsData = UserDefaults.standard.data(forKey: "zooms"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Zoom].self, from: zoomsData){
                zooms = decodedData
            }
        }
        
        cancellable = $zooms.sink(receiveValue: {(value) in
            let encoder = JSONEncoder()
            if let encoderData = try? encoder.encode(value){
                UserDefaults.standard.set(encoderData, forKey: "zooms")
            }
            })
    }
}
