
import SwiftUI

// MARK: - Reusable Patterns

/// A small helper for a one-liner delete confirmation.
extension View {
    func confirmDelete(isPresented: Binding<Bool>,
                       title: String = "Delete Item",
                       message: String = "This action cannot be undone.",
                       onDelete: @escaping () -> Void) -> some View {
        self.alert(title, isPresented: isPresented) {
            Button("Delete", role: .destructive, action: onDelete)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text(message)
        }
    }
}

/// A tiny model + modifier pattern for reusable "error" alerts.
struct ErrorAlert: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct ErrorAlertPresenter: ViewModifier {
    @Binding var error: ErrorAlert?

    func body(content: Content) -> some View {
        content.alert(error?.title ?? "Error", isPresented: Binding(
            get: { error != nil },
            set: { if !$0 { error = nil } }
        )) {
            Button("OK", role: .cancel) { error = nil }
        } message: {
            Text(error?.message ?? "An unexpected error occurred.")
        }
    }
}

extension View {
    func errorAlert(_ error: Binding<ErrorAlert?>) -> some View {
        self.modifier(ErrorAlertPresenter(error: error))
    }
}

// MARK: - Demo screen to show the helpers

struct ReusableHelperExamples: View {
    @State private var showDelete = false
    @State private var error: ErrorAlert? = nil
    @State private var deletedCount = 0

    var body: some View {
        Form {
            Section("Delete Confirmation Helper") {
                Button(role: .destructive) {
                    showDelete = true
                } label: {
                    Label("Delete Item", systemImage: "trash")
                }
                Text("Deleted count: \(deletedCount)")
                    .foregroundStyle(.secondary)
            }

            Section("Error Alert Helper") {
                Button("Trigger Error") {
                    error = ErrorAlert(title: "Network Error",
                                       message: "We couldn't reach the server. Please try again.")
                }
            }
        }
        .navigationTitle("Helpers")
        .confirmDelete(isPresented: $showDelete, onDelete: {
            deletedCount += 1
        })
        .errorAlert($error)
        
    }
}

#Preview {
    NavigationStack { ReusableHelperExamples() }
}
