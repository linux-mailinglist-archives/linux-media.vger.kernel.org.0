Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D79C10E798
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 10:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfLBJZJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 04:25:09 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:39438 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfLBJZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Dec 2019 04:25:07 -0500
Received: by mail-il1-f200.google.com with SMTP id v11so1883658ilg.6
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2019 01:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=vlZSW3HLefI9bXNH/+u9926W8YYXQ2/ihlTh151hCYg=;
        b=jkOye7tBjAfHN7YfxwHop2M4cXbdHj+7kK3Z/Nkn3OhXvm6RamYExGZczCfnH0HLfe
         eNXXNgvAaFweIqKPwhh+21PqApzcNOIjgcDvIydOSLQDRRF/+/VQDPRdWXftavVtfBNm
         BtowQWgT1E1t3+7QxeW5UOnHTqSl9yXJF8oUbrCQtuPRSp4TtQLHRFlv5t9JYDJ4WbPc
         vdLiy36wdGIuVS3biQ/PJYROXUyODSuLQw9UGZVB5zR5DGt9pgFLfNBTywfigLAVu0RC
         iKlXVpWmc82nVgRBklG3fUzUSJbzFsjiuRLvEN8j09E33m8J6aeHC5f3ZspK/e+kJTiB
         d3wg==
X-Gm-Message-State: APjAAAV5t2YbM5XQzrwOTa0Y+Aludn3LWHLQUhH/2Sgx8GWg04N5vs3n
        +sCRzKAXa+sZ+ouSZL6LrPB9BlcT3HiF2cQblgaRHYwMRAdo
X-Google-Smtp-Source: APXvYqzm/EPogmg2s8v0c6GN1ZO5ECxnO9ocPG0KALjtJTs4yHOrz2J8CuM+PYywU6eWy16bEFKiVcJiY4ZMK/AVSXLQES9Ibi0Z
MIME-Version: 1.0
X-Received: by 2002:a92:47c9:: with SMTP id e70mr4543272ilk.144.1575278706468;
 Mon, 02 Dec 2019 01:25:06 -0800 (PST)
Date:   Mon, 02 Dec 2019 01:25:06 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b8b3c10598b5274a@google.com>
Subject: kernel BUG at drivers/media/mc/mc-entity.c:LINE!
From:   syzbot <syzbot+8eb28ed1d916cc03eef6@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    32b5e2b2 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=101d682ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d88612251f7691bd
dashboard link: https://syzkaller.appspot.com/bug?extid=8eb28ed1d916cc03eef6
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b9ffcee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16859696e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8eb28ed1d916cc03eef6@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=18cd, idProduct=cafe, bcdDevice=  
3.bb
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=16
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
uvcvideo: Found UVC 0.00 device <unnamed> (18cd:cafe)
uvcvideo 1-1:0.0: Entity type for entity Output 0 was not initialized!
------------[ cut here ]------------
kernel BUG at drivers/media/mc/mc-entity.c:666!
invalid opcode: 0000 [#1] SMP KASAN
CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.4.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:media_create_pad_link+0x40f/0x530 drivers/media/mc/mc-entity.c:666
Code: 83 45 3a 01 45 31 e4 e8 9f 93 59 fd 44 89 e0 48 83 c4 18 5b 5d 41 5c  
41 5d 41 5e 41 5f c3 e8 88 93 59 fd 0f 0b e8 81 93 59 fd <0f> 0b e8 7a 93  
59 fd 0f 0b e8 53 23 81 fd e9 91 fc ff ff e8 49 23
RSP: 0018:ffff8881d8c2f058 EFLAGS: 00010293
RAX: ffff8881da24e200 RBX: ffff8881cf8dc070 RCX: ffffffff83e4dd4b
RDX: 0000000000000000 RSI: ffffffff83e4e0df RDI: 0000000000000000
RBP: ffff8881cf8da070 R08: ffff8881da24e200 R09: ffffed1039ff2a91
R10: ffffed1039ff2a90 R11: ffff8881cff95483 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000003 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7061237000 CR3: 00000001d148c000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  uvc_mc_create_links drivers/media/usb/uvc/uvc_entity.c:50 [inline]
  uvc_mc_register_entities+0x468/0x77a drivers/media/usb/uvc/uvc_entity.c:114
  uvc_register_chains drivers/media/usb/uvc/uvc_driver.c:2075 [inline]
  uvc_probe.cold+0x2137/0x29de drivers/media/usb/uvc/uvc_driver.c:2201
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0x1480/0x1c20 drivers/base/core.c:2487
  usb_set_configuration+0xe67/0x1740 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0x1480/0x1c20 drivers/base/core.c:2487
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2537
  hub_port_connect drivers/usb/core/hub.c:5184 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1e59/0x3860 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2264
  worker_thread+0x96/0xe20 kernel/workqueue.c:2410
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 4651c1a0587de7fd ]---
RIP: 0010:media_create_pad_link+0x40f/0x530 drivers/media/mc/mc-entity.c:666
Code: 83 45 3a 01 45 31 e4 e8 9f 93 59 fd 44 89 e0 48 83 c4 18 5b 5d 41 5c  
41 5d 41 5e 41 5f c3 e8 88 93 59 fd 0f 0b e8 81 93 59 fd <0f> 0b e8 7a 93  
59 fd 0f 0b e8 53 23 81 fd e9 91 fc ff ff e8 49 23
RSP: 0018:ffff8881d8c2f058 EFLAGS: 00010293
RAX: ffff8881da24e200 RBX: ffff8881cf8dc070 RCX: ffffffff83e4dd4b
RDX: 0000000000000000 RSI: ffffffff83e4e0df RDI: 0000000000000000
RBP: ffff8881cf8da070 R08: ffff8881da24e200 R09: ffffed1039ff2a91
R10: ffffed1039ff2a90 R11: ffff8881cff95483 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000003 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7061237000 CR3: 00000001d148c000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
