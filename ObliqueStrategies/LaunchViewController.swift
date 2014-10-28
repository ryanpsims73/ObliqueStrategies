//
//  LaunchViewController.swift
//  ObliqueStrategies
//
//  Created by Ryan Sims on 10/26/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var launchView: UIView!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var cardsView: UIView!
    @IBOutlet weak var targetUIButton: UIButton!
    @IBOutlet weak var targetImageView: UIImageView!
    @IBOutlet weak var smallCardsImageView: UIImageView!
    @IBOutlet weak var largeCardImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.largeCardImageView.alpha = 0;
        UIView.animateWithDuration(1.2, delay: 0.0, options: .Autoreverse | .Repeat, animations: { () -> Void in
            self.targetImageView.alpha = 0.3
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func targetTap(sender: AnyObject) {
        UIView.animateWithDuration(0.75, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
            // lift title up
            self.titleImageView.transform = CGAffineTransformMakeTranslation(0.0, -230.0)
            // scale mini cards and target
            self.largeCardImageView.alpha = 1
            self.cardsView.transform = CGAffineTransformMakeTranslation(0.0, -130.0)
            self.cardsView.transform = CGAffineTransformScale(self.cardsView.transform, 6.05, 6.05)
            self.smallCardsImageView.alpha = 0;
            self.targetImageView.alpha = 0;
        }) { (finished: Bool) -> Void in
            // load our next view
            self.performSegueWithIdentifier("cardSegue", sender: self)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        //println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

}
