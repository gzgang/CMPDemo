//
//  ComposeView.swift
//  iosApp
//
//  Created by i71 on 2025/2/24.
//  Copyright © 2025 orgName. All rights reserved.
//
import UIKit
import SwiftUI
import shared

struct ComposeView: UIViewControllerRepresentable {
   @Environment(\.presentationMode) var presentationMode
   
   func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
       
   }
   
   func makeUIViewController(context: Context) -> some UIViewController {
       FusionViewController()
   }
}
