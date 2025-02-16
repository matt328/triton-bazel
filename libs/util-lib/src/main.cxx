#include <iostream>
#include <ranges>
#include <vector>

int main() {

  std::vector<int> v = {1, 2, 3, 4};

  // Use a C++23 feature to test toolchains
  auto result = v | std::ranges::views::transform([](int i) { return i * 2; }) |
                std::ranges::to<std::vector>();

  for (const auto& num : result) {
    std::cout << num << " ";
  }

  std::cout << "Hello world" << '\n';
  return 0;
}
