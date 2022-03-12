//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Alex Golyshkov on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Public Properties
    let userProfile = UserProfile.getUserProfile()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting background gradient color
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemCyan.cgColor, UIColor.systemFill.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        usernameTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.returnKeyType = UIReturnKeyType.done
        
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userProfile = userProfile
            } else if let navigationVC = viewController as? UINavigationController {
                let personalDataVC = navigationVC.topViewController as? PersonalDataViewController
                personalDataVC?.userProfile = userProfile
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func loginButtonTapped() {
        if usernameTextField.text != userProfile.userLogin || passwordTextField.text != userProfile.userPassword {
            showAlert(
                title: "Invalid login or password!",
                message: "Please, enter correct login and password"
            )
        } else {
            performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
        }
    }
    
    @IBAction func helpButtonTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ooops!", message: "Your name is \"\(userProfile.userLogin)\"")
        : showAlert(title: "Ooops!", message: "Your password is \"\(userProfile.userPassword)\"")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alertMessage = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        alertMessage.addAction(okAction)
        present(alertMessage, animated: true)
    }
}

// MARK: - Keyboard
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField {
            loginButtonTapped()
        }
        return true
    }
}
