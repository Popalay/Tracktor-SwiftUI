//
//  File.swift
//  Tracktor
//
//  Created by Денис Никифоров on 16.07.2020.
//

import Foundation

struct Tracker {
    let id = UUID()
    let title: String
}

struct ValueRecord {
    let id = UUID()
    let trackerId = UUID()
    let value: Double
    let date: Date
}

struct TrackerWithRecords: Identifiable {
    let id = UUID()
    let tracker: Tracker
    let records: [ValueRecord]
}
