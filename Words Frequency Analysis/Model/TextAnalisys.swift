//
//  TextAnalisys.swift
//  Words Frequency Analysis
//
//  Created by Yevhenii Vuksta on 30.11.2021.
//

import Foundation

// Extension to String to get separate words from string as array
extension String {
    func words() -> [String] {
        var words = [String]()
        enumerateSubstrings(in: startIndex..., options: .byWords) { substring, _, _, _ in
            words.append(substring!)
        }
        return words
    }
}

// Structure to analyze text
struct TextAnalysis {
    // Empty string for text input
    var inputText: String = ""
    
    // Dictionary to store frequency
    var words: [String: Int] = [:]
    
    // Words counter for later calculations
    var totalWords: Int = 0
    
    // Function to get input
    mutating func getInput(input: String) {
        inputText = input
    }
    
    // Func to analyze input text
    mutating func analyze() {
        // Clear dictionary
        words = [:]
        
        // Create array of words from input
        let analyzeArray = inputText.words()
        
        // Set total words to size of words array
        totalWords = analyzeArray.count
        
        /*
        Go over every word in array and check if it is in dictionary
        if it is - add 1 to value to count words usage
        if it is not - add it to dictionary with value 1
        */
        for word in analyzeArray {
            if words.keys.contains(word.lowercased()){
                words[word.lowercased()]! += 1
            } else {
                words[word.lowercased()] = 1
            }
        }
    }
    
    // Generate string with analysis result
    func analysisDescription() -> String {
        // Start with analysis word
        var outputText = "Analysis: \n"
        
        // Go over all elements of dictionary and add them to output string
        for (key, value) in words {
           outputText += "\(key) : \(value) or \((Float(value) / Float(totalWords)) * 100)%\n"
        }
        
        // Return generated string
        return outputText
    }
}
