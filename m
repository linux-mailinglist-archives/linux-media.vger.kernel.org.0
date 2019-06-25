Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFCD55B81
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 00:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfFYWrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 18:47:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:35753 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFYWrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 18:47:06 -0400
Received: by mail-io1-f69.google.com with SMTP id w17so216285iom.2
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 15:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Vw6MJY7BFxpWAU+MjwyOxPcnR+sho3N/M68uPuBFnGU=;
        b=f8KJLRR75TNQCvPz58JlDbuyui8Y5WI19s4/2NQW+QQuQ2J7oYwKCzEpa8/I1Zh039
         ri4+wfhw/7ulGzbcVv9MIU+a/eE2/p7T7TaBBLgFtZcHKx64VPtdVf76xMqzAyBjEVFq
         zNA8PCfrE1rEk8uRTm28Rv2dTd3iK1oHPnMKe4uhv0Lv8XRstQ6GwvN3duH889g+COLQ
         dckiFrdu2hNO6c7fZ6kxzJUCiz0ujFr+AhEqVFFBc9ns2VEnA5tDs1qqAPRZtqV27iaX
         ZbgHptDQiFNzinMd2fupIVtBLqz8YBG/QsHM0cYckeBU8LDEu9ojiHo4Y79b730bM8A1
         KvyA==
X-Gm-Message-State: APjAAAWrgnIXS7Mh5VEYNgPELhYeZOCnWS64/zG2spdwL2CLmVffT/YH
        lzuzBO4Etq+vojIgpz/ZBB0J7HSDPzF/zS8/303G3yFv3eLl
X-Google-Smtp-Source: APXvYqw3FPGBs+xBmYD7Bm5K5bn6fZbFnVRr1zstkNRTrOudHW+rhnCoXXsHdhc0JAXMg8tPslu60h9QbiEUzTK10ICQwMYq5Whi
MIME-Version: 1.0
X-Received: by 2002:a02:3f0a:: with SMTP id d10mr909996jaa.23.1561502825823;
 Tue, 25 Jun 2019 15:47:05 -0700 (PDT)
Date:   Tue, 25 Jun 2019 15:47:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003fc6ef058c2db557@google.com>
Subject: KASAN: slab-out-of-bounds Read in hdpvr_probe
From:   syzbot <syzbot+79d18aac4bf1770dd050@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com,
        gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    9939f56e usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=12e0f72da00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df134eda130bb43a
dashboard link: https://syzkaller.appspot.com/bug?extid=79d18aac4bf1770dd050
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+79d18aac4bf1770dd050@syzkaller.appspotmail.com

usb 2-1: config 0 descriptor??
==================================================================
BUG: KASAN: slab-out-of-bounds in string_nocheck+0x1d2/0x200  
lib/vsprintf.c:605
Read of size 1 at addr ffff8881cda45b20 by task kworker/0:0/5

CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.2.0-rc5+ #11
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  string_nocheck+0x1d2/0x200 lib/vsprintf.c:605
  string+0xe5/0xf0 lib/vsprintf.c:668
  vsnprintf+0x7d3/0x14f0 lib/vsprintf.c:2503
  vscnprintf+0x29/0x80 lib/vsprintf.c:2606
  vprintk_store+0x40/0x4b0 kernel/printk/printk.c:1907
  vprintk_emit+0xc8/0x3e0 kernel/printk/printk.c:1968
  vprintk_func+0x75/0x113 kernel/printk/printk_safe.c:386
  printk+0xba/0xed kernel/printk/printk.c:2046
  device_authorization drivers/media/usb/hdpvr/hdpvr-core.c:140 [inline]
  hdpvr_device_init drivers/media/usb/hdpvr/hdpvr-core.c:201 [inline]
  hdpvr_probe.cold+0x194/0x1247 drivers/media/usb/hdpvr/hdpvr-core.c:342
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
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 5:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:489 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
  kmalloc include/linux/slab.h:547 [inline]
  hdpvr_probe+0x1ce/0xac0 drivers/media/usb/hdpvr/hdpvr-core.c:297
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
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 0:
(stack is not available)

The buggy address belongs to the object at ffff8881cda45ae0
  which belongs to the cache kmalloc-64 of size 64
The buggy address is located 0 bytes to the right of
  64-byte region [ffff8881cda45ae0, ffff8881cda45b20)
The buggy address belongs to the page:
page:ffffea0007369140 refcount:1 mapcount:0 mapping:ffff8881dac03600  
index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 dead000000000100 dead000000000200 ffff8881dac03600
raw: 0000000000000000 00000000802a002a 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cda45a00: fc fc fc fc fb fb fb fb fb fb fb fb fc fc fc fc
  ffff8881cda45a80: fb fb fb fb fb fb fb fb fc fc fc fc 00 00 00 00
> ffff8881cda45b00: 00 00 00 00 fc fc fc fc fb fb fb fb fb fb fb fb
                                ^
  ffff8881cda45b80: fc fc fc fc 00 00 00 00 00 00 00 00 fc fc fc fc
  ffff8881cda45c00: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
