#1
memory test trigger~
0 o 100
~
say I remember you, %actor.name%!
~
#2
mob greet test~
0 g 100
~
set num 5
say num = >%num%<
say random.num=>% random. %num% %<


say Привет тебе, о %actor.name%!
say Чтобы пройти дальше, ты должен за 10 секунд отгадать
say какое число я загадал. Число от 0 до 1

if (%actor.get_var("var_0001")% == not_found)
 %actor.create_var("var_0001" "a")%
 eval num %random.5%
 say num=%num%
  switch %num
  case 0
   %actor.set_var("var_0001" "zero" "0" "0" "4")%
  break
  case 1
   %actor.set_var("var_0001" "one" "0" "0" "4")%
  break
  done
end

say value=%actor.get_var("var_0001")%
~
#3
obj get test~
1 g 100
~
oecho You hear, 'Please put me down, %actor.name%'
~
#4
room test~
2 g 100
~
wait 50
wsend %actor% you enter a room
~
#5
car/cdr test~
0 d 100
test~
say speech: %speech%
say car: %speech.car%
say cdr: %speech.cdr%
~
#6
subfield test~
0 c 100
test~
say your hide ability is %actor.skill(посохи и дубины)% percent.
~
#7
object otransform test~
1 jl 7
test~
oecho Beginning object transform.
if %self.vnum% == 3020
  otransform 3021
else
  otransform 3020
end
oecho Transform complete.
~
#8
makeuid and remote testing~
2 c 100
test~
eval counter 0
while (%counter% < 10)
  makeuid mob 200000+%counter%
  wecho #%counter%      %mob.id%   %mob.name%
  eval counter %counter% + 1
done
makeuid mob 200000
eval globalname 12345
remote globalname %mob.id%
wecho %mob.name%'s "globalname" value is %mob.globalname%
wecho %globalname%
wecho %mob.id%
~
#9
mtransform test~
0 g 100
~
mecho Beginning transform.
if %self.vnum%==1
  mtransform 99
else
  mtransform 1
end
mecho Transform complete.
~
#10
reset_var test~
0 p 0
~
%echo% HEHE
say AAAAAAA

~

$
$
