import Foundation
import SwiftUI
struct LineChart: View {
    @State private var height: CGFloat = 50
    var Height: Double
    var body: some View{
        VStack{
            Text("\(Int(Height))")
                .fontWeight(.heavy)
           
            Rectangle()
                .frame(width: 20, height: height)
                .animation(.linear(duration: 1))
                .onAppear{
                    height = CGFloat(Height)
                }
        }
    }
}
struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(Height: 40)
    }
}
