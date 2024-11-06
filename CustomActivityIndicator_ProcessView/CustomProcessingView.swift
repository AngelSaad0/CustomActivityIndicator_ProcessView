//
//  CustomProcessingView.swift
//  CustomActivityIndicator_ProcessView
//
//  Created by Engy on 11/6/24.
//

import UIKit

class CustomProcessingView: UIView {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //for take instance
        commanInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commanInit()
    }

    func commanInit() {

        self.layer.cornerRadius = 10
        self.clipsToBounds =  true
        let bundle = Bundle.init(for: CustomProcessingView.self)
        if let ViewToAdd = bundle.loadNibNamed("CustomProcessingView", owner: self,options: nil), let contentView = ViewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]

        }
           activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.activityIndicator.stopAnimating()
            self.isHidden = true
        }

    }



    


}
