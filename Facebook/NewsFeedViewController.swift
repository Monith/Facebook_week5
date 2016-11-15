//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var weddingOne: UIImageView!
    
    @IBOutlet weak var weddingTwo: UIImageView!
    
    @IBOutlet weak var weddingThree: UIImageView!
    
    @IBOutlet weak var weddingFour: UIImageView!
    
    @IBOutlet weak var weddingFive: UIImageView!
    
    var selectedImageView: UIImageView!
    
    var fadeTransition: FadeTransition!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    @IBAction func didTapPicture(_ sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegue(withIdentifier: "photoSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! PhotoViewController
        
        destinationViewController.image = selectedImageView.image
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.3
    }
        
        
}

