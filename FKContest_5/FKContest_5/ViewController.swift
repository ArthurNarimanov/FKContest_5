//
//  ViewController.swift
//  FKContest_5
//
//  Created by Arthur Narimanov on 3/14/23.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    private let presentButton: UIButton = {
       let button = UIButton()
        button.setTitle("present", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(presentButton)
        presentButton.addTarget(self, action: #selector(tapOnPresentButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
    }
    
    @objc
    func tapOnPresentButton() {
        let vc = SegmentPopoverViewController()
        vc.modalPresentationStyle = .popover
        let popover = vc.popoverPresentationController
        popover?.delegate = self
        popover?.sourceView = presentButton
        popover?.sourceRect = CGRect(x: 0, y: 0, width: presentButton.bounds.width, height: presentButton.bounds.height)
        popover?.permittedArrowDirections = .up
        present(vc, animated: true)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
