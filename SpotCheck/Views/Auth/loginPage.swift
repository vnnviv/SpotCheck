//
// loginPage.swift
// spotCheckImaging
//
// Created by Student on 2/3/26.
//
import SwiftUI
struct loginPage: View {
   @State private var emailAddress: String = ""
   @State private var password: String = ""
   @State private var showDisclaimer = false

     var body: some View {
       VStack { // Parent container starts here

          Image("logoText")
            .resizable()
            .scaledToFit()
            .frame(width: 160, height: 60)
//            .padding(.top)
            .padding(.bottom,120)

          VStack(alignment: .leading) {
             Text("Sign In")
               .bold()
               .font(.largeTitle)
               .padding(.horizontal)
               .padding(.bottom, 8)
               .padding(.top, 50)
               .foregroundColor(.black)
               .padding(.horizontal, 3)
          }
          .frame(maxWidth: .infinity, alignment: .leading)


       VStack(alignment: .leading) {
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
         Button("Sign In") { }
           .padding()
           .frame(maxWidth: 370)
           .background(Color.brandBlue)
           .foregroundColor(.white)
           .cornerRadius(50)
           .padding()
           .bold()
       }
       Group {
         Text("Don't have an account? ") +
         Text("Sign Up")
           .bold()
           .foregroundColor(.brandBlue)
           .underline()
       }

       Spacer() // This pushes everything above it to the top

    } // Parent container ends here
  }
}
#Preview {
  loginPage()
}
extension Color {

}
