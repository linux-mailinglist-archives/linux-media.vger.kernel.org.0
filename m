Return-Path: <linux-media+bounces-18401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA997CB3D
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 17:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 806BA1C217EF
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 15:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D71B19EEC0;
	Thu, 19 Sep 2024 15:00:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC4134C4
	for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758025; cv=none; b=B0Iml8UY7K5EeqFtsnTAjIJ0wImVqXBFDV0juf3zoiSza2mIaCf3SWBMPoVKhlM6Q29HJ/rSliyP6jbXR38YVyL84nvLqn/3Lg3FjeB6/KoNLH6awGEBIA/gP4PURc/RJCJBdNp/T5g+fH+MN9NS6nmGvdoaEUVMd50FSTUz3kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758025; c=relaxed/simple;
	bh=RtZAc11JkGkK0nfVsT/wk1fA1akbQA0MuHauWDlMoiw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=EK8gbeDfgQUEwcnA2v44UiRO9sx0ltSa8FT3yugaLbN1FoM8cC4N4rtDOnhJ13AAeaWUJrha4PFmAkiIrA7JR2C/aRpuih9JViGedxejqbAe/3b9kLwjTvsd8IgUneEAqhANxn7GUnnyc4DfGe4KhV8pZWesCcxTXEz/nFKec8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-82cda2c8997so130505839f.0
        for <linux-media@vger.kernel.org>; Thu, 19 Sep 2024 08:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726758020; x=1727362820;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWsfqOtP48O9v6SvCaxtO2hK13tGEa5J1JaeeZpFiK8=;
        b=JZZdmogCkNXYaXkP0IMUIYuW1Z8rVBuRmxwapkyykkZ2d21C8WLy/p9J8xWbM3hymr
         7bKjKQ5VtLO7SeCffD0pPR20I/8PhqAuOUVJ/P5oXNrRnOxURWzJGbfNpiwOsdh4GVE+
         dY7OnkqOEEbKeMAyz2xVaGFChkBvPGcrl4YDJdi8k4u9AE9zu+wUAGafAMqJMjRg65+t
         ++fUETTWtwA2/jIPbY2Bmr3SYuYn5DIwAucIL/AnlAdz5FNleSL/5zmB/uL7ntmiVhAs
         CV02syhlsv/mathUDD2XzknUqByBBgzoigtuv9EGYEd/BvZlACQhJXWYzd0G37zXY8MR
         7WRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3J+2ycOPOPt/kOEyutHRXqNbfBECpiC5AoAC9ALoLT6o7C4iWxbGxXO3v8DRnWyKhR430bCeD0jycg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVyLbzLHiWyROLkqEFcP8IP84DboarkiRjPypN2lEoIVqr1ZDP
	zRpEb1IDd9fxT2XRBZrPQIiIniq6Slm/NDstwnl9aNwVELroDBeyVPsTATea/Ctag1Dxa2xwEeN
	f5pjp7C8JA0iqJHEKh/JB7/WsT7cjH4pNHhsfh9/g/XQk6UhRtNz1zaU=
X-Google-Smtp-Source: AGHT+IGM5vjFQeR3W6EpU71z3i9kaPjqxbZeyMhXaVCV3nccHXXUarWSRUyivSb+p47FA1K6y6A6Hb9t+KAZaNAxjA5OS3ws8ID9
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3419:b0:82d:1cf:5e0c with SMTP id
 ca18e2360f4ac-82d376aa563mr2426125839f.4.1726758019636; Thu, 19 Sep 2024
 08:00:19 -0700 (PDT)
Date: Thu, 19 Sep 2024 08:00:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66ec3c83.050a0220.29194.002f.GAE@google.com>
Subject: [syzbot] [media?] KASAN: use-after-free Read in em28xx_close_extension
 (2)
From: syzbot <syzbot+a11c46f37ee083a73deb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    68d4209158f4 sub: cdns3: Use predefined PCI vendor ID cons..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=139b97c7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb61872d4d8c5df9
dashboard link: https://syzkaller.appspot.com/bug?extid=a11c46f37ee083a73deb
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1571e797980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11166200580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c69290425359/disk-68d42091.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caf4f26a3e85/vmlinux-68d42091.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3acdec4b62e6/bzImage-68d42091.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a11c46f37ee083a73deb@syzkaller.appspotmail.com

list_del corruption. next->prev should be ffff888112424250, but was 0000000000000000. (next=ffff888112acc250)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:65!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 UID: 0 PID: 42 Comm: kworker/0:2 Not tainted 6.11.0-rc7-syzkaller-00152-g68d4209158f4 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:__list_del_entry_valid_or_report+0x141/0x1c0 lib/list_debug.c:65
Code: e1 fe 90 0f 0b 48 89 c2 48 c7 c7 a0 9e 46 87 e8 05 b1 e1 fe 90 0f 0b 48 89 d1 48 c7 c7 20 9f 46 87 48 89 c2 e8 f0 b0 e1 fe 90 <0f> 0b 48 89 34 24 e8 d4 2e 57 ff 48 8b 34 24 e9 d5 fe ff ff 48 89
RSP: 0018:ffffc900004d76f0 EFLAGS: 00010282
RAX: 000000000000006d RBX: ffffffff89df37a0 RCX: ffffffff813560b9
RDX: 0000000000000000 RSI: ffffffff8135f4f6 RDI: 0000000000000005
RBP: ffff888112424250 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: dffffc0000000000
R13: ffff888112424000 R14: ffffffff89e0d908 R15: ffff888121f0c000
FS:  0000000000000000(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055853d6842e0 CR3: 0000000111614000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:124 [inline]
 __list_del_entry include/linux/list.h:215 [inline]
 list_del include/linux/list.h:229 [inline]
 em28xx_close_extension+0x10e/0x2b0 drivers/media/usb/em28xx/em28xx-core.c:1137
 em28xx_usb_disconnect+0x19d/0x610 drivers/media/usb/em28xx/em28xx-cards.c:4197
 usb_unbind_interface+0x1e8/0x970 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:568 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:560
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1295
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:574
 device_del+0x396/0x9f0 drivers/base/core.c:3871
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xed0 kernel/workqueue.c:3389
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x141/0x1c0 lib/list_debug.c:65
Code: e1 fe 90 0f 0b 48 89 c2 48 c7 c7 a0 9e 46 87 e8 05 b1 e1 fe 90 0f 0b 48 89 d1 48 c7 c7 20 9f 46 87 48 89 c2 e8 f0 b0 e1 fe 90 <0f> 0b 48 89 34 24 e8 d4 2e 57 ff 48 8b 34 24 e9 d5 fe ff ff 48 89
RSP: 0018:ffffc900004d76f0 EFLAGS: 00010282
RAX: 000000000000006d RBX: ffffffff89df37a0 RCX: ffffffff813560b9
RDX: 0000000000000000 RSI: ffffffff8135f4f6 RDI: 0000000000000005
RBP: ffff888112424250 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: dffffc0000000000
R13: ffff888112424000 R14: ffffffff89e0d908 R15: ffff888121f0c000
FS:  0000000000000000(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055853d6842e0 CR3: 0000000111614000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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

