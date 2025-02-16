#include <iostream>
#include <ranges>
#include <utility>
#include <vector>
#include <spdlog/spdlog.h>

#include "Logger2.hpp"
#include "BaseException.hpp"

class MyException : public tr::BaseException {
public:
  explicit MyException(std::string msg) : tr::BaseException(std::move(msg)) {
  }
};

auto main() -> int {

  const auto debugLevel = spdlog::level::level_enum::trace;
  const auto releaseLevel = spdlog::level::level_enum::trace;

  initLogger(debugLevel, releaseLevel);

  Log.debug("Hello from spdlog");

  std::vector<int> v = {1, 2, 3, 4};

  // Use a C++23 feature to test toolchains
  auto result = v | std::ranges::views::transform([](int i) { return i * 2; }) |
                std::ranges::to<std::vector>();

  for (const auto& num : result) {
    std::cout << num << " ";
  }

  try {
    throw MyException{"oops"};
  } catch (const tr::BaseException& ex) { Log.error(ex.what()); }

  std::cout << "Hello world" << '\n';
  return 0;
}
