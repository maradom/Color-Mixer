//
//  ViewController.swift
//  colourMixer
//
//  Created by Martynas Adomaitis on 1/30/18.
//  Copyright © 2018 Martynas Adomaitis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabelValue: UILabel!
    @IBOutlet weak var greenLabelValue: UILabel!
    @IBOutlet weak var blueLabelValue: UILabel!
    
    var isHex = false
    var isbyte = false
    var isFloat = false
    var strFormat = "%.0f"

    
    @IBOutlet weak var imageViewColourPanel: UIImageView!
    
    var colourMix : Colour?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redLabelValue.text = "0"
        greenLabelValue.text = "0"
        blueLabelValue.text = "0"
        colourMix = Colour(red: 0.0, green: 0.0, blue: 0.0)
        
        let redClick = UITapGestureRecognizer(target: self,action:#selector(changeRedSlider(gesture:)))
        redLabelValue.addGestureRecognizer(redClick)
        
        let greenClick = UITapGestureRecognizer(target: self, action: #selector(changedGreenSlider(gesture:)))
        greenLabelValue.addGestureRecognizer(greenClick)
        
        let blueClick = UITapGestureRecognizer(target: self, action: #selector(changedBlueSlider(gesture:)))
    blueLabelValue.addGestureRecognizer(blueClick)
        
    }
    
    @objc func changeFormat(gesture: UITapGestureRecognizer){
        
        if (isHex){
            isHex = false
            isFloat = true
            strFormat = "%.2f"
            
        }else if (isFloat){
            isHex = false
            isFloat = true
            strFormat = "%.0f"
            
        } else {
            isbyte = false
            isHex = true
            strFormat = "%2X"
            
        }
        redLabelValue.text = String(format:strFormat,(isHex ? Int(redSlider.value) : redSlider.value))
        greenLabelValue.text = String(format:strFormat,(isHex ? Int(greenSlider.value) : greenSlider.value))
        blueLabelValue.text = String(format:strFormat,(isHex ? Int(blueSlider.value) : blueSlider.value))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func changeRedSlider(gesture: UITapGestureRecognizer) {
        redLabelValue.text = String(format:"%X", Int(redSlider.value))
    }
    @IBAction func changedGreenSlider(gesture: UITapGestureRecognizer) {
        greenLabelValue.text = String(format: "%2X", greenSlider.value)
    }
    
    @IBAction func changedBlueSlider(gesture: UITapGestureRecognizer) {
        blueLabelValue.text = String(format: "%2X",blueSlider.value)
    }
    
    
    
    @IBAction func redValueChanged(_ sender: UISlider) {
        //uodate red label
        redLabelValue.text = String(format : "%.0f", redSlider.value)
        colourMix?.redValue = redSlider.value
        imageViewColourPanel.backgroundColor = colourMix?.getColour()
        
    }
    
    
    @IBAction func greenValueChanged(_ sender: UISlider) {
        //update green label
        greenLabelValue.text = String(format : "%.0f",greenSlider.value)
        colourMix?.greenValue = greenSlider.value
        imageViewColourPanel.backgroundColor = colourMix?.getColour()
    }
   
    @IBAction func blueValueChanged(_ sender: UISlider) {
        //update blue label
        blueLabelValue.text = String(format : "%.0f", blueSlider.value)
        colourMix?.blueValue = blueSlider.value
        imageViewColourPanel.backgroundColor = colourMix?.getColour()
    }
    
    
}


