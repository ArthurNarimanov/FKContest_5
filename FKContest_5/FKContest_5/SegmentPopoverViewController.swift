//
//  SegmentPopoverViewController.swift
//  FKContest_5
//
//  Created by Arthur Narimanov on 3/15/23.
//

import UIKit

class SegmentPopoverViewController: UIViewController {
    
    private var segment: UISegmentedControl = {
       let segment = UISegmentedControl(items: ["280", "150"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "power.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.bounds.size = CGSize(width: 24, height: 24)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = Constants.mid
        view.addSubview(segment)
        view.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            segment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
        
        segment.addTarget(self, action: #selector(actionSegment(_:)), for: .valueChanged)
        dismissButton.addTarget(self, action: #selector(tapOnDismissButton), for: .touchUpInside)
    }
    
    @objc
    private func actionSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: preferredContentSize = Constants.mid
        default: preferredContentSize = Constants.low
        }
    }
    
    @objc
    private func tapOnDismissButton() {
        dismiss(animated: true)
    }
    
    private enum Constants {
        static let low: CGSize = CGSize(width: 300, height: 150)
        static let mid: CGSize = CGSize(width: 300, height: 280)
    }
}
