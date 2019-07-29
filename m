Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630B678AD9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 13:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387812AbfG2LsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 07:48:16 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:40981 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387771AbfG2LsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 07:48:07 -0400
Received: by mail-io1-f69.google.com with SMTP id x17so66845718iog.8
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 04:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=kZ37XenQa1BiXC+YxE40YDF1Kab2aLWtcRgow9fgtEY=;
        b=LCLQtAw4ACeD5i/IOOSw21lpplc7sNc5bhXTWe57WGMBVutf1OhjMzWmS0DPKcAI4u
         qxwsA21zCybX1YBEPKHR83ArkTmkH1QCb1YFa5NgoD575KQNgEoqvbbrVsZ4P/Z6g0RB
         /qAM+eTr4q7s1dAsNKB/+znzibLjteH5Nto3s2AHS9r86swgnte9j9mhbwlTptzGN1NX
         aYR9h1vT7bTn9wdLq4X0nClC9xRFtGqKcIJAiuRLa4zWCIEcpNEmfrV2fvEUrjLe0Ag9
         zYj4XIrEdpdjcX2+5T9OIDadkDo5skYa5fPmf8SoVqkCYUWCYEhu0BO1gU+MhQWltkNb
         sfcw==
X-Gm-Message-State: APjAAAUBm/qdl9Ocy2qZJOX4mBshtNt6uuacxh9nuTlthF1rMp9p9b+J
        WvNhAajEEofwLHYt1VCA+fa7Ut3j/Vw00GRWNkHUpYyeKKit
X-Google-Smtp-Source: APXvYqzeBzlcm1whsgBJI46ajx9HT7GM3Dpn9vMSlT57UUSUTirQbcCmnNmFpRwexcd9Yz7r1jU17mMCD4ydOXAaYMgNxZWNx6D6
MIME-Version: 1.0
X-Received: by 2002:a6b:6505:: with SMTP id z5mr98047140iob.295.1564400886105;
 Mon, 29 Jul 2019 04:48:06 -0700 (PDT)
Date:   Mon, 29 Jul 2019 04:48:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001a4e93058ed07733@google.com>
Subject: KASAN: use-after-free Write in usbvision_scratch_alloc
From:   syzbot <syzbot+fa317310495b601f2c3e@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bigeasy@linutronix.de, hverkuil@xs4all.nl,
        kjlu@umn.edu, kstewart@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14089192600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=fa317310495b601f2c3e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+fa317310495b601f2c3e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in usbvision_scratch_alloc+0x8c/0xa0  
drivers/media/usb/usbvision/usbvision-core.c:350
Write of size 8 at addr ffff8881cd2adc00 by task v4l_id/5718

CPU: 0 PID: 5718 Comm: v4l_id Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  usbvision_scratch_alloc+0x8c/0xa0  
drivers/media/usb/usbvision/usbvision-core.c:350
  usbvision_v4l2_open+0x148/0x2f0  
drivers/media/usb/usbvision/usbvision-video.c:325
  v4l2_open+0x1af/0x350 drivers/media/v4l2-core/v4l2-dev.c:423
  chrdev_open+0x219/0x5c0 fs/char_dev.c:413
  do_dentry_open+0x497/0x1040 fs/open.c:778
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3ff0 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1070
  do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f655947e120
Code: 48 8b 15 1b 4d 2b 00 f7 d8 64 89 02 83 c8 ff c3 90 90 90 90 90 90 90  
90 90 90 83 3d d5 a4 2b 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 31 c3 48 83 ec 08 e8 5e 8c 01 00 48 89 04 24
RSP: 002b:00007ffd1bdddb58 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007ffd1bdddcb8 RCX: 00007f655947e120
RDX: 00007f6559733138 RSI: 0000000000000000 RDI: 00007ffd1bdddf1c
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
R13: 00007ffd1bdddcb0 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 2779:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:489 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
  kmalloc include/linux/slab.h:547 [inline]
  kzalloc include/linux/slab.h:742 [inline]
  usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1310 [inline]
  usbvision_probe.cold+0x586/0x1d69  
drivers/media/usb/usbvision/usbvision-video.c:1464
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x660 drivers/base/dd.c:509
  driver_probe_device+0x104/0x210 drivers/base/dd.c:670
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:843
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2111
  usb_new_device.cold+0x6a4/0xe61 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1abd/0x3550 drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 2779:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:451
  slab_free_hook mm/slub.c:1421 [inline]
  slab_free_freelist_hook mm/slub.c:1448 [inline]
  slab_free mm/slub.c:2994 [inline]
  kfree+0xd7/0x280 mm/slub.c:3949
  usbvision_release+0x181/0x1c0  
drivers/media/usb/usbvision/usbvision-video.c:1359
  usbvision_disconnect+0x16c/0x1d0  
drivers/media/usb/usbvision/usbvision-video.c:1582
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x460/0xb80 drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2199
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x13bd/0x3550 drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881cd2ac200
  which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 6656 bytes inside of
  8192-byte region [ffff8881cd2ac200, ffff8881cd2ae200)
The buggy address belongs to the page:
page:ffffea000734aa00 refcount:1 mapcount:0 mapping:ffff8881dac02400  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000200 ffff8881dac02400
raw: 0000000000000000 0000000080030003 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cd2adb00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cd2adb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cd2adc00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                    ^
  ffff8881cd2adc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cd2add00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
