//
//  ContentView.swift
//  Shared
//
//  Created by Денис Никифоров on 16.07.2020.
//

import SwiftUI

struct ListView: View {
    let tracker = Tracker(title: "Title")
    let records = [
        ValueRecord(value: 12.0, date: Date.init()),
        ValueRecord(value: 14.0, date: Date.init()),
        ValueRecord(value: 14.0, date: Date.init()),
        ValueRecord(value: 14.0, date: Date.init()),
    ]
    
    let items: [TrackerWithRecords]
    
    init() {
        items = [
            TrackerWithRecords(tracker: tracker, records: records),
            TrackerWithRecords(tracker: tracker, records: records),
            TrackerWithRecords(tracker: tracker, records: records),
            TrackerWithRecords(tracker: tracker, records: records),
            TrackerWithRecords(tracker: tracker, records: records)
        ]
    }
    
    var body: some View {
        NavigationView {
            listView
                .navigationBarItems(leading: navigationBar)
                .background(Resources.Colors.background)
        }
    }
    
    var navigationBar: some View {
        Image(Resources.Images.logoText)
            .padding(UIScreen.main.bounds.size.width/4)
    }
    
    var listView: some View {
        ScrollView{
            LazyVStack {
                ForEach(items) { item in
                    NavigationLink(destination: Text("destination")) {
                        TrackerListItemView(data: item)
                    }
                    Spacer()
                }
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 16)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environment(\.colorScheme, .dark)
    }
}
