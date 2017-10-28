//
//  JHModalStatusView.swift
//  JHModalStatus
//
//  Created by Juliano Hallac on 28/10/17.
//  Copyright © 2017 Juliano Hallac. All rights reserved.
//

import UIKit

public class JHModalStatusView: UIView {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var headLineLabel: UILabel!
    @IBOutlet weak var subHeadLabel: UILabel!
    let nibName = "JHModalStatusView"
    var contentView : UIView!
    var timer : Timer?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView(){
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        contentView.alpha = 0.0
        
        headLineLabel.text = ""
        subHeadLabel.text = ""
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
    
    public override func didMoveToSuperview() {
        self.contentView.transform =  CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.30, animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        }){ _ in
            self.timer = Timer.scheduledTimer(
                timeInterval: TimeInterval(3.0),
                target: self,
                selector: #selector(self.removeSelf),
                userInfo: nil,
                repeats: false)
        }
    }
    
    @objc private func removeSelf(){
        UIView.animate(withDuration: TimeInterval(0.15), animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.contentView.alpha = 0.0
        })
        {_ in
            self.removeFromSuperview()
        }
        
        
        
    }
    
    public override func layoutSubviews(){
        self.layoutIfNeeded()
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.clipsToBounds = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
