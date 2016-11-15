//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Monith Ilavarasan on 11/14/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var photoScroll: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var doneButtonImage: UIImageView!
    
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        photoScroll.contentSize = CGSize(width: 320, height: 700)
        photoScroll.delegate = self
        
        imageView.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ photoScroll: UIScrollView) {
        let scrollOffset = photoScroll.contentOffset.y
        
        backgroundView.alpha = 1 + (scrollOffset / 400)
        doneButtonImage.alpha = 1 + (scrollOffset / 50)
    }
    
    func scrollViewDidEndDragging(_ photoScroll: UIScrollView, willDecelerate decelerate: Bool) {
        let scrollOffset = photoScroll.contentOffset.y
        
        if scrollOffset < -100 {
            /*UIView.animate(withDuration: 0.6, animations: { () -> Void in
                self.photoScroll.transform = self.photoScroll.transform.translatedBy(x: 0, y: 600)
                self.backgroundView.alpha = 0
            })*/
            dismiss(animated: false, completion: nil)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
