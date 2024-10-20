Return-Path: <linux-media+bounces-19923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411A9A52EA
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 08:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E730F1C21376
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 06:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D6718052;
	Sun, 20 Oct 2024 06:44:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D78F14A90
	for <linux-media@vger.kernel.org>; Sun, 20 Oct 2024 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729406671; cv=none; b=MHts6YtNsdEgMKXO/LGCvJ4tptsysEzhccY+Y55H0jGZT0m9aZ/6EVjdMEVVhUM1X4knUL6cO/yqr2Wfmc68vxsXcPmmEX4Z0aSXgGKu/JIMQneGUTLoTnYmCIcW7gaRd3j8gXjcwY+GpwpfLN/nosPSmjQqjMKG6wpABp3RA4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729406671; c=relaxed/simple;
	bh=V3fNttd2n0ql5uASrbgLMeCI4WtK3rqH9eK8HXoqvv4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fJmEQGDP+DlU4QZNYo4TvNvtQjw2biY6VeTKOltzXY91qJpswjYOkuIfImees4f2MsM5b0dSFawRaJoA9KtEHGJddgwECyLQSvkWxIgBO9QlyEX9GXG5HVOYxYK8svcST7dQO4mF6ewJupaRioB2Ubap+0TOfcxLivq415AqVn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a3ae775193so36010095ab.1
        for <linux-media@vger.kernel.org>; Sat, 19 Oct 2024 23:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729406668; x=1730011468;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bd1fL7aS05DYOnfvYcKYEq0K4IvNygpjLfYe3E0oh04=;
        b=uScL9gF7VNDeZJ5LRt7mDBlYPKU2bfCdtXzNt1yb6Mt190oCMkkM4AyQ2PjJpRfZPT
         NCGd3I4nRhlR1ee7WT700hZnkHpexs9Ee9L/AG+qrHBP9b21bl8fL+fSwzwp/BTok/Ae
         zwu6FM7CngkOWdvNcOmzSeAfdNnc0vT2PtHZQagG/4geee475a90vwu6j0zVghe5K7Rx
         k5b4tbr7qiSjf8HuvJZC4wb885WNCqBRekL2F7WMVswAc+Oi1TRdA5+RiktMp182zXoS
         eDcXeyKlkOhkr1G/zgaQnRaPKiX/nCHmNICoVpPWQRD25cRog9q0eSOvo/KysI5tCm8W
         DP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQEaHxerrIfxI3FFDRPujdIU0sxpsSiZaeqTFp68vna7cQ3PLsyNnQ7ZTjTiyjdi6LM9Z5Hg+79rfYiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe0rEVm04/fqP73oA/XsEp+lu2evqkWVhOad6FJvjCz5WbrNHZ
	jndSb8oKZwY7J/OzR2hQTbZcFH2cwRrIkT6U+z1jxgHA6xHo2eOkMYoEEag9csMflQG0seIAKXw
	4/+1p6/oRkCfMbYGFgSmYpSu3zSbCujy87bgwWKZ+bFCSPv9/2A9ku58=
X-Google-Smtp-Source: AGHT+IHA/beOU/s52aJdDpURlTjcgZTMwCHn0pYfQlC9jGVSxlKa6YaJiS7C/2mxZHc9Vcxoczzt9alSPoSGEEoAKFpeXLU3jp/P
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a83:b0:3a3:b254:ca2c with SMTP id
 e9e14a558f8ab-3a3f40b5b9cmr63228105ab.25.1729406668673; Sat, 19 Oct 2024
 23:44:28 -0700 (PDT)
Date: Sat, 19 Oct 2024 23:44:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6714a6cc.050a0220.10f4f4.002b.GAE@google.com>
Subject: [syzbot] [media?] WARNING in uvc_status_unregister
From: syzbot <syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, 
	ribalda@chromium.org, senozhatsky@chromium.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    15e7d45e786a Add linux-next specific files for 20241016
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14a8f887980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c36416f1c54640c0
dashboard link: https://syzkaller.appspot.com/bug?extid=9446d5e0d25571e6a212
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1483e830580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10560240580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cf2ad43c81cc/disk-15e7d45e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c85347a66a1c/vmlinux-15e7d45e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/648cf8e59c13/bzImage-15e7d45e.xz

The issue was bisected to:

commit c5fe3ed618f995b4a903e574bf2e993cdebeefca
Author: Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu Sep 26 05:49:58 2024 +0000

    media: uvcvideo: Avoid race condition during unregister

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12554240580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11554240580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16554240580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com
Fixes: c5fe3ed618f9 ("media: uvcvideo: Avoid race condition during unregister")

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
usb 1-1: Found UVC 0.00 device syz (05ac:8600)
usb 1-1: No valid video chain found.
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 1166 at kernel/locking/mutex.c:587 __mutex_lock_common kernel/locking/mutex.c:587 [inline]
WARNING: CPU: 0 PID: 1166 at kernel/locking/mutex.c:587 __mutex_lock+0xc41/0xd70 kernel/locking/mutex.c:752
Modules linked in:
CPU: 0 UID: 0 PID: 1166 Comm: kworker/0:2 Not tainted 6.12.0-rc3-next-20241016-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:587 [inline]
RIP: 0010:__mutex_lock+0xc41/0xd70 kernel/locking/mutex.c:752
Code: 0f b6 04 20 84 c0 0f 85 18 01 00 00 83 3d 36 20 49 04 00 75 19 90 48 c7 c7 20 b9 0a 8c 48 c7 c6 c0 b9 0a 8c e8 00 0f 81 f5 90 <0f> 0b 90 90 90 e9 bd f4 ff ff 90 0f 0b 90 e9 cf f8 ff ff 90 0f 0b
RSP: 0018:ffffc90004516980 EFLAGS: 00010246
RAX: 44423ff48d37de00 RBX: 0000000000000000 RCX: ffff888027929e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90004516ad0 R08: ffffffff8155d7b2 R09: fffffbfff1cfa3e0
R10: dffffc0000000000 R11: fffffbfff1cfa3e0 R12: dffffc0000000000
R13: ffff88814bd82518 R14: 0000000000000000 R15: ffff88814bd824e8
FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ffca8e3610 CR3: 000000001e3f4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 class_mutex_constructor include/linux/mutex.h:201 [inline]
 uvc_status_suspend drivers/media/usb/uvc/uvc_status.c:375 [inline]
 uvc_status_unregister+0x2f/0xe0 drivers/media/usb/uvc/uvc_status.c:297
 uvc_unregister_video+0xeb/0x1c0 drivers/media/usb/uvc/uvc_driver.c:1947
 uvc_probe+0x9135/0x98c0 drivers/media/usb/uvc/uvc_driver.c:2272
 usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2b8/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3675
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
 device_add+0x856/0xbf0 drivers/base/core.c:3675
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

