Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091FE375262
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 12:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbhEFKeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 06:34:18 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:48869 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbhEFKeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 06:34:18 -0400
Received: by mail-io1-f71.google.com with SMTP id y191-20020a6bc8c80000b02904313407018fso3172819iof.15
        for <linux-media@vger.kernel.org>; Thu, 06 May 2021 03:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=gEzWFeT+0h8lPmc7NREAgF3P5/yzcA+Z7mY7aMEhe+Y=;
        b=ruZE3l5NkOa3x0qOopxb8L2zFEwuc+HR193CP39HgpXtRhn239fdbKO88z5Edc+E3B
         cmYpLa0F7OD7WG3i3P8s7awLWWgTudf+x/OzP5rGxDBDg6NWsYsleb3REyuVRQKtekJc
         SESWAOEkqI6eGdQRtmYMmCWlLIyQ1oYTK0Q2GpQ/V9V+j/sWDDayyXR//dZ87xe/mL5z
         Mvb0yKsSEkGNFSs3+5Q8dOScBOOryU7oCVp3QLTVDMajBnW+00eE47YDv5fQeyHAL4h5
         QbmuKtbUwAYx0SP8yreJ4sF3PRqb5aBLZImHrwUEf9r8J+zeIvvuuAnTgy+iYBT8nH0Q
         GZew==
X-Gm-Message-State: AOAM532OrDFZwWuHhA5CIMU1WIRJlZvXN8qd39YJCvR5oEBsx/72hl8z
        qJ6uHYdyEyd6wFeAPrLl/rnq1DPYLguOOr5i/0Kp61mQGYul
X-Google-Smtp-Source: ABdhPJySOCjGht6lWTW0mzsnRkQtohwvqYtIdOms1blaP3GGjeVqYEXUE1B4a0nSz+NXISL06HKKoADHHrnN8H2/KYWBPOb9Xkjd
MIME-Version: 1.0
X-Received: by 2002:a92:cd8a:: with SMTP id r10mr3579681ilb.282.1620297199237;
 Thu, 06 May 2021 03:33:19 -0700 (PDT)
Date:   Thu, 06 May 2021 03:33:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fdc0be05c1a6d68f@google.com>
Subject: [syzbot] WARNING in __vmalloc_node_range
From:   syzbot <syzbot+7336195c02c1bd2f64e1@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    d665ea6e Merge tag 'for-linus-5.13-rc1' of git://git.kerne..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=148bff43d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f635d6ce17da8a68
dashboard link: https://syzkaller.appspot.com/bug?extid=7336195c02c1bd2f64e1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16e963e1d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116eec2dd00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7336195c02c1bd2f64e1@syzkaller.appspotmail.com

usb 1-1: media controller created
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
cxusb: set interface failed
dvb-usb: bulk message failed: -22 (1/0)
DVB: Unable to find symbol mt352_attach()
dvb-usb: no frontend was attached by 'DViCO FusionHDTV DVB-T USB (LGZ201)'
dvbdev: DVB: registering new adapter (DViCO FusionHDTV DVB-T USB (LGZ201))
usb 1-1: media controller created
------------[ cut here ]------------
WARNING: CPU: 0 PID: 7 at mm/vmalloc.c:2873 __vmalloc_node_range+0x769/0x970 mm/vmalloc.c:2873
Modules linked in:
CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.12.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:__vmalloc_node_range+0x769/0x970 mm/vmalloc.c:2873
Code: c7 04 24 00 00 00 00 eb 93 e8 93 b7 d9 ff 44 89 fa 44 89 f6 4c 89 ef e8 75 20 07 00 48 89 04 24 e9 be fb ff ff e8 77 b7 d9 ff <0f> 0b 48 c7 04 24 00 00 00 00 e9 63 ff ff ff e8 63 b7 d9 ff 8b 7c
RSP: 0018:ffffc9000007ee30 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffffffff8403d464 RCX: 0000000000000000
RDX: ffff888100283680 RSI: ffffffff81673599 RDI: 0000000000000003
RBP: 0000000000000001 R08: 0000000000000000 R09: 8000000000000163
R10: ffffffff81672ed2 R11: 0000000000000000 R12: 0000000000000000
R13: ffffc90000000000 R14: dffffc0000000000 R15: 00000000ffffffff
FS:  0000000000000000(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fffeb9f7c40 CR3: 00000001033f2000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __vmalloc_node mm/vmalloc.c:2963 [inline]
 vmalloc+0x67/0x80 mm/vmalloc.c:2996
 dvb_dmx_init+0xe4/0xb90 drivers/media/dvb-core/dvb_demux.c:1251
 dvb_usb_adapter_dvb_init+0x564/0x860 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:184
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:86 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]
 dvb_usb_device_init.cold+0xc94/0x146e drivers/media/usb/dvb-usb/dvb-usb-init.c:308
 cxusb_probe+0x159/0x5e0 drivers/media/usb/dvb-usb/cxusb.c:1634
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 really_probe+0x291/0xf60 drivers/base/dd.c:576
 driver_probe_device+0x298/0x410 drivers/base/dd.c:763
 __device_attach_driver+0x203/0x2c0 drivers/base/dd.c:870
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4b0 drivers/base/dd.c:938
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbe0/0x2100 drivers/base/core.c:3319
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 really_probe+0x291/0xf60 drivers/base/dd.c:576
 driver_probe_device+0x298/0x410 drivers/base/dd.c:763
 __device_attach_driver+0x203/0x2c0 drivers/base/dd.c:870
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4b0 drivers/base/dd.c:938
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbe0/0x2100 drivers/base/core.c:3319
 usb_new_device.cold+0x721/0x1058 drivers/usb/core/hub.c:2556
 hub_port_connect drivers/usb/core/hub.c:5276 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5416 [inline]
 port_event drivers/usb/core/hub.c:5562 [inline]
 hub_event+0x2357/0x4320 drivers/usb/core/hub.c:5644
 process_one_work+0x98d/0x1580 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x38c/0x460 kernel/kthread.c:313
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
