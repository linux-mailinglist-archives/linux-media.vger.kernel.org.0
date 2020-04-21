Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB881B336B
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 01:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgDUXgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 19:36:16 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:48018 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgDUXgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 19:36:15 -0400
Received: by mail-il1-f198.google.com with SMTP id a15so155395ild.14
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 16:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=sm/eNTD8bWLggNPVW9T1lZ73Ny8Np4owkqwW7A5qdK4=;
        b=RMLv8XKojrJnGqbicjiKyBRmIIh/jiJAAtJK55jL/6IkB+qyDcvkMnhjx2aaAp+U4m
         kEduLZyYqDJgqqpLq3TlTMv9ztv5QmJt6MTM78/2kYProDMwukQz0UjS61BbsM5jp9Nr
         j/VKDScQTO1fxMS5Iakifsr0LTTQ7AyVHc7J2XgBbAmWabsOKUhHu82+uW3+sLiwbfRt
         Pr4ub12xrHbXutte2UTL+ZG0v0EXb2M3e/cpiwubfuLiADos2nR1ZgJEMEzTI+529RVX
         azlu9PX/8tyZljxHsG/rGKmSIHo/g3MWJCdi61vaae66EoC2oNXyF6ZSXHpdMYNOlEyq
         9CEQ==
X-Gm-Message-State: AGi0Pub32u1GUd7HMgUpWHByjJRxT+xQyO3ExamapEKhkutdzBCmYVaM
        FhrWrRX+0M8Yz3QiLUN86ouVatpvVjxY4H/zi4c7t+sEdzPg
X-Google-Smtp-Source: APiQypI1IB0bjalyAwivvRvbW6gKXVuq6aXl1KrJxU7CA2HfFvtphRWpGhr4FhX6aJ5QyzGOCnzKbM7Ufwf+kiF98vTQp1PGIec2
MIME-Version: 1.0
X-Received: by 2002:a92:9e11:: with SMTP id q17mr11991355ili.137.1587512174492;
 Tue, 21 Apr 2020 16:36:14 -0700 (PDT)
Date:   Tue, 21 Apr 2020 16:36:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003cbf8e05a3d57b98@google.com>
Subject: general protection fault in go7007_usb_probe
From:   syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e9010320 usb: cdns3: gadget: make a bunch of functions sta..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1263a930100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd14feb44652cfaf
dashboard link: https://syzkaller.appspot.com/bug?extid=cabfa4b5b05ff6be4ef0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com

usb 3-1: string descriptor 0 read error: -71
general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 4298 Comm: kworker/0:5 Not tainted 5.7.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:go7007_usb_probe+0x4ba/0x1d49 drivers/media/usb/go7007/go7007-usb.c:1145
Code: c1 ee 03 80 3c 0e 00 0f 85 59 16 00 00 4c 8b a2 e8 05 00 00 48 b9 00 00 00 00 00 fc ff df 49 8d 7c 24 03 48 89 fe 48 c1 ee 03 <0f> b6 0c 0e 48 89 fe 83 e6 07 40 38 f1 7f 08 84 c9 0f 85 11 16 00
RSP: 0018:ffff8881c70bf190 EFLAGS: 00010246
RAX: ffff8881d0024400 RBX: ffff8881cf5a1000 RCX: dffffc0000000000
RDX: ffff8881d40ae000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: ffff8881caadc000 R08: 0000000000000001 R09: fffffbfff1268ad6
R10: ffffffff893456af R11: fffffbfff1268ad5 R12: 0000000000000000
R13: ffff8881d40ae0a0 R14: ffff8881c7f44c00 R15: ffffffff86786240
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000561ee1bd5160 CR3: 00000001ac56c000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374
 really_probe+0x290/0xac0 drivers/base/dd.c:527
 driver_probe_device+0x223/0x350 drivers/base/dd.c:701
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:808
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x390 drivers/base/dd.c:874
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1367/0x1c20 drivers/base/core.c:2533
 usb_set_configuration+0xed4/0x1850 drivers/usb/core/message.c:2025
 usb_generic_driver_probe+0x9d/0xe0 drivers/usb/core/generic.c:241
 usb_probe_device+0xd9/0x230 drivers/usb/core/driver.c:272
 really_probe+0x290/0xac0 drivers/base/dd.c:527
 driver_probe_device+0x223/0x350 drivers/base/dd.c:701
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:808
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x390 drivers/base/dd.c:874
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1367/0x1c20 drivers/base/core.c:2533
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2548
 hub_port_connect drivers/usb/core/hub.c:5195 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5335 [inline]
 port_event drivers/usb/core/hub.c:5481 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5563
 process_one_work+0x965/0x1630 kernel/workqueue.c:2268
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 kthread+0x326/0x430 kernel/kthread.c:268
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 14ebf3362a06b993 ]---
RIP: 0010:go7007_usb_probe+0x4ba/0x1d49 drivers/media/usb/go7007/go7007-usb.c:1145
Code: c1 ee 03 80 3c 0e 00 0f 85 59 16 00 00 4c 8b a2 e8 05 00 00 48 b9 00 00 00 00 00 fc ff df 49 8d 7c 24 03 48 89 fe 48 c1 ee 03 <0f> b6 0c 0e 48 89 fe 83 e6 07 40 38 f1 7f 08 84 c9 0f 85 11 16 00
RSP: 0018:ffff8881c70bf190 EFLAGS: 00010246
RAX: ffff8881d0024400 RBX: ffff8881cf5a1000 RCX: dffffc0000000000
RDX: ffff8881d40ae000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: ffff8881caadc000 R08: 0000000000000001 R09: fffffbfff1268ad6
R10: ffffffff893456af R11: fffffbfff1268ad5 R12: 0000000000000000
R13: ffff8881d40ae0a0 R14: ffff8881c7f44c00 R15: ffffffff86786240
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000561ee1bd5160 CR3: 0000000007024000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
