//
//  Alerts.swift
//  SheeBa
//
//  Created by 金子広樹 on 2024/01/31.
//

import Foundation

struct AlertNotification: Hashable, Identifiable {
    var id: String { uid }
    
    let uid: String
    let title: String
    let text: String
    
    init(data: [String: Any]) {
        self.uid = data[FirebaseConstants.uid] as? String ?? ""
        self.title = data[FirebaseConstants.title] as? String ?? ""
        self.text = data[FirebaseConstants.text] as? String ?? ""
    }
}
