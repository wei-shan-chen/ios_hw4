

import Foundation
import SwiftUI

struct ZoomRow: View {
    var zoom: Zoom
    var body: some View{
        HStack{
            Text(zoom.zoom)
            Spacer()
            Text("\(zoom.days)  天")
            Image(systemName: zoom.favorite ? "heart.fill" : "heart")
        }
    }
}
struct ZoomRow_Previews: PreviewProvider {
    static var previews: some View {
        ZoomRow(zoom: Zoom(zoom: "台北", weather: "冬", days: 2, favorite: true))
            .previewLayout(.sizeThatFits)
    }
}
