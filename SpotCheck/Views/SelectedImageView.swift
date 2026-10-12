//
// SelectedImageView.swift
// SpotCheck
//
// Created by Student on 2/2/26.
//
import SwiftUI
struct SelectedImageView: View {
   let image: UIImage
   @Environment(\.dismiss) var dismiss
   @State private var isAnalyzing = false

  private var backgroundGradient: LinearGradient {
    LinearGradient(
       gradient: Gradient(colors: [
           Color(red: 0.95, green: 1.00, blue: 1.00),
           Color(red: 0.95, green: 0.94, blue: 0.98)
       ]),
       startPoint: .topLeading,
       endPoint: .bottomTrailing
    )
  }

  var body: some View {
    ZStack {
       backgroundGradient
         .ignoresSafeArea()

        VStack(spacing: 0) {
          // Custom Header
          header

            ScrollView {
              VStack(spacing: 24) {
                 // Selected Image Display
                 imageSection

                  // Analysis Button
                  analyzeButton

                  Spacer(minLength: 50)
                }
                .padding(.top, 20)
            }
        }
    }
    .navigationBarBackButtonHidden(true)
}

// Header with back button
private var header: some View {
   HStack {
     Button(action: {
        dismiss()
     }) {
        HStack(spacing: 8) {
           Image(systemName: "chevron.left")
             .font(.system(size: 18, weight: .semibold))

            Text("Back")
              .font(.system(size: 18, weight: .medium))
          }
          .foregroundColor(.black)
      }

      Spacer()

      Text("Review Image")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.black)

      Spacer()

      // Invisible spacer for centering
      HStack(spacing: 8) {
          Image(systemName: "chevron.left")
            .font(.system(size: 18, weight: .semibold))
          Text("Back")
            .font(.system(size: 18, weight: .medium))
      }
      .opacity(0)
    }
    .padding(.horizontal, 24)
    .padding(.top, 16)
    .padding(.bottom, 12)
}

// Image section
private var imageSection: some View {
    VStack(spacing: 16) {
      Text("Selected Image")
        .font(.system(size: 24, weight: .bold))
         .foregroundColor(.black)

      Image(uiImage: image)
        .resizable()
        .scaledToFit()
        .frame(maxHeight: 400)
        .cornerRadius(20)
        // REMOVED SHADOW
    }
    .padding(.horizontal, 24)
}

// Analyze button
private var analyzeButton: some View {
   Button(action: {
     isAnalyzing = true
     // TODO: Add your ML model analysis here
     print("Analyzing image...")

       // Simulate analysis delay
       DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          isAnalyzing = false
          // Navigate to results or show results
       }
    }) {
       HStack(spacing: 12) {
          if isAnalyzing {
              ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
          } else {
              Image(systemName: "wand.and.stars")
                .font(.system(size: 20))
          }

         Text(isAnalyzing ? "Analyzing..." : "Analyze Skin")
           .font(.system(size: 18, weight: .semibold))
      }
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .padding(.vertical, 16)
      .background(
         LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.20, green: 0.50, blue: 0.95),
                Color(red: 0.15, green: 0.55, blue: 1.0)
            ]),
             startPoint: .topLeading,
             endPoint: .bottomTrailing
           )
        )
        .cornerRadius(16)
        // REMOVED SHADOW
      }
      .disabled(isAnalyzing)
      .padding(.horizontal, 24)
  }
}
#Preview {
  NavigationStack {
    SelectedImageView(image: UIImage(systemName: "photo.fill")!)
  }
}
