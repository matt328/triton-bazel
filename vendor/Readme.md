# Dependency Build/Install

TODO: Convert this into a script.

## Spdlog

```sh
cd spdlog
mkdir build
cd build
cmake .. -DSPDLOG_INSTALL=ON
cmake --build . --config Release
cmake --install . --prefix ../../build/spdlog
```
