import SwiftUI
struct Comment: Identifiable {
   let id = UUID()
   let username: String
   let comment: String
   let time: String
   let likes: Int
   var isLiked: Bool = false
}
struct commentsPage: View {
   @State private var comments = [
      Comment(username: "Sarah Kim", comment: "After struggling with acne for years, I finally found a routine that works! Less is more", time: "2h ago", likes: 14),
      Comment(username: "Emily Lee", comment: "Cutting out dairy helped my skin so much! Anyone else experience this?", time: "5h ago", likes: 8),
      Comment(username: "Henry Zhou", comment: "Just started using benzoyl peroxide. When will I see results? 🤔", time: "1d ago", likes: 7),
      Comment(username: "Alex Castro", comment: "Change your pillowcases every few days. Game changer!", time: "2d ago", likes: 10),
      Comment(username: "Jessica Davis", comment: "Accutane was tough but worth it. Clear skin for the first time in 10 years!", time: "3d ago", likes: 2)
   ]

  var body: some View {
    NavigationView {
       List {
          ForEach($comments) { $comment in
              VStack(alignment: .leading, spacing: 8) {
                HStack {
                  Image(systemName: "person.circle.fill")
                    .font(.title2)
                  Text(comment.username)
                    .font(.headline)
                  Text(comment.time)
                    .font(.caption)
                    .foregroundColor(.gray)
                  Spacer()
                }

               Text(comment.comment)
                 .font(.body)

               HStack {
                 Button(action: {
                    comment.isLiked.toggle()
                 }) {
                    HStack {
                      Image(systemName: comment.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(comment.isLiked ? .red : .gray)
                      Text("\(comment.likes + (comment.isLiked ? 1 : 0))")
                    }
                 }

                 Button(action: {}) {
                   HStack {
                      Image(systemName: "bubble.right")
                      Text("Reply")
                     }
                   }
                   .padding(.leading, 20)
                 }
                 .font(.subheadline)
                 .foregroundColor(.gray)
              }
              .padding(.vertical, 5)
              }
          }
          .listStyle(.plain)
          .navigationTitle("Community Comments")
          .navigationBarTitleDisplayMode(.inline)
      }
  }
}
#Preview {
  commentsPage()
}
