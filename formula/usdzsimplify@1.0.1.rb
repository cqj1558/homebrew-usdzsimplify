class UsdzsimplifyAT101 < Formula
  desc "A Swift-powered tool for simplifying USDZ models"
  homepage "https://github.com/cqj1558/USDZSimplifySPM"
  url "https://github.com/cqj1558/USDZSimplifySPM/archive/refs/tags/1.0.1.tar.gz"
  sha256 "aa08e17b856748b4f077672eae38aad5c2694d8abdc53087d43cf2159d6f95d5"
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

