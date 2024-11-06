//
//  ViewController.swift
//  CustomActivityIndicator_ProcessView
//
//  Created by Engy on 11/6/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProcessingView()
    }

    func setupProcessingView() {

        // Create a view to contain the activity indicator and label
        let processingView = UIView()
        processingView.backgroundColor = UIColor.secondaryLabel.withAlphaComponent(0.1)
        processingView.translatesAutoresizingMaskIntoConstraints = false
        processingView.layer.cornerRadius = 10
        processingView.clipsToBounds = true

        // Create the activity indicator
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .systemRed
        activityIndicator.startAnimating()

        // Create the label
        let label = UILabel()
        label.text = "Processing..."
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        // Add the activity indicator and label to the processing view
        processingView.addSubview(label)
        processingView.addSubview(activityIndicator)

        // Add the processing view to the main view
        view.addSubview(processingView)

        // Set up constraints for processing view
        NSLayoutConstraint.activate([
            processingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            processingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            processingView.widthAnchor.constraint(equalToConstant: 150),
            processingView.heightAnchor.constraint(equalToConstant: 100),

            activityIndicator.centerXAnchor.constraint(equalTo: processingView.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: processingView.topAnchor, constant: 15),

            label.centerXAnchor.constraint(equalTo: processingView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: processingView.bottomAnchor, constant: -15)
        ])

        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
           activityIndicator.stopAnimating()
           processingView.isHidden = true
        }
    }


}

