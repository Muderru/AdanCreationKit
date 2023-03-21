#2100 1
встречаем ньюба~
0 g 100
~
if (%actor.vnum%==-1)
  wait 1
  say Привет!
  say Отец велел мне перебить этих противных насекомых!
  say Он обещал мне по 2 монеты за каждого! Но я сломал свою рогатку...
  say ВО! ЗНАЧИТ ТАК!
  say Ты мне приносишь труп жучка, червяка или паучка
  say А я даю тебе 1 монету за каждого! По рукам?!
  ул %actor.alias%
end
~
#2101 1
приносим труп~
0 j 100
~
if (%object.is_corpse% && (%object.corpse_vnum%==2106 || %object.corpse_vnum%==2107 || %object.corpse_vnum%==2108))
  mjunk all
  say Вот спасибо, удружил%actor.y%! Получай свою долю!
  дать 1 монет %actor.alias%
  return 1
else
  say А это мне зачем...я не просил %object.vname%...
  return 0
end
~
#2102 1
рассчитываемся за труп~
0 p 100
~
mecho test1
wait 1s
mecho test2
mecho "%self.get_var("var_2101_%actor.id%")%"
if (%self.get_var("var_2101_%actor.id%")% > 0)
  mjunk all
  say Вот спасибо, удружил%actor.y%! Получай свою долю!
  дать %self.get_var("var_2101_%actor.id%")% монет %actor.alias%
  %self.reset_var("var_2101_%actor.id%")%
else
  say А это-то мне зачем...я не просил...
end
~
#2103 1
>greet_prog 100~
0 g 100
~
wait 5
if (%actor.vnum%==-1)
mecho Вы услышали громкий клекот орла, защищающего свое гнездо.
end
~
$
$
