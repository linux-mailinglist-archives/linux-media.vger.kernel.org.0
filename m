Return-Path: <linux-media+bounces-48331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65FCA8417
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 16:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CF933ADAC7
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 15:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C92233D6D8;
	Fri,  5 Dec 2025 15:03:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26673331228
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947011; cv=none; b=fDAr/VIsPFJ1rzS+HwvtZWxaWZLXiu+wvzJzt/ihnulWbm5V9apYf6CcTXPz7Ugv4msPP18aPZ5N5eVW/gbmeppuaub19JVvBVZoGTszJeNOxWAqhADvpHHOgp2IQtPRTbGWKqxwbt7Sn//+wdGOj4ia/lelncZ5SDwqOeIBQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947011; c=relaxed/simple;
	bh=H8d8ZgxBp+MJmziHi/e+b235tqYhFPQdWYXwUDtYYwA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YvJ7IlotBCz92rHRdY3vHp+2XyoSiEOvB5DQz6pfOg4eNRrIVMKI7Pahp+pp14fDvVDmD4ED+Q4vRH60HvLJDj77qqvkhUFcaX47sci6lR4wbxB/atYRQECv+rJbFG/vhq/v+nX22i0ypEaPs7FZy89aqsavXHExiBecRjIOPEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7c673f5f4b6so5871073a34.1
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 07:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764947005; x=1765551805;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZKFrS8XaCz5ZAVZPhJSZM2i//Nrp4m2i8bb62103AU=;
        b=X/6jWiRWWXyf6tm7CrB7S1fU2x6Tbnbx07jzxUEG2xCibxVHGPIGOYQYqoBpOIu3Qy
         KY4/e3lU1Mj9ZFgwx7IjD3P2w8igd98A/uR/bYTexZvoGKEmkREfpF6pARNW8QcsaaOx
         5UWBnlXC0f9xS6jpJ1b0JgJFfHL66D289FVJTzu401qq7UJPmmoq3ErtomzoBxcKj48O
         CJ1XsA6zuSiSSRp4X30RVp7E+pQjXF6kSxghSTJFqpPlk9S/+wI1/uMapCAbFrmlPfiw
         /vOHo4fBUraDwrOEQLfwbmUskZnm8CUX6gQ6ocA8GpHh8rKW40Z1qgb7gQ4qrXlap7ys
         T6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFfEE9bo/my+su9SUHnHNHxqKQYEhuu+X6hCFO3oDB126ebg3QwvLEoKq+KDvbF8ufwfiKip/J1Bj38A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiki/VZ+tlyKKarScYICxk+KOPiZZx90ygehIX4kSbdmXcEmmq
	FhCip9mWs2u6eV9UKxhj0Z4FhFRw9iJ6wEsa3Zaj/yaYW1nUXixq3q99lVQIilGi7Tsu4UvLzv4
	JEsEyLkUXZ7lwyoKlnYZc5dmkotPl4g++GTg8eUKPmdFk9T8kl+g2KuIyoIg=
X-Google-Smtp-Source: AGHT+IHoCMSNZxkfLUxmG4WkZE2nzhRHxjsZBfDI/5hxG3CFpHHTxb4vc9kfXHV2SzD2x6XCnzwyVNRUAkEnBfJafNtJQOFsy/r3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3008:b0:441:8f74:fc8 with SMTP id
 5614622812f47-45379ddf7c9mr3526983b6e.53.1764947005487; Fri, 05 Dec 2025
 07:03:25 -0800 (PST)
Date: Fri, 05 Dec 2025 07:03:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6932f43d.a70a0220.38f243.0002.GAE@google.com>
Subject: [syzbot] [pvrusb2?] [usb?] WARNING in pvr2_send_request_ex
From: syzbot <syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com>
To: isely@pobox.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, pvrusb2@isely.net, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7d31f578f323 Add linux-next specific files for 20251128
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12e42192580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec890b8333fce099
dashboard link: https://syzkaller.appspot.com/bug?extid=405dcd13121ff75a9e16
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10de0512580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17392512580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9bcc6eb60940/disk-7d31f578.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/895bc1bfae48/vmlinux-7d31f578.xz
kernel image: https://storage.googleapis.com/syzbot-assets/48f15e4679f3/bzImage-7d31f578.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com

