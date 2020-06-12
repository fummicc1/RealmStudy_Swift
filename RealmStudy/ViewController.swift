import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: @IBOutletプロパティ
    @IBOutlet var tableView: UITableView!
    
    var accounts: [Account] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        get()
        tableView.reloadData()
    }
    
    //MARK: データベースを操作するメソッド
    
    // Accountを保存するメソッド
    func create(account: Account) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(account)
        }
    }
    
    // Accountを取得するメソッド
    func get() {
        let realm = try! Realm()
        accounts = Array(realm.objects(Account.self))
    }
    
    // Accountを削除するメソッド
    func delete(account: Account) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(account)
        }
    }
    
    //MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = accounts[indexPath.row].name
        cell.detailTextLabel?.text = accounts[indexPath.row].category
        return cell
    }
    
    //MARK: @IBActionメソッド
    // +ボタンを押したときに呼ばれる
    @IBAction func addAccount() {
        // 保存するAccountを用意
        let account = Account()
        // データを代入（今回は仮で適当なデータを代入）
        account.name = "テストNAME"
        account.id = "テストID"
        account.password = "テストPASSWORD"
        account.category = "テストCATEGORY"
        account.imageData = nil
        // 保存を行う
        create(account: account)
        // 最新データを取得する
        get()
        // TableViewをリロードして保存したAccountも表示されるようにする
        tableView.reloadData()
    }
    
    // 削除ボタンを押したときに呼ばれる
    @IBAction func deleteAccount() {
        // 配列の先頭のAccountを取得
        let account = accounts[0]
        // 削除する
        delete(account: account)
        get()
        tableView.reloadData()
    }
}
