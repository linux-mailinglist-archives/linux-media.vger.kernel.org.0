Return-Path: <linux-media+bounces-19926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCE29A54EF
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 18:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59DA72835A9
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 16:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19E0194147;
	Sun, 20 Oct 2024 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I1mkg/yA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E72567D;
	Sun, 20 Oct 2024 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729440179; cv=none; b=X0PRtgjzm3tXoztwX6yCsjH2vIy909zDYnx1rWUmMRvYVDuFbg1EpzEJ4SrJYBDRAe3xpJlTeaeuLV++SuFmLS83GhzhpbqKVJP/eu5sUm8AY52GNXkb+rqYJ9/WfoG7Zgk+VB3K7ZAmfL1Rje1jbKu3Kgm1l8G6RvkPBcKpHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729440179; c=relaxed/simple;
	bh=eEqdnT9zeihfovN32kEoloUVe9WbErtbn9U2MC80FII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDiLOah4XlywTW5yrEYGf88GlcvAKWZRdA4J6KOBjFifoF5ORmsZ2/K66cio32s4oW6kQ3uJGahDUKCaSjBsWCK6JrJSg02kFichz/p0iP8qQSFdbO24Lrqdiyy+w1pnxSKqjJNZUoT4oKqVVMLk6bDL8a5upyfzKyxO/Fn9yrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I1mkg/yA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C76F526;
	Sun, 20 Oct 2024 18:01:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729440069;
	bh=eEqdnT9zeihfovN32kEoloUVe9WbErtbn9U2MC80FII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1mkg/yAdmkyZPEEqssKSr8Zk+zkjwO+4T5+PTiWas1aTopJwq6Y4VpPnEjOE7uk7
	 sBeS7h9kEj30KL9U4mjtKaPIiI+kOjDBcOprB3/XT0ftOLuqqggqEncDxLujwJxily
	 TDkEhg+wL0V9fYE0JLHyEUncS3Tna9DHsLl18ojA=
Date: Sun, 20 Oct 2024 19:02:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: syzbot <syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com>
Cc: hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	ribalda@chromium.org, senozhatsky@chromium.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] WARNING in uvc_status_unregister
Message-ID: <20241020160249.GD7770@pendragon.ideasonboard.com>
References: <6714a6cc.050a0220.10f4f4.002b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6714a6cc.050a0220.10f4f4.002b.GAE@google.com>

On Sat, Oct 19, 2024 at 11:44:28PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    15e7d45e786a Add linux-next specific files for 20241016
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=14a8f887980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c36416f1c54640c0
> dashboard link: https://syzkaller.appspot.com/bug?extid=9446d5e0d25571e6a212
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1483e830580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10560240580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/cf2ad43c81cc/disk-15e7d45e.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/c85347a66a1c/vmlinux-15e7d45e.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/648cf8e59c13/bzImage-15e7d45e.xz
> 
> The issue was bisected to:
> 
> commit c5fe3ed618f995b4a903e574bf2e993cdebeefca
> Author: Ricardo Ribalda <ribalda@chromium.org>
> Date:   Thu Sep 26 05:49:58 2024 +0000
> 
>     media: uvcvideo: Avoid race condition during unregister

It looks like the issue comes from the fact that uvc_status_unregister()
gets called from the error path in uvc_probe() through
uvc_unregister_video(), likely for errors occuring before
uvc_status_init() is called. uvc_status_unregister() should return
immediately in that case. Ricardo, do you plan to look at that?

> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12554240580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=11554240580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16554240580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9446d5e0d25571e6a212@syzkaller.appspotmail.com
> Fixes: c5fe3ed618f9 ("media: uvcvideo: Avoid race condition during unregister")
> 
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: syz
> usb 1-1: Manufacturer: syz
> usb 1-1: SerialNumber: syz
> usb 1-1: config 0 descriptor??
> usb 1-1: Found UVC 0.00 device syz (05ac:8600)
> usb 1-1: No valid video chain found.
> ------------[ cut here ]------------
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> WARNING: CPU: 0 PID: 1166 at kernel/locking/mutex.c:587 __mutex_lock_common kernel/locking/mutex.c:587 [inline]
> WARNING: CPU: 0 PID: 1166 at kernel/locking/mutex.c:587 __mutex_lock+0xc41/0xd70 kernel/locking/mutex.c:752
> Modules linked in:
> CPU: 0 UID: 0 PID: 1166 Comm: kworker/0:2 Not tainted 6.12.0-rc3-next-20241016-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:587 [inline]
> RIP: 0010:__mutex_lock+0xc41/0xd70 kernel/locking/mutex.c:752
> Code: 0f b6 04 20 84 c0 0f 85 18 01 00 00 83 3d 36 20 49 04 00 75 19 90 48 c7 c7 20 b9 0a 8c 48 c7 c6 c0 b9 0a 8c e8 00 0f 81 f5 90 <0f> 0b 90 90 90 e9 bd f4 ff ff 90 0f 0b 90 e9 cf f8 ff ff 90 0f 0b
> RSP: 0018:ffffc90004516980 EFLAGS: 00010246
> RAX: 44423ff48d37de00 RBX: 0000000000000000 RCX: ffff888027929e00
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc90004516ad0 R08: ffffffff8155d7b2 R09: fffffbfff1cfa3e0
> R10: dffffc0000000000 R11: fffffbfff1cfa3e0 R12: dffffc0000000000
> R13: ffff88814bd82518 R14: 0000000000000000 R15: ffff88814bd824e8
> FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055ffca8e3610 CR3: 000000001e3f4000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  class_mutex_constructor include/linux/mutex.h:201 [inline]
>  uvc_status_suspend drivers/media/usb/uvc/uvc_status.c:375 [inline]
>  uvc_status_unregister+0x2f/0xe0 drivers/media/usb/uvc/uvc_status.c:297
>  uvc_unregister_video+0xeb/0x1c0 drivers/media/usb/uvc/uvc_driver.c:1947
>  uvc_probe+0x9135/0x98c0 drivers/media/usb/uvc/uvc_driver.c:2272
>  usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
>  really_probe+0x2b8/0xad0 drivers/base/dd.c:658
>  __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
>  driver_probe_device+0x50/0x430 drivers/base/dd.c:830
>  __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
>  bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
>  __device_attach+0x333/0x520 drivers/base/dd.c:1030
>  bus_probe_device+0x189/0x260 drivers/base/bus.c:534
>  device_add+0x856/0xbf0 drivers/base/core.c:3675
>  usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
>  usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
>  usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294
>  really_probe+0x2b8/0xad0 drivers/base/dd.c:658
>  __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
>  driver_probe_device+0x50/0x430 drivers/base/dd.c:830
>  __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
>  bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
>  __device_attach+0x333/0x520 drivers/base/dd.c:1030
>  bus_probe_device+0x189/0x260 drivers/base/bus.c:534
>  device_add+0x856/0xbf0 drivers/base/core.c:3675
>  usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2651
>  hub_port_connect drivers/usb/core/hub.c:5521 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
>  port_event drivers/usb/core/hub.c:5821 [inline]
>  hub_event+0x2d6d/0x5150 drivers/usb/core/hub.c:5903
>  process_one_work kernel/workqueue.c:3229 [inline]
>  process_scheduled_works+0xa63/0x1850 kernel/workqueue.c:3310
>  worker_thread+0x870/0xd30 kernel/workqueue.c:3391
>  kthread+0x2f0/0x390 kernel/kthread.c:389
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

-- 
Regards,

Laurent Pinchart

