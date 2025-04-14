Return-Path: <linux-media+bounces-30184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9C9A88599
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0413B581D55
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A682918DC;
	Mon, 14 Apr 2025 14:20:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F762472A9
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640424; cv=none; b=C8SB/MLpRfSkOfnmY/HFIlyLUmstGSq9ydtHvFEraFdFY3jkoH9rgP/QJNxnNTkqPhIpvyC+sVsITkz40SCa1TOrLUX2cdLocrFKpB8ElIKHX9u1PeJWhJuLtJgoDqul8bA06HFWtcDeji5dO85AZ5w4yHrm+45Vo2bJIl+ScIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640424; c=relaxed/simple;
	bh=Mj6c7WdZQhf3ijm7yytTkCr+/vkJW2+utZFvWZvAdIA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qOSyGeCaixWIfBNvkgnoSJsQBhP+RefQodR0C0TOL/QJUI2t5jnRm0wIZ/iM8QykTX7/OmkfgfP5Vwm91nvSBth0rGU6nP+mlhxs+fkjf3WvIXZmdcUmh0ErM4WvVmwzzf3VZquQLdWLWW61dyqkA3hqBWSq6OkYHLvdlsHqim8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d443811f04so40889195ab.1
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 07:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640422; x=1745245222;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7I37HzaF5M9MfTDYR36+tqp84ocbCY8yCRx5Lxmimho=;
        b=nt39cupp3Uv0qWTDL6HnIH+y5NShIRIKyLe5C+/Cj8VY5D+Pk1AWDpmiHDSgYMTXtJ
         d9PDYvdMyga7drSTOnaP+4OcmYQt0cNuowAp6rQBUSoCBLvS0s9I/yyjCdwkwbUxivMa
         PS9uakDWYRRXtUiaDKbLRbvi+0ryCielsJOy2toy53Yg0XNTcBt1liSYtGdcEC7uXVBq
         VY01V8lrrZwVR8cN+9xON8M0evJUbAGOxg5L9E2DdyJbbFSV+Rtnr8t8YvE3EaJVoQqG
         2e+8R5AHbJrpUViQNzi0MVdvgyyiS31OAoyvyt4Xj8iSGX5d2PVMdPCqty+0jIWYVlHP
         AImw==
X-Forwarded-Encrypted: i=1; AJvYcCVYIFTebw77TmytJDCsZofSFjraLOu89B7u7iwJEkzwbOua7eAA78bXn3tHnbrLAXc9C+XAObManfxuxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOi1/cQUUWTfipet1Fpk1hJM9G3bMcOZ9GY8ZokY05lX1oQzPI
	6gVP7igCxgD6Sdhyi/Rrxpc8ZbsR3/XtbjwildjYmrvHDHRxEwf+DdNUz6IloDJMdcvzM0vs2lS
	Ba8QuGfihnwICzlXiKjASQ/kgEROf7RSfPGTNtWahk/IbtL82B1Ow1V0=
X-Google-Smtp-Source: AGHT+IHpm44OqTs+cbL7F3+y+dkmId12KFaB5faG+RpxhBBbxCTM+c+riC2zh9h+lAjxz7WiZATz4f7PIhDDQSFaI4LNzAjIJY7z
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1889:b0:3cf:c7d3:e4b with SMTP id
 e9e14a558f8ab-3d7ec27efd0mr139059305ab.21.1744640422169; Mon, 14 Apr 2025
 07:20:22 -0700 (PDT)
