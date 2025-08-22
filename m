Return-Path: <linux-media+bounces-40689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E0B30A32
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14761D07611
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED82110785;
	Fri, 22 Aug 2025 00:15:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF447522F
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 00:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755821731; cv=none; b=GGX/SG3pyM0zy+JLfxEw1j2uJ0hbLWOROagHuLuAc1MkYpvh3Nbxa80f7UW6CLL/MsVDtjU1JG2tzM2zcUYFCfGWF9shtxYY/s7piBCBwMleiF7HdOX1Gt84Hu5bM6co/j75aU1gArMpu8+7O4jz9EqIyGB+mJmFJbWeod41WRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755821731; c=relaxed/simple;
	bh=CsQ2g5rgnURgAxGrsOg8jGu31SG0qFAec8vbDN/JAgk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gKb+ck3dloW8covmSSbyu9x5RE8iMZKpVQYJcKsB7odHcOrOzatQm6YzjNgwTZj+J6fQQGoZudevnZO0DA6ui2+25yWtUDt/PK/xBW2icvzVrfi9r2fyg7X69w+kRrlft2fcPWomJcZpQjBxwIBaRoGR0zvceNxGrOJ9QWGFIXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-88432e1c782so171990339f.2
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 17:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755821728; x=1756426528;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FyKM0EQABf3vNkgSV/GGQkPbG27/7UYkkIP+/kbpuq0=;
        b=PqeOMiG7gj4eity8BeByPQJQNcoRNEfm9Uaiu3s1cWnLPPKf+qtDVCiLNoewm0Q/DM
         eHeFxg0g+hRo7kMXqSimxcV7BfsINasTcLD7WISvH1b9VlOzaj/igf4FUPAPb7m7dkZE
         Zf7YA2OlDTr+QWcgjAdg7kVC16kEjXrc6YnfHOOhQU5y3Cs8xx6Y4J4jvBGcCQ/E8Nb7
         gaDjQI7Viv3bQLM9EHkXB6WkjkBEXZ6NEdZNZPtw2HtRyy7gr8oRNyMJqLrTeWbw4K4l
         MlsXIh7Pt06c3/Z3PGLaT/UD2HDFyPG0bGBwmUPk+XemsUfMOx9HL75Ut8y/YZs8YOEG
         JVDA==
X-Forwarded-Encrypted: i=1; AJvYcCVyxu1nMyihheD137DqDIp/9UKDlwgFBZWUdMzrQvyggiI+Uxh4jvOOLD6LdIG7cq7e69tgK/0zQC333Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA10GyiFiNDo+59JJgqLTjlgIQWZ1jWCiH3SVPe/65gv3GUuJF
	0+/FijiHJay66NhcUZUizBbrNw0nxwydkkGu5oFLT+UxZGe8dWtXoRYJyBEHl64O0YgXbmAsB2T
	APeIj6YYBHtzKserq9yrBFJgj4XW1dZ3lPkYgXLaR4ial29eFXpe32bEHTDQ=
X-Google-Smtp-Source: AGHT+IFK/IGsPoyrVcHADKuPfHfHmrFijMeNTA/eFat7zqh6BYi11CogvPZ/K4TcCxDF4JKwCRWMBw+GisHdXXYvrC8jUJLApW1U
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca08:0:b0:3e5:5c80:2cf3 with SMTP id
 e9e14a558f8ab-3e921d46281mr20832795ab.13.1755821727811; Thu, 21 Aug 2025
 17:15:27 -0700 (PDT)
Date: Thu, 21 Aug 2025 17:15:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68a7b69f.050a0220.37038e.0047.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in su3000_i2c_transfer
From: syzbot <syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, micha@freedict.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8d561baae505 Merge tag 'x86_urgent_for_v6.17_rc2' of git:/..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15226ba2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ce98061fb8ee27bc
dashboard link: https://syzkaller.appspot.com/bug?extid=d99f3a288cc7d8ef60fb
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=176206f0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=102993a2580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f70b0639e5f7/disk-8d561baa.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8d12dcdbfe95/vmlinux-8d561baa.xz
kernel image: https://storage.googleapis.com/syzbot-assets/47f7ceb7ac19/bzImage-8d561baa.xz

