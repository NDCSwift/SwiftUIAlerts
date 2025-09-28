
import SwiftUI

/// Demo 3: When to use ConfirmationDialog instead of Alert (lists of options).
struct ConfirmationDialogDemo: View {
    @State private var showDialog = false
    @State private var selection: String? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("Use a ConfirmationDialog for multiple options or non-critical choices.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button("Show Options") { showDialog = true }
                .buttonStyle(.bordered)

            if let selection {
                Text("You chose: \(selection)")
                    .font(.headline)
            }
        }
        .padding()
        .confirmationDialog("Choose an option",
                            isPresented: $showDialog) {
            Button("Option A") { selection = "Option A" }
            Button("Option B") { selection = "Option B" }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("ConfirmationDialog appears from the bottom and suits lists of actions.")
        }
    }
}

#Preview {
    NavigationStack { ConfirmationDialogDemo() }
}
