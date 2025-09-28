
import SwiftUI

/// Demo 1: Small, single-button alert using @State to toggle presentation.
struct BasicAlertView: View {
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Tap the button to present a simple alert.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button("Show Alert") { showAlert = true }
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert("Hello SwiftUI!",
               isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

#Preview {
    NavigationStack { BasicAlertView() }
}
