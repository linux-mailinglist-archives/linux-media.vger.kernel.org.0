Return-Path: <linux-media+bounces-15405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952093E9B6
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 23:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3591128154F
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 21:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03A26F079;
	Sun, 28 Jul 2024 21:37:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB012B94
	for <linux-media@vger.kernel.org>; Sun, 28 Jul 2024 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722202647; cv=none; b=imKcjsqXJgcdc+roaRdx8nUprgkDng41lFOLyZI9xRL5oivhcm17L+RTiQvVZ9yOkFMZUyS/0ynodHeJB0fXWOEIJN+CjDVsINUcgo5k3Jd1Wu3yIsaY/SYlb2C7sJ5K5DQkwpFPr3vnPH732Q1QyBiGFWVzj5H0vUIP9DxRyYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722202647; c=relaxed/simple;
	bh=HgRXS5kmGOCgZxer6F6Zr5ptUDREp6JRQn2LDBkOJrE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=g5Op6B9uKdmvendnmdWyEGLhi/kEl6ZAy5wzK6V3PqpQJEcjavXPzouc9b9HkAYGKRDV48YlLrXtaV6v9N6B0em3ywa/xHbp3bnETQ00x/rRZ+kWR4DugVhRFTKQBr/zVmpPAwLyV1rl4tWgYwnwN0mDTDy1CzdVKc5HVgOe1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-396c41de481so57532335ab.3
        for <linux-media@vger.kernel.org>; Sun, 28 Jul 2024 14:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722202645; x=1722807445;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VMs5yT871XTf/d0or5t339a635pM6lfyoSiQynkorA=;
        b=NzgZWpFtTBP2iSF14ORc5AVZIDonVfGhg4zYUkI20E4r/H8L6SV9vrDbrmNrkq1aOa
         NQUN/ae8JuFciMgf917RFIHU8gS2kaZEmR0BcYlG6h76j8qI2k7ZNmZ2AcM0JiJ7+8R9
         E2v5naA5B9F42pVbvr0Fa/ls7jw+zvY/mjsWkgskHL6IIVpv7SWkQ12OoMrg1E4hcONF
         Jj6v8pxAyP090jvsBZOpTys9xw82o7n+55kQhHE/S80lV1hStNu+GfPKpmm8LDlc87Xz
         OsWwoylK5j95k4s/G97UskjVyBBhuLyJE3ZZ0UOkyM0wehi4r7rSr+MfdLCEPw2WM8IN
         m1gg==
X-Forwarded-Encrypted: i=1; AJvYcCXNToePK6FJ+2k/m7VYyFbo9Wl8lfogCJpK2DCUH8MlPzhV7mov+CmLQGgW+YEPPOLGI0xcwxacC/UYjRCgf1wdOooLppmZMuC/Og8=
X-Gm-Message-State: AOJu0Yz0hvxCDU03ARf6BvFCPy9XhNfSybMDD3Nrgb9j2E7NmXUVxATs
	p+I3sd1KShTE/sTPoUdQZ2yuFFnBVlYFg/mhi3PG3jAAmL7zAkfNRCm3IH83zzaJHx+JqZWrdpf
	O3hwAVcy5843ytTbem6Z/dgGFi9ujuj+YcZOXTxhy2ffMIy7/W1muyaw=
X-Google-Smtp-Source: AGHT+IGAjEeYPHCfAyETru4FvlFQIbze6r7U27mVuzr7jLjgI0LgUpwC4jQorPN3rm/yYdWuX4/gCPolQln+C37ckSAYFtyFrKVR
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c245:0:b0:382:56bd:dfbc with SMTP id
 e9e14a558f8ab-39aec2d7874mr4739325ab.2.1722202645085; Sun, 28 Jul 2024
 14:37:25 -0700 (PDT)
Date: Sun, 28 Jul 2024 14:37:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e45551061e558c37@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in smsusb_init_device/usb_submit_urb
From: syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    933069701c1b Merge tag '6.11-rc-smb3-server-fixes' of git:..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=10eb7dad980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8cdd6022e793d4ad
dashboard link: https://syzkaller.appspot.com/bug?extid=85e3ddbf0ddbfbc85f1e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10893645980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10885779980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/504e81a2120c/disk-93306970.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/320d2f3e66b3/vmlinux-93306970.xz
kernel image: https://storage.googleapis.com/syzbot-assets/65b8e1c28010/bzImage-93306970.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com

smsusb:smsusb_probe: board id=15, interface number 6
smsusb:siano_media_device_register: media controller created
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 42 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 0 UID: 0 PID: 42 Comm: kworker/0:2 Not tainted 6.10.0-syzkaller-g933069701c1b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Code: 84 3c 02 00 00 e8 d5 d5 2b fd 4c 89 ef e8 dd 14 00 ff 45 89 e0 89 e9 4c 89 f2 48 89 c6 48 c7 c7 e0 8b 30 87 e8 26 c8 f1 fc 90 <0f> 0b 90 90 e9 e9 f8 ff ff e8 a7 d5 2b fd 49 81 c4 c0 05 00 00 e9
RSP: 0018:ffffc900004d6de8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff8881022bf600 RCX: ffffffff81194ce9
RDX: ffff8881036a8000 RSI: ffffffff81194cf6 RDI: 0000000000000001
RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
R13: ffff8881043930a8 R14: ffff88810de96e80 R15: ffff8881022bf67c
FS:  0000000000000000(0000) GS:ffff8881f6400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e21a0c8380 CR3: 00000001154e0000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 smsusb_submit_urb+0x288/0x410 drivers/media/usb/siano/smsusb.c:173
 smsusb_start_streaming drivers/media/usb/siano/smsusb.c:197 [inline]
 smsusb_init_device+0x856/0xe10 drivers/media/usb/siano/smsusb.c:477
 smsusb_probe+0x5e2/0x10b0 drivers/media/usb/siano/smsusb.c:575
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:656
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:798
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:828
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:956
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1028
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:656
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:798
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:828
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:956
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1028
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2e66/0x4f50 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


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