pvrusb2: Invalid read control endpoint
------------[ cut here ]------------
URB ffff88814e172b00 submitted while active
WARNING: drivers/usb/core/urb.c:380 at 0x0, CPU#0: pvrusb2-context/2345
Modules linked in:
CPU: 0 UID: 0 PID: 2345 Comm: pvrusb2-context Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:usb_submit_urb+0x7e/0x18d0 drivers/usb/core/urb.c:380
Code: 89 f0 48 c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 07 cf 20 fb 49 83 3e 00 74 40 e8 6c 82 ba fa 48 8d 3d e5 1e c8 08 48 89 de <67> 48 0f b9 3a b8 f0 ff ff ff eb 11 e8 51 82 ba fa eb 05 e8 4a 82
RSP: 0018:ffffc90004f268a0 EFLAGS: 00010293
RAX: ffffffff870770c4 RBX: ffff88814e172b00 RCX: ffff88802a5c8000
RDX: 0000000000000000 RSI: ffff88814e172b00 RDI: ffffffff8fcf8fb0
RBP: ffffc90004f26b00 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1f85a8f R12: 0000000000000cc0
R13: ffff88806783d5f8 R14: ffff88814e172b08 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125a03000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f910bc43e9c CR3: 000000000e13a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 pvr2_send_request_ex+0xc2a/0x2030 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3676
 pvr2_send_request+0x38/0x50 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3819
 pvr2_i2c_read drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:130 [inline]
 pvr2_i2c_basic_op+0x44e/0x930 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:172
 pvr2_i2c_xfer+0x9e3/0xda0 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:445
 __i2c_transfer+0x871/0x2110 drivers/i2c/i2c-core-base.c:-1
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:470 [inline]
 __i2c_smbus_xfer+0xf80/0x1e40 drivers/i2c/i2c-core-smbus.c:608
 i2c_smbus_xfer+0x275/0x3c0 drivers/i2c/i2c-core-smbus.c:546
 i2c_smbus_read_byte_data+0xfe/0x1c0 drivers/i2c/i2c-core-smbus.c:143
 saa711x_detect_chip drivers/media/i2c/saa7115.c:1710 [inline]
 saa711x_probe+0x1c1/0x1570 drivers/media/i2c/saa7115.c:1816
 i2c_device_probe+0x87e/0xc00 drivers/i2c/i2c-core-base.c:592
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0xad0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:831
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:500
 __device_attach+0x2b8/0x430 drivers/base/dd.c:1031
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1086
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb80 drivers/base/core.c:3689
 i2c_new_client_device+0xa11/0x1150 drivers/i2c/i2c-core-base.c:1019
 v4l2_i2c_new_subdev_board+0x86/0x250 drivers/media/v4l2-core/v4l2-i2c.c:81
 v4l2_i2c_new_subdev+0x14a/0x1e0 drivers/media/v4l2-core/v4l2-i2c.c:136
 pvr2_hdw_load_subdev drivers/media/usb/pvrusb2/pvrusb2-hdw.c:-1 [inline]
 pvr2_hdw_load_modules drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2074 [inline]
 pvr2_hdw_setup_low drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2155 [inline]
 pvr2_hdw_setup drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2261 [inline]
 pvr2_hdw_initialize+0xe18/0x3ac0 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2338
 pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:111 [inline]
 pvr2_context_thread_func+0x487/0xaf0 drivers/media/usb/pvrusb2/pvrusb2-context.c:158
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
----------------
Code disassembly (best guess):
   0:	89 f0                	mov    %esi,%eax
   2:	48 c1 e8 03          	shr    $0x3,%rax
   6:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 07 cf 20 fb       	call   0xfb20cf1c
  15:	49 83 3e 00          	cmpq   $0x0,(%r14)
  19:	74 40                	je     0x5b
  1b:	e8 6c 82 ba fa       	call   0xfaba828c
  20:	48 8d 3d e5 1e c8 08 	lea    0x8c81ee5(%rip),%rdi        # 0x8c81f0c
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  34:	eb 11                	jmp    0x47
  36:	e8 51 82 ba fa       	call   0xfaba828c
  3b:	eb 05                	jmp    0x42
  3d:	e8                   	.byte 0xe8
  3e:	4a                   	rex.WX
  3f:	82                   	.byte 0x82


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

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

