Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C414635CC
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 14:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfGIM1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 08:27:10 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:41330 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfGIM1J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 08:27:09 -0400
Received: by mail-io1-f69.google.com with SMTP id x17so22717315iog.8
        for <linux-media@vger.kernel.org>; Tue, 09 Jul 2019 05:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Hdde+sjwRhJZLPKSoYAqd9t3nfoISgBodyTv+3nnI+4=;
        b=qB9LubHDIWcwjhSgxJW1mOqs4v0CYd+iLUa85/83XkGqVRiD2JPwLYeCDfB3Dec4tQ
         e8V7hqjqrqiYZ1WjQk8FcFd4BkbokVw5hF8+oxzezYFHcSrKAPvoDptGLwmhdz4/A59L
         5jJm0JYsjepzrly2X4YMWhFX944LOsfgvIyvB6uirz0maq0L6H7HY6hgaFtf/5GMqXJQ
         aXmu83DoU0zLdZOLhTrAB/1gY99WW2AV5KPbUh5H/1kmi17d2jyWZb+e+HH9GpOo8hvL
         FgmWJ79hA0IdDMxjCWx9Nhax3ej6T+cUE2n3Omkh2lv7VK+5d/BlPP8jRyy+LhP5EXgz
         +OFA==
X-Gm-Message-State: APjAAAU56EwQfVz9l4iICfbW0wsBY6NyUmTlN58lV8xrTA/eS0LS+1kg
        8w/QwahLVUZLlPR72Bf+/SnFxQcYeYz5nH3CXE84oeZWfpqm
X-Google-Smtp-Source: APXvYqyCo9/pdFbhVRSiVv6UKgCXHGC+G2cPwqaS/LigdJ7Fkn/cpZbBz1icsVa9NU/xpsxu62LVS+L14GWIlmVmnOu5uq046Wnw
MIME-Version: 1.0
X-Received: by 2002:a02:a183:: with SMTP id n3mr28751626jah.74.1562675228356;
 Tue, 09 Jul 2019 05:27:08 -0700 (PDT)
Date:   Tue, 09 Jul 2019 05:27:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e2be4e058d3ead4a@google.com>
Subject: KASAN: use-after-free Read in si470x_int_in_callback
From:   syzbot <syzbot+2d4fc2a0c45ad8da7e99@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=17139aa5a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
dashboard link: https://syzkaller.appspot.com/bug?extid=2d4fc2a0c45ad8da7e99
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1245ae9ba00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=104f501da00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+2d4fc2a0c45ad8da7e99@syzkaller.appspotmail.com

radio-si470x 1-1:0.241: non-zero urb status (-71)
radio-si470x 1-1:0.241: non-zero urb status (-71)
dummy_hcd dummy_hcd.0: no ep configured for urb 00000000b07b2836
==================================================================
BUG: KASAN: use-after-free in si470x_int_in_callback.cold+0x27/0xbe  
drivers/media/radio/si470x/radio-si470x-usb.c:378
Read of size 8 at addr ffff8881cf4b4e28 by task kworker/0:2/107

CPU: 0 PID: 107 Comm: kworker/0:2 Not tainted 5.2.0-rc6+ #13
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  si470x_int_in_callback.cold+0x27/0xbe  
drivers/media/radio/si470x/radio-si470x-usb.c:378
  __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1758
  usb_hcd_giveback_urb+0x34a/0x400 drivers/usb/core/hcd.c:1823
  dummy_timer+0x1022/0x2df4 drivers/usb/gadget/udc/dummy_hcd.c:1965
  call_timer_fn+0x15e/0x5e0 kernel/time/timer.c:1322
  expire_timers kernel/time/timer.c:1366 [inline]
  __run_timers kernel/time/timer.c:1685 [inline]
  __run_timers kernel/time/timer.c:1653 [inline]
  run_timer_softirq+0x597/0x1410 kernel/time/timer.c:1698
  __do_softirq+0x219/0x8b0 kernel/softirq.c:292
  invoke_softirq kernel/softirq.c:373 [inline]
  irq_exit+0x17c/0x1a0 kernel/softirq.c:413
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0xe2/0x480 arch/x86/kernel/apic/apic.c:1068
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:806
  </IRQ>
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:85 [inline]
RIP: 0010:console_unlock+0x9db/0xbf0 kernel/printk/printk.c:2471
Code: 00 89 ee 48 c7 c7 e0 eb f2 86 e8 50 a4 03 00 65 ff 0d 51 56 da 7e e9  
11 fa ff ff e8 af 43 15 00 e8 ba 69 1a 00 ff 74 24 30 9d <e9> 31 fe ff ff  
e8 9b 43 15 00 48 8b bc 24 80 00 00 00 c7 05 d9 e6
RSP: 0018:ffff8881d4197148 EFLAGS: 00000293 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000200 RCX: 1ffff1103aed5d24
RDX: 0000000000000000 RSI: ffff8881d76ae900 RDI: ffff8881d76ae834
RBP: 0000000000000000 R08: ffff8881d76ae000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000004e
R13: ffffffff828cb580 R14: ffffffff8726a520 R15: dffffc0000000000
  vprintk_emit+0x171/0x3e0 kernel/printk/printk.c:1986
  vprintk_func+0x75/0x113 kernel/printk/printk_safe.c:386
  printk+0xba/0xed kernel/printk/printk.c:2046
  really_probe.cold+0x69/0x122 drivers/base/dd.c:577
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
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 107:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:489 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
  kmalloc include/linux/slab.h:547 [inline]
  kzalloc include/linux/slab.h:742 [inline]
  si470x_usb_driver_probe+0x51/0xf14  
drivers/media/radio/si470x/radio-si470x-usb.c:576
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
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 107:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:451
  slab_free_hook mm/slub.c:1421 [inline]
  slab_free_freelist_hook mm/slub.c:1448 [inline]
  slab_free mm/slub.c:2994 [inline]
  kfree+0xd7/0x280 mm/slub.c:3949
  si470x_usb_driver_probe+0xaf5/0xf14  
drivers/media/radio/si470x/radio-si470x-usb.c:764
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
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881cf4b4400
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 2600 bytes inside of
  4096-byte region [ffff8881cf4b4400, ffff8881cf4b5400)
The buggy address belongs to the page:
page:ffffea00073d2c00 refcount:1 mapcount:0 mapping:ffff8881dac02600  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea00073d2400 0000000200000002 ffff8881dac02600
raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cf4b4d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cf4b4d80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cf4b4e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                   ^
  ffff8881cf4b4e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cf4b4f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
