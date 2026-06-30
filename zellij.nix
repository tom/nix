{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      theme = "nord";
      copy_command = "pbcopy";
      macos-option-as-alt = "righ";
    };
  };
}
