Return-Path: <linux-media+bounces-45425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E89C03363
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 21:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 886544E01ED
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 19:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4747D34D918;
	Thu, 23 Oct 2025 19:42:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5229D2C027B
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 19:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761248553; cv=none; b=ab2WyEmrQQbnEM1tPUgj/6S+vcV75Dsn0nwLalUAGjJrGYaz1uWnbK1zCCEKvuorFXPB/q2NYc41DTkugwcRisWM9uIwmZgYd/o1pqE7mytfnKHokVUMX0NoDVRwS5Sg0FY10GYvVTw1MtJY2X9PXaipOMBWcXD/GHcan9SfmNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761248553; c=relaxed/simple;
	bh=nc9chtan1UtEearFWNoBUIjrkWURXLLcAz1SOVyBjKM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Qvsw1y3PD44b25obCl+QP/GiNDPQr9Eake0EMP4D86Arovi0sta5q8DN0Vz5nbI3FyQmsi3RYa5nWVSKHPBqDUOrxyknUJN3J2TA2Ep9+xwY7u8rHCKPyE0YzL2w+RjKqmn1s/1LsXDXb4kcu9+Q0sSqj7dalzCZhsMihupuNYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-430c477fe44so16740895ab.1
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 12:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761248551; x=1761853351;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/j66UHV7eWVXQ/5NgxI2zhfNUEsUpY/obl+Xu6nLmY=;
        b=hSSlqLyQMdmQbmsMoLb1KSClw5BCVmGlZnNSPN8uUnIW6oJHL5tSV/ylPOs9PawHsM
         a4JOXDQu07L4yngqTiZrPxixDm/EMhpGw3Ubgcwtp31uJlt0wKO/V84o1gsT9lXG1Eps
         38DThK9lyD3CCWeCO4PbA54JdAZAyP+qn2nP5PP1wFla4cW2PSLi7+6zfOk1r9cijLfu
         PUNJFCJ7H1zucFMgFemPr8+uHrGjPoz1OBQp+tR8aYD2MLx+kt+OizhMJrjvMXpw7rn0
         89aECEsL7txdrQA1fvzOl9TRN/NXpwcV57wL6vFhCcwm+doPz72fA0zLgxkt6rdbHRe/
         VQBg==
X-Forwarded-Encrypted: i=1; AJvYcCXXC4DQUNubnBRJtKbvSWrFozXhoUY31GGo3y/RSL9Q2zAODAhijv6a+vQyLW5Xo9+GBYEKWUaW5xAVfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr68ewgvTZPsiT+0xAD0D3jzML2c2qG6Of/YVgk/x19XuYYhkv
	riw//Jt1JBZhkTYu61Ur03vkPlB6pRPZ7FiYx3OxXoA0e4Fa7wsxCnW9YDlvf4bZTyvrkoIYiUH
	kQbG/pptPO/MOV5stz5l07cRWFKxCtqKOfGZiLgLbaLhqJ7O1HTOhSvbkEJk=
X-Google-Smtp-Source: AGHT+IFGDHTbq1mWl/KscoUgy+vojUnD69RAha1l0VUZk1AMrW2N9mgdZ0coSHa0v43SVdEFl/k7HBBAtJq88Wfc0VuArkPpOymy
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1745:b0:42f:94fd:318f with SMTP id
 e9e14a558f8ab-430c521f9e2mr336072655ab.9.1761248551518; Thu, 23 Oct 2025
 12:42:31 -0700 (PDT)
Date: Thu, 23 Oct 2025 12:42:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68fa8527.a70a0220.3bf6c6.00b6.GAE@google.com>
Subject: [syzbot] [media?] WARNING in dtv5100_i2c_msg
From: syzbot <syzbot+a83ee2dae0e6cc6cd3aa@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1c64efcb083c Merge tag 'rust-rustfmt' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a9752f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9ad7b090a18654a7
dashboard link: https://syzkaller.appspot.com/bug?extid=a83ee2dae0e6cc6cd3aa
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5e186ec77007/disk-1c64efcb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6b834b72dada/vmlinux-1c64efcb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3ba22aa75c23/bzImage-1c64efcb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a83ee2dae0e6cc6cd3aa@syzkaller.appspotmail.com

------------[ cut here ]------------
memcpy: detected field-spanning write (size 4096) of single field "st->data" at drivers/media/usb/dvb-usb/dtv5100.c:58 (size 80)
WARNING: CPU: 1 PID: 20467 at drivers/media/usb/dvb-usb/dtv5100.c:58 dtv5100_i2c_msg+0x2ac/0x330 drivers/media/usb/dvb-usb/dtv5100.c:58
Modules linked in:
CPU: 1 UID: 0 PID: 20467 Comm: syz.1.4196 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:dtv5100_i2c_msg+0x2ac/0x330 drivers/media/usb/dvb-usb/dtv5100.c:58
Code: d1 e8 d8 5c 0b fa c6 05 1c 33 d3 07 01 90 b9 50 00 00 00 48 c7 c7 e0 7b 32 8c 4c 89 e6 48 c7 c2 60 7c 32 8c e8 c5 79 ce f9 90 <0f> 0b 90 90 e9 34 ff ff ff 44 89 e9 80 e1 07 38 c1 0f 8c e2 fe ff
RSP: 0018:ffffc9000ff6f8a0 EFLAGS: 00010246
RAX: dd4b062c6f0c5d00 RBX: ffff88802fb10000 RCX: 0000000000080000
RDX: ffffc9000be3b000 RSI: 00000000000054be RDI: 00000000000054bf
RBP: 0000000000000102 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfa650 R12: 0000000000001000
R13: ffff8880543d4300 R14: 00000000000000c7 R15: 0000000080007700
FS:  0000000000000000(0000) GS:ffff888125e0d000(0063) knlGS:00000000f5436b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 0000000080000100 CR3: 0000000047562000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 dtv5100_i2c_xfer+0x269/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:81
 __i2c_transfer+0x874/0x2170 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2317
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 compat_i2cdev_ioctl+0x5a8/0x5c0 drivers/i2c/i2c-dev.c:575
 __do_compat_sys_ioctl fs/ioctl.c:695 [inline]
 __se_compat_sys_ioctl fs/ioctl.c:638 [inline]
 __ia32_compat_sys_ioctl+0x543/0x840 fs/ioctl.c:638
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xb6/0x2b0 arch/x86/entry/syscall_32.c:306
 do_fast_syscall_32+0x34/0x80 arch/x86/entry/syscall_32.c:331
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7f41539
Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f543655c EFLAGS: 00000206 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 0000000000000707
RDX: 00000000800002c0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   4:	10 07                	adc    %al,(%rdi)
   6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   a:	10 08                	adc    %cl,(%rax)
   c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

