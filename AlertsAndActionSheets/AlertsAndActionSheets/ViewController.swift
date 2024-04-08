//
//  ViewController.swift
//  AlertsAndActionSheets
//
//  Created by Vemireddy Vijayasimha Reddy on 04/04/24.
//

import UIKit

class ViewController: UIViewController {

    var customButton: UIButton = {
       let button = UIButton()
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        return button
        
    }()
    
    var customActionSheetButton: UIButton = {
       
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        let image = UIImage(named: "Skyview")
        button.setBackgroundImage(image, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    
    var customLabel: UILabel = {
       
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22)
        label.textColor = UIColor.red
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 10
       
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(customButton)
        customButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        customButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        customButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        
        self.view.addSubview(customActionSheetButton)
        customActionSheetButton.addTarget(self, action: #selector(actionSheetButton), for: .touchUpInside)
        customActionSheetButton.setTitle("ActionSheet", for: .normal)
        customActionSheetButton.layer.cornerRadius = 10
        customActionSheetButton.layer.borderWidth = 2
        customActionSheetButton.translatesAutoresizingMaskIntoConstraints = false
        customActionSheetButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        customActionSheetButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        customActionSheetButton.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: 20).isActive = true
        customActionSheetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        self.view.addSubview(customLabel)
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.topAnchor.constraint(equalTo: customActionSheetButton.bottomAnchor, constant: 20).isActive = true
        customLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        customLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        customLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
    }
    
    @objc func buttonAction() {
        print("Button action")
        alertsSetup()
    }
    
    @objc func actionSheetButton() {
        setupActionSheet()
        
    }
    
    func alertsSetup() {
        
        let alerts = UIAlertController(title: "Alert Title", message: "AlertMessage", preferredStyle: .alert)
        
        
        alerts.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alerts.addAction(UIAlertAction(title: "Destructive", style: .destructive))
        alerts.addTextField { textfield in
            textfield.font = .systemFont(ofSize: 20)
            textfield.placeholder = "Username"
        }
        
        alerts.addTextField { textfield in
            textfield.font = .systemFont(ofSize: 23)
            textfield.placeholder = "Password"
            textfield.isSecureTextEntry = true
        }
        alerts.addAction(UIAlertAction(title: "Login", style: .default, handler: { [weak alerts] (_) in
            print("Username: \(alerts?.textFields?[0].text)")
            print("password: \(alerts?.textFields?[1].text)")
            self.customLabel.text = alerts?.textFields?[0].text
        }))
        self.present(alerts, animated: false)
        
    }
    
    func setupActionSheet() {
        
        let actionSheet = UIAlertController(title: "Actio Sheet", message: "Some message", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "OK", style: .default))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { some in
            
        }))
        self.present(actionSheet, animated: true)
    }
}

