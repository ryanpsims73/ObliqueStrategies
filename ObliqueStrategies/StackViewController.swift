//
//  StackViewController.swift
//  ObliqueStrategies
//
//  Created by Ryan Sims on 10/27/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class StackViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var largeCardView: UIView!
    @IBOutlet weak var largeCardImageView: UIImageView!
    @IBOutlet weak var largeGraphicImageView: UIImageView!
    @IBOutlet weak var largeCardUIText: UITextView!
    @IBOutlet weak var stackImageView: UIImageView!
    @IBOutlet weak var favoritesImageView: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!

    var baseStrategyDictionary = [Int: String]()
    var baseStrategyImageDictionary = [Int: String]()
    
    var personalStrategyArray:Array<Any>  = []
    var activeBaseCardIndex = Int(1)
    var activePersonalCardIndex = Int(1)
    
    var activeCardCenter = CGPoint()
    
    let cardFrontCGRect = CGRect(x: 34, y: 77, width: 252, height: 402)
    let cardFrontImageCGRect = CGRect(x: 0, y: 0, width: 252, height: 402)
    let cardFrontTopImageCGRect = CGRect(x: 0, y: 0, width: 252, height: 239)
    let cardFrontTextViewCGRect = CGRect(x: 16, y: 264, width: 220, height: 130)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide base card template
        self.largeCardView.alpha = 0
        self.largeCardUIText.textAlignment = .Center
        self.largeCardUIText.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.largeCardUIText.editable = false
        self.largeCardUIText.userInteractionEnabled = true
        
        // populate strategy dictionary
        baseStrategyDictionary = [
            1: "Always first steps",
            2: "Make an exhaustive list of everything you might do and do the last thing on the list",
            3: "Destroy: Nothing. The most important thing.",
            4: "Discover the recipes you are using and abandon them.",
            5: "Be extravagant",
            6: "Disconnect from desire",
            7: "Think: Inside the work. Outside the work.",
            8: "Try faking it!",
            9: "Voice nagging suspicions",
            10: "Who should do this job? How would they do it?",
            11: "Take away the elements in order of apparent non importance",
            12: "In total darkness or in a very large room, very quietly",
            13: "What wouldn't you do?",
            14: "Take a break",
            15: "Be less critical more often",
            16: "Water",
            17: "Give way to your worst impulse",
            18: "Only a part, not the whole",
            19: "Make it more sensual",
            20: "State the problem in words as clearly as possible",
            21: "Overtly resist change",
            22: "The inconsistency principle",
            23: "Remember .those quiet evenings",
            24: "Question the heroic approach",
            25: "Only one element of each kind",
            26: "Courage!",
            27: "Do something boring",
            28: "Do we need holes?",
            29: "Decorate, decorate",
            30: "Change nothing and continue with immaculate consistency",
            31: "Cut a vital connection",
            32: "Just carry on",
            33: "Listen to the quiet voice",
            34: "Is there something missing?",
            35: "Simply a matter of work",
            36: "Do the words need changing?",
            37: "Accretion",
            38: "Don't be afraid of things because they're easy to do",
            39: "Accept advice",
            40: "Don't break the silence",
            41: "Be dirty",
            42: "Disciplined self-indulgence",
            43: "The most important thing is the thing most easily forgotten",
            44: "What mistakes did you make last time?",
            45: "Use 'unqualified' people",
            46: "Look at the order in which you do things",
            47: "Breathe more deeply",
            48: "Give the game away",
            49: "Tidy up",
            50: "Use filters",
            51: "Gardening, not architecture",
            52: "Distorting time",
            53: "Remove ambiguities and convert to specifics",
            54: "Use an old idea",
            55: "You are an engineer",
            56: "You don't have to be ashamed of using your own ideas",
            57: "Trust in the you of now",
            58: "When is it for?",
            59: "Would anybody want it?",
            60: "Go to an extreme, move back to a more comfortable place",
            61: "What to maintain?",
            62: "Work at a different speed",
            63: "Which frame would make this look right?",
            64: "How would you have done it?",
            65: "Short circuit (example: a man eating peas with the idea that they will improve his virility shovels them straight into his lap)",
            66: "Retrace your steps",
            67: "Make a sudden, destructive unpredictable action; incorporate",
            68: "Discard an axiom",
            69: "Define an area as 'safe' and use it as an anchor",
            70: "Do nothing for as long as possible",
            71: "Which elements can be groupd?",
            72: "Where's the edge? Where does the frame start?",
            73: "Faced with a choice do both",
            74: "Turn it upside down",
            75: "What to increase? What to reduce?",
            76: "Go outside. Shut the door",
            77: "Towards the insignificant",
            78: "Honor thy error as a hidden intention",
            79: "Repitition is a form of change",
            80: "Make a blank valuable by putting it in an equisite frame",
            81: "Not building a wall but making a brick",
            82: "Reverse",
            83: "Are there sections? Consider transitions",
            84: "Ask your body",
            85: "Emphasize the flaws",
            86: "Emphasize differences",
            87: "Use an unacceptable colour",
            88: "Remove specifics and convert to ambiquities",
            89: "What would your closest friend do?",
            90: "Is it finished?",
            91: "Once the search is in progress, something will be found",
            92: "What are you really thinking about just now? Incorporate",
            93: "Don't be afraid of cliches",
            94: "Allow an easement (an easement is the abandonment of a stricture)",
            95: "Dont' be frightended to display your talents",
            96: "Dont' stress one thing more than another",
            97: "Ask people to work against their better judgement",
            98: "Simple subtraction",
            99: "Look closely at the most embarassment details and amplify them",
            100: "Make something implied more definite (reinforce, duplicate)",
            101: "Slow preparation... Fast execution",
            102: "Humanize something free of error",
            103: "Abandon normal instruments",
        ]
        
        baseStrategyImageDictionary = [
            1: "card-image-0",
            2: "card-image-1",
            3: "card-image-2",
            4: "card-image-3",
            5: "card-image-4",
            6: "card-image-0",
            7: "card-image-1",
            8: "card-image-2",
            9: "card-image-3",
            10: "card-image-4",
            11: "card-image-0",
            12: "card-image-1",
            13: "card-image-2",
            14: "card-image-3",
            15: "card-image-4",
            16: "card-image-0",
            17: "card-image-1",
            18: "card-image-2",
            19: "card-image-3",
            20: "card-image-4",
            21: "card-image-0",
            22: "card-image-0",
            23: "card-image-0",
            24: "card-image-0",
            25: "card-image-0",
            26: "card-image-0",
            27: "card-image-0",
            28: "card-image-0",
            29: "card-image-0",
            30: "card-image-0",
            31: "card-image-0",
            32: "card-image-0",
            33: "card-image-0",
            34: "card-image-0",
            35: "card-image-0",
            36: "card-image-0",
            37: "card-image-0",
            38: "card-image-0",
            39: "card-image-0",
            40: "card-image-0",
            41: "card-image-0",
            42: "card-image-0",
            43: "card-image-0",
            44: "card-image-0",
            45: "card-image-0",
            46: "card-image-0",
            47: "card-image-0",
            48: "card-image-0",
            49: "card-image-0",
            50: "card-image-0",
            51: "card-image-0",
            52: "card-image-0",
            53: "card-image-0",
            54: "card-image-0",
            55: "card-image-0",
            56: "card-image-0",
            57: "card-image-0",
            58: "card-image-0",
            59: "card-image-0",
            60: "card-image-0",
            61: "card-image-0",
            62: "card-image-0",
            63: "card-image-0",
            64: "card-image-0",
            65: "card-image-0",
            66: "card-image-0",
            67: "card-image-0",
            68: "card-image-0",
            69: "card-image-0",
            70: "card-image-0",
            71: "card-image-0",
            72: "card-image-0",
            73: "card-image-0",
            74: "card-image-0",
            75: "card-image-0",
            76: "card-image-0",
            77: "card-image-0",
            78: "card-image-0",
            79: "card-image-0",
            80: "card-image-0",
            81: "card-image-0",
            82: "card-image-0",
            83: "card-image-0",
            84: "card-image-0",
            85: "card-image-0",
            86: "card-image-0",
            87: "card-image-0",
            88: "card-image-0",
            89: "card-image-0",
            90: "card-image-0",
            91: "card-image-0",
            92: "card-image-0",
            93: "card-image-0",
            94: "card-image-0",
            95: "card-image-0",
            96: "card-image-0",
            97: "card-image-0",
            98: "card-image-0",
            99: "card-image-0",
            100: "card-image-0",
            101: "card-image-0",
            102: "card-image-0",
            103: "card-image-0",
        ]

        // Do any additional setup after loading the view.
        loadCard(activeBaseCardIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func incrementCardIndex() {
        if self.activeBaseCardIndex == baseStrategyDictionary.count {
            self.activeBaseCardIndex = 0
        } else {
            self.activeBaseCardIndex += 1
        }
    }
    
    func decrementCardInex() {
        if self.activeBaseCardIndex == 1 {
            self.activeBaseCardIndex = baseStrategyDictionary.count
        } else {
            self.activeBaseCardIndex -= 1
        }
    }
    
    func loadCard(activeCardIndex: Int) {
        var tempCardIndex: Int
        
        if self.activeBaseCardIndex == baseStrategyDictionary.count {
            tempCardIndex = 0
        } else {
            tempCardIndex = self.activeBaseCardIndex + 1
        }
        
        // setup our card in the UI
        var activeCard = UIView(frame: cardFrontCGRect)

        var activeCardImage = UIImageView(frame: cardFrontImageCGRect)
        activeCardImage.image = UIImage(named: "large-card")

        var activeCardTopImage = UIImageView(frame: cardFrontTopImageCGRect)
        activeCardTopImage.image = UIImage(named: baseStrategyImageDictionary[activeCardIndex]!)
        
        var activeCardTextView = UITextView(frame: cardFrontTextViewCGRect)
        activeCardTextView.text = baseStrategyDictionary[activeCardIndex]
        activeCardTextView.textAlignment = .Center
        activeCardTextView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        activeCardTextView.editable = false
        activeCardTextView.userInteractionEnabled = true

        activeCard.addSubview(activeCardImage)
        activeCard.addSubview(activeCardTopImage)
        activeCard.addSubview(activeCardTextView)
        
        // let it respond to gestures
        let cardPan = UIPanGestureRecognizer(target: self, action:Selector("largeCardPan:"))
        let cardTap = UITapGestureRecognizer(target: self, action:Selector("largeCardTap:"))
        cardPan.delegate = self
        cardTap.delegate = self
        activeCard.addGestureRecognizer(cardPan)
        activeCard.addGestureRecognizer(cardTap)
        
        // add it to the view
        view.addSubview(activeCard)
        
        // load fake view behind this one
        self.largeCardUIText.text = baseStrategyDictionary[tempCardIndex]
        self.largeGraphicImageView.image = UIImage(named: baseStrategyImageDictionary[tempCardIndex]!)
        
    }
    
    func largeCardTap(gestureRecognizer: UITapGestureRecognizer) {
        let senderCard = gestureRecognizer.view as UIView!
        UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: { () -> Void in
            senderCard.transform = CGAffineTransformMakeScale(1.01, 1.01)
            }) { (finished: Bool) -> Void in
        }
    }
    func largeCardPan(gestureRecognizer: UIPanGestureRecognizer) {
        let senderCard = gestureRecognizer.view as UIView!

        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
    
        // Rotational angle based on amount of movement
        var translationPercentageX = Double((translation.x/320))
        var translationPercentageY = Double((translation.y/568))
        var angle = translationPercentageX / 2
        
        // Movement cutpoints
        let horizontalCutpoint: CGFloat = 10
        let verticalCutpoint: CGFloat = 10
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            activeCardCenter = senderCard.center

            // Panning begins
            UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: { () -> Void in
                senderCard.transform = CGAffineTransformMakeScale(1.02, 1.02)
                }) { (finished: Bool) -> Void in
            }
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            // Panning happens
            // Movement
            println("Panning")
            
            if translation.x > horizontalCutpoint {
                UIView.animateWithDuration(0.1, delay: 0, options: nil, animations: { () -> Void in
                    //self.largeCardImageView.alpha = 0.7
                    senderCard.transform = CGAffineTransformRotate(senderCard.transform, CGFloat(angle * M_PI / 180))
                    }) { (finished: Bool) -> Void in
                }
                self.largeCardView.alpha = CGFloat(abs(translationPercentageX))
                senderCard.center.x = translation.x + activeCardCenter.x
            } else if translation.x < -horizontalCutpoint {
                UIView.animateWithDuration(0.1, delay: 0, options: nil, animations: { () -> Void in
                    //self.largeCardImageView.alpha = 0.7
                    senderCard.transform = CGAffineTransformRotate(senderCard.transform, CGFloat(angle * M_PI / 180))
                    }) { (finished: Bool) -> Void in
                }
                self.largeCardView.alpha = CGFloat(abs(translationPercentageX))
                senderCard.center.x = translation.x + activeCardCenter.x
            } else if translation.y > verticalCutpoint {
                self.largeCardView.alpha = CGFloat(abs(translationPercentageY))
                senderCard.center.y = translation.y + activeCardCenter.y
            }
        }
        else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            // Panning ends
            // Cleanup
            println("Pan ended")
            var cardDestination: CGFloat
            
            var horizontalDrag: Bool = false
            var verticalDrag: Bool = false
            
            if (abs(velocity.x) > abs(velocity.y)) {
                horizontalDrag = true
            } else if (abs(velocity.y) > abs(velocity.x)) {
                verticalDrag = true
            }

            // Evaluate drag position
            if horizontalDrag {
                switch translation.x {
                case 0...50:
                    UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: { () -> Void in
                        senderCard.transform = CGAffineTransformIdentity
                        senderCard.center.x = self.activeCardCenter.x
                        //self.largeCardImageView.alpha = 1
                        }) { (finished: Bool) -> Void in
                    }
                case -50...0:
                    UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: { () -> Void in
                        senderCard.transform = CGAffineTransformIdentity
                        senderCard.center.x = self.activeCardCenter.x
                        //self.largeCardImageView.alpha = 1
                        }) { (finished: Bool) -> Void in
                    }
                default:
                    if velocity.x > 0 {
                        cardDestination = 320
                    } else {
                        cardDestination = -320
                    }
                    UIView.animateWithDuration(0.3, delay: 0, options: nil, animations: { () -> Void in
                        senderCard.transform = CGAffineTransformIdentity
                        senderCard.frame.origin.x = cardDestination
                        }) { (finished: Bool) -> Void in
                        UIView.animateWithDuration(0.3, delay: 0, options: nil, animations: { () -> Void in
                            senderCard.alpha = 0.75
                            senderCard.transform = CGAffineTransformMakeScale(0.95, 0.95)
                            senderCard.center.x = self.activeCardCenter.x
                            }) { (finished: Bool) -> Void in
                              self.view.sendSubviewToBack(senderCard)
                                senderCard.removeFromSuperview()
                            }
                        self.incrementCardIndex()
                        self.loadCard(self.activeBaseCardIndex)
                    }
                }
            } else if verticalDrag {
                switch translation.y {
                case 0...50:
                    UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: { () -> Void in
                        senderCard.transform = CGAffineTransformIdentity
                        senderCard.center.x = self.activeCardCenter.x
                        //self.largeCardImageView.alpha = 1
                        }) { (finished: Bool) -> Void in
                    }
                default:
                    self.personalStrategyArray.append((self.activeBaseCardIndex))
                    self.heartImageView.image = UIImage(named: "heart-filled")
                    println(self.personalStrategyArray.count)
                    
                    cardDestination = 530

                    UIView.animateWithDuration(0.3, delay: 0, options: nil, animations: { () -> Void in
                        senderCard.transform = CGAffineTransformIdentity
                        senderCard.frame.origin.y = cardDestination
                        senderCard.frame.origin.x = self.largeCardView.frame.origin.x
                        }) { (finished: Bool) -> Void in
                            UIView.animateWithDuration(0.3, delay: 0, options: nil, animations: { () -> Void in
                                senderCard.alpha = 0
                                }) { (finished: Bool) -> Void in
                                    senderCard.removeFromSuperview()
                                    UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: { () -> Void in
                                        self.heartImageView.transform = CGAffineTransformMakeScale(1.5, 1.5)
                                        }) { (finished: Bool) -> Void in
                                        self.heartImageView.transform = CGAffineTransformIdentity
                                    }
                            }
                            self.incrementCardIndex()
                            self.loadCard(self.activeBaseCardIndex)
                    }
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
