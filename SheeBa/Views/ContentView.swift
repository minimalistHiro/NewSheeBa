//
//  ContentView.swift
//  CocoShibaTsuka
//
//  Created by 金子広樹 on 2023/10/14.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ContentView: View {
    
    @ObservedObject var vm = ViewModel()
    @State private var selectedTab = 1                      // 選択されたタブ
    @State private var isUserCurrentryLoggedOut = false     // ユーザーのログインの有無
    
    init() {
        isUserCurrentryLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
//        if FirebaseManager.shared.auth.currentUser?.uid != nil {
//            vm.fetchCurrentUser()
//            vm.fetchRecentMessages()
//        }
    }
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                HomeView(isUserCurrentryLoggedOut: $isUserCurrentryLoggedOut)
                    .tabItem {
                        Label("ホーム", systemImage: "house")
                    }
                    .tag(1)
                CameraView(isUserCurrentryLoggedOut: $isUserCurrentryLoggedOut)
                    .tag(2)
                AccountView(isUserCurrentryLoggedOut: $isUserCurrentryLoggedOut)
                    .tabItem {
                        Label("アカウント", systemImage: "person.fill")
                    }
                    .tag(3)
            }
            .padding(.bottom, 5)
            .overlay {
                VStack {
                    Spacer()
                    Button {
                        selectedTab = 2
                    } label: {
                        Circle()
                            .frame(width: 60)
                            .overlay {
                                VStack {
                                    Image(systemName: "qrcode.viewfinder")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25)
                                    Text("スキャン")
                                        .font(.caption2)
                                        .bold()
                                }
                                .foregroundStyle(.white)
                            }
                    }
                    .padding(.bottom, 7)
                }
            }
        }
        .tint(Color(String.darkGreen))
    }
}

#Preview {
    ContentView()
}
