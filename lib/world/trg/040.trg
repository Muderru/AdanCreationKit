#4002 1
копать~
2 c 100
копать~
* комната 4025
if (%actor.vnum%!=-1)
  return 0
  halt
end

if (%actor.haveobj(4006)% != eq)
  wsend %actor.unique_id% Но чем вы собрались тут копать?! Почва каменистая, руками не прокопаешь.
  halt
end

wechoaround %actor.unique_id% %actor.name% начал%actor.y% копать землю...
wsend %actor.unique_id% Вы начали копать землю...

wait 3s
if (%actor.room% != %self.vnum%)
  halt
end
wechoaround %actor.unique_id% Немного покопав, %actor.name% на что-то наткнул%actor.u%. Похоже, это деревянный ключ!
wsend %actor.unique_id% Вдруг, вы на что-то наткнулись. Похоже, это деревянный ключ!
wload obj 4001
wforce %actor.unique_id% взять ключ

* уничтожаем лопату и землю полюбому!
calcuid lopata 4006 obj
%func.purge("obj" "%lopata.unique_id%")%
calcuid zemlya 4008 obj
%func.purge("obj" "%zemlya.unique_id%")%
~
#4003 1
лоад шкатулки из паука~
0 f 100
~
mload obj 4005
~
#4006 1
зеваем~
0 b 3
~
зев
~
#4007 1
грибник выдает квест~
0 g 100
~
set var_mushrooms var_4002_%actor.id%

if (%actor.vnum%!=-1) || (%actor.is_var_exist("%var_mushrooms%")%)
  halt
end

wait 20
if (%actor.room% != %self.room%)
  halt
end
г Привет тебе, %actor.name%!
wait 1s
if (%actor.room% != %self.room%)
  halt
end
г Слушай, мы тут с друзьями поспорили, кто грибов больше наберет...
г Может, ты мне поможешь, и отдашь те грибы, которые найдешь, мне?
г А, я тебе за каждый гриб - монету! За белый - даже две.

%actor.create_var("%var_mushrooms%")%
%actor.set_var_reset("%var_mushrooms%" "reset_zone" "40")%
~
#4008 1
награда грибника~
0 j 100
~
* хитрый триггер, благодаря этим измывательствам
* можно брать сразу много вещей

set var_corpse var_4000_%actor.id%

if (%object.vnum% == 4009) || (%object.vnum% == 4010) || (%object.vnum% == 4011)

    wait 1
    г Отлично!
    set n 0
    * белые
    set have %self.haveobj(4009)%
    while (%have%==inv)
      eval n %n%+2
      mpurge obj_4009
      set have %self.haveobj(4009)%
    done
    * подосиновики
    set have %self.haveobj(4010)%
    while (%have%==inv)
      eval n %n%+1
      mpurge obj_4010
      set have %self.haveobj(4010)%
    done
    * дождевики
    set have %self.haveobj(4011)%
    while (%have%==inv)
      eval n %n%+1
      mpurge obj_4011
      set have %self.haveobj(4011)%
    done

    %func.create_money("%self.unique_id%" "%n%")%
    give all %actor.name%
    mjunk all

else
  return 0
end
~
#4009 1
грибник собирает грибы~
0 b 40
~
вз гриб
mjunk all
~
#4010 1
лезем в волчью яму~
2 c 100
спуститься~
* спускаемся в волчью яму
wechoaround %actor.unique_id% %actor.name% аккуратно спустил%actor.u% в волчью яму.
wsend %actor.unique_id% Вы аккуратно спустились в волчью яму.
wteleport %actor.unique_id% 4027
wforce %actor.unique_id% look
~
#4011 1
антураж при входе к волчьей яме~
2 g 100
~
* антураж
if (%actor.vnum%==-1) && (%random.4%==1)
  wait 1
  wechoaround %actor.unique_id% %actor.name% чуть не упал%actor.y% в волчью яму!
  wsend %actor.unique_id% Ба, да вы чуть не провалились в волчью яму!
end
~
#4012 1
тянем-потянем :)~
2 c 100
потянуть~
* вытягиваем кол

if (%actor.vnum%!=-1)
  return 0
  halt
end

set var var_4012_%actor.id%

if (%actor.is_var_exist("%var%")%==0)
  wechoaround %actor.unique_id% %actor.name% напряг%actor.i% и вытянул%actor.y% острый кол из земли!
  wsend %actor.unique_id% Как следует напрягшись, вы вытянули кол из земли!
  wload obj 4013
  wforce %actor.name% взять кол
  %actor.create_var("%var%")%
  %actor.set_var_reset("%var%" "reset_zone" "40")%
else
  wsend %actor.unique_id% Как вы ни старались, еще один кол вам вытянуть не удалось...
end

return 1
~
$
$
