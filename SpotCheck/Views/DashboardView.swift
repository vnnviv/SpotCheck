import SwiftUI
import PhotosUI
struct DashboardView: View {
   @State private var selectedTab = 0
   @State private var selectedItem: PhotosPickerItem?
   @State private var selectedImage: UIImage?
   @State private var showingCamera = false
   @State private var showingImageOptions = false
   @State private var showingPhotoPicker = false
   @State private var navigateToSelectedImage = false
   let userName: String = "Vivian"

  // Extract gradient as computed property
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
    NavigationStack {
       ZStack {
         backgroundGradient
            .ignoresSafeArea()

         VStack(spacing: 0) {
           ScrollView {
             mainContent
           }

            CustomTabBar(selectedTab: $selectedTab)
          }
       }
       .navigationDestination(isPresented: $navigateToSelectedImage) {
          if let image = selectedImage {
              SelectedImageView(image: image) // FIXED: Changed to SelectedImageView
          }
       }
       .fullScreenCover(isPresented: $showingCamera) {
          CameraView(image: $selectedImage)
              .ignoresSafeArea()
         }
         .photosPicker(
             isPresented: $showingPhotoPicker,
             selection: $selectedItem,
             matching: .images,
             photoLibrary: .shared()
         )
         .onChange(of: selectedItem) { newValue in
             handleImageSelection(newValue)
         }
         .onChange(of: selectedImage) { newImage in
             if newImage != nil {
                navigateToSelectedImage = true
             }
         }
         .confirmationDialog("Choose Photo Source", isPresented: $showingImageOptions,
titleVisibility: .visible) {
             Button("Take Photo") {
                showingCamera = true
             }

              Button("Select from Library") {
                showingPhotoPicker = true
              }

              Button("Cancel", role: .cancel) { }
          }
      }
  }

  // Extract main content
  private var mainContent: some View {
     VStack(alignment: .leading, spacing: 24) {
        decorativeLine
        headerSection
        checkupButton
        recentIdentificationsSection
        Spacer(minLength: 100)
     }
  }

  // Decorative line
  private var decorativeLine: some View {
     HStack(spacing: 8) {
       Rectangle()
         .fill(Color.black)
          .frame(height: 2)

      Image(systemName: "sparkle")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.black)
    }
    .padding(.horizontal, 24)
    .padding(.top, 15)
}

// Header section
private var headerSection: some View {
   VStack(alignment: .leading, spacing: 4) {
     HStack {
       Text("Hello, \(userName)!")
          .font(.system(size: 32, weight: .bold))
          .foregroundColor(.black)

          Spacer()
      }

      Text("Welcome to Your Dashboard!")
        .font(.system(size: 18, weight: .regular))
        .foregroundColor(.black.opacity(0.7))
    }
    .padding(.horizontal, 24)
}

// Checkup button
private var checkupButton: some View {
   Button(action: {
      showingImageOptions = true
   }) {
      VStack(spacing: 16) {
        Text("Start Checkup")
          .font(.system(size: 24, weight: .semibold))
          .foregroundColor(.white)

          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .stroke(Color.white, lineWidth: 3)
              .frame(width: 60, height: 60)

            Image(systemName: "camera.fill")
              .font(.system(size: 28))
              .foregroundColor(.white)
           }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(checkupButtonGradient)
        .cornerRadius(24)
    }
    .padding(.horizontal, 24)
}

private var checkupButtonGradient: LinearGradient {
  LinearGradient(
     gradient: Gradient(colors: [
         Color(red: 0.20, green: 0.50, blue: 0.95),
         Color(red: 0.15, green: 0.55, blue: 1.0)
     ]),
     startPoint: .topLeading,
     endPoint: .bottomTrailing
  )
}

// Recent identifications section
private var recentIdentificationsSection: some View {
   VStack(alignment: .leading, spacing: 16) {
     Text("Recent Identifications")
       .font(.system(size: 24, weight: .bold))
       .foregroundColor(.black)
       .padding(.horizontal, 24)

        VStack(spacing: 16) {
          IdentificationCard(
            date: "April 5, 2026",
            condition: "Acne",
            description: "Bumpy texture or redness caused by clogged pores and excess oil."
          )

          IdentificationCard(
            date: "March 22, 2026",
            condition: "Eczema",
            description: "Dry, itchy, or inflamed patches caused by a sensitive skin barrier."
          )
        }
        .padding(.horizontal, 24)
    }
}
  // Helper function for image selection
  private func handleImageSelection(_ newValue: PhotosPickerItem?) {
     if let newItem = newValue {
         Task {
            if let data = try? await newItem.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
                selectedImage = image
            }
         }
     }
  }
}
struct IdentificationCard: View {
   let date: String
   let condition: String
   let description: String

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
       dateHeader

        Text(condition)
          .font(.system(size: 22, weight: .bold))
          .foregroundColor(.black)

        Text(description)
          .font(.system(size: 15, weight: .regular))
          .foregroundColor(.black.opacity(0.7))
          .lineSpacing(4)
          .fixedSize(horizontal: false, vertical: true)

         treatmentButton
      }
      .padding(20)
      .background(Color.white)
      .cornerRadius(20)
  }

  private var dateHeader: some View {
    HStack(spacing: 8) {
       Image(systemName: "calendar")
         .font(.system(size: 14))
         .foregroundColor(.gray)

        Text(date)
          .font(.system(size: 14, weight: .medium))
            .foregroundColor(.gray)
      }
  }

  private var treatmentButton: some View {
    Button(action: {
       // Navigate to treatment
    }) {
       Text("Suggested Treatment")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 12)
          .background(Color(red: 0.2, green: 0.5, blue: 1.0))
          .cornerRadius(12)
    }
  }
}
struct CustomTabBar: View {
   @Binding var selectedTab: Int

  var body: some View {
    HStack {
       TabBarItem(icon: "house.fill", title: "Home", isSelected: selectedTab == 0) {
         selectedTab = 0
       }

          TabBarItem(icon: "chart.bar.fill", title: "Insights", isSelected: selectedTab == 1) {
            selectedTab = 1
          }

          TabBarItem(icon: "person.fill", title: "Profile", isSelected: selectedTab == 2) {
            selectedTab = 2
          }

          TabBarItem(icon: "gearshape.fill", title: "Settings", isSelected: selectedTab == 3) {
            selectedTab = 3
          }
      }
      .padding(.horizontal, 20)
      .padding(.top, 12)
      .padding(.bottom, 20)
      .background(
        Color.white
           .ignoresSafeArea(edges: .bottom)
      )
   }
}
struct TabBarItem: View {
   let icon: String
   let title: String
   let isSelected: Bool
   let action: () -> Void

  private var itemColor: Color {
    isSelected ? Color(red: 0.2, green: 0.5, blue: 1.0) : Color.gray
  }

  var body: some View {
    Button(action: action) {
       VStack(spacing: 4) {
         Image(systemName: icon)
            .font(.system(size: 24))
            .foregroundColor(itemColor)

          Text(title)
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(itemColor)
        }
        .frame(maxWidth: .infinity)
    }
   }
}
struct DashboardView_Previews: PreviewProvider {
   static var previews: some View {
     DashboardView()
   }
}
