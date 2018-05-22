method exercise1(x: int) returns(y: int)
  requires (x < 0 && x >= -3) || (x < 7 && x > 0)
  ensures y < 15
{
  if (x < 0)
  {
    y := x * x;
  }
  else
  {
    y := x * 2;
    y := (y * 5) / (x - 7);
    if ( y == 3 )
    {
      y := (y * 2 + 10) / (2 - y);
    }
    y := y + 4;
  }
}