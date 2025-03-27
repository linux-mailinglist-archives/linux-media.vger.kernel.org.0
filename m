Return-Path: <linux-media+bounces-28865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F9A736CF
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 17:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E18D7A56F3
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 16:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F5A1C6FEA;
	Thu, 27 Mar 2025 16:26:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241A81A0BCA
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092804; cv=none; b=qaB00cfSLAnkmtWviA3u7hlMmebIIP3q5R+lmIJ0McOdOTFK6Ulw5m/VoYUXSCcsosW2RxW8QaDBicy0fUCRVFXvQ7hbmygrQ+HUGkqdM1KIprLNpFDZKqiN50kuqWmzPxqvMkqxYtmZpkE1p2SijmGPXyw/eIMXkXPp0sDXNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092804; c=relaxed/simple;
	bh=UvBcNEB8+4Jw+qZ12tOnWbWX09KN0uw8dO91yt3PQ8s=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=eFPRaPv9IalddCGumCq3RNej7+TG/iMYoBdQEb1cvEb7Zi3+nKvJxCddU8mqs2EqkTxvXCE4sUSHMuKdcr9qMyrptF0ElFdLpKAkRHrVdNzpg3xqXDkwHBA3mj+W8eHaQggK3HAzhUZQpQSOd6SUUYzd79i27PdiQu+19uVWr8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85db4460f5dso202314139f.0
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 09:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092802; x=1743697602;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ebgeVAj2B3dpVuEf9hMsmVGaGTcOb2Qo074ZMxB+Xi8=;
        b=P4fJuB6Ce1T99yaAW8C8zmjgJW2saA00i2G/w7x1eWDfz5oT8L74BuGU4C+l8AEZuV
         wDZ7hyIUHlyga114QK6J9T9jG2cTwfzkGCoae2b+KCwHv/jBYHM+ZZV297ArT6ddO/Me
         8lORNMNTxIZM9oS2+Wi/ZTTwTkJllF/2Ih/1cxqB8+p2VtE83b0VIeIBNAaXZquOYAq1
         0GDPhOcuJHl0ieCBl/BBRhpZHhGW/Y1KrKe3WaKzrvst5OKa8R9KAueMJLM8YL7fhCBg
         XCrwPpEVCcZh3Ne0AU+Ki2CPRXYrpl+/KXJHjuaWNcqjBMXqIrO5/YzPmv6ccPt+G82T
         lM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0sElGdnj/k6x5w8CvZwV3gJ1FyynIdZIziOdrW7rMwHslCU/BwDM/jpp6sp9rVeNp+XMYdcnanmJkng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHgbcGHoaRx1Tv29roPFa00z0hXnOgkgxZOoAlb74vwDHr3RI3
	mfC68NtRrPcEHv9vCwxJfZ6VeqBFoA5bzqToqe2XGmp0UaeAxuvmE1o8S7FXPeSDnmeSYsuu2Bv
	fbNM7ccgR+ou3iEf00kOXN8kJ0Xps4qED2YWgbtERFRmnM1IjCTcdSWY=
X-Google-Smtp-Source: AGHT+IGi29mFRsB3h8dDL1Hv5glfhv8cPlruBJQ+Vx/qSSpW4SNyxS3eUMSZfG6Ry31JqgURETNd9kw3wuUVIowktpMe+Cn/2kTH
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4812:b0:3d4:341a:441d with SMTP id
 e9e14a558f8ab-3d5ccdd1b1cmr38049915ab.10.1743092801976; Thu, 27 Mar 2025
 09:26:41 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:26:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e57c41.050a0220.2f068f.0035.GAE@google.com>
Subject: [syzbot] [media?] [usb?] WARNING in dib0700_rc_setup/usb_submit_urb
From: syzbot <syzbot+e0d5af779eabb323f695@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ed492c95f13a Merge tag 'usb-serial-6.15-rc1' of ssh://gito..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=10ab8de4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e0ed68747dbff9
dashboard link: https://syzkaller.appspot.com/bug?extid=e0d5af779eabb323f695
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1068c804580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1196a43f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0740d718846a/disk-ed492c95.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4a501730105d/vmlinux-ed492c95.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a69dd9641588/bzImage-ed492c95.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e0d5af779eabb323f695@syzkaller.appspotmail.com

rc_core: IR keymap rc-dib0700-rc5 not found
Registered IR keymap rc-empty
dvb-usb: could not initialize remote control.
dvb-usb: Gigabyte U7000 successfully initialized and connected.
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 0 PID: 10 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.14.0-rc6-syzkaller-ged492c95f13a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Code: 84 3c 02 00 00 e8 e5 7c ee fc 4c 89 ef e8 1d ca d4 fe 45 89 e0 89 e9 4c 89 f2 48 89 c6 48 c7 c7 40 65 a2 87 e8 56 86 b2 fc 90 <0f> 0b 90 90 e9 e9 f8 ff ff e8 b7 7c ee fc 49 81 c4 c0 05 00 00 e9
RSP: 0018:ffffc900000aef60 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff888114974300 RCX: ffffffff813f5e19
RDX: ffff888101699d40 RSI: ffffffff813f5e26 RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000003
R13: ffff8881150bf0b0 R14: ffff8881046961a0 R15: ffff88811497437c
FS:  0000000000000000(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb081020440 CR3: 0000000117d02000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dib0700_rc_setup+0x45d/0x7b0 drivers/media/usb/dvb-usb/dib0700_core.c:866
 dib0700_probe+0x29c/0x390 drivers/media/usb/dvb-usb/dib0700_core.c:903
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

