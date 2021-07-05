//
//  ViewController.swift
//  OurToDoList
//
//  Created by 변웅섭 on 2021/07/02.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // UITableViewDataSource는
    // func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    // func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    // 위 두 메소드가 필수 메소드이다. (없는 경우 에러 발생)
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        title = "To Do List"
        view.addSubview(table)
        table.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        

        let alert = UIAlertController(title: "New Item", message: "Enter new to do list item", preferredStyle: .alert)
        alert.addTextField{field in field.placeholder = "Enter item..." }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (_) in
            // Optional binding(옵셔널 바인딩): 변수의 값이 nil이라면 통과하고 값이 존재한다면 변수에 값을 대입합니다.
            
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty { // 왼쪽의 코드와 같이 Optional Binding과 조건절이 같이 쓰였을 경우에는 Biniding이 일어난 후에 실행되기 때문에 즉, 옵셔널이 벗겨진 값을 가지고 검사한다.
                    // Enter new to do list item
                    DispatchQueue.main.async {
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems, forKey: "items")
                        self?.items.append(text)
                        self?.table.reloadData()
                    }
                    
                }
            }
            
        }))
        
        present(alert, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                     for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
            return cell
    }
}

