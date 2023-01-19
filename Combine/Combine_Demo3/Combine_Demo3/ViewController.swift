//
//  ViewController.swift
//  Combine_Demo3
//
//  Created by Mahesh on 19/01/23.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    
    private var switchSubscriber: AnyCancellable?
    private var viewModel = ViewModel()
    
    @IBOutlet private weak var howsJoshSwitch: UISwitch!
    @IBOutlet private weak var joshButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchSubscriber = viewModel.$howsJosh
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: joshButton)
    }
    
    @IBAction func didSwitch(_ sender: UISwitch) {
        viewModel.howsJosh = sender.isOn
    }
}
