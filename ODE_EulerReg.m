function [x,y] = edoEulerReg(func, a, b, yIni, h)

  edo = str2func(strcat("@(x, y) ", func));
  x(1) = a;
  y(1) = yIni;
  yTemp(1) = yIni;
  N = (b-a)/h;

  fprintf("Itr.\tx\ty\n");
  fprintf("%d\t%d\t%d\n", 1, x(1), y(1));

  for i = 1:N
    x(i+1) = x(i) + h;
    yTemp(i+1) = yTemp(i) + edo(x(i), yTemp(i)) * h;
    y(i+1) = y(i) + edo(x(i+1), yTemp(i+1)) * h;
    fprintf("%d\t%d\t%d\n", i+1, x(i+1), y(i+1));
  endfor
  plot(x, y);
endfunction
