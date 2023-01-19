//
//  ViewController.swift
//  Combine_Demo5
//
//  Created by Mahesh on 19/01/23.
//

import UIKit
import Combine

extension Notification.Name {
    static let notificationName = Notification.Name("High Sir!!")
}

class ViewController: UIViewController {
    var cancellable: AnyCancellable?
    
    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cancellable = NotificationCenter.Publisher(center: .default, name: .notificationName, object: nil)
            .sink { notification in
                self.responseLabel.text = notification.name.rawValue
            }
    }
    
    @IBAction func postNotificationButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: .notificationName, object: nil)
    }
}

