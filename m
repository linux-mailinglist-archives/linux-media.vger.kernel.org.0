Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF5AF117920
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 23:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfLIWPI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 17:15:08 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:45249 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfLIWPI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 17:15:08 -0500
Received: by mail-io1-f70.google.com with SMTP id m18so11712198ioj.12
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 14:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=WeCZI4MD5QWcdvNn2ICJL7eurDPLvZIu0ibe2CDEYBM=;
        b=rkOE6AaSi4k+qYceeBy5AScHsPP7tfZqbSqTYuYxzfBBgJHCRQkwI5lrROaR8wTBMu
         Uz/BQHf8ul7dvvOWIJSEpelsag0X8A3i2+yCebrXviYzxvUQR0yBtj5gULUVgCSQeeOZ
         TVG4EVPKJAXEje8M3rQgrFnJaldiuong2WqUjNBSPtZvIHkekJyumxkJlQVYt/YkgfXa
         xYFTTdKPIBtnfXuDzFhbDz+LTP6CXfDhPS9JZDdnMIbS9Ef1wU3FOSa3Bg9kcagEbCBg
         flVDSN6hIh3rpd4pVS7TlNFCD8Y822FOCeCsOAQojaY7ZicL9eXx6Jgwq3PhWJLOx2ww
         QfUw==
X-Gm-Message-State: APjAAAUogp06zHJedVZXMU5D/qUj6uaOm+3RJHEDfIqkZYf9727Uyx1B
        m0eO5YH9XQxcGFatj3HnkKJ1wc4cKKZb9OnThHdlk6s0yx0s
X-Google-Smtp-Source: APXvYqzKSFdXBuMvo//ntcSQyXHzLiXLtvIr085VOIgJbrKolHs8IvPr9kmBG+UYD0Q+HsfbSEgvC1q9uvOxS5CxEOuzbmUgCD3P
MIME-Version: 1.0
X-Received: by 2002:a02:cc75:: with SMTP id j21mr28768869jaq.113.1575929707669;
 Mon, 09 Dec 2019 14:15:07 -0800 (PST)
Date:   Mon, 09 Dec 2019 14:15:07 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006ab7cc05994cbae2@google.com>
Subject: KASAN: use-after-free Read in usbvision_v4l2_open
From:   syzbot <syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil@xs4all.nl, jrdr.linux@gmail.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, rfontana@redhat.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    1f22d15c usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1296f42ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
dashboard link: https://syzkaller.appspot.com/bug?extid=c7b0ec009a216143df30
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __mutex_lock_common  
kernel/locking/mutex.c:1043 [inline]
BUG: KASAN: use-after-free in __mutex_lock+0x124d/0x1360  
kernel/locking/mutex.c:1106
Read of size 8 at addr ffff8881cad4d8b8 by task v4l_id/4526

CPU: 0 PID: 4526 Comm: v4l_id Not tainted 5.4.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xef/0x16e lib/dump_stack.c:118
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:638
  __mutex_lock_common kernel/locking/mutex.c:1043 [inline]
  __mutex_lock+0x124d/0x1360 kernel/locking/mutex.c:1106
  usbvision_v4l2_open+0x77/0x340  
drivers/media/usb/usbvision/usbvision-video.c:314
  v4l2_open+0x20f/0x3d0 drivers/media/v4l2-core/v4l2-dev.c:423
  chrdev_open+0x219/0x5c0 fs/char_dev.c:414
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3412 [inline]
  path_openat+0x142b/0x4030 fs/namei.c:3529
  do_filp_open+0x1a1/0x280 fs/namei.c:3559
  do_sys_open+0x3c0/0x580 fs/open.c:1097
  do_syscall_64+0xb7/0x5b0 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f70d3cab120
Code: 48 8b 15 1b 4d 2b 00 f7 d8 64 89 02 83 c8 ff c3 90 90 90 90 90 90 90  
90 90 90 83 3d d5 a4 2b 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 31 c3 48 83 ec 08 e8 5e 8c 01 00 48 89 04 24
RSP: 002b:00007ffc46d40ca8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007ffc46d40e08 RCX: 00007f70d3cab120
RDX: 00007f70d3f60138 RSI: 0000000000000000 RDI: 00007ffc46d42f1d
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
R13: 00007ffc46d40e00 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 12:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:512 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:485
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:670 [inline]
  usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1315 [inline]
  usbvision_probe.cold+0x5c5/0x1f1e  
drivers/media/usb/usbvision/usbvision-video.c:1469
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

Freed by task 3310:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  kasan_set_free_info mm/kasan/common.c:334 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:473
  slab_free_hook mm/slub.c:1425 [inline]
  slab_free_freelist_hook mm/slub.c:1458 [inline]
  slab_free mm/slub.c:3005 [inline]
  kfree+0xdc/0x310 mm/slub.c:3957
  usbvision_release+0x181/0x1c0  
drivers/media/usb/usbvision/usbvision-video.c:1364
  usbvision_disconnect+0x171/0x1e0  
drivers/media/usb/usbvision/usbvision-video.c:1589
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
  device_del+0x481/0xd30 drivers/base/core.c:2664
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
  hub_port_connect drivers/usb/core/hub.c:5035 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1753/0x3860 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2264
  worker_thread+0x96/0xe20 kernel/workqueue.c:2410
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881cad4c000
  which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 6328 bytes inside of
  8192-byte region [ffff8881cad4c000, ffff8881cad4e000)
The buggy address belongs to the page:
page:ffffea00072b5200 refcount:1 mapcount:0 mapping:ffff8881da40c500  
index:0x0 compound_mapcount: 0
raw: 0200000000010200 ffffea0007249a00 0000000200000002 ffff8881da40c500
raw: 0000000000000000 0000000080020002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cad4d780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cad4d800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cad4d880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                         ^
  ffff8881cad4d900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cad4d980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
