class MkdocsMaterialExtensions < Formula
  include Language::Python::Virtualenv
  desc "Markdown extension resources for MkDocs for Material"
  homepage "https://github.com/facelessuser/mkdocs-material-extensions"
  url "https://github.com/facelessuser/mkdocs-material-extensions/archive/refs/tags/1.3.1.tar.gz"
  sha256 "a67b5d0fb8590746b1b8184017bf13ffed5e2eb861fcbc2f4da851c3645520b4"
  license "MIT"
  depends_on "python@3"

  def install
    virtualenv_install_with_resources(using: "python@3")
  end

  test do
    ENV["PYTHONDONTWRITEBYTECODE"] = "1"
    Language::Python.each_python(build) do |python, _|
      system python, "-c", "import materialx"
    end
  end
end
