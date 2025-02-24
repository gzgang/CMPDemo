//
//  FusionViewController.swift
//  iosApp
//
//  Created by i71 on 2025/1/23.
//  Copyright © 2025 orgName. All rights reserved.
//
import UIKit
import shared

/**
 UIScrollView 滚动里面套 compose
 */
class FusionViewController: UIViewController {
    
    var dismissAction: (() ->Void)?
    

    override func viewDidAppear(_ animated: Bool) {
        let screenWidth = view.bounds.width
        NSLog("viewDidAppear get screen width = %f", screenWidth)

    }

    override func viewDidLoad() {
        let backButton = UIButton(type: .system)
        backButton.setTitle("back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false

        backButton.addTarget(
            self, action: #selector(backAction), for: .touchUpInside)

        self.view.addSubview(backButton)

        NSLayoutConstraint.activate([
            backButton.leadingAnchor
                .constraint(equalTo: self.view.leadingAnchor, constant: 12),
            backButton.topAnchor
                .constraint(equalTo: self.view.topAnchor, constant: 16),
        ])

        let screenWidth = view.bounds.width
        NSLog("viewDidLoad get screen width = %f", screenWidth)

        //scroll
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor
                .constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor
                .constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor
                .constraint(equalTo: backButton.bottomAnchor, constant: 16),
            scrollView.bottomAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        //container
        let scrollContainer = UIStackView()
        scrollContainer.axis = .vertical
        scrollContainer.spacing = 10
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(scrollContainer)

        NSLayoutConstraint.activate([
            scrollContainer.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor),
            scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContainer.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor),
            scrollContainer.widthAnchor
                .constraint(equalToConstant: view.bounds.width),
        ])

        //content
        let itemCount = 2

        for index in 0..<itemCount {
            let label = UILabel()
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.translatesAutoresizingMaskIntoConstraints = false

            label.text =
                "According to the Central Meteorological Observatory, a cold wave will hit a large area with rain and snow starting today (January 23), and the day after tomorrow will enter the strongest snowfall period, bringing significant cooling to most parts of the country from west to east. This year's first cold wave process is fierce, and the Central Meteorological Observatory issued a blue cold wave warning at 6 o'clock today, which is also the first cold wave warning of the year."

            scrollContainer.addArrangedSubview(label)

            label.widthAnchor
                .constraint(
                    equalTo: scrollContainer.widthAnchor
                ).isActive = true

            if index % 2 == 0 {
                label.backgroundColor = .gray
            }
        }

        //
        let composeVC = MainViewControllerKt.CardDemoViewController()
        self.addChild(composeVC)
        composeVC.didMove(toParent: self)

        let composeView: UIView = composeVC.view
        composeView.translatesAutoresizingMaskIntoConstraints = false
 
        //
        scrollContainer.addArrangedSubview(composeView)
        composeView.widthAnchor.constraint(equalTo: scrollContainer.widthAnchor).isActive = true
        //set fixed height
        composeView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        //
        for index in 0..<itemCount {
            let label = UILabel()
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.translatesAutoresizingMaskIntoConstraints = false

            label.text =
                "According to the Central Meteorological Observatory, a cold wave will hit a large area with rain and snow starting today (January 23), and the day after tomorrow will enter the strongest snowfall period, bringing significant cooling to most parts of the country from west to east. This year's first cold wave process is fierce, and the Central Meteorological Observatory issued a blue cold wave warning at 6 o'clock today, which is also the first cold wave warning of the year."


            scrollContainer.addArrangedSubview(label)

            label.widthAnchor
                .constraint(
                    equalTo: scrollContainer.widthAnchor
                ).isActive = true

            if index % 2 == 0 {
                label.backgroundColor = .gray
            }
        }
    }

    @objc func backAction() {
        print("点击返回 ")
        dismissAction?()
    }

}
