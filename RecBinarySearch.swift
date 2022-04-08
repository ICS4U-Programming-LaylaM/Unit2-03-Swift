//
//  RecBinarySearch.swift
//
//  Created by Layla Michel
//  Created on 2022-04-06
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  This program generates 250 random numbers in an array
// and allows the user to search the array for a number.

import Foundation

func binary(userArray: [Int], userNumber: Int, low: Int, high: Int) -> Int {
    // Get the middle index of the array
    let mid = low + ((high - low) / 2)

    if low > high {
        return -1
    }

    // Check if the userNumber is at the middle
    if userArray[mid] == userNumber {
        return mid
    // Check if the userNumber is lower than the number at the middle
    } else if userArray[mid] > userNumber {
        return binary(userArray: userArray, userNumber: userNumber, low: low, high: mid - 1)
    // Check if the userNumber is greater than the number at the middle
    } else {
        return binary(userArray: userArray, userNumber: userNumber, low: mid + 1, high: high)
    }
}

// Declare constants
let MAX = 999
let MIN = 0
let ARRAY_SIZE = 250

// Declare variables
var number = 0
var numberString: String
var searchNum: Int
var searchResult: Int
var randomNumberArray: [Int] = []

// Create array of random numbers
while number < ARRAY_SIZE {
    let rand = Int.random(in: MIN...MAX)
    randomNumberArray.append(rand)
    number += 1
}

// Sort the array from lowest to highest number
randomNumberArray.sort()
print(randomNumberArray)
print("\n")

while true {
    print("What number are you searching for in the "
        + "array (integer between 0 and 999): ", terminator: "")
    let numberString = readLine()

    // Convert from string to int
    // Return -23847125624345235 if it's not an int
    let searchNum = Int(numberString!) ?? -23847125624345235

    // Error message if the user does not input an integer
    if searchNum == -23847125624345235 {
        print("Please enter a valid number.\n")
    // Error message if the user inputs a number outside of the range
    } else if searchNum > MAX || searchNum < MIN {
        print("The number must be between \(MIN) and \(MAX) .\n")
    } else {
        // Call the binary function
        searchResult = binary(userArray: randomNumberArray, userNumber: searchNum,
            low: 0, high: randomNumberArray.count - 1)

        // Check if the function returned -1
        // Meaning that the number was not in the array
        if searchResult == -1 {
            print("\n\(searchNum) is not in the list.")
            break
        } else {
            print("\n\(searchNum) is on index: \(searchResult).")
            break
        }
    }
}
