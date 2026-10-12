import SwiftUI
struct UserDetails: View {
   @State private var firstName = ""
   @State private var lastName = ""
   @State private var birthday = Date()
   @State private var gender = ""
   @State private var occupation = ""
   @State private var allergies = ""
   @State private var medications = ""
   @State private var vaccinations = ""

  var body: some View {
    NavigationView {
       List {
          Section(header: Text("Basic Information")) {
              HStack {
                Text("First Name")
                  .frame(width: 100, alignment: .leading)
                  .foregroundColor(.secondary)
                TextField("Enter first name", text: $firstName)
              }


             HStack {
               Text("Birthday")
                 .frame(width: 100, alignment: .leading)
                 .foregroundColor(.secondary)
               DatePicker("", selection: $birthday, displayedComponents: .date)
                 .labelsHidden()
             }

             HStack {
               Text("Gender")
                 .frame(width: 100, alignment: .leading)
                 .foregroundColor(.secondary)
               TextField("Enter gender", text: $gender)
             }

             HStack {
               Text("Occupation")
                 .frame(width: 100, alignment: .leading)
                 .foregroundColor(.secondary)
               TextField("Enter occupation", text: $occupation)
             }
         }

         Section(header: Text("Medical History")) {
           HStack(alignment: .top) {
              Text("Allergies")
                .frame(width: 100, alignment: .leading)
                .foregroundColor(.secondary)
              TextField("List any allergies", text: $allergies, axis: .vertical)
                .lineLimit(3...6)
           }

             HStack(alignment: .top) {
               Text("Medications")
                     .frame(width: 100, alignment: .leading)
                     .foregroundColor(.secondary)
                   TextField("Current medications", text: $medications, axis: .vertical)
                     .lineLimit(3...6)
               }

               HStack(alignment: .top) {
                 Text("Vaccinations")
                   .frame(width: 100, alignment: .leading)
                   .foregroundColor(.secondary)
                 TextField("Vaccination history", text: $vaccinations, axis: .vertical)
                   .lineLimit(3...6)
               }
            }
          }
          .navigationTitle("User Profile")
          .navigationBarTitleDisplayMode(.inline)
      }
  }
}
#Preview {
  UserDetails()
}
