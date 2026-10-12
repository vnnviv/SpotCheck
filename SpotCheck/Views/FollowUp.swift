//
// FollowUp.swift
// spotCheckImaging
//
// Created by Student on 2/2/26.
//
import SwiftUI
struct FollowUpQuestionsView: View {
   // State for tracking progress (0.0 to 1.0)
   @State private var progress: Double = 0.6

  // State for tracking selected answer
  @State private var selectedAnswer: AnswerOption? = nil

  enum AnswerOption {
    case yes, no, unsure
  }

  var body: some View {
    VStack(spacing: 0) {
       // Header Section
       VStack(alignment: .leading, spacing: 12) {
          // Back button
          Button(action: {
             // Handle back action
          }) {
             Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.gray)
          }
          .padding(.bottom, 8)

          // Title
          Text("Follow-up Questions")
             .font(.system(size: 32, weight: .bold))

          // Subtitle
          Text("This will be used to increase accuracy in identifying your condition")
             .font(.system(size: 16))
             .foregroundColor(.gray)
             .fixedSize(horizontal: false, vertical: true)

          // Progress Bar
          ProgressBar(progress: progress)
             .frame(height: 8)
             .padding(.top, 8)
}
.padding(.horizontal, 24)
.padding(.top, 20)

Spacer()

// Question Section
VStack(spacing: 20) {
   Text("Does the area feel itchy, stinging, or painful?")
     .font(.system(size: 24, weight: .semibold))
     .multilineTextAlignment(.center)
     .padding(.horizontal, 24)

    // Answer Buttons
    VStack(spacing: 16) {
       AnswerButton(
          text: "Yes",
          color: .green,
          isSelected: selectedAnswer == .yes
       ){
          selectedAnswer = .yes
       }

      AnswerButton(
         text: "No",
         color: Color(red: 1.0, green: 0.4, blue: 0.4),
         isSelected: selectedAnswer == .no
      ){
         selectedAnswer = .no
      }

      AnswerButton(
         text: "Unsure",
         color: .gray,
         isSelected: selectedAnswer == .unsure
      ){
         selectedAnswer = .unsure
      }
    }
    .padding(.horizontal, 24)
}

Spacer()

// Bottom Navigation Buttons
HStack(spacing: 16) {
          Button(action: {
             // Handle previous action
          }) {
             Text("Previous")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color(.systemGray6))
                .cornerRadius(28)
          }

          Button(action: {
             // Handle continue action
             // Update progress here if needed
             progress = min(progress + 0.2, 1.0)
          }) {
             Text("Continue")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.blue)
                .cornerRadius(28)
          }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
      }
      .background(Color.white)
  }
}
// Custom Progress Bar Component
struct ProgressBar: View {
   var progress: Double // 0.0 to 1.0

  var body: some View {
    GeometryReader { geometry in
       ZStack(alignment: .leading) {
         // Background
         RoundedRectangle(cornerRadius: 4)
            .fill(Color(.systemGray5))

          // Progress Fill
          RoundedRectangle(cornerRadius: 4)
             .fill(Color.blue)
            .frame(width: geometry.size.width * CGFloat(progress))
            .animation(.easeInOut(duration: 0.3), value: progress)
        }
    }
   }
}
// Custom Answer Button Component
struct AnswerButton: View {
   let text: String
   let color: Color
   let isSelected: Bool
   let action: () -> Void

  var body: some View {
    Button(action: action) {
       Text(text)
         .font(.system(size: 18, weight: .medium))
         .foregroundColor(isSelected ? color : color.opacity(0.6))
         .frame(maxWidth: .infinity)
         .frame(height: 60)
         .background(
            RoundedRectangle(cornerRadius: 12)
               .stroke(color, lineWidth: isSelected ? 3 : 1.5)
               .background(
                  RoundedRectangle(cornerRadius: 12)
                     .fill(isSelected ? color.opacity(0.05) : Color.clear)
               )
         )
    }
  }
}
// Preview
struct FollowUpQuestionsView_Previews: PreviewProvider {
   static var previews: some View {
      FollowUpQuestionsView()
   }
}
