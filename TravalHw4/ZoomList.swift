//
//  ZoomList.swift
//  TravalCrud
//
//  Created by 葉之霆 on 2020/11/18.
//

import Foundation
import SwiftUI

struct ZoomList: View {
    @StateObject var zoomsData = ZoomsData()
    @State private var showEditorZoom = false
    var body: some View{
        NavigationView{
            List{
                ForEach(zoomsData.zooms.indices, id: \.self){ (index) in
                    NavigationLink(
                        destination: ZoomEditor(zoomsData:self.zoomsData, editorZoomIndex: index)){
                        ZoomRow(zoom: zoomsData.zooms[index])
                    }
                }
                .onMove { (indexSet, index) in
                                    zoomsData.zooms.move(fromOffsets: indexSet,
                                                    toOffset: index)}
                .onDelete(perform: { (indexSet) in
                    zoomsData.zooms.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("旅行紀錄")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showEditorZoom = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            })
            .sheet(isPresented: $showEditorZoom){
                NavigationView {
                    ZoomEditor(zoomsData: self.zoomsData) 
                }
            }
        }
    }
}

struct ZoomList_Previews: PreviewProvider {
    static var previews: some View {
        ZoomList()
    }
}
