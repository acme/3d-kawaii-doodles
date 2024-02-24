// SVG filename
filename = "data/donut.svg";

union () {
  color("#FF5000")
  linear_extrude(height = 5)
    fill()
      resize([100,0,0], auto=true)
        resize([0,100,0], auto=true)
          import(file = filename, center = true, dpi = 96);

  color("#333333")
  linear_extrude(height = 10)
    resize([100,0,0], auto=true)
      resize([0,100,0], auto=true)
        import(file = filename, center = true, dpi = 96);
}

