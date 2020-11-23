

import SwiftUI

struct ContentView: View {
    @ObservedObject var zoomsData = ZoomsData()
    var body: some View {
        VStack{
            TabView{
                ZoomList(zoomsData: self.zoomsData)
                    .tabItem {
                    Text("表格")
                    Image(systemName: "doc.fill")
                }
                CharView(zoomsData: self.zoomsData)
                    .tabItem {
                    Text("圖表")
                    Image(systemName: "star.circle.fill")
                }
                
            }
            .accentColor(.pink)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

