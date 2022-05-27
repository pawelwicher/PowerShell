$i = 42
$i
$x = Compare-Object -DifferenceObject (1,2,3) -ReferenceObject (1,7,8) -IncludeEqual
$true
$false
write "hello"

Get-Member -InputObject $x[0]

write ""

$x | ForEach-Object {"$($_.InputObject) $($_.SideIndicator)"}

write ""

$a = 1 .. 10
$a | % { write ([System.Math]::Pow(2, $_)) }


function Test-Time([Parameter(Mandatory=$true)] $text)
{
  $time    = Get-Date
  $hour    = $time.Hour
  $minute  = $time.Minute
  $seconds = $time.Second
  $speaker = New-Object -ComObject Sapi.SpVoice
  $null    = $speaker.Speak($text)
}
# Test-Time "text"


$code = {
  param
  (
    [Parameter(Mandatory=$true)]
    $Text
  )
 
  $speaker = New-Object -ComObject Sapi.SpVoice
  $null    = $speaker.Speak($Text)
}
#& $code -Text 'This works, too!'


$a = 1,2,3
#$a.GetType()

$ht = @{ 
    SomeKey = 'SomeValue'
     SomeKey2 = 'SomeValue2'
     SomeKey3 = 'SomeValue3'
}
#$ht.GetType()

write ""

$ch = { 
write "test"
}
& $ch

write ""

# $PSVersionTable
$PSVersionTable.PSVersion

$Source = @"
public class TestClass
{
  public static int Add(int a, int b) 
  { 
    return a + b;
  }
    
  public int Multiply(int a, int b)
  {
    return a * b;
  }
}
"@


Add-Type -TypeDefinition $Source
[TestClass]::Add(40, 30)
$TestClassObject = New-Object TestClass
$TestClassObject.Multiply(50, 20)

class Contact
{
    [string]$First
    [string]$Last
    [string]$Phone

    Contact($First, $Last, $Phone) {
       $this.First = $First
       $this.Last = $Last
       $this.Phone = $Phone
    }
}

$contact = [Contact]::new("Bob", "Smith", "555")
$contact.First

Get-Member -InputObject $contact

$x = $contact | Select-Object -Property First, Last
$x.First

write ""

function sum($a,$b,$c) {
  return $a+$b+$c
}
$a = @(1,2,3)
sum @a

write ""

$a = @(1,2,3) + @(5,6,7)
$a

write ""

$hash = @{ ID = 1; Shape = "Square"; Color = "Blue"}
$hash

write ""

$hash = [ordered]@{ ID = 1; Shape = "Square"; Color = "Blue"}
$hash

$hash.Add("TEST", 123)
$hash | Format-Table

write ""

$array = @("item1", "item2", "item3")
 
foreach ($element in $array) { $element }

$foreach | ForEach-Object {$_}

Get-Alias Foreach

write ""

1..5 | ForEach-Object { $Sum = 0 } { $Sum += $_ } { $Sum }

write ""

for($i=0; $i -le 5; $i++)
{
"`$i = $i"
}

Get-Alias pwd
(Get-Location).Path

write ""

$output = (lua -e @"
print(2+3)
print(5*5)
"@)
$output

write ""

$code = @"
function fact(n)
  if (n == 0) then
    return 1
  else
    return n * fact(n - 1)
  end
end

text = 'hello' .. ' ' .. 'world'
print('hello')
print('lua')
print(text)
print(fact(5))
print(fact(6))
"@

$output = (lua -e $code)
$output

write ""

$code = @"
c1 = string.char(97)
c2 = utf8.char(300)
print(c1, c2, #c1, #c2)
"@

$output = (lua -e $code)
$output

write ""

$code1 = @"
s = 'hellol'
print(string.sub(s, 1, -2))
"@

$output = (lua -e $code1)
$output

write ""

$x = 23 * 8 * 120
write $x