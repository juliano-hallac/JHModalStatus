//
//  JHModalStatusView.swift
//  JHModalStatus
//
//  Created by Juliano Hallac on 28/10/17.
//  Copyright © 2017 Juliano Hallac. All rights reserved.
//

import UIKit

class JHModalStatusView: UIView {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var headLineLabel: UILabel!
    @IBOutlet weak var subHeadLabel: UILabel!
    let nibName = "JHModalStatusView"
    var contentView : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView(){
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.addSubview(self.contentView)
        
        self.contentView.center = self.center
        self.contentView.autoresizingMask = []
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        
        self.headLineLabel.text = ""
        self.subHeadLabel.text = ""
    }
    
    public func set(image: UIImage){
        self.statusImage.image = image
    }
    
    public func set(headLine text : String){
        self.headLineLabel.text = text
    }
    
    public func set(subHead text : String){
        self.subHeadLabel.text = text
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
