//
//  ViewController.swift
//  Homework1
//
//  Created by Aaron Sargento on 1/18/17.
//  Copyright © 2017 Aaron Sargento. All rights reserved.
//

// Input: this program will take in the user 8-number combination
// Ouptut: If user's 8-number combination matches, then the label changes to "You have the correct combination" and the image opens. If not matching, then the user will be prompted to enter a new 8-number combination

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundButtonOne: UIButton!
    
    @IBOutlet weak var roundButtonTwo: UIButton!
    
    @IBOutlet weak var roundButtonThree: UIButton!
    
    @IBOutlet weak var roundButtonFour: UIButton!
    
    @IBOutlet weak var roundButtonFive: UIButton!
    
    @IBOutlet weak var roundButtonSix: UIButton!
    
    @IBOutlet weak var roundButtonSeven: UIButton!
    
    @IBOutlet weak var roundButtonEight: UIButton!
    
    @IBOutlet weak var roundButtonNine: UIButton!
    
    @IBOutlet weak var roundButtonZero: UIButton!
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var counter : Int = 0 //counter for buttons pressed
    
    //Hardcode our secret combination to be '12345678'
    var password: [Int] = [1,2,3,4,5,6,7,8]
    
    //Record our user's entry in an array
    var entry: [Int] = []
    

    /*
     The following action function does the following:
     Based on the corresponding button, it will add an element to the entry array
     If the counter is 8, then that means the user entered their 8-number combination and compareArrays() will be called to determine if the combination is correct.
     If the combination is correct then change the label to "You have the correct combination" and open the box; else send a prompt to have the user try again.
     After each 8-number combination, the counter will be reset to 0 and the entry array will be empty for another attempt.
     If the counter is less than 8, then the box remains closed
     */
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender {
        case roundButtonOne:
            entry.append(1)
        case roundButtonTwo:
            entry.append(2)
        case roundButtonThree:
            entry.append(3)
        case roundButtonFour:
            entry.append(4)
        case roundButtonFive:
            entry.append(5)
        case roundButtonSix:
            entry.append(6)
        case roundButtonSeven:
            entry.append(7)
        case roundButtonEight:
            entry.append(8)
        case roundButtonNine:
            entry.append(9)
        case roundButtonZero:
            entry.append(0)
        default:
            break
        }
        counter += 1
        if counter == 8 {
            if compareArrays() == false {
                myLabel.text = "Mismatched entry. Please try again"
            }
            else {
                myLabel.text = "You have the correct combination"
                self.myImage.image = UIImage(named: "openbox.jpg")
            }
            counter = 0
            entry.removeAll()
        }
        else {
            myLabel.text = "Please place the correct combination"
            self.myImage.image = UIImage(named: "closedbox.jpg")
        }
    }
    
    /*
        When called this Boolean-returning function will compare the user's entry with the hard-coded secret combination, one element a time.
        A false is returned for mis-match; a true is returned for matching combination
    */
    func compareArrays() -> Bool {
        var check : Bool = true
        var iterator : Int = 0
        for item in entry {
            print("Entry is \(item)") //output the entry for debugging
            if item !=  password[iterator] {
                check = false
                break
            }
            else {
                check = true
            }
            iterator += 1
        }
        return check
    }
    
    /*
        When called this function will format the button to a circular shape
    */
    func formatButton(_ sender: UIButton) {
        sender.layer.borderColor = UIColor(red: 81/255, green: 149/255, blue: 243/255, alpha: 1).cgColor
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 0.5 * sender.bounds.size.width
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* Render each button to a circular shape */
        formatButton(roundButtonOne)
        formatButton(roundButtonTwo)
        formatButton(roundButtonThree)
        formatButton(roundButtonFour)
        formatButton(roundButtonFive)
        formatButton(roundButtonSix)
        formatButton(roundButtonSeven)
        formatButton(roundButtonEight)
        formatButton(roundButtonNine)
        formatButton(roundButtonZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

