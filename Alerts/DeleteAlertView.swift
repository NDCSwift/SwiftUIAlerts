
import SwiftUI

/// Demo 2: Critical action with .destructive + .cancel roles, using modern .alert API.
struct DeleteAlertView: View {
    @State private var showAlert = false
    @State private var didDelete = false

    var body: some View {
        VStack(spacing: 16) {
            Text("A destructive action should use an Alert and a .destructive role.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(role: .destructive) {
                showAlert = true
            } label: {
                Label("Delete Account", systemImage: "trash")
            }
            .buttonStyle(.borderedProminent)

            if didDelete {
                Text("Deleted.")
                    .foregroundStyle(.red)
            }
        }
        .padding()
        .alert("Delete Account?",
               isPresented: $showAlert) {
            Button("Delete", role: .destructive) {
                didDelete = true
                print("Account deleted.")
            }
            Button("Cancel", role: .cancel) {
                print("Cancelled.")
            }
        } message: {
            Text("This action cannot be undone.")
        }
    }
}

#Preview {
    NavigationStack { DeleteAlertView() }
}
