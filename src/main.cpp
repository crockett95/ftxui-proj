#include <memory>  // for allocator, make_shared, __shared_ptr_access
#include <utility> // for move
#include <vector>  // for vector

#include "ftxui/component/captured_mouse.hpp" // for ftxui
#include "ftxui/component/component.hpp" // for Collapsible, Renderer, Vertical
#include "ftxui/component/component_base.hpp" // for ComponentBase
#include "ftxui/component/screen_interactive.hpp" // for Component, ScreenInteractive
#include "ftxui/dom/elements.hpp"                 // for text, hbox, Element

// Take a list of component, display them vertically, one column shifted to the
// right.
ftxui::Component Inner(std::vector<ftxui::Component> children) {
  ftxui::Component vlist = ftxui::Container::Vertical(std::move(children));
  return Renderer(vlist, [vlist] {
    return ftxui::hbox({
        ftxui::text(" "),
        vlist->Render(),
    });
  });
}

ftxui::Component Empty() {
  return std::make_shared<ftxui::ComponentBase>();
}

int main() {
  auto component = ftxui::Collapsible(
      "Collapsible 1",
      Inner({
          ftxui::Collapsible(
              "Collapsible 1.1",
              Inner({
                  ftxui::Collapsible("Collapsible 1.1.1", Empty()),
                  ftxui::Collapsible("Collapsible 1.1.2", Empty()),
                  ftxui::Collapsible("Collapsible 1.1.3", Empty()),
              })),
          ftxui::Collapsible(
              "Collapsible 1.2",
              Inner({
                  ftxui::Collapsible("Collapsible 1.2.1", Empty()),
                  ftxui::Collapsible("Collapsible 1.2.2", Empty()),
                  ftxui::Collapsible("Collapsible 1.2.3", Empty()),
              })),
          ftxui::Collapsible(
              "Collapsible 1.3",
              Inner({
                  ftxui::Collapsible("Collapsible 1.3.1", Empty()),
                  ftxui::Collapsible("Collapsible 1.3.2", Empty()),
                  ftxui::Collapsible("Collapsible 1.3.3", Empty()),
              })),
      }));

  int left_size = 20;

  auto middle =
      ftxui::Renderer([] { return ftxui::text("middle") | ftxui::center; });
  auto container = ResizableSplitLeft(component, middle, &left_size);

  auto renderer = ftxui::Renderer(
      container, [&] { return container->Render() | ftxui::border; });

  ftxui::ScreenInteractive::Fullscreen().Loop(renderer);
}
