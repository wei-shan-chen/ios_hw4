import Foundation
import SwiftUI

struct LineChartView: View {
    var percentages: [Double]
 
    
    var body: some View{
        HStack(alignment: .bottom){
            LineChart(Height: percentages[0]*20)
                .foregroundColor(.red)
            LineChart(Height: percentages[1]*20)
                .foregroundColor(.orange)
            LineChart(Height: percentages[2]*20)
                .foregroundColor(.yellow)
            LineChart(Height: percentages[3]*20)
                .foregroundColor(.green)
        }
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(percentages: [2,3,6,4])
    }
}
