//
//  EditStoreInfoView.swift
//  SheeBa
//
//  Created by 金子広樹 on 2024/02/20.
//

import SwiftUI

struct StoreInfoListView: View {
    
    @ObservedObject var vm = ViewModel()
    @State private var storeUsers = [ChatUser]()                // 全店舗ユーザー
//    @State private var editUser: ChatUser?                      // 編集するユーザー
//    @State private var isEnableScan = false                     // スキャンの可否
//    @State private var isShowChangeIsEnableScanAlert = false    // スキャンの可否変更確認アラート
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(storeUsers) { user in
                    NavigationLink {
                        EditStoreInfoView(user: user)
                    } label: {
                        HStack {
                            Text(user.username)
                                .foregroundStyle(user.isEnableScan ? .blue : .gray)
                            
                            Spacer()
                            
                            Text(String(user.getPoint))
                                .font(.title3)
                                .bold()
                            Text("pt")
                                .padding(.trailing)
                        }
                    }
                }
            }
            .padding(.leading, 10)
            .listStyle(.inset)
            .environment(\.defaultMinListRowHeight, 60)
        }
        .overlay {
            ScaleEffectIndicator(onIndicator: $vm.onIndicator)
        }
        .navigationTitle("店舗管理")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            fetchAllStoreUsers()
        }
        .asBackButton()
//        .asSingleAlert(title: "",
//                       isShowAlert: $isShowChangeIsEnableScanAlert,
//                       message: "スキャンの可否を更新しますか？",
//                       didAction: {
//            isEnableScan.toggle()
//            if let user = editUser {
//                updateStoreUserIsEnableScan(user: user)
//            }
//            isShowChangeIsEnableScanAlert = false
//        })
        .asSingleAlert(title: "",
                       isShowAlert: $vm.isShowError,
                       message: vm.errorMessage,
                       didAction: { vm.isShowError = false })
    }
    
    // MARK: - 全店舗ユーザーを取得
    /// - Parameters: なし
    /// - Returns: なし
    private func fetchAllStoreUsers() {
        vm.onIndicator = true
        storeUsers.removeAll()
        
        FirebaseManager.shared.firestore
            .collection(FirebaseConstants.users)
            .getDocuments { documentsSnapshot, error in
                if error != nil {
                    vm.handleNetworkError(error: error, errorMessage: String.failureFetchAllUser)
                    return
                }
                
                documentsSnapshot?.documents.forEach({ snapshot in
                    let data = snapshot.data()
                    let user = ChatUser(data: data)
                    
                    // 追加するユーザーが店舗の場合のみ追加する。
                    if user.isStore {
                        storeUsers.append(.init(data: data))
                    }
                })
                storeUsers.sort(by: {$0.no < $1.no})
                vm.onIndicator = false
            }
    }
    
    // MARK: - 店舗ユーザーの
    /// - Parameters: なし
    /// - Returns: なし
//    private func updateStoreUserIsEnableScan(user: ChatUser) {
//        vm.onIndicator = true
//        
//        let data = [FirebaseConstants.isEnableScan: isEnableScan,]
//        // ユーザー情報を更新
//        vm.updateUser(document: user.uid, data: data)
//        
//        fetchAllStoreUsers()
//        
//        vm.onIndicator = false
//    }
}

#Preview {
    StoreInfoListView()
}
