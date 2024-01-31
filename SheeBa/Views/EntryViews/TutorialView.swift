//
//  TutorialView.swift
//  CocoShibaTsuka
//
//  Created by 金子広樹 on 2023/12/18.
//

import SwiftUI

struct TutorialView: View {
    
    let didCompleteTutorialProcess: () -> ()
    @State private var selectedTab: Int = 1         // 選択されたページ
    let pages: [Int] = [1, 2, 3, 4, 5]              // ページ
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(String.yellow).ignoresSafeArea(edges: .all)
                
                TabView(selection: $selectedTab) {
                    ForEach(pages, id: \.self) { page in
                        Tutorial(text: String.tutorialText(page: page),
                                 lastPage: pages.count,
                                 selectedTab: $selectedTab,
                                 didAction: didCompleteTutorialProcess)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .animation(.easeInOut, value: selectedTab)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Spacer()
                            if selectedTab != pages.endIndex {
                                Button {
//                                    didCompleteTutorialProcess()
                                    selectedTab = pages.endIndex
                                } label: {
                                    Text("スキップ")
                                }
                            }
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct Tutorial: View {
    
    let text: String
    let lastPage: Int
    @Binding var selectedTab: Int
    let didAction: () -> ()
    @State private var isAgree = false          // ユーザーの同意の有無
    var disabled: Bool {
        if (selectedTab == lastPage) && !isAgree {
            return true
        }
        return false
    }                                           // ボタンの有効性

    var body: some View {
        ZStack {
            // ボタン周辺
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                if selectedTab == lastPage {
                    agreeButton
                }
                
                Button {
                    if selectedTab != lastPage {
                        selectedTab += 1
                    } else {
                        didAction()
                    }
                } label: {
                    CustomCapsule(text: selectedTab != lastPage ? "次へ" : "始める", imageSystemName: nil, foregroundColor: disabled ? .gray : .black, textColor: .white, isStroke: false)
                }
                .disabled(disabled)
                
                Spacer()
            }
            
            // テキスト周辺
            VStack {
                if selectedTab != lastPage {
                    Spacer()
                }
                
    //            Image(systemName: "iphone")
    //                .resizable()
    //                .scaledToFill()
    //                .frame(width: 180, height: 180)
                
                if selectedTab != lastPage {
                    Spacer()
                    
                    Text(text)
                        .multilineTextAlignment(.center)
                        .lineSpacing(10)
                        .font(.title2)
                        .bold()
                        .frame(height: 100)
                } else {
                    
                    Text(String.termsOfServiceTitle)
                        .fontWeight(.bold)
                        .font(.title2)
                    privacyPolicy
                }
                
                Spacer()
                Spacer()
            }
        }
    }
    
    // 同意ボタン
    private var agreeButton: some View {
        HStack {
            Button {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                isAgree.toggle()
            } label: {
                if isAgree {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                } else {
                    Image(systemName: "circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                }
            }
            .foregroundStyle(Color.blue)
            .padding(.trailing, 5)
            
            Text("同意します")
                .font(.title3)
                .bold()
        }
        .padding(.bottom)
    }
    
    // プライバシーポリシー
    private var privacyPolicy: some View {
        ScrollView {
            Text(String.termsOfServiceExplanation)
                .font(.subheadline)
                .frame(alignment: .leading)
            Group {
                Text(String.termsOfServiceTitle1)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle1)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle2)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle2)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle3)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle3)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle4)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle4)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle5)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle5)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle6)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle6)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle7)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle7)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle8)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle8)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle9)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle9)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
            Group {
                Text(String.termsOfServiceTitle10)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.vertical)
                Text(String.termsOfServiceArticle10)
                    .font(.subheadline)
                    .frame(alignment: .leading)
            }
        }
        .frame(height: CGFloat(UIScreen.main.bounds.height / 2))
        .padding()
        .background(Color(String.chatLogBackground))
    }
}

#Preview {
    TutorialView(didCompleteTutorialProcess: {})
}
