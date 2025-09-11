{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      # Extensions - these will be automatically installed
      extensions = with pkgs.vscode-extensions; [      
        # Nix support (perfect for your nixfiles!)
        bbenoist.nix
        
        # Git and version control
        eamodio.gitlens

        # Devcontainers
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.remote-explorer
        ms-azuretools.vscode-containers
        ms-azuretools.vscode-docker

        
        # Productivity
        ms-vscode-remote.remote-ssh
        ms-vscode.remote-explorer
        github.copilot
        github.copilot-chat
        
        # Themes and appearance
        dracula-theme.theme-dracula
        vscode-icons-team.vscode-icons
        #pkief.material-icon-theme
        
        # Development tools
        ms-vscode.live-server
        esbenp.prettier-vscode
        njpwerner.autodocstring
        
        # Add more as needed - search available extensions at:
        # https://search.nixos.org/packages?type=packages&query=vscode-extensions

        # rust
        ms-python.python
        rust-lang.rust-analyzer

        # Python
        charliermarsh.ruff
        ms-python.black-formatter
        ms-python.debugpy
        ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow

        # Typescript
        biomejs.biome
        ecmel.vscode-html-css
        graphql.vscode-graphql-syntax
        wholroyd.jinja

        # Terraform
        hashicorp.terraform

        # Java
        #redhat.java
        #vscjava.vscode-gradle
        #vscjava.vscode-java-debug
        #vscjava.vscode-java-dependency
        #vscjava.vscode-java-pack
        #vscjava.vscode-java-test
        #vscjava.vscode-maven

        # Viewers
        hediet.vscode-drawio
        mechatroner.rainbow-csv
        redhat.vscode-yaml
        tamasfe.even-better-toml
        tomoki1207.pdf

        # Random
        visualstudioexptteam.intellicode-api-usage-examples
        visualstudioexptteam.vscodeintellicode
      ];
      
      # Settings (equivalent to settings.json)
      userSettings = {
        "workbench.iconTheme" = "vscode-icons";
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "gitlens.defaultDateFormat" = null;
        "editor.wordWrap" = "bounded";
        "explorer.compactFolders" = false;
        
        "[python]" = {
          "editor.codeActionsOnSave" = {
            "source.organizeImports" = "explicit";
            "source.fixAll" = "explicit";
          };
          "editor.formatOnType" = true;
        };
        
        "python.formatting.provider" = "black";
        "python.analysis.typeCheckingMode" = "basic";
        "ruff.args" = [ "--ignore" "F401" "--ignore" "F841" ];
        "editor.wordWrapColumn" = 120;
        "redhat.telemetry.enabled" = true;
        
        "[yaml]" = {
          "editor.defaultFormatter" = "redhat.vscode-yaml";
        };
        
        "python.analysis.diagnosticMode" = "workspace";
        "terminal.integrated.fontFamily" = "'Hack Nerd Font', monospace";
        
        "yaml.customTags" = [
          "!And"
          "!And sequence"
          "!If"
          "!If sequence"
          "!Not"
          "!Not sequence"
          "!Equals"
          "!Equals sequence"
          "!Or"
          "!Or sequence"
          "!FindInMap"
          "!FindInMap sequence"
          "!Base64"
          "!Join"
          "!Join sequence"
          "!Cidr"
          "!Ref"
          "!Sub"
          "!Sub sequence"
          "!GetAtt"
          "!GetAZs"
          "!ImportValue"
          "!ImportValue sequence"
          "!Select"
          "!Select sequence"
          "!Split"
          "!Split sequence"
          "!reference sequence"
        ];
        
        "dev.containers.defaultExtensions" = [
          "ms-azuretools.vscode-docker"
          "ms-python.python"
          "ms-python.vscode-pylance"
          "charliermarsh.ruff"
          "tamasfe.even-better-toml"
          "GitLab.gitlab-workflow"
          "eamodio.gitlens"
          "hashicorp.terraform"
          "esbenp.prettier-vscode"
          "mechatroner.rainbow-csv"
          "vscode-icons-team.vscode-icons"
          "redhat.vscode-yaml"
          "njpwerner.autodocstring"
          "GitHub.copilot"
        ];
        
        "[jsonc]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        
        "ruff.importStrategy" = "fromEnvironment";
        "ruff.logLevel" = "warn";
        "editor.formatOnSave" = true;
        
        "files.associations" = {
          "*.jinja" = "jinja";
        };
        
        "git.ignoreRebaseWarning" = true;
        
        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        
        "explorer.confirmDragAndDrop" = false;
        
        "[csv]" = {
          "editor.wordWrap" = "off";
        };
        
        "[html]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        
        "tabnine.experimentalAutoImports" = true;
        "codium.editorButton" = false;
        
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        
        "window.zoomLevel" = 1;
        
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        
        "github.copilot.advanced" = { };
        "terminal.integrated.enableMultiLinePasteWarning" = false;
        "explorer.autoReveal" = false;
        "workbench.colorTheme" = "Default Dark+";
        "editor.fontFamily" = "'Iosevka Custom', monospace";
        "editor.fontSize" = 14;
        "powermode.enabled" = true;
        "powermode.shake.enabled" = false;
        "editor.fontLigatures" = true;
        "editor.fontVariations" = true;
        "workbench.fontAliasing" = "auto";
        "remote.autoForwardPortsSource" = "hybrid";
        "prisma.showPrismaDataPlatformNotification" = false;
        "terminal.integrated.fontSize" = 13;
        "github.copilot.editor.enableAutoCompletions" = true;
        "workbench.editor.revealIfOpen" = true;
        "gitlens.codeLens.recentChange.enabled" = false;
        "gitlens.codeLens.authors.enabled" = false;
        
        "[rust]" = {
          "editor.inlayHints.enabled" = "offUnlessPressed";
        };
        
        "vsicons.dontShowNewVersionMessage" = true;
        "chat.editing.alwaysSaveWithGeneratedChanges" = true;
        "docker.extension.enableComposeLanguageServer" = false;
        "diffEditor.renderSideBySide" = true;
        "github.copilot.nextEditSuggestions.enabled" = true;
      };
      
      # Keybindings (equivalent to keybindings.json)
      keybindings = [
        {
          "key" = "ctrl+shift+t";
          "command" = "workbench.action.terminal.new";
        }
        {
          "key" = "ctrl+shift+e";
          "command" = "workbench.view.explorer";
        }
        # Add your custom keybindings here
      ];
    };
  };
}