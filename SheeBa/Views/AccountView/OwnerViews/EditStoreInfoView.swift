//
//  EditStoreInfoView.swift
//  SheeBa
//
//  Created by 金子広樹 on 2024/02/20.
//

import SwiftUI

struct EditStoreInfoView: View {
    
    @FocusState var focus: Bool
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm = ViewModel()
    @State private var uiImage: UIImage?                    // トップ画像
    @State private var isEnableScan = false                 // スキャンの可否
    @State private var getPoint = "0"                       // 獲得ポイント
    @State private var isShowImagePicker = false            // ImagePicker表示有無
    @State private var isShowChangeSuccessAlert = false     // 変更確定アラート
    let user: ChatUser
    
    // ボタンの有効性
    var disabled: Bool {
        getPoint.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    isShowImagePicker.toggle()
                } label: {
                    if let uiImage = uiImage {
                        Icon.CustomImage(imageSize: .xLarge, image: uiImage)
                            .overlay {
                                Icon.CustomImageChangeCircle(imageSize: .xLarge)
                            }
                    } else {
                        if user.profileImageUrl != "" {
                            Icon.CustomWebImage(imageSize: .xLarge, image: user.profileImageUrl)
                                .overlay {
                                    Icon.CustomImageChangeCircle(imageSize: .xLarge)
                                }
                        } else {
                            Icon.CustomCircle(imageSize: .xLarge)
                                .overlay {
                                    Icon.CustomImageChangeCircle(imageSize: .xLarge)
                                }
                        }
                    }
                }
                
                // スキャンの可否
                Toggle(isOn: $isEnableScan, label: {
                    Text("スキャンの可否")
                })
                .padding()
                
                // 獲得ポイント数
                TextField("獲得ポイント", text: $getPoint)
                    .keyboardType(.numberPad)
                    .focused($focus)
                    .frame(width: 20)
                    .padding()
                
                Button {
                    if let image = uiImage {
                        persistAndDeleteImage(image: image)
                    } else {
                        updateStoreUserInfo(user: user, imageUrl: nil)
                    }
                } label: {
                    CustomCapsule(text: "確定", imageSystemName: nil, foregroundColor: disabled ? .gray : .black, textColor: .white, isStroke: false)
                }
                .disabled(disabled)
            }
        }
        .onAppear {
            isEnableScan = user.isEnableScan
            getPoint = String(user.getPoint)
        }
        .asBackButton()
        .navigationTitle("店舗情報を変更")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isShowImagePicker) {
            ImagePicker(selectedImage: $uiImage)
        }
        .asSingleAlert(title: "",
                       isShowAlert: $vm.isShowError,
                       message: vm.errorMessage,
                       didAction: { vm.isShowError = false })
        .asSingleAlert(title: "",
                       isShowAlert: $isShowChangeSuccessAlert,
                       message: "変更しました。",
                       didAction: {
            isShowChangeSuccessAlert = false
            dismiss()
        })
    }
    
    // MARK: - 店舗ユーザーの
    /// - Parameters: なし
    /// - Returns: なし
    private func updateStoreUserInfo(user: ChatUser, imageUrl: URL?) {
        vm.onIndicator = true
        var data: [String: Any] = [:]
        
        if uiImage != nil {
            data = [
                FirebaseConstants.profileImageUrl: imageUrl?.absoluteString ?? "",
                FirebaseConstants.isEnableScan: isEnableScan,
                FirebaseConstants.getPoint: Int(getPoint) ?? 1,
            ]
        } else {
            data = [
                FirebaseConstants.isEnableScan: isEnableScan,
                FirebaseConstants.getPoint: Int(getPoint) ?? 1,
            ]
        }
        // ユーザー情報を更新
        vm.updateUser(document: user.uid, data: data)
        
        vm.onIndicator = false
        isShowChangeSuccessAlert = true
    }
    
    /// 画像を保存
    /// - Parameters:
    ///   - image: トップ画像
    /// - Returns: なし
    private func persistAndDeleteImage(image: UIImage?) {
        vm.onIndicator = true
        
        // 画像削除
        vm.deleteImage(withPath: user.uid)
        
        let ref = FirebaseManager.shared.storage.reference(withPath: user.uid)
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
        
        ref.putData(imageData, metadata: nil) { _, error in
            if error != nil {
                vm.handleError("画像の保存に失敗しました。", error: error)
                return
            }
            // Firestore Databaseに保存するためにURLをダウンロードする。
            ref.downloadURL { url, error in
                if error != nil {
                    vm.handleError("画像URLの取得に失敗しました。", error: error)
                    return
                }
                guard let url = url else { return }
                updateStoreUserInfo(user: user, imageUrl: url)
            }
        }
    }
}

#Preview {
    EditStoreInfoView(user: previewOfChatUser)
}
