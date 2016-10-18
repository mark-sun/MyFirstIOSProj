//
//  RatingControl.swift
//  MyFirstIOSProj
//
//  Created by Mark Sun on 10/14/16.
//  Copyright © 2016 Mark Sun. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    let spacing = 15
    let starCount = 5
    var buttonSize = 0
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let blackStartImage = UIImage(named: "blackstar")
        let whiteStartImage = UIImage(named: "whitestar")
        
        buttonSize = 44
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.setImage(whiteStartImage, for: UIControlState())
            button.setImage(blackStartImage, for: .selected)
            button.setImage(blackStartImage, for: [.highlighted, .selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override var intrinsicContentSize : CGSize {
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonSize)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    // MARK: Button Action
    func ratingButtonTapped(_ button: UIButton) {
        print("Button pressed")
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
}
