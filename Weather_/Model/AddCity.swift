//
//  AddCity.swift
//  Weather_
//
//  Created by Олег Рубан on 13.04.2022.
//

import UIKit

extension UIViewController {
    func alertPlusCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ок", style: .default) { (action) in
            
            let tftext = alert.textFields?.first
            guard let text = tftext?.text else { return }
                completionHandler(text)
        }
        alert.addTextField { (tf) in
            tf.placeholder = placeholder
        }
        
        let alertCancel = UIAlertAction(title: "Отмена", style: .default) { _ in }
        
        alert.addAction(alertOk)
        alert.addAction(alertCancel)
        
        present(alert, animated: true, completion: nil)
    }
}
