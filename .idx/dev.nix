{ pkgs ? import <nixpkgs> {} }:
{
  # Channel for Nix package selection
  channel = "stable-24.05";

  # Packages to install
  packages = with pkgs; [
    jdk17
    unzip
    flutter.sdk
  ];

  # Environment variables
  env = {
    JAVA_HOME = "${pkgs.jdk17}/lib/openjdk";
  };

  # IDX configuration
  idx = {
    # VS Code extensions
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    # Workspace configuration
    workspace = {
      onCreate = {
        script = ''
          # Change directory (modify path if needed)
          cd /home/user/myapp/android
          # Gradlew command for building Flutter app (adjust flags if needed)
          ./gradlew \
            --parallel \
            -Pverbose=true \
            -Ptarget-platform=android-x86 \
            -Ptarget=/home/user/myapp/lib/main.dart \
            -Pbase-application-name=android.app.Application \
            -Pdart-defines=RkxVVFRFUl9XRUJfQFOVkFTS0lUX1VSTD1odHRwczovL3d3dy5nc3RhdGljLmNvbS9mbHV0dGVyLWNhbnZhc2tpdC85NzU1MDkwN2I3MGY0ZjNiMzI4YjZjMTYwMGRmMjFmYWMxYTE4ODlhLw== \
            -Pdart-obfuscation=false \
            -Ptrack-widget-creation=true \
            -Ptree-shake-icons=false \
            -Pfilesystem-scheme=org-dartlang-root \
            assembleDebug
        '';
      };
    };

    # Previews configuration (for Flutter web and android)
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT"];
          manager = "flutter";
        };
        android = {
          command = ["flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555"];
          manager = "flutter";
        };
      };
    };
  };
}