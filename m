Return-Path: <linux-media+bounces-28460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4849A685A2
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 08:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6C7519C40F7
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 07:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BEC24EF7F;
	Wed, 19 Mar 2025 07:16:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2D211463
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742368590; cv=none; b=rKfpW17JwGz0oI1nzw5tHgbcYHWUP1Aov+rHnw46uEi0cFFQW/zkj0YdyyTJwN65kjT7LuGfNs7rPeG3P6n3GJPzKLR2SFyJfgUBZKkY9wb1OWeiPADanRj0xp+3IyoqrICETbICzgjKXgHNl1ftFbA3QKlzgdp0Cb0l+Yb8Hjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742368590; c=relaxed/simple;
	bh=CC7DRDtrFvkxYQtn3kfZJFOhKEzGVTL4FB9WynWstlU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kNCk1HlNcXwCiXHoyOkpD/qCP7LykBXS3eTSYHDTSKvVgbsP43mM+DcOxjN+T4r62Wi2DdgXgY6OFMkbGmFg6sQ/QiHG3tnU9C2SYDPQNuJvEVhN0QhL1sCZ2+juZXCm2hqAIWMkpmR1q2IE0/7hObuwlP4AhAAIy3MCPZohh/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-851a991cf8bso37878239f.0
        for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 00:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742368587; x=1742973387;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JpfHRhd3cZqCv/ShofI+lV++ZteeaYec28PjSosO4Y=;
        b=CXV6cU6U23gQlpP0RXpRZt29ctHQ7/DQSvUqupBA2yt5Lvp2jwmCnBbmCeVsEbs+8q
         a4c3NzJC7m3rChE7J6AFGWJJwrPiC6gukCsEvYVronjx1tL+axTrxKEdFUM1nBbMv9cF
         cpmW/89rhTYiOE+mrva2uz9SVC8SFIjeN86c2cVyZ3/hdbJoEFre/bJK5y83aZSmMoUs
         oYxFiwkd7Ywo2kYQVqtx8+7adSdR5QDaeQUnaP/DwwcJiNmNqmSRXxf26rGmnfRJ8SQh
         FjLqLgRT3t9WmvuT9PagxaMRoicF064sQP+47eY+Yqe/5kCIJnKcBvCMtUFsNz+ZS1bB
         z0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVW0oZ9IsCXE2Wgs/T+QQhDPD7EzPsdpYHZIS26tL5fRitJ3MFmaac+he8UeqHerNzKKI5REc8apbcyaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WuQDftvuOWL9NfZr61YCcwPVezo0DSzu0sYTC19kXrF69tVB
	EkC/P6Jkuxi3yKlV8Lh1U3quCCitfnolTeZUzcQjsjuwhUCvxRS6PK5cLf8TB7yZIt8c6rJfXdj
	Dkc6t3EEuQ+id7RWsOormw4I/6iq+lj9kGdX1De4m7LbY18YF6HdD64U=
X-Google-Smtp-Source: AGHT+IFVsMa7mvYecZQOmiCe4H9qLGvCcN6wJuiI+m/B3W9zZtW7EwARBsUWZp6QwYfofNG8b2hOTkUl5xo/A0Uh4NjMdwlSf3gy
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a24:b0:3d3:f72c:8fd8 with SMTP id
 e9e14a558f8ab-3d586eafb52mr13943225ab.6.1742368587460; Wed, 19 Mar 2025
 00:16:27 -0700 (PDT)
Date: Wed, 19 Mar 2025 00:16:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67da6f4b.050a0220.3657bb.013b.GAE@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in media_create_pad_link (2)
From: syzbot <syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com>
To: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3a85c1011540 usb: host: cdns3: forward lost power informat..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1590f874580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e0ed68747dbff9
dashboard link: https://syzkaller.appspot.com/bug?extid=701fc9cc0cb44e2b0fe9
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1726ae54580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1390f874580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/eaddfad7c5c2/disk-3a85c101.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d37f14fba48b/vmlinux-3a85c101.xz
kernel image: https://storage.googleapis.com/syzbot-assets/47054ab7f64f/bzImage-3a85c101.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
usb 1-1: Found UVC 0.00 device syz (046d:08c3)
usb 1-1: No streaming interface found for terminal 6.
------------[ cut here ]------------
WARNING: CPU: 1 PID: 25 at drivers/media/mc/mc-entity.c:1144 media_create_pad_link+0x5c1/0x760 drivers/media/mc/mc-entity.c:1144
Modules linked in:
CPU: 1 UID: 0 PID: 25 Comm: kworker/1:0 Not tainted 6.14.0-rc6-syzkaller-g3a85c1011540 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:media_create_pad_link+0x5c1/0x760 drivers/media/mc/mc-entity.c:1144
Code: d8 48 83 c4 28 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc e8 70 7e 65 fc 90 0f 0b 90 bb ea ff ff ff eb d6 e8 60 7e 65 fc 90 <0f> 0b 90 eb ee e8 55 7e 65 fc 90 0f 0b 90 eb e3 e8 4a 7e 65 fc 90
RSP: 0018:ffffc900001aef18 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888118fa0880 RCX: ffffffff8515cf70
RDX: ffff888102689d40 RSI: ffffffff8515d490 RDI: 0000000000000002
RBP: ffff888121e9f880 R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffff8ee92ad0 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000003 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffec100cca8 CR3: 0000000122e30000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 uvc_mc_create_links drivers/media/usb/uvc/uvc_entity.c:50 [inline]
 uvc_mc_register_entities+0x3a8/0xaa0 drivers/media/usb/uvc/uvc_entity.c:151
 uvc_register_chains drivers/media/usb/uvc/uvc_driver.c:2142 [inline]
 uvc_probe+0x2859/0x4810 drivers/media/usb/uvc/uvc_driver.c:2278
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x114b/0x1a70 drivers/base/core.c:3666
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x114b/0x1a70 drivers/base/core.c:3666
 usb_new_device+0xd09/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2e58/0x4f40 drivers/usb/core/hub.c:5913
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3400
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
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

