

import Foundation
import SwiftUI

struct PieChartView: View {
    var percentages: [Double]
    var angles: [Angle]
    
    init(percentages: [Double]){
        var total: Double = 0
        var finalpercentage : [Double] = [0,0,0,0]
        
        for i in 0..<4{
            total = total+percentages[i]
        }
        
        for i in 0..<4{
            finalpercentage[i] = percentages[i]/total
        }
        
        self.percentages = percentages
        
        angles = [Angle]()
        var startAngle: Double = 0
        for percentage in finalpercentage {
            angles.append(.degrees(startAngle))
            startAngle += 360 * percentage
        }
    }
    
    var body: some View{
        ZStack{
            PieChart(startAngle: angles[0], endAngle: angles[1]).fill(Color(.red))
            PieChart(startAngle: angles[1], endAngle: angles[2]).fill(Color(.orange))
            PieChart(startAngle: angles[2], endAngle: angles[3]).fill(Color(.yellow))
            PieChart(startAngle: angles[3], endAngle: angles[0]).fill(Color(.green))
        }
        .frame(width: 300, height: 300)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(percentages: [20,30,60,40])
    }
}
