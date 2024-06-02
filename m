Return-Path: <linux-media+bounces-12384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C338D7307
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 03:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAEB4B210E1
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 01:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5E053AC;
	Sun,  2 Jun 2024 01:44:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8F5EDF
	for <linux-media@vger.kernel.org>; Sun,  2 Jun 2024 01:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717292672; cv=none; b=Ya46Dyw15FHlwosuMtXn6vXiOLDW5GsKEpWEpLv14+56AhW2HvoKpZUc7PPnxmLEW9b7BdwmLLDXfHmgFDWaAUIAOsZdI29ApacCn4zSyeezOmxAkM+lSHjO34YqFKo8FcKod93WeUyH3oQn8OpldBXlF+Nfy3xnBw4BtRukA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717292672; c=relaxed/simple;
	bh=L6huh4WFyKIVkBNbX6dnvyVqd/LbRjammXro5OYz/Yg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hBTd1+goxSUjxteE+e2LwzI92uTJfsCkk80MsfMbI2ciCt1eKnVhena191IXNeI/FNInB0XAuO4nILMLEcvFEM3u4WQXKPrTIxVFo4VuslV+xoi0HvEhvNP4tCaYv+oM3EZKU47uBL8y2KRHM7rblt+3FPmQukpp/6SGrAHR7zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-7e69c0762b8so423063639f.1
        for <linux-media@vger.kernel.org>; Sat, 01 Jun 2024 18:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717292670; x=1717897470;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/E2HjWx2Ed6dFkXX1+r4wbdkwC7c6bpCT2rElMK7a8=;
        b=gP9kUPfkFpw45AgiKy2rHnXs/iifebm3FcdSlHwubbrcavDiQtsoyMXSPiVf5pi1Go
         +8lCPOsOuJeLRDH/SoDReSDB6jGlaoNNKCRXGiHxW6Uyee1I6sDy0i2VuHJWdGs+sj+m
         W4bUY7sbjt+Eiy7Y9Cu5AHPb40i5Q2B1s0vG3bRACSE/lBksVMwji1Yn5gQcfWvl76H8
         yMHAnDgyQcH3jQBdkzQOhjmBVFtexjlNE4wHoX7FhHG0sF2B23vM1f1sv/APuAZpVh9d
         YFkODMyS7rcbOENmaCNKPZ9mStUv5e/QGsX8gqEeeH2lRJOfS11TMCimIrGKtbssYSo7
         w3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWczcMlYeelVScGZKG+exv2cSaSFhl+EiZ0drL+wOi2tD3y9g7vNICmqCkhoskB7O0OK2fHj9dillrWOYB1VE3cd6PeZnrguFbNW8A=
X-Gm-Message-State: AOJu0YxhxY7vUK6XpGpSTO0pxTNKm3HV40nl2iiyNsoVF7N4YqqcuC4U
	gGWVegz7+7wXy7Mv1pylY4beXLJb5OZezeFw/nAgdSIzUlVW3J32lyf/ZDF3JINsln9KpumhCDH
	R5zXH5k+YQYbBEe8QkPKYdOZK9p0sxvcpSe2v5mCqufe1XTq2QN0jwfg=
X-Google-Smtp-Source: AGHT+IHXplj+0MNWzfVC72xih9Sii5ngPfH5O60jBILqhsEw5CMXbNzF1Pz9GrlfgFQVjONUdaJYA4q0jm6lX9bTNXEHaEfHBU5I
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:640f:b0:7de:da9b:21f4 with SMTP id
 ca18e2360f4ac-7eafff0ac29mr47505339f.2.1717292669999; Sat, 01 Jun 2024
 18:44:29 -0700 (PDT)
Date: Sat, 01 Jun 2024 18:44:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000922b0b0619de5b8f@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in usb_free_urb
From: syzbot <syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e0cce98fe279 Merge tag 'tpmdd-next-6.10-rc2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15c9b13c980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=238430243a58f702
dashboard link: https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f3e2fc980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=157ada62980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-e0cce98f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5a8fbe5a0be1/vmlinux-e0cce98f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1f8ed6b81845/bzImage-e0cce98f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com

usb 5-1: Product: syz
usb 5-1: Manufacturer: syz
usb 5-1: SerialNumber: syz
smsusb:smsusb_probe: board id=7, interface number 55
smsusb:smsusb_probe: board id=7, interface number 147
smsusb:smsusb_probe: board id=7, interface number 0
smsusb:siano_media_device_register: media controller created
smsusb:smsusb_start_streaming: smsusb_submit_urb(...) failed
smsusb:smsusb_init_device: smsusb_start_streaming(...) failed
------------[ cut here ]------------
WARNING: CPU: 2 PID: 55 at mm/slub.c:4519 free_large_kmalloc+0xda/0x140 mm/slub.c:4519
Modules linked in:
CPU: 2 PID: 55 Comm: kworker/2:1 Not tainted 6.10.0-rc1-syzkaller-00021-ge0cce98fe279 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:free_large_kmalloc+0xda/0x140 mm/slub.c:4519
Code: 56 fb 8b 43 34 85 c0 75 c7 48 c7 c6 90 f0 26 8d 48 89 df e8 e8 08 f1 ff 90 0f 0b 48 89 df 5b 5d 41 5c 41 5d e9 47 a2 e4 ff 90 <0f> 0b 90 80 3d 3c b9 ee 0d 00 74 28 48 8b 74 24 20 48 89 ef e8 bd
RSP: 0018:ffffc90000a76e18 EFLAGS: 00010246
RAX: 00fff00000000000 RBX: ffffea0000c9d880 RCX: ffffffff813e21dc
RDX: ffff88801a924880 RSI: ffff888032762000 RDI: ffffea0000c9d880
RBP: ffff888032762000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88801ade0000
R13: ffff88801ac2b000 R14: dffffc0000000000 R15: ffff88801ade00f0
FS:  0000000000000000(0000) GS:ffff88806b200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f66ab5c8388 CR3: 000000002a16a000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 urb_destroy drivers/usb/core/urb.c:25 [inline]
 kref_put include/linux/kref.h:65 [inline]
 usb_free_urb.part.0+0xf8/0x110 drivers/usb/core/urb.c:97
 usb_free_urb+0x1f/0x30 drivers/usb/core/urb.c:96
 smsusb_term_device+0x108/0x1e0 drivers/media/usb/siano/smsusb.c:352
 smsusb_init_device+0xaa2/0xe10 drivers/media/usb/siano/smsusb.c:497
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
 device_add+0x114b/0x1a70 drivers/base/core.c:3721
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
 device_add+0x114b/0x1a70 drivers/base/core.c:3721
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2db0/0x4e20 drivers/usb/core/hub.c:5903
 process_one_work+0x9fb/0x1b60 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf70 kernel/workqueue.c:3393
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

