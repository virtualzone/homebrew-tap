class OnedriveUploader < Formula
  desc "Command-line utility for uploading files to OneDrive"
  homepage "https://github.com/virtualzone/onedrive-uploader"
  url "https://github.com/virtualzone/onedrive-uploader/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "5aa31f44dc70e0c403a89c510b87a13d6c3519afff53838aecdb70c6ebc45ecb"
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
