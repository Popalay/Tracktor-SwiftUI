//
//  TrackerListItemView.swift
//  Tracktor
//
//  Created by Денис Никифоров on 16.07.2020.
//

import SwiftUI

struct TrackerListItemView: View {
    let data: TrackerWithRecords
    
    var body: some View {
        HStack {
            Text(data.tracker.title).foregroundColor(Resources.Colors.onSurface)
            Spacer()
            Text(String(format: "%.1f", data.records.last?.value ?? 0.0))
                .foregroundColor(Resources.Colors.onSurface)
            Spacer()
            ChartView(data: data.records.map{ $0.value })
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }.padding(.all, 16)
        .background(Resources.Colors.surface)
        .cornerRadius(8)
    }
}

struct TrackerListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let tracker = Tracker(title: "Title")
        let records = [
            ValueRecord(value: 12.0, date: Date.init()),
            ValueRecord(value: 112.0, date: Date.init()),
            ValueRecord(value: 312.0, date: Date.init()),
            ValueRecord(value: 212.0, date: Date.init()),
        ]
        
        TrackerListItemView(data: TrackerWithRecords(tracker: tracker, records: records))
    }
}
