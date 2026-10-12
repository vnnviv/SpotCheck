//
// CameraView.swift
// spotCheckImaging
//
// Created by Student on 1/28/26.
//
import Foundation
import SwiftUI
import UIKit
struct CameraView: UIViewControllerRepresentable {
   @Binding var image: UIImage? // bind to the parent's view state
   @Environment (\.presentationMode) var presentationMode // dismiss the view if done
   func makeUIViewController(context: Context) -> some UIViewController {
     let picker = UIImagePickerController() //create the camera picker
     picker.delegate = context.coordinator //set the coordinate as delegate
     picker.sourceType = .camera //sets source type to camera
//     picker.allowsEditing = false
//
     return picker
   }
   func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
     //no updates needed
   }

    func makeCoordinator() -> Coordinator {
      Coordinator(self)
    }
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
      var parent: CameraView

      init(_ parent: CameraView) {
         self.parent = parent
      }

      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
info: [UIImagePickerController.InfoKey : Any]) {
         if let image = info[.originalImage] as? UIImage{
             parent.image = image
         }
         parent.presentationMode.wrappedValue.dismiss()
      }
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         parent.presentationMode.wrappedValue.dismiss()
      }
   }
}
