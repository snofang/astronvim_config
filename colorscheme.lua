local theme_avail, _ = pcall(require, "tokyonight")
if theme_avail then
  return "tokyonight"
else
  return "default_theme"
end
