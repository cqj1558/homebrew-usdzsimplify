class UsdzsimplifyAT102 < Formula
  desc "A Swift-powered tool for simplifying USDZ models"
  homepage "https://github.com/cqj1558/USDZSimplifySPM"
  url "https://github.com/cqj1558/USDZSimplifySPM/archive/refs/tags/1.0.2.tar.gz"
  sha256 "db5081777fb99485cd97616b188feaa0ae5d019b41949046af7304b0a39de043"
  license "MIT"

  # 声明 macOS 版本要求（根据 Package.swift 中的 platforms）
  depends_on :macos => :sequoia  # macOS 15.0 (Sequoia)
  depends_on "swift" => :build

  def install
    # 使用 swift build 命令编译项目
    system "swift", "build", "-c", "release", "--disable-sandbox", "--product", "usdzutil"
    
    # 将编译好的二进制文件安装到 Homebrew 的 bin 目录
    bin.install ".build/release/usdzutil"
  end

  test do
    # 测试工具是否能正常运行（使用 --help 而不是 --version）
    # 因为 ArgumentParser 默认支持 --help
    assert_match "USDZ 模型简化工具", shell_output("#{bin}/usdzutil --help")
    
    # 或者测试 simplify 子命令的帮助信息
    assert_match "简化单个 USDZ 文件", shell_output("#{bin}/usdzutil simplify --help")
  end
end

