Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42DB210E79B
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 10:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfLBJZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 04:25:08 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:43781 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfLBJZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Dec 2019 04:25:07 -0500
Received: by mail-il1-f199.google.com with SMTP id m67so7572211ill.10
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2019 01:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=s/fzY9n/Wc759s+X5jwa5PXhW5V1f6rxMUh+sQv+EIU=;
        b=AeI4AV6L1Hbd64k4sbWbqxKOokivUcyCqUjJb104MeH/5CHurm9l9ZrFF0pu201kMY
         FELoiRhkFqyiKpmptMYLkhoPnt9fxI+rrF6nmeKiIkdO04bnvaNEtha+9vRm08AdBwQ3
         JtGyWDL0GYmbkGwqqM+laZiWc9Wm0xXDUkObEZLbRyRp+w8zJwg7AEBS2bGar/Au8CeA
         XTsbAfp7m/5yHyTerrVqK3kHqkzWa2y0W1/YxXyCRrv+n8u+3u9+tw/7AInyFpSBzOa+
         yys55w1QZQ2CoQ3riQmkNOMCdxizKgkVYP/eZXcYVA0uV7sHKUXX0RB6ckbj52TxYCKT
         StBg==
X-Gm-Message-State: APjAAAXwdmBSRwYRLfkmeqBhhdK4sZ6JO5qoUcoz6RAUyg9xp72ALVSo
        NslWBmjVH1MnVWBFtqPpFksJ6dKEAIC5Pni/gPOEM/r7SKMa
X-Google-Smtp-Source: APXvYqxUgkfSuyTzo7urgNwiNWOccCUAD3r/7Xc6+I7tBgXjkAdKtW2Xb8ndo2wJJNzCx0qC3O1QWtMZvde93oeGiTGB9b+IeVx2
MIME-Version: 1.0
X-Received: by 2002:a92:8995:: with SMTP id w21mr6775582ilk.231.1575278706708;
 Mon, 02 Dec 2019 01:25:06 -0800 (PST)
Date:   Mon, 02 Dec 2019 01:25:06 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bc5c0e0598b52778@google.com>
Subject: KASAN: use-after-free Write in as102_release
From:   syzbot <syzbot+edff65c4ade21b5db190@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    32b5e2b2 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1255457ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d88612251f7691bd
dashboard link: https://syzkaller.appspot.com/bug?extid=edff65c4ade21b5db190
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+edff65c4ade21b5db190@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in atomic_fetch_sub  
include/asm-generic/atomic-instrumented.h:199 [inline]
BUG: KASAN: use-after-free in refcount_sub_and_test  
include/linux/refcount.h:253 [inline]
BUG: KASAN: use-after-free in refcount_dec_and_test  
include/linux/refcount.h:281 [inline]
BUG: KASAN: use-after-free in kref_put include/linux/kref.h:64 [inline]
BUG: KASAN: use-after-free in as102_release+0x58/0xd8  
drivers/media/usb/as102/as102_usb_drv.c:458
Write of size 4 at addr ffff8881adb84140 by task syz-executor.5/16315

CPU: 1 PID: 16315 Comm: syz-executor.5 Not tainted 5.4.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xef/0x16e lib/dump_stack.c:118
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  atomic_fetch_sub include/asm-generic/atomic-instrumented.h:199 [inline]
  refcount_sub_and_test include/linux/refcount.h:253 [inline]
  refcount_dec_and_test include/linux/refcount.h:281 [inline]
  kref_put include/linux/kref.h:64 [inline]
  as102_release+0x58/0xd8 drivers/media/usb/as102/as102_usb_drv.c:458
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  exit_task_work include/linux/task_work.h:22 [inline]
  do_exit+0x8ab/0x2bc0 kernel/exit.c:797
  do_group_exit+0x125/0x340 kernel/exit.c:895
  get_signal+0x466/0x23c0 kernel/signal.c:2734
  do_signal+0x88/0x1490 arch/x86/kernel/signal.c:815
  exit_to_usermode_loop+0x1a2/0x200 arch/x86/entry/common.c:160
  prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
  do_syscall_64+0x4d1/0x5b0 arch/x86/entry/common.c:304
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a4e7
Code: Bad RIP value.
RSP: 002b:00007f8274f103c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: fffffffffffffffc RBX: 0000000000000000 RCX: 000000000045a4e7
RDX: 00007f8274f10810 RSI: 0000000080085502 RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 00000000004ca701 R14: 00000000004e2e78 R15: 00000000ffffffff

Allocated by task 17:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:690 [inline]
  as102_usb_probe+0x4e/0x3d0 drivers/media/usb/as102/as102_usb_drv.c:350
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

Freed by task 17:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
  slab_free_hook mm/slub.c:1424 [inline]
  slab_free_freelist_hook mm/slub.c:1457 [inline]
  slab_free mm/slub.c:3004 [inline]
  kfree+0xdc/0x310 mm/slub.c:3956
  as102_usb_probe.cold+0x133/0x366  
drivers/media/usb/as102/as102_usb_drv.c:412
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

The buggy address belongs to the object at ffff8881adb84000
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 320 bytes inside of
  4096-byte region [ffff8881adb84000, ffff8881adb85000)
The buggy address belongs to the page:
page:ffffea0006b6e000 refcount:1 mapcount:0 mapping:ffff8881da00c280  
index:0x0 compound_mapcount: 0
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c280
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881adb84000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881adb84080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881adb84100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                            ^
  ffff8881adb84180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881adb84200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
