//
//  ViewController.swift
//  UIKit-AccountCenter-Testing
//
//  Created by Bekzhan Talgat on 05.07.2023.
//

import UIKit


class ViewController: UIViewController {
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in"
        label.textColor = .white
        label.font = .systemFont(ofSize: 28)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var usernameTF: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .secondarySystemBackground
        
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.label.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var passwordTF: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .secondarySystemBackground
        
        field.layer.cornerRadius = 8
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.label.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var continueBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(handleContinueButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        usernameTF.text = ""
        passwordTF.text = ""
    }

//    MARK: - @Objc
    @objc func handleContinueButton() {
        guard
            let username = usernameTF.text,
            let password = passwordTF.text,
            username == "Beka",
            password == "Password"
        else {
            let alert = UIAlertController(
                title: "Invalid Login",
                message: "Your login credentials were incorrect. Try again",
                preferredStyle: .alert
            )
            
            alert.addAction(.init(title: "Dismiss", style: .cancel))
            present(alert, animated: true)
            
            return
        }
        
        let vc = AccountVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

//    MARK: - private func
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(loginLabel)
        view.addSubview(usernameTF)
        view.addSubview(passwordTF)
        
        view.addSubview(continueBtn)
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usernameTF.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 64),
            usernameTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            usernameTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            usernameTF.heightAnchor.constraint(equalToConstant: 64),
            
            passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 8),
            passwordTF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            passwordTF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            passwordTF.heightAnchor.constraint(equalToConstant: 64),
            
            continueBtn.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 16),
            continueBtn.widthAnchor.constraint(equalToConstant: 240),
            continueBtn.heightAnchor.constraint(equalToConstant: 56),
            continueBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}


final class AccountVC: UIViewController {
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Beka"
        label.textColor = .white
        label.font = .systemFont(ofSize: 44)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dismissBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dimiss", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .black
        button.layer.cornerRadius = 18
        
        button.addTarget(self, action: #selector(handleDismissButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
//    MARK: - @Objc
    @objc func handleDismissButton() {
        dismiss(animated: true)
    }
    
//    MARK: - private func
    private func setupViews() {
        view.backgroundColor = .systemGreen
        
        view.addSubview(welcomeLabel)
        view.addSubview(dismissBtn)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -16),
            
            dismissBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            dismissBtn.widthAnchor.constraint(equalToConstant: 140),
            dismissBtn.heightAnchor.constraint(equalToConstant: 36),
            dismissBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
}
