//
//  programmaticallyProcessingView.swift
//  CustomActivityIndicator_ProcessView
//
//  Created by Engy on 11/6/24.
//

import UIKit

class ProgrammaticallyProcessingView: UIView {

    // Activity indicator and label properties
    private var activityIndicator: UIActivityIndicatorView!
    private var label: UILabel!

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupProcessingView()
//
//    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupProcessingView()
    }


    func setupProcessingView() {

        // Create a view to contain the activity indicator and label
        self.backgroundColor = UIColor.secondaryLabel.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.clipsToBounds = true

        // Create the activity indicator
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .systemRed
        activityIndicator.startAnimating()

        // Create the label
        label = UILabel()
        label.text = "Processing..."
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        // Add the activity indicator and label to the processing view
        self.addSubview(label)
        self.addSubview(activityIndicator)

        // Add the processing view to the main view

        // Set up constraints for processing view
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.widthAnchor.constraint(equalToConstant: 150),
            self.heightAnchor.constraint(equalToConstant: 100),

            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),

            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])

        // Hide the processing view and stop the activity indicator after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.activityIndicator.stopAnimating()
            self.isHidden = true
        }
    }
}
