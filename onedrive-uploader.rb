class OnedriveUploader < Formula
  desc "Command-line utility for uploading files to OneDrive"
  homepage "https://github.com/virtualzone/onedrive-uploader"
  url "https://github.com/virtualzone/onedrive-uploader/archive/refs/tags/v0.8.4.tar.gz"
  sha256 "0bf38f66858bfb6b79419672dbf3211a9a217517c276733f9bf7ecaa05fb2ae8"
  license "MIT"
  head "https://github.com/virtualzone/onedrive-uploader.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = ["-w -s"]
    system "go", "build", "-ldflags", ldflags.join(" "), "-o", "#{bin}/onedrive-uploader"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/onedrive-uploader version")
  end
end
