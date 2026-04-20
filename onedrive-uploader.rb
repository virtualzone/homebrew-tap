class OnedriveUploader < Formula
  desc "Command-line utility for uploading files to OneDrive"
  homepage "https://github.com/virtualzone/onedrive-uploader"
  url "https://github.com/virtualzone/onedrive-uploader/archive/refs/tags/v0.8.5.tar.gz"
  sha256 "e79e95f0c810dcbfda79f83d56bef8e949c9d5dd34d3dee47980d7c6674b5d25"
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
