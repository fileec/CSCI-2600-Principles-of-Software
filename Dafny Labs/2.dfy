function pow10(n: nat): nat
{ 
  if n == 0 then 1 
  else 10 * pow10(n - 1) 
}

method trailingZeros(x:int) returns(y:int, zeros:nat)
  requires x > 0
  ensures y % 10 != 0 && x == y * pow10(zeros)
{
  zeros := 0;
  y := x;
  while (y % 10 == 0)
    invariant x == y * pow10(zeros)
    decreases y / 10
  {
    y := y / 10;
    zeros := zeros + 1;
  }
}