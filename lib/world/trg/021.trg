#2100 1
��������� �����~
0 g 100
~
if (%actor.vnum%==-1)
  wait 1
  say ������!
  say ���� ����� ��� �������� ���� ��������� ���������!
  say �� ������ ��� �� 2 ������ �� �������! �� � ������ ���� �������...
  say ��! ������ ���!
  say �� ��� ��������� ���� �����, ������� ��� ������
  say � � ��� ���� 1 ������ �� �������! �� �����?!
  �� %actor.alias%
end
~
#2101 1
�������� ����~
0 j 100
~
if (%object.is_corpse% && (%object.corpse_vnum%==2106 || %object.corpse_vnum%==2107 || %object.corpse_vnum%==2108))
  mjunk all
  say ��� �������, �������%actor.y%! ������� ���� ����!
  ���� 1 ����� %actor.alias%
  return 1
else
  say � ��� ��� �����...� �� ������ %object.vname%...
  return 0
end
~
#2102 1
�������������� �� ����~
0 p 100
~
mecho test1
wait 1s
mecho test2
mecho "%self.get_var("var_2101_%actor.id%")%"
if (%self.get_var("var_2101_%actor.id%")% > 0)
  mjunk all
  say ��� �������, �������%actor.y%! ������� ���� ����!
  ���� %self.get_var("var_2101_%actor.id%")% ����� %actor.alias%
  %self.reset_var("var_2101_%actor.id%")%
else
  say � ���-�� ��� �����...� �� ������...
end
~
#2103 1
>greet_prog 100~
0 g 100
~
wait 5
if (%actor.vnum%==-1)
mecho �� �������� ������� ������ ����, ����������� ���� ������.
end
~
$
$
