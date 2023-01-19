//
//  ViewController.swift
//  Combine_Demo4
//
//  Created by Mahesh on 19/01/23.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    var cancellable: AnyCancellable?
    var cancellableTimerPublisher: Cancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButtonAction(_ sender: Any) {
        let timerPublisher = Timer.publish(every: 1.0, on: RunLoop.main, in: .default)
        cancellable = timerPublisher
            .sink {
                self.counterLabel.text = "\($0.formatted(date: .numeric, time: .standard))"
            }
        cancellableTimerPublisher = timerPublisher.connect()
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        cancellableTimerPublisher?.cancel()
    }
}

