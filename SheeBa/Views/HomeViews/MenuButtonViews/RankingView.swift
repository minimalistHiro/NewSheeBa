//
//  RankingView.swift
//  SheeBa
//
//  Created by 金子広樹 on 2024/02/06.
//

import SwiftUI

struct RankingView: View {
    
    @ObservedObject var vm = ViewModel()
    @State private var users = [ChatUser]()             // 全ユーザー
    @State private var rank5Users = [ChatUser]()        // 取得ポイント数上位5位までのユーザー
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(rank5Users, id: \.self) { user in
                        CardView(user: user)
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .navigationTitle("ランキング")
        .onAppear {
            if FirebaseManager.shared.auth.currentUser?.uid != nil {
                vm.fetchCurrentUser()
                fetchAllUsersOrderByMoney()
            }
        }
        .asBackButton()
        .asSingleAlert(title: "",
                       isShowAlert: $vm.isShowAlert,
                       message: vm.alertMessage,
                       didAction: { vm.isShowAlert = false })
    }
    
    // MARK: - cardView
    struct CardView: View {
        
        let user: ChatUser
        
        var body: some View {
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .padding(.horizontal, 30)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .foregroundStyle(Color.white)
                    .shadow(radius: 7, x: 0, y: 0)
                    .overlay {
                        VStack {
                            Spacer()
                            
                            HStack {
                                Text("\(user.ranking)位：")
                                    .font(.title3)
                                    .dynamicTypeSize(.medium)
                                    .padding(.leading)
                                Text(user.username)
                                    .font(.title3)
                                    .bold()
                                    .dynamicTypeSize(.medium)
                                    .padding(.horizontal)
                                    .padding(.bottom, 5)
                            }
                            
                            HStack {
                                Spacer()
                                
                                // トップ画像
                                if user.profileImageUrl != "" {
                                    Icon.CustomWebImage(imageSize: .large, image: user.profileImageUrl)
                                } else {
                                    Icon.CustomCircle(imageSize: .large)
                                }
                                
                                Spacer()
                                
                                HStack {
                                    Text(user.money)
                                        .font(.system(size: 40))
                                        .bold()
                                        .dynamicTypeSize(.medium)
                                        .padding(.horizontal)
                                    Text("pt")
                                        .font(.title3)
                                        .dynamicTypeSize(.medium)
                                }
                                
                                Spacer()
                            }
                            
                            Spacer()
                        }
                    }
                    .padding(.top, 20)
            }
        }
    }
    
    // MARK: - 全ユーザーをポイントが高い順に並べて取得
    /// - Parameters: なし
    /// - Returns: なし
    private func fetchAllUsersOrderByMoney() {
        FirebaseManager.shared.firestore
            .collection(FirebaseConstants.users)
            .order(by: FirebaseConstants.money, descending: true)
            .getDocuments { documentsSnapshot, error in
                if error != nil {
                    vm.handleNetworkError(error: error, errorMessage: String.failureFetchAllUser)
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    users.append(.init(data: data))
                })
                
                // ポイントが高い順に並び替える。
                let sortUsers = users.sorted(by: { user1, user2 in
                    if let money1 = Int(user1.money), let money2 = Int(user2.money) {
                        return money1 > money2
                    }
                    return false
                })
                
                var previousMoney = 0               // 一つ上位のポイント数
                var count = 0                       // 順位
                
                // 上位5位までのユーザーを取得する。
                for user in sortUsers {
                    if let money = Int(user.money), !user.isOwner {
                        // 5位以内であれば、ランキングに加える
                        if count < 5  {
                            // ポイント数に変更があったら、順位を一つ変えるためカウント数を一つ加える。
                            if money != previousMoney {
                                count += 1
                            }
                            // データを上位5位までのユーザーに追加する。
                            let data = [
                                FirebaseConstants.username: user.username,
                                FirebaseConstants.profileImageUrl: user.profileImageUrl,
                                FirebaseConstants.money: user.money,
                                FirebaseConstants.rankign: "\(count)"
                            ] as [String : Any]
                            rank5Users.append(.init(data: data))
                            
                            previousMoney = money
                        }
                    }
                }
        }
    }
}

#Preview {
    RankingView()
}
