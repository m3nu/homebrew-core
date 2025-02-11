class Inxi < Formula
  desc "Full featured CLI system information tool"
  homepage "https://smxi.org/docs/inxi.htm"
  url "https://github.com/smxi/inxi/archive/3.3.12-1.tar.gz"
  sha256 "fce1a764849bac981c363bcb333ffcdf546740545f41073a64548b8e3b882195"
  license "GPL-3.0-or-later"
  head "https://github.com/smxi/inxi.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "de60a7a27ba05ca682c7d0f14534c7fa8950ef021871a2887405dd6059afde63"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "de60a7a27ba05ca682c7d0f14534c7fa8950ef021871a2887405dd6059afde63"
    sha256 cellar: :any_skip_relocation, monterey:       "d0f0a2d590c75997729afc3a917952fa4f68c115e21b34f45e1c9910a364a84c"
    sha256 cellar: :any_skip_relocation, big_sur:        "d0f0a2d590c75997729afc3a917952fa4f68c115e21b34f45e1c9910a364a84c"
    sha256 cellar: :any_skip_relocation, catalina:       "d0f0a2d590c75997729afc3a917952fa4f68c115e21b34f45e1c9910a364a84c"
  end

  def install
    bin.install "inxi"
    man1.install "inxi.1"

    ["LICENSE.txt", "README.txt", "inxi.changelog"].each do |file|
      prefix.install file
    end
  end

  test do
    inxi_output = shell_output("#{bin}/inxi")

    uname = shell_output("uname").strip
    assert_match uname.to_str, inxi_output.to_s

    uname_r = shell_output("uname -r").strip
    assert_match uname_r.to_str, inxi_output.to_s
  end
end
