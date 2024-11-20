Return-Path: <linux-media+bounces-21636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F99D3CB3
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2A64B234CE
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 13:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EF21AB6FC;
	Wed, 20 Nov 2024 13:45:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04F1AB53F
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732110332; cv=none; b=fGslthFTFDwvOM+j27JLn/x/Hzm/2ztyDM98CTcw40KyUYIEwmxrsZsEnCEmKm8hUBmpNaeFox49ZkP9KXYDrd9LJpfUtTDHp7uv5nsL+t0JAXoKO0NMxxIdw5jpGSY2Eem/JoUQOnKXZk90+xpoNOirRPAAnEmnQ8Mjl6vUrWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732110332; c=relaxed/simple;
	bh=HHaoBCC8MK64RwHit1JQhYwaHeQLH9QM8pOD53gKPRI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DPBnss8LNOVPyA4SpXCPIYsQAwllwJSSAFGp/8M6cTGPsdq65Dn5ls8PUPsUnVrhSGfSjyNHUdwuxVIrUlbu4KRLGcOxfRS0CN7z+/MkWi7BYfxdxO+Ad4Zcwo1XQTDeLBMImR4YvWa2vTskemjyCN9VS/AMUnlLvKnOdLMB0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a71d04c76dso62598975ab.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 05:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732110329; x=1732715129;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycQjTfS2NOM91awP/bXrJt0XnXXfKhyI2pL/uuArTSY=;
        b=uJ4viaLKxvyaDZoTUx9A7IYqAGw8YxBTXK5TnU7cBknUcGgomATArGerrZeTQR5fF4
         8P/S6rUd5GnPglq2/smkGBvXIvtAp3+62NOCoE1AdqO/W9Onb57jI6Qw4Cke1Atidcn5
         QkRZn3pY9pLXWB+7Eb8bSt6x3znR6AXIl3U6fo54xCndmh4dplWcfUNcUFVaO5QEcBab
         t5/r3WG/LSEOqt0GTc5fB06MjpXqwzLtV7bg66Rs3TQsdmBssM5cUfLLAT8LGZ7Brvsq
         iJGpTKcJqtRHOjIbXBFGgw4AzxjOmHgYl34VttpWvKrUHvsxyMFKd/kU+ikxlYUrn4R+
         umfA==
X-Forwarded-Encrypted: i=1; AJvYcCXtN8SocD4y4F6b8EcHAZjwPAyU7w9DljRsmA+mz+seRIk6xb4+MTYzoU6JBotuvyIkTfoeQhM7Hzy3yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZE1ueCMrY9MBer1S/DqXxtmDzLxzY9fNv3VmuCCD4JXmcIIX2
	kHr5sPvLvEshAS6BUzToHufHUATeQ45luN7xyt1Qn16SUSjhg+xUF4AsLm9i6oCjsp5FyVOv9u/
	VvvcD8wx4vgwQt+oFRdRTggr/rp0DN0XXRlKg5+e9nltpiKvde5R31YQ=
X-Google-Smtp-Source: AGHT+IH3ad3T4hqc4asFT+D/H0cLBeVbVwxflb+dKyaNJA3S9UIzmGps4B/nbsOee5ELbKoSC1Rbu6wLAQc02EMCjv44hZeJstqA
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b03:b0:3a7:7ee3:108d with SMTP id
 e9e14a558f8ab-3a7865a9107mr32230585ab.23.1732110329481; Wed, 20 Nov 2024
 05:45:29 -0800 (PST)
Date: Wed, 20 Nov 2024 05:45:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673de7f9.050a0220.363a1b.0011.GAE@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in iguanair_get_features/usb_submit_urb
From: syzbot <syzbot+e3ae1e7f4b88f3e696f5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f868cd251776 Merge tag 'drm-fixes-2024-11-16' of https://g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=175892c0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2aeec8c0b2e420c
dashboard link: https://syzkaller.appspot.com/bug?extid=e3ae1e7f4b88f3e696f5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10edf1a7980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d892c0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/50674231b58f/disk-f868cd25.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c6a8d7f6f69f/vmlinux-f868cd25.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5b4f3e883f4a/bzImage-f868cd25.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e3ae1e7f4b88f3e696f5@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
------------[ cut here ]------------
URB ffff88802128ea00 submitted while active
WARNING: CPU: 0 PID: 972 at drivers/usb/core/urb.c:379 usb_submit_urb+0x1039/0x1930 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 0 UID: 0 PID: 972 Comm: kworker/0:2 Not tainted 6.12.0-rc7-syzkaller-00187-gf868cd251776 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0x1039/0x1930 drivers/usb/core/urb.c:379
Code: 00 eb 66 e8 f9 b9 5b fa e9 79 f0 ff ff e8 ef b9 5b fa c6 05 4c a6 cd 08 01 90 48 c7 c7 80 21 b1 8c 4c 89 ee e8 48 b0 1c fa 90 <0f> 0b 90 90 e9 40 f0 ff ff e8 c9 b9 5b fa eb 12 e8 c2 b9 5b fa 41
RSP: 0018:ffffc9000378ec50 EFLAGS: 00010246
RAX: 60687f36e4038100 RBX: 0000000000000cc0 RCX: ffff88802606bc00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffff88802128ea08 R08: ffffffff8155e312 R09: fffffbfff1cf9fd0
R10: dffffc0000000000 R11: fffffbfff1cf9fd0 R12: ffff88802fb894a8
R13: ffff88802128ea00 R14: dffffc0000000000 R15: ffff88802fb89400
FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005653c9143738 CR3: 0000000028d30000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 iguanair_send drivers/media/rc/iguanair.c:193 [inline]
 iguanair_get_features+0x1c8/0x7c0 drivers/media/rc/iguanair.c:218
 iguanair_probe+0xb1c/0x1540 drivers/media/rc/iguanair.c:438
 usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2b8/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3672
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294
 really_probe+0x2b8/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3672
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d6d/0x5150 drivers/usb/core/hub.c:5903
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa63/0x1850 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
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

