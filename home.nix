{ pkgs, ... }: {
  home.stateVersion = "26.05";

  imports = [
    ./zellij.nix
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_add_path /run/current-system/sw/bin
      fish_add_path /nix/var/nix/profiles/default/bin
      fish_add_path /opt/homebrew/bin
      set -gx BAT_THEME Nord
      set -gx EDITOR nvim
      starship init fish | source
    '';
    plugins = [
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "fzf-forgit"; src = pkgs.fishPlugins.forgit.src; }
    ];
  };# match your nixpkgs channel

  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "Tom Malone";
        email = "tomjmalone@gmail.com";
      };
      push = { autoSetupRemote = true; };
      init.defaultBranch = "main";
      alias = {
        ci = "commit";
        co = "checkout";
        s = "status";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration= true;
    enableFishIntegration= true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
      character = {
        success_symbol = "[](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
    };
  };

  programs.eza = {
    enable = true;
    colors = "always";
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    extraOptions =[
    ];
    icons = "always";
  };

  home.file = {
    ".config/ghostty/config".text = ''
      font-family = "JetBrainsMono Nerd Font Mono"
      font-style="medium"
      font-size = "13"
      theme = "Nord"
      font-thicken=true
      macos-option-as-alt=right
    '';

    ".config/bottom/bottom.toml".text = ''
      [styles]
      theme = "nord"
    '';
  };

  home.packages = with pkgs; [
    vim
    neovim
    curl
    fzf
    bat
    bottom
  ];

  programs.home-manager.enable = true;
}
