import WidgetKit
import SwiftUI

struct NotesEntry: TimelineEntry {
    let date: Date
    let count: Int
    let latestTitle: String
    let latestPreview: String
    let latestDate: String
    let accentColor: Color

    static var placeholder: NotesEntry {
        NotesEntry(date: Date(), count: 3,
            latestTitle: "Réunion demain",
            latestPreview: "Préparer le compte rendu et les slides…",
            latestDate: "28/05/2025",
            accentColor: Color(hex: "#FFE082"))
    }
}

struct NotesProvider: TimelineProvider {
    private func readEntry() -> NotesEntry {
        let d = UserDefaults(suiteName: "group.com.example.notes")
        return NotesEntry(
            date: Date(),
            count:        d?.integer(forKey: "notes_count") ?? 0,
            latestTitle:  d?.string(forKey: "latest_title") ?? "",
            latestPreview: d?.string(forKey: "latest_preview") ?? "",
            latestDate:   d?.string(forKey: "latest_date") ?? "",
            accentColor:  Color(hex: d?.string(forKey: "latest_color") ?? "#FFE082")
        )
    }

    func placeholder(in context: Context) -> NotesEntry { .placeholder }
    func getSnapshot(in context: Context, completion: @escaping (NotesEntry) -> Void) {
        completion(context.isPreview ? .placeholder : readEntry())
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<NotesEntry>) -> Void) {
        let next = Calendar.current.date(byAdding: .minute, value: 30, to: Date())!
        completion(Timeline(entries: [readEntry()], policy: .after(next)))
    }
}

struct NotesWidgetView: View {
    let entry: NotesEntry
    @Environment(\.widgetFamily) var family

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 0.11, green: 0.11, blue: 0.12))

            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(entry.accentColor)
                    .frame(width: 4)
                    .padding(.vertical, 12)

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("📝 Bloc-Notes")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(entry.count)")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 7).padding(.vertical, 2)
                            .background(Color.white.opacity(0.2))
                            .clipShape(Capsule())
                    }

                    if entry.count == 0 {
                        Spacer()
                        Text("Aucune note")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                    } else {
                        Text(entry.latestTitle)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(1)

                        if family != .systemSmall {
                            Text(entry.latestPreview)
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.7))
                                .lineLimit(2)
                        }
                        Spacer(minLength: 0)
                        Text(entry.latestDate)
                            .font(.system(size: 10))
                            .foregroundColor(.white.opacity(0.45))
                    }
                }
                .padding(.leading, 10).padding(.trailing, 12).padding(.vertical, 12)
            }
        }
        .widgetURL(URL(string: "blocnotes://open"))
    }
}

@main
struct NotesWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "NotesWidget", provider: NotesProvider()) { entry in
            NotesWidgetView(entry: entry)
        }
        .configurationDisplayName("Bloc-Notes")
        .description("Affiche le compteur et la dernière note.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

extension Color {
    init(hex: String) {
        let h = hex.trimmingCharacters(in: .init(charactersIn: "#"))
        var rgb: UInt64 = 0
        Scanner(string: h).scanHexInt64(&rgb)
        self.init(
            red:   Double((rgb >> 16) & 0xFF) / 255,
            green: Double((rgb >> 8)  & 0xFF) / 255,
            blue:  Double( rgb        & 0xFF) / 255
        )
    }
}