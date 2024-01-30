//
//  StringExtension.swift
//  CocoShibaTsuka
//
//  Created by 金子広樹 on 2023/12/08.
//

import Foundation

extension String {
    
    // Colors
    static let highlight = "Highlight"
    static let caution = "Caution"
    static let chatLogBackground = "ChatLogBackground"
    static let yellow = "Yellow"
    static let green = "Green"
    static let darkGreen = "DarkGreen"
    static let brown = "Brown"
    
    // Image
    static let title = "Title"
    static let clearTitle = "ClearTitle"
    
    // Tutorial
    static func tutorialText(page: Int) -> String {
        switch page {
        case 1:
            return "SheeBaを\nダウンロードしていただき\nありがとうございます"
        case 2:
            return "各店舗にあるQRコードを読み取って\nポイントを貯めることができます"
        case 3:
            return "貯まったポイントは\n景品と交換することができます"
        case 4:
            return "QRコードをたくさんスキャンして\n欲しい商品をゲットしよう！"
        default :
            return ""
        }
    }
    
    // UserDefault
    static let authVerificationID = "authVerificationID"
    
    // ErrorCode
    static let emptyEmailOrPassword = "メールアドレス、パスワードを入力してください。"
    static let invalidEmail = "メールアドレスの形式が正しくありません。"
    static let weakPassword = "パスワードは6文字以上で設定してください。"
    static let mismatchPassword = "パスワードとパスワード（確認用）が一致しません。"
    static let emailAlreadyInUse = "このメールアドレスはすでに登録されています。"
    static let userNotFound = "メールアドレス、またはパスワードが違います。"
    static let wrongEmail = "メールアドレスが違います。"
    static let userDisabled = "このユーザーアカウントは無効化されています。"
    static let networkError = "通信エラーが発生しました。"
    static let notFoundData = "データが見つかりませんでした。"
    static let failureFetchUID = "UIDの取得に失敗しました。"
    static let failureFetchUser = "ユーザー情報の取得に失敗しました。"
    static let failureFetchStorePoint = "店舗ポイント情報の取得に失敗しました。"
    static let failureDeleteData = "データ削除に失敗しました。"
    static let failureDeleteUser = "ユーザー情報の削除に失敗しました。"
    static let failureDeleteMessage = "メッセージの削除に失敗しました。"
    static let failureDeleteRecentMessage = "最新メッセージの削除に失敗しました。"
    static let failureDeleteFriend = "友達情報の削除に失敗しました。"
    static let failureDeleteStorePoint = "店舗ポイント情報の削除に失敗しました。"
    static let failureDeleteImage = "画像の削除に失敗しました。"
    static let failureDeleteAuth = "認証情報の削除に失敗しました。"
    
    // Preview
    static let previewUsername = "test"
    static let previewAge = ages.first ?? ""
    static let previewAddress = addresses.first ?? ""
    static let previewEmail = "test@gmail.com"
    static let previewPhoneNumber = "0120123456"
    static let previewPassword = "12345678"
    
