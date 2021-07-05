//
//  EntryViewController.swift
//  SecondTodoListApp
//
//  Created by 변웅섭 on 2021/07/05.
//

import UIKit

class EntryViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet var field: UITextField!

    var update: (() -> Void)? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        
        return true
    }
    
    @objc func saveTask() {
        // guard let vs if let
        // - guard 뒤에는 else 구문이 무조건 필요함
        // - guard 구문이 실행되고 난 후의 변수는 해당 블록 뿐만이 아니라 해당 함수 내의 지역변수처럼 사용가능 (if let은 불가능)
        guard let text = field.text, !text.isEmpty else {
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
    

}
