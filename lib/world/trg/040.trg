#4002 1
������~
2 c 100
������~
* ������� 4025
if (%actor.vnum%!=-1)
  return 0
  halt
end

if (%actor.haveobj(4006)% != eq)
  wsend %actor.unique_id% �� ��� �� ��������� ��� ������?! ����� ����������, ������ �� ����������.
  halt
end

wechoaround %actor.unique_id% %actor.name% �����%actor.y% ������ �����...
wsend %actor.unique_id% �� ������ ������ �����...

wait 3s
if (%actor.room% != %self.vnum%)
  halt
end
wechoaround %actor.unique_id% ������� �������, %actor.name% �� ���-�� �������%actor.u%. ������, ��� ���������� ����!
wsend %actor.unique_id% �����, �� �� ���-�� ����������. ������, ��� ���������� ����!
wload obj 4001
wforce %actor.unique_id% ����� ����

* ���������� ������ � ����� ��������!
calcuid lopata 4006 obj
%func.purge("obj" "%lopata.unique_id%")%
calcuid zemlya 4008 obj
%func.purge("obj" "%zemlya.unique_id%")%
~
#4003 1
���� �������� �� �����~
0 f 100
~
mload obj 4005
~
#4006 1
������~
0 b 3
~
���
~
#4007 1
������� ������ �����~
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
� ������ ����, %actor.name%!
wait 1s
if (%actor.room% != %self.room%)
  halt
end
� ������, �� ��� � �������� ���������, ��� ������ ������ �������...
� �����, �� ��� ��������, � ������ �� �����, ������� �������, ���?
� �, � ���� �� ������ ���� - ������! �� ����� - ���� ���.

%actor.create_var("%var_mushrooms%")%
%actor.set_var_reset("%var_mushrooms%" "reset_zone" "40")%
~
#4008 1
������� ��������~
0 j 100
~
* ������ �������, ��������� ���� ���������������
* ����� ����� ����� ����� �����

set var_corpse var_4000_%actor.id%

if (%object.vnum% == 4009) || (%object.vnum% == 4010) || (%object.vnum% == 4011)

    wait 1
    � �������!
    set n 0
    * �����
    set have %self.haveobj(4009)%
    while (%have%==inv)
      eval n %n%+2
      mpurge obj_4009
      set have %self.haveobj(4009)%
    done
    * ������������
    set have %self.haveobj(4010)%
    while (%have%==inv)
      eval n %n%+1
      mpurge obj_4010
      set have %self.haveobj(4010)%
    done
    * ���������
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
������� �������� �����~
0 b 40
~
�� ����
mjunk all
~
#4010 1
����� � ������ ���~
2 c 100
����������~
* ���������� � ������ ���
wechoaround %actor.unique_id% %actor.name% ��������� �������%actor.u% � ������ ���.
wsend %actor.unique_id% �� ��������� ���������� � ������ ���.
wteleport %actor.unique_id% 4027
wforce %actor.unique_id% look
~
#4011 1
������� ��� ����� � ������� ���~
2 g 100
~
* �������
if (%actor.vnum%==-1) && (%random.4%==1)
  wait 1
  wechoaround %actor.unique_id% %actor.name% ���� �� ����%actor.y% � ������ ���!
  wsend %actor.unique_id% ��, �� �� ���� �� ����������� � ������ ���!
end
~
#4012 1
�����-������� :)~
2 c 100
��������~
* ���������� ���

if (%actor.vnum%!=-1)
  return 0
  halt
end

set var var_4012_%actor.id%

if (%actor.is_var_exist("%var%")%==0)
  wechoaround %actor.unique_id% %actor.name% ������%actor.i% � �������%actor.y% ������ ��� �� �����!
  wsend %actor.unique_id% ��� ������� ����������, �� �������� ��� �� �����!
  wload obj 4013
  wforce %actor.name% ����� ���
  %actor.create_var("%var%")%
  %actor.set_var_reset("%var%" "reset_zone" "40")%
else
  wsend %actor.unique_id% ��� �� �� ���������, ��� ���� ��� ��� �������� �� �������...
end

return 1
~
$
$
