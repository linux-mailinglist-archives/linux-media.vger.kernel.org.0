Return-Path: <linux-media+bounces-23850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1C9F8D43
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 08:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A77A916AB54
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 07:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507A91A0BCF;
	Fri, 20 Dec 2024 07:27:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8918A6D3
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 07:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734679647; cv=none; b=LpuNXNwBmmrU9WJtwUItxlDgaRBWE2c+EB6HBAskWM6hRgSUvVI1vLHMu8Zkw50F9SdOYD+ZoTkeC1ZuKsaK4KHfaQbPCUjpnHDvDzleZW8P9U8nTz7s63ANy45gSX02VVvZTuYe1fjL07j5xFbRJYPOxwyDWUsfJwYVmir5gnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734679647; c=relaxed/simple;
	bh=i8eOHYy5NsAmxw897ERmZwbSHruLrFigCsAl5lIIfqI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=T1mZFM3Wmh9UJzL5CXnqw75IlA7wmciJ5AVF3ZH/3mk9E2xEZD79CqfN7D0/k/tSXa/s1oQWxGCpXqnZ7kwe+jAoQpoXzgJ23JQqG/dUXwF1AAOBLGgicwT73kyC16PWMDAyUHBXgh8WNXFzEvAyasTcX45prNFEtVYuo6yYvpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-83e5dd390bfso232921939f.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 23:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734679645; x=1735284445;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8SgrZxYh1O1O2y4MCABle9M1j/2XwX6SLZ5HofzLzo=;
        b=XFL3/PqhEfNEq0neXhp87XaCqfw76lqdQxguSiwM5pbCnh4zCF2pbGLkz6Kee/ADMU
         T7rAXOvev6jKcxkQL0NSBqkG2wPhDaxW8haFMJLTIfoovCzJr6f1v2pDVv8z+7SRXfeb
         Fq2n4zSg6IeGKe2+gzsgdhDtFio/mW/PabFVPwHriYHpupt7GxFU0rbRI/acmQBRTzdI
         qWM+a4SHF77s7qmprqmnUJlw/KHuF52X3AB0Z2Fwor65KtIdgE/vjhNxdc5l4tyVyvUh
         qSdM0/WErSgV42vtMl4tikivYmypymHvBhCAytxxDwTq3QZYNIBRRAjY4qzcdAu0dg1Y
         H8+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWW7FamE0aRyIFcwN6ovzXvOeLKMsZgnMfiZFcaoVCWXt9mB5DFW1RlGL4rakpHrKRSxrflNMqnbzwwiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqzkFfzUkfQ7q4d+aLkjUmU19XNKRnIxJLy5k0BEwPx462zk4j
	POk+vl9GNnBFGPKy95iBenbxz+eX81tARJhsLmb+8FrfTPlrIDI83fptBm7ZQ3a14PlNOHOeOCc
	q2/mElr406sLkaZaPwzUQ4tzZWAoIovB+JSQoTrNjEr/J7bBwODgrsYI=
X-Google-Smtp-Source: AGHT+IED0ssTdFV0LD8i+RzUb0F0rsoJp1cd5dT8hkfLgrMc1fH+KnxCIG8QVJTDhhgu2ciYJWt8RI9+e4su4pj+zhBUwi8NhkQw
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198c:b0:3a7:a58b:557e with SMTP id
 e9e14a558f8ab-3c302627786mr14933065ab.12.1734679645548; Thu, 19 Dec 2024
 23:27:25 -0800 (PST)
Date: Thu, 19 Dec 2024 23:27:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67651c5d.050a0220.1bfc9e.0007.GAE@google.com>
Subject: [syzbot] [media?] WARNING in uvc_unregister_video
From: syzbot <syzbot+e565008f33c121ad8cbe@syzkaller.appspotmail.com>
To: hdegoede@redhat.com, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d8d936c51388 usb: storage: add a macro for the upper limit..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=131b1730580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9666422a569a9b7d
dashboard link: https://syzkaller.appspot.com/bug?extid=e565008f33c121ad8cbe
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b5f0fe63d6bf/disk-d8d936c5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/16c74d2e64c7/vmlinux-d8d936c5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/00ab13339c70/bzImage-d8d936c5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e565008f33c121ad8cbe@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 19150 at kernel/locking/mutex.c:564 __mutex_lock_common kernel/locking/mutex.c:564 [inline]
WARNING: CPU: 0 PID: 19150 at kernel/locking/mutex.c:564 __mutex_lock+0x369/0xa60 kernel/locking/mutex.c:735
Modules linked in:
CPU: 0 UID: 0 PID: 19150 Comm: kworker/0:9 Not tainted 6.13.0-rc1-syzkaller-gd8d936c51388 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/25/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:564 [inline]
RIP: 0010:__mutex_lock+0x369/0xa60 kernel/locking/mutex.c:735
Code: d0 7c 08 84 d2 0f 85 6d 06 00 00 8b 0d 70 f9 63 03 85 c9 75 19 90 48 c7 c6 20 ea 27 87 48 c7 c7 80 e8 27 87 e8 e8 5f 2d fa 90 <0f> 0b 90 90 90 e9 f2 fd ff ff 4c 8d b5 60 ff ff ff 48 89 df 4c 89
RSP: 0018:ffffc90011e7eeb0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff88813754e518 RCX: ffffc9000fe18000
RDX: 0000000000100000 RSI: ffffffff811f5886 RDI: 0000000000000001
RBP: ffffc90011e7eff0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000750c78 R12: dffffc0000000000
R13: 0000000000000002 R14: 0000000000000000 R15: ffffc90011e7ef30
FS:  0000000000000000(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f94f51d9160 CR3: 000000011d072000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 uvc_unregister_video+0x126/0x250 drivers/media/usb/uvc/uvc_driver.c:1977
 uvc_probe+0x2bf1/0x4950 drivers/media/usb/uvc/uvc_driver.c:2302
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2e58/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

