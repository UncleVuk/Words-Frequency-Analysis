//
//  ViewController.swift
//  Words Frequency Analysis
//
//  Created by Yevhenii Vuksta on 30.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextView!
    
    @IBOutlet weak var buttonAnalyze: UIButton!
    
    @IBOutlet weak var buttonClear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Create instance of text analysis struct
    var textAnalysis = TextAnalysis()
    
    // Analysis button pressed
    @IBAction func analyzeButtonPressed(_ sender: UIButton) {
        // Get input text from input text field
        guard let input = inputTextField.text else {
            inputTextField.text = "Entr sum text plz"
            return
        }
        // set input to input text of structure instance
        textAnalysis.getInput(input: input)
        
        // Perform text frequency analysis
        textAnalysis.analyze()
        
        // Output analysis results to text field
        inputTextField.text = textAnalysis.analysisDescription()
    }
    
    // Clear input text field
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        inputTextField.text = ""
    }
}
