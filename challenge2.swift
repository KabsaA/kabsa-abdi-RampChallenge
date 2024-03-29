/*
 Hello! Thank you for taking the time to complete our
 coding challenge. There are 3 challenges, each on a
 separate page. The clue derived from each page will
 provide instructions for the next challenge.

 We recommend turning "Editor > Show Rendered Markup"
 on for a classier experience.

 When you are done, please rename this playground to
 "first-last Ramp Challenge.playground" and submit it to
 ios-submissions@ramp.com.

 Good Luck!

 - The Ramp Mobile Team

 */

// = = = = = = = = = = = = = = = = = = = = = = = =

//: [Challenge 1](@previous)
//: #### Challenge 2
//: Get the prompt from Challenge 1 and paste it below.
//: Solve the challenge to get the prompt for Challenge 3.

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let prompt = """
Solve challenge 1 to get the prompt and paste it here.
"""

"""
Great job!

Next we've hosted a JSON file at at this url: https://api.jsonbin.io/v3/b/646bed328e4aa6225ea22a79. Your job is to write a script to
download the contents of the URL (hint: The X-ACCESS-KEY is $2b$10$Ke1iwieFO7/7qsSKU.GYU.oYXZMW1EeHrwd4xx9ylboJik5mstZk6)
sort the data by each elements 'bar' key
filter out elements where 'baz' is not divisible by 3
concatenate each elements 'foo' value

Do each of these steps to reveal the instructions for the final part. Remember to show your work!
"""

// Show your work here! When you are done move on to Challenge 3



let url = URL(string: "https://api.jsonbin.io/v3/b/646bed328e4aa6225ea22a79")!
let accessKey = " $2b$10$Ke1iwieFO7/7qsSKU.GYU.oYXZMW1EeHrwd4xx9ylboJik5mstZk6"

// creating the request
var request = URLRequest(url: url)
request.setValue(accessKey, forHTTPHeaderField: "X-Access-Key")

let (data, _, error) = URLSession.shared.synchronousDataTask(with: request)

// adding error handling functionality
if let error = error {
    print("Error: \(error)")
} else if let data = data {
    // reading data from json
    do {
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let jsonData = json["record"] as? [String: Any],
           let dataArray = jsonData["data"] as? [[String: Any]] {

            // sort by 'bar' key
            let sortedData = dataArray.sorted { first, second in
                if let firstBar = first["bar"] as? Int,
                   let secondBar = second["bar"] as? Int {
                    return firstBar < secondBar
                }
                return false
            }

           //divide by 3 from baz
            let filteredData = sortedData.filter { element in
                if let bazValue = element["baz"] as? Int {
                    return bazValue % 3 == 0
                }
                return false
            }

          // add letters together
            let concatenatedFoo = filteredData.map { element in
                if let fooValue = element["foo"] as? String {
                    return fooValue
                }
                return ""
            }.reduce("", +)

           
            print("Concatenated Foo Values: \(concatenatedFoo)")
        }
    } catch {
        print("Error parsing JSON: \(error)")
    }
}

extension URLSession {
    func synchronousDataTask(with request: URLRequest) -> (Data?, URLResponse?, Error?) {
        var result: (Data?, URLResponse?, Error?)

        let semaphore = DispatchSemaphore(value: 0)

        dataTask(with: request) {
            result = ($0, $1, $2)
            semaphore.signal()
        }.resume()

        semaphore.wait()

        return result
    }
}

// challenge 2 answer
"""
Nice Work! For the final challenge, update ContentView.body to display a smiley face using only native SwiftUI views (no Sf Symbols or emojis). Be creative and have fun! Don't forget to submit a screenshot of your view with the completed playground.
"""


