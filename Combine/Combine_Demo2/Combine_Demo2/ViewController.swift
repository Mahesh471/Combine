//
//  ViewController.swift
//  Combine_Demo2
//
//  Created by Mahesh on 19/01/23.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    @Published var howsJosh: Bool = true
    private var switchSubscriber: AnyCancellable?
    
    @IBOutlet private weak var howsJoshSwitch: UISwitch!
    @IBOutlet private weak var joshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchSubscriber = $howsJosh
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: joshButton)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        switchSubscriber?.cancel()
    }
    
    @IBAction func didSwitch(_ sender: UISwitch) {
        howsJosh = sender.isOn
    }
}

