
import Foundation
import SwiftUI

struct CharView: View {
    @ObservedObject var zoomsData = ZoomsData()
    @State private var selection = "圓餅圖"
    var percentage : [Double] = [0,0,0,0]
    var picture = ["圓餅圖", "長條圖"]
    var whatWeather = ["spring","summer","fall","winter"]
    
    init(zoomsData: ZoomsData) {
        for zoom in zoomsData.zooms{
            for i in 0..<4{
                if zoom.weather == whatWeather[i]{
                    percentage[i] += 1
                }
            }
        }
    }
    
    var body: some View{
        VStack{
            Text("\n")
            Text("~最常旅遊的季節~")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 0.3, green: 0.4, blue: 0.6))
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 70)
                .background(Color(.white))
                .cornerRadius(10)
            Picker(selection: $selection, label: Text("圖")){
                ForEach(self.picture, id: \.self) { (Picture) in
                    Text(Picture)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            HStack{
               
                Text("spring")
                    .frame(width: 60, height: 40, alignment: .center)
                    .background(Color(.red))
                
                Text("summer")
                    .frame(width: 80, height: 40, alignment: .center)
                    .background(Color(.orange))
             
                Text("fall")
                    .frame(width: 50, height: 40, alignment: .center)
                    .background(Color(.yellow))
            
                Text("winter")
                    .frame(width: 60, height: 40, alignment: .center)
                    .background(Color(.green))
                
            }
            if self.selection == "圓餅圖"{
                PieChartView(percentages: percentage).frame(width: 400, height: 400)
            }else if self.selection == "長條圖"{
                LineChartView(percentages: percentage).frame(width: 400, height: 400)
            }
            
        }
        .background(Color(red: 0.7, green: 0.8, blue: 1))
        .cornerRadius(30)
        
    }
}


struct CharView_Previews: PreviewProvider {
    static var previews: some View {
        CharView(zoomsData: ZoomsData())
    }
}
