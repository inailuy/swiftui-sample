//  Created by Yuliani Noriega on 10/10/20.
//

import Foundation
/*
extension String {
    var martianTranslation: String {
        var translation = ""
        _ = self.components(separatedBy: "\n\n").map { paragraph in
            _ = paragraph.components(separatedBy: " ").map { word in
                // bypass if word is a number
                if word.isDigit {
                    translation += word
                } else {
                    // start translation
                    var tmp = word
                    
                    // check if word does not start or end with apostrophe, but contains apostrophe
                    if word.first != "\'" && word.last != "'" {
                        tmp = tmp.filter { $0 != "\'" }
                    }
                    
                    //translate word to boinga if needed
                    tmp = tmp.regexBoingaTranslation()
                    
                    //check for capilization and add to martian text
                    translation += "\(word.isCapitalized ? tmp.capitalized : tmp)"
                }
                
                // if word is the last one in paragraph, dont add extra space
                if word != paragraph.components(separatedBy: " ").last {
                    translation += " "
                }
            }
            
            // if paragraph is the last one in full text, dont add extra two new lines
            if paragraph != self.components(separatedBy: "\n\n").last {
                translation += "\n\n"
            }
        }
        return translation
    }
    
    func regexBoingaTranslation() -> String {
        let pattern = "\\w{4,}" //words with 4 or more characters
        var value = ""
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: count)
            value = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: boinga)
        } catch let error {
            print("error with regexBoingaTranslation - \(error.localizedDescription)")
        }
        
        return value
    }
}
*/
