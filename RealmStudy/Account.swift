import Foundation
// RealmSwiftをimportする
import RealmSwift

// Objectをスーパークラスにすることでこのクラスの変数のデータをRealmに保存することができる
class Account: Object {
    // 変数の宣言
    // 名前
    @objc dynamic var name: String = ""
    // ID
    @objc dynamic var id: String = ""
    // パスワード
    @objc dynamic var password: String = ""
    // カテゴリ
    @objc dynamic var category: String = ""
    // 画像データ
    @objc dynamic var imageData: Data?
}
