on *:TEXT:!commands*:#: {
  msg $nick 4,1 !createaccount !tips !pstats
}
on *:TEXT:!tips*:#: {
  msg $nick 4,1 This is a fun little game created by ReFuSeR...
  msg $nick 11,1 You can compete for stats by slaping, punching, shooting and stalking other users.
  msg $nick 11,1 Do !createaccount to make a account then go slap people!  
}
on *:TEXT:!createaccount*:#: {
  if ($readini(funscript.ini,$nick,registered) == 1) {
    msg $chan 4,1This account has been created!
    halt
  }
  msg $chan 4,1Creating...
  writeini funscript.ini $nick registered 1
  writeini funscript.ini $nick bslap 0
  writeini funscript.ini $nick bshot 0 
  writeini funscript.ini $nick bpunch 0
  writeini funscript.ini $nick bstalk 0
  writeini funscript.ini $nick slap 0
  writeini funscript.ini $nick shot 0 
  writeini funscript.ini $nick punch 0
  writeini funscript.ini $nick stalk 0
  timer 1 5 msg $chan 11,1Your account has been created... Now go and slap everyone!
}
on *:action:*slaps*:#: {
  if ($readini(funscript.ini,$nick,registered) == 1) {
    var %+ = $readini(funscript.ini,$nick,slap), %++ = $readini(funscript.ini,$2,bslap)
    inc %+ 1
    inc %++ 1
    writeini funscript.ini $nick slap %+
    writeini funscript.ini $2 bslap %++
  }
}
on *:action:*punches*:#: {
  if ($readini(funscript.ini,$nick,registered) == 1) {
    var %+ = $readini(funscript.ini,$nick,punch), %++ = $readini(funscript.ini,$2,bpunch)
    inc %+ 1
    inc %++ 1
    writeini funscript.ini $nick punch %+
    writeini funscript.ini $2 bpunch %++
  }
}
on *:action:*shoots*:#: {
  if ($readini(funscript.ini,$nick,registered) == 1) {
    var %+ = $readini(funscript.ini,$nick,shot), %++ = $readini(funscript.ini,$2,bshot)
    inc %+ 1
    inc %++ 1
    writeini funscript.ini $nick shot %+
    writeini funscript.ini $2 bshot %++
  }
}
on *:action:*stalks*:#: {
  if ($readini(funscript.ini,$nick,registered) == 1) {
    var %+ = $readini(funscript.ini,$nick,stalk), %++ = $readini(funscript.ini,$2,bstalk)
    inc %+ 1
    inc %++ 1
    writeini funscript.ini $nick stalk %+
    writeini funscript.ini $2 bstalk %++
  }
}
on *:TEXT:!pstats*:#: {
  if ($readini(funscript.ini,$nick,registered) == 0) {
    notice $nick 4,1This Account has not been created
    halt
  }
  if (!$2) {
    notice $nick 11,1Been Slaped $+ :4,1 $readini(funscript.ini,$nick,bslap)
    notice $nick 11,1Been Shot $+ :4,1 $readini(funscript.ini,$nick,bshot)
    notice $nick 11,1Been Punched $+ :4,1 $readini(funscript.ini,$nick,bpunch)
    notice $nick 11,1Been Stalked $+ :4,1 $readini(funscript.ini,$nick,bstalk)
    notice $nick 4,1Slaps $+ :11,1 $readini(funscript.ini,$nick,slap)
    notice $nick 4,1Shots $+ :11,1 $readini(funscript.ini,$nick,bshot)
    notice $nick 4,1Punches $+ :11,1 $readini(funscript.ini,$nick,punch)
    notice $nick 4,1Stalks $+ :11,1 $readini(funscript.ini,$nick,stalk)    
    halt
  }
  if ($readini(funscript.ini,$2,registered) == 0) {
    notice $nick 4,1There is no user matching: $2 $+ !
    halt
  }
  notice $nick 11,1Been Slaped $+ :4,1 $readini(funscript.ini,$2,bslap)
  notice $nick 11,1Been Shot $+ :4,1 $readini(funscript.ini,$2,bshot)
  notice $nick 11,1Been Punched $+ :4,1 $readini(funscript.ini,$2,bpunch)
  notice $nick 11,1Been Stalked $+ :4,1 $readini(funscript.ini,$2,bstalk)
  notice $nick 4,1Slaps $+ :11,1 $readini(funscript.ini,$2,slap)
  notice $nick 4,1Shots $+ :11,1 $readini(funscript.ini,$2,bshot)
  notice $nick 4,1Punches $+ :11,1 $readini(funscript.ini,$2,punch)
  notice $nick 4,1Stalks $+ :11,1 $readini(funscript.ini,$2,stalk)   
}