The issue was bisected to:

commit 0e148a522b8453115038193e19ec7bea71403e4a
Author: Michael Bunk <micha@freedict.org>
Date:   Sun Jan 16 11:22:36 2022 +0000

    media: dw2102: Don't translate i2c read into write

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14657ba2580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16657ba2580000
console output: https://syzkaller.appspot.com/x/log.txt?x=12657ba2580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d99f3a288cc7d8ef60fb@syzkaller.appspotmail.com
Fixes: 0e148a522b84 ("media: dw2102: Don't translate i2c read into write")

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 1 UID: 0 PID: 5865 Comm: syz-executor259 Not tainted 6.17.0-rc1-syzkaller-00224-g8d561baae505 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:su3000_i2c_transfer+0x1ad/0x1040 drivers/media/usb/dvb-usb/dw2102.c:740
Code: 4c 89 f8 48 c1 e8 03 49 bc 00 00 00 00 00 fc ff df 42 80 3c 20 00 74 08 4c 89 ff e8 8d b6 3c fa 49 8b 1f 48 89 d8 48 c1 e8 03 <42> 0f b6 04 20 84 c0 0f 85 5f 09 00 00 0f b6 1b 48 8b 44 24 38 42
RSP: 0018:ffffc9000411faa8 EFLAGS: 00010202

RAX: 0000000000000002 RBX: 0000000000000010 RCX: 0000000000000003
RDX: ffffffff87e65d05 RSI: ffffffff8f0d3a50 RDI: 0000000000001900
RBP: 0000000000000000 R08: ffff888032dd0000 R09: 0000000000000002
R10: 0000000000001a00 R11: 0000000000000000 R12: dffffc0000000000
R13: 1ffff1100fb25968 R14: 0000000000000002 R15: ffff88807d92cb48
FS:  000055556ae14380(0000) GS:ffff888125d1b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055b6f1430230 CR3: 000000007277a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __i2c_transfer+0x871/0x2170 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2320
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x64b/0x7f0 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc919191e19
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcc5ebd038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fc9191cd533 RCX: 00007fc919191e19
RDX: 0000200000000a40 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00007fc919205610 R08: 0000000000002a00 R09: 00007ffcc5ebd208
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffcc5ebd1f8 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:su3000_i2c_transfer+0x1ad/0x1040 drivers/media/usb/dvb-usb/dw2102.c:740
Code: 4c 89 f8 48 c1 e8 03 49 bc 00 00 00 00 00 fc ff df 42 80 3c 20 00 74 08 4c 89 ff e8 8d b6 3c fa 49 8b 1f 48 89 d8 48 c1 e8 03 <42> 0f b6 04 20 84 c0 0f 85 5f 09 00 00 0f b6 1b 48 8b 44 24 38 42
RSP: 0018:ffffc9000411faa8 EFLAGS: 00010202
RAX: 0000000000000002 RBX: 0000000000000010 RCX: 0000000000000003
RDX: ffffffff87e65d05 RSI: ffffffff8f0d3a50 RDI: 0000000000001900
RBP: 0000000000000000 R08: ffff888032dd0000 R09: 0000000000000002
R10: 0000000000001a00 R11: 0000000000000000 R12: dffffc0000000000
R13: 1ffff1100fb25968 R14: 0000000000000002 R15: ffff88807d92cb48
FS:  000055556ae14380(0000) GS:ffff888125c1b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562d24ac2168 CR3: 000000007277a000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	4c 89 f8             	mov    %r15,%rax
   3:	48 c1 e8 03          	shr    $0x3,%rax
   7:	49 bc 00 00 00 00 00 	movabs $0xdffffc0000000000,%r12
   e:	fc ff df
  11:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
  16:	74 08                	je     0x20
  18:	4c 89 ff             	mov    %r15,%rdi
  1b:	e8 8d b6 3c fa       	call   0xfa3cb6ad
  20:	49 8b 1f             	mov    (%r15),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 5f 09 00 00    	jne    0x996
  37:	0f b6 1b             	movzbl (%rbx),%ebx
  3a:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  3f:	42                   	rex.X


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