    // PrivacyPolicy
    static let privacyPolicyTitle = "プライバシーポリシー"
    static let privacyPolicyExplanation = "芝銀座通り商店会（以下、「当会」といいます。）は、本ウェブサイト上で提供する芝銀座通り商店会デジタルポイントアプリSheeBa（シーバ）（以下、「本サービス」といいます。）における、ユーザーの個人情報の取扱いについて、以下のとおりプライバシーポリシー（以下、「本ポリシー」といいます。）を定めます。"
    static let privacyPolicyTitle1 = "第1条（個人情報）"
    static let privacyPolicyArticle1 = "「個人情報」とは、個人情報保護法にいう「個人情報」を指すものとし、生存する個人に関する情報であって、当該情報に含まれる氏名、生年月日、住所、電話番号、連絡先その他の記述等により特定の個人を識別できる情報及び容貌、指紋、声紋にかかるデータ、及び健康保険証の保険者番号などの当該情報単体から特定の個人を識別できる情報（個人識別情報）を指します。"
    static let privacyPolicyTitle2 = "第2条（個人情報の収集方法）"
    static let privacyPolicyArticle2 = "当会は、ユーザーが利用登録をする際に氏名、住所、メールアドレス、パスワードなどの個人情報をお尋ねすることがあります。"
    static let privacyPolicyTitle3 = "第3条（個人情報を収集・利用する目的）"
    static let privacyPolicyArticle3 = "当会が個人情報を収集・利用する目的は、以下のとおりです。\n　1.当会サービスの提供・運営のため\n　2.ユーザーからのお問い合わせに回答するため（本人確認を行うことを含む）\n　3.ユーザーが利用中のサービスの新機能、更新情報、キャンペーン等及び当会が提供する他のサービスの案内のメールを送付するため\n　4.メンテナンス、重要なお知らせなど必要に応じたご連絡のため\n　5.利用規約に違反したユーザーや、不正・不当な目的でサービスを利用しようとするユーザーの特定をし、ご利用をお断りするため\n　6.ユーザーにご自身の登録情報の閲覧や変更、削除、ご利用状況の閲覧を行っていただくため\n　7.有料サービスにおいて、ユーザーに利用料金を請求するため\n　8.上記の利用目的に付随する目的"
    static let privacyPolicyTitle4 = "第4条（利用目的の変更）"
    static let privacyPolicyArticle4 = "　1.当会は、利用目的が変更前と関連性を有すると合理的に認められる場合に限り，個人情報の利用目的を変更するものとします。\n　2.利用目的の変更を行った場合には、変更後の目的について、当会所定の方法により、ユーザーに通知し、または本ウェブサイト上に公表するものとします。"
    static let privacyPolicyTitle5 = "第5条（個人情報の第三者提供）"
    static let privacyPolicyArticle5 = "　1.当会は、次に掲げる場合を除いて、あらかじめユーザーの同意を得ることなく、第三者に個人情報を提供することはありません。ただし、個人情報保護法その他の法令で認められる場合を除きます。\n　　1.人の生命、身体または財産の保護のために必要がある場合であって、本人の同意を得ることが困難であるとき\n　　2.公衆衛生の向上または児童の健全な育成の推進のために特に必要がある場合であって、本人の同意を得ることが困難であるとき\n　　3.国の機関もしくは地方公共団体またはその委託を受けた者が法令の定める事務を遂行することに対して協力する必要がある場合であって、本人の同意を得ることにより当該事務の遂行に支障を及ぼすおそれがあるとき\n　　4.予め次の事項を告知あるいは公表し、かつ当会が個人情報保護委員会に届出をしたとき\n　　　1.利用目的に第三者への提供を含むこと\n　　　2.第三者に提供されるデータの項目\n　　　3.第三者への提供の手段または方法\n　　　4.本人の求めに応じて個人情報の第三者への提供を停止すること\n　　　5.本人の求めを受け付ける方法\n　2.前項の定めにかかわらず、次に掲げる場合には、当該情報の提供先は第三者に該当しないものとします。\n　　1.当会が利用目的の達成に必要な範囲内において個人情報の取扱いの全部または一部を委託する場合\n　　2.合併その他の事由による事業の承継に伴って個人情報が提供される場合\n　　3.個人情報を特定の者との間で共同して利用する場合であって、その旨並びに共同して利用される個人情報の項目、共同して利用する者の範囲、利用する者の利用目的および当該個人情報の管理について責任を有する者の氏名または名称について、あらかじめ本人に通知し、または本人が容易に知り得る状態に置いた場合"
    static let privacyPolicyTitle6 = "第6条（個人情報の開示）"
    static let privacyPolicyArticle6 = "　1.当会は、本人から個人情報の開示を求められたときは、本人に対し、遅滞なくこれを開示します。ただし、開示することにより次のいずれかに該当する場合は、その全部または一部を開示しないこともあり、開示しない決定をした場合には、その旨を遅滞なく通知します。なお、個人情報の開示に際しては、1件あたり1,000円の手数料を申し受けます。\n　　1.本人または第三者の生命、身体、財産その他の権利利益を害するおそれがある場合\n　　2.当会の業務の適正な実施に著しい支障を及ぼすおそれがある場合\n　　3.その他法令に違反することとなる場合\n　2.前項の定めにかかわらず、履歴情報および特性情報などの個人情報以外の情報については、原則として開示いたしません。"
    static let privacyPolicyTitle7 = "第7条（個人情報の訂正および削除）"
    static let privacyPolicyArticle7 = "　1.ユーザーは、当会の保有する自己の個人情報が誤った情報である場合には、当会が定める手続きにより、当会に対して個人情報の訂正、追加または削除（以下、「訂正等」といいます。）を請求することができます。\n　2.当会は、ユーザーから前項の請求を受けてその請求に応じる必要があると判断した場合には、遅滞なく、当該個人情報の訂正等を行うものとします。\n　3.当会は、前項の規定に基づき訂正等を行った場合、または訂正等を行わない旨の決定をしたときは遅滞なく、これをユーザーに通知します。"
    static let privacyPolicyTitle8 = "第8条（個人情報の利用停止等）"
    static let privacyPolicyArticle8 = "　1.当会は、本人から、個人情報が、利用目的の範囲を超えて取り扱われているという理由、または不正の手段により取得されたものであるという理由により、その利用の停止または消去（以下、「利用停止等」といいます。）を求められた場合には、遅滞なく必要な調査を行います。\n　2.前項の調査結果に基づき、その請求に応じる必要があると判断した場合には、遅滞なく、当該個人情報の利用停止等を行います。\n　3.当会は、前項の規定に基づき利用停止等を行った場合、または利用停止等を行わない旨の決定をしたときは、遅滞なく、これをユーザーに通知します。\n　4.前2項にかかわらず、利用停止等に多額の費用を有する場合その他利用停止等を行うことが困難な場合であって、ユーザーの権利利益を保護するために必要なこれに代わるべき措置をとれる場合は、この代替策を講じるものとします。"
    static let privacyPolicyTitle9 = "第9条（プライバシーポリシーの変更）"
    static let privacyPolicyArticle9 = "　1.本ポリシーの内容は、法令その他本ポリシーに別段の定めのある事項を除いて、ユーザーに通知することなく、変更することができるものとします。\n　2.当会が別途定める場合を除いて、変更後のプライバシーポリシーは、本ウェブサイトに掲載したときから効力を生じるものとします。"
    static let privacyPolicyTitle10 = "第10条（お問い合わせ窓口）"
    static let privacyPolicyArticle10 = "本ポリシーに関するお問い合わせは、下記の窓口までお願いいたします。\n住所：川口市芝3871-2\n会名：芝銀座通り商店会\n会長：平田輝久\n担当部署：事業部\nEメールアドレス：sheeba.point.project@gmail.com\n\n　　　　　　　　　　　　　　　　　　　　　以上"
}
