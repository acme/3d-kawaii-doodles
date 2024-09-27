// SVG filename
filename = "data/astrobot.svg";

union () {
  color("#0087ff")
  linear_extrude(height = 1)
    fill()
      resize([100,0,0], auto=true)
        resize([0,100,0], auto=true)
          import(file = filename, center = true, dpi = 96);

  color("#333333")
  linear_extrude(height = 2)
    resize([100,0,0], auto=true)
      resize([0,100,0], auto=true)
        import(file = filename, center = true, dpi = 96);
}