Date: Mon, 14 Apr 2025 07:20:22 -0700
In-Reply-To: <000000000000974b090622004b40@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fd19a6.050a0220.3483fc.0028.GAE@google.com>
Subject: Re: [syzbot] [media?] general protection fault in dvb_usbv2_generic_write
From: syzbot <syzbot+f9f5333782a854509322@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    8ffd015db85f Linux 6.15-rc2
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11fca0cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a972ee73c2fcf8ca
dashboard link: https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12827398580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161620cc580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2640fd4fd0f2/disk-8ffd015d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1c5931df89bc/vmlinux-8ffd015d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f8fece45017d/bzImage-8ffd015d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000019: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x00000000000000c8-0x00000000000000cf]
CPU: 1 UID: 0 PID: 5849 Comm: syz-executor279 Not tainted 6.15.0-rc2-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:580 [inline]
RIP: 0010:__mutex_lock+0x15d/0x10c0 kernel/locking/mutex.c:746
Code: c0 80 f6 73 9a 48 c1 e8 03 42 0f b6 04 38 84 c0 0f 85 07 0e 00 00 83 3d 40 ba 41 0e 00 75 21 49 8d 7e 60 48 89 f8 48 c1 e8 03 <42> 80 3c 38 00 74 05 e8 17 52 fb f5 4d 39 76 60 0f 85 81 0d 00 00
RSP: 0018:ffffc90004206f80 EFLAGS: 00010202
RAX: 0000000000000019 RBX: ffffc90004207040 RCX: ffffffff9a73f603
RDX: ffff888035f65a00 RSI: ffffffff8e4fde18 RDI: 00000000000000c8
RBP: ffffc90004207118 R08: ffffc90004207087 R09: 0000000000000000
R10: ffffc90004207060 R11: fffff52000840e11 R12: 0000000000000000
R13: ffffc90004207048 R14: 0000000000000068 R15: dffffc0000000000
FS:  0000555594939380(0000) GS:ffff888125093000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f79554c50f0 CR3: 000000007cfd2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dvb_usbv2_generic_write+0x26/0x50 drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c:77
 mxl111sf_ctrl_msg+0x172/0x2e0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:73
 mxl111sf_write_reg+0xda/0x1f0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:123
 mxl111sf_i2c_start drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:130 [inline]
 mxl111sf_i2c_sw_xfer_msg drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:-1 [inline]
 mxl111sf_i2c_xfer+0x923/0x8aa0 drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:813
 __i2c_transfer+0x859/0x2250 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x2c2/0x430 drivers/i2c/i2c-core-base.c:2315
 i2c_transfer_buffer_flags+0x182/0x260 drivers/i2c/i2c-core-base.c:2343
 i2c_master_recv include/linux/i2c.h:79 [inline]
 i2cdev_read+0x10a/0x220 drivers/i2c/i2c-dev.c:155
 vfs_read+0x21f/0xb90 fs/read_write.c:568
 ksys_read+0x19d/0x2d0 fs/read_write.c:713
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f795544e4e9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc002847a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f795544e4e9
RDX: 0000000000000063 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00000000000f4240 R08: 00232d6332692f76 R09: 00000000000000a0
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffc002849c8 R14: 00007ffc002847d0 R15: 00007ffc002847c0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:580 [inline]
RIP: 0010:__mutex_lock+0x15d/0x10c0 kernel/locking/mutex.c:746
Code: c0 80 f6 73 9a 48 c1 e8 03 42 0f b6 04 38 84 c0 0f 85 07 0e 00 00 83 3d 40 ba 41 0e 00 75 21 49 8d 7e 60 48 89 f8 48 c1 e8 03 <42> 80 3c 38 00 74 05 e8 17 52 fb f5 4d 39 76 60 0f 85 81 0d 00 00
RSP: 0018:ffffc90004206f80 EFLAGS: 00010202

RAX: 0000000000000019 RBX: ffffc90004207040 RCX: ffffffff9a73f603
RDX: ffff888035f65a00 RSI: ffffffff8e4fde18 RDI: 00000000000000c8
RBP: ffffc90004207118 R08: ffffc90004207087 R09: 0000000000000000
R10: ffffc90004207060 R11: fffff52000840e11 R12: 0000000000000000
R13: ffffc90004207048 R14: 0000000000000068 R15: dffffc0000000000
FS:  0000555594939380(0000) GS:ffff888125093000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055dccfef9670 CR3: 000000007cfd2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	c0 80 f6 73 9a 48 c1 	rolb   $0xc1,0x489a73f6(%rax)
   7:	e8 03 42 0f b6       	call   0xb60f420f
   c:	04 38                	add    $0x38,%al
   e:	84 c0                	test   %al,%al
  10:	0f 85 07 0e 00 00    	jne    0xe1d
  16:	83 3d 40 ba 41 0e 00 	cmpl   $0x0,0xe41ba40(%rip)        # 0xe41ba5d
  1d:	75 21                	jne    0x40
  1f:	49 8d 7e 60          	lea    0x60(%r14),%rdi
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1) <-- trapping instruction
  2f:	74 05                	je     0x36
  31:	e8 17 52 fb f5       	call   0xf5fb524d
  36:	4d 39 76 60          	cmp    %r14,0x60(%r14)
  3a:	0f 85 81 0d 00 00    	jne    0xdc1


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

