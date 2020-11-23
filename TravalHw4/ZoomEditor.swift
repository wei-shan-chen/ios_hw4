//
//  ZoomEdtor.swift
//  TravalCrud
//
//  Created by 葉之霆 on 2020/11/18.
//

import Foundation
import SwiftUI

struct ZoomEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var zoomsData: ZoomsData
    var editorZoomIndex: Int?
    @State private var showEditorZoom = false
    @State private var zoom = ""
    @State private var weather = ""
    @State private var days = 1
    @State private var favorite = true
    var whatWeather = ["spring","summer","fall","winter"]
    
    var body: some View{
        NavigationView{
            Form{
                TextField("地點", text: $zoom)
                VStack{
                    Picker(selection: $weather, label: Text("weather")){
                        ForEach(self.whatWeather, id:\.self){(index) in
                            Text(index)
                        }
                    }
                }
                Stepper("天數\(days)", value: $days, in: 1...100)
                Toggle("喜歡嗎", isOn:  $favorite)
            }
            .onAppear(perform: {
                if let editorZoomIndex = editorZoomIndex{
                    let editorZoom = zoomsData.zooms[editorZoomIndex]
                    zoom = editorZoom.zoom
                    weather = editorZoom.weather
                    days = editorZoom.days
                    favorite = editorZoom.favorite
                }
            })
            .navigationBarTitle(editorZoomIndex == nil ? "新增" : "修改")
            .navigationBarItems(trailing: Button("save"){
                let zooms = Zoom(zoom: zoom, weather: weather, days: days, favorite: favorite)
                if let editorZoomIndex = editorZoomIndex{
                    zoomsData.zooms[editorZoomIndex] = zooms
                }else{
                    zoomsData.zooms.insert(zooms, at: 0)
                }
                
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
struct ZoomEditor_Previews: PreviewProvider {
    static var previews: some View {
        ZoomEditor(zoomsData: ZoomsData())
    }
}
