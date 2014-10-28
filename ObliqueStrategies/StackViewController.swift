//
//  StackViewController.swift
//  ObliqueStrategies
//
//  Created by Ryan Sims on 10/27/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    @IBOutlet weak var largeCardView: UIView!
    @IBOutlet weak var largeCardImageView: UIImageView!
    @IBOutlet weak var stackImageView: UIImageView!
    
    var activeCardCenter = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func largeCardTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: { () -> Void in
            self.largeCardImageView.transform = CGAffineTransformMakeScale(1.01, 1.01)
            }) { (finished: Bool) -> Void in
        }
    }
    @IBAction func largeCardPan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
    
        // Rotational angle based on amount of movement
        var translationPercentage = Double((translation.x/320))
        var angle = translationPercentage / 1
        
        // Movement cutpoints
        let panRotationCutpoint: CGFloat = 75
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            activeCardCenter = self.largeCardView.center

            // Panning begins
            UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: { () -> Void in
                self.largeCardView.transform = CGAffineTransformMakeScale(1.02, 1.02)
                }) { (finished: Bool) -> Void in
            }
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            // Panning happens
            // Movement
            println("Panning")
            
            if velocity.x > panRotationCutpoint {
                UIView.animateWithDuration(0.1, delay: 0, options: nil, animations: { () -> Void in
                    self.largeCardView.transform = CGAffineTransformRotate(self.largeCardView.transform, CGFloat(angle * M_PI / 180))
                    }) { (finished: Bool) -> Void in
                }
            } else if velocity.x < -panRotationCutpoint {
                UIView.animateWithDuration(0.1, delay: 0, options: nil, animations: { () -> Void in
                    self.largeCardView.transform = CGAffineTransformRotate(self.largeCardView.transform, CGFloat(angle * M_PI / 180))
                    }) { (finished: Bool) -> Void in
                }
            }
            largeCardView.center.x = translation.x + activeCardCenter.x
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            // Panning ends
            // Cleanup
            println("Pan ended")
            var cardDestination: CGFloat
            if velocity.x > 0 {
                cardDestination = 320
            } else {
                cardDestination = -320
            }

            // Evaluate drag position
            switch translation.x {
            case 0...50:
                UIView.animateWithDuration(0.15, delay: 0, options: nil, animations: { () -> Void in
                    self.largeCardView.transform = CGAffineTransformIdentity
                    self.largeCardView.center.x = self.activeCardCenter.x
                    }) { (finished: Bool) -> Void in
                }
            case -50...0:
                UIView.animateWithDuration(0.15, delay: 0, options: nil, animations: { () -> Void in
                    self.largeCardView.transform = CGAffineTransformIdentity
                    self.largeCardView.center.x = self.activeCardCenter.x
                    }) { (finished: Bool) -> Void in
                }
            default:
                UIView.animateWithDuration(0.35, delay: 0, options: nil, animations: { () -> Void in
                    self.largeCardView.transform = CGAffineTransformIdentity
                    self.largeCardView.frame.origin.x = cardDestination
                    }) { (finished: Bool) -> Void in
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
