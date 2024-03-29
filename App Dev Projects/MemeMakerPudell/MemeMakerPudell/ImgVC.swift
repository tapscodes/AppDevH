//
//  ImgVC.swift
//  MemeMakerPudell
//
//  Created by Tristan Pudell-Spatscheck on 10/30/19.
//  Copyright © 2019 Tristan Pudell-Spatscheck. All rights reserved.
//

import Foundation
import UIKit
class ImgVC: UIViewController{
    //UI Componenets of Image VC
    @IBOutlet weak var previewLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var prevView: UIView!
    @IBOutlet weak var realImg: UIImageView!
    @IBOutlet weak var realTopTxt: UITextField!
    @IBOutlet weak var realBottomTxt: UITextField!
    override func viewDidLoad(){
        super.viewDidLoad()
        realImg.image = mainImg
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
    }
    @IBAction func savePressed(_ sender: Any) {
        //takes a "screenshot" of the screen with the text + image
        let saveImg = generateMemedImage()
        //adds image to album
        UIImageWriteToSavedPhotosAlbum(saveImg, nil, nil, nil)
        //Tells user image was saved
        let alert = UIAlertController(title: "Saved!", message: "Your meme was added to your camera roll.", preferredStyle: .alert)
        //Add "OK" Button so user can exit the alert
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        //actually present the alert
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func generateMemedImage() -> UIImage {
        ///renders meme
        UIGraphicsBeginImageContext(self.prevView.frame.size)
        prevView.drawHierarchy(in: self.prevView.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return memedImage
    }
}
