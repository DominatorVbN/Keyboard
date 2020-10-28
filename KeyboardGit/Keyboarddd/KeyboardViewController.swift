//
//  KeyboardViewController.swift
//  Keyboarddd
//
//  Created by Federica Benacquista on 28/10/2020.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    var letters : lettersKeyboard = {
          
            let m = lettersKeyboard(frame: .zero)
                m.translatesAutoresizingMaskIntoConstraints = false

                m.backgroundColor = .clear
                return m
            
    }()
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(letters)
          
               letters.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
               letters.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
               letters.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
               letters.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        let colorScheme:  ColorScheme
        let proxy = self.textDocumentProxy
                if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
                    colorScheme = .dark
                } else {
                    colorScheme = .light
                }
                letters.setColorScheme(colorScheme)
    }

}
