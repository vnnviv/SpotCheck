//
// registrationPage.swift
// spotCheckImaging
//
// Created by Student on 2/3/26.
//
import SwiftUI
struct registrationPage: View {
   @State private var fullName: String = ""
   @Satate private var emailAddress: String = ""
   @State private var password: String = ""
   @State private var showDisclaimer = false

     var body: some View {
       VStack { // Parent container starts here

          Image("logoText")
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 60)
//            .padding(.top)
            .padding(.bottom,50)

          VStack(alignment: .leading) {
             Text("Sign Up")
               .bold()
               .font(.largeTitle)
               .padding(.horizontal)
               .padding(.bottom, 8)
               .padding(.top, 50)
               .foregroundColor(.black)
               .padding(.horizontal, 3)
          }
          .frame(maxWidth: .infinity, alignment: .leading)

          Group {
             Text("Already have an account? ") +
             Text("Sign in")
               .bold()
               .foregroundColor(.brandBlue)
               .underline()
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal,20)
          .padding(.bottom, 20)
          .foregroundColor(.black.opacity(0.6))
       .bold()

       VStack(alignment: .leading) {
          TextField("Full name", text: $fullName)
             .padding(10)
             .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.5),
lineWidth: 2))
             .padding(.horizontal, 17)
             .padding(.vertical, 10)

          TextField("Email address", text: $emailAddress)
             .padding(10)
             .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.5),
lineWidth: 2))
             .padding(.horizontal, 17)
             .padding(.vertical, 10)

          SecureField("Password", text: $password)
             .padding(10)
             .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.5),
lineWidth: 2))
             .padding(.horizontal, 17)
             .padding(.vertical, 10)
       }

       VStack {
         Button("Register") { }
           .padding()
           .frame(maxWidth: 370)
           .background(Color.brandBlue)
           .foregroundColor(.white)
           .cornerRadius(50)
           .padding()
           .bold()

           Group {
             Text("By selecting register, I agree to SpotCheck's ") +
             Text("Medical Terms.")
                .bold()
                .foregroundColor(.brandBlue)
                .underline()
           }
           .onTapGesture { showDisclaimer = true }
           .padding(.horizontal)
       }
       Spacer() // This pushes everything above it to the top

     } // Parent container ends here
     .alert("Medical Disclaimer", isPresented: $showDisclaimer) {
         Button("I Understand", role: .cancel) { }
     } message: {
         Text("SpotCheck is for educational use only and is not a medical diagnosis. Always consult a doctor for health concerns.")
     }
  }
}
#Preview {
  registrationPage()
}
extension Color {
  static let brandBlue = Color(red: 13/255, green: 94/255, blue: 251/255)
}
