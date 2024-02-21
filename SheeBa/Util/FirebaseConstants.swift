//
//  FirebaseConstants.swift
//  CocoShibaTsuka
//
//  Created by 金子広樹 on 2023/10/14.
//

import Foundation

struct FirebaseConstants {
    // users
    static let users = "users"
    static let uid = "uid"
    static let profileImageUrl = "profileImageUrl"
    static let email = "email"
    static let money = "money"
    static let username = "username"
    static let age = "age"
    static let address = "address"
//    static let isConfirmEmail = "isConfirmEmail"
    static let isFirstLogin = "isFirstLogin"
    static let isStore = "isStore"
    static let isOwner = "isOwner"
    static let os = "os"
    static let no = "no"
    static let isEnableScan = "isEnableScan"
    
    // messages
    static let messages = "messages"
    static let fromId = "fromId"
    static let toId = "toId"
    static let text = "text"
    static let isSendPay = "isSendPay"
    static let timestamp = "timestamp"
    
    // recent_messages
    static let recentMessages = "recent_messages"
    static let message = "message"
    
    // friends
    static let friends = "friends"
    static let user = "user"
    static let isApproval = "isApproval"
    static let approveUid = "approveUid"
    
    // store_points
    static let storePoints = "storePoints"
    static let getPoint = "getPoint"
    static let date = "date"
    
    // alerts
    static let alerts = "alerts"
    static let title = "title"
    
    // Notifications
    static let notifications = "notifications"
    static let notification = "notification"
    static let isRead = "isRead"
    static let imageUrl = "imageUrl"
    
    // Advertisement
    static let advertisements = "advertisements"
    static let url = "url"
    
    // DBに保存しないデータ
    static let rankign = "rankign"
}
