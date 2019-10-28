Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613A3E7244
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 14:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729817AbfJ1NCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 09:02:11 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:35597 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbfJ1NCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 09:02:11 -0400
Received: by mail-io1-f69.google.com with SMTP id g24so7546694ioc.2
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2019 06:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=jz8xl1j2uKLt8ScyvhQgkFIWQqtE47psXnzDRQuYc18=;
        b=Gw/pFHe/tqqsJyNx/ZF3C+sF66yG5RnAah25S+TlVctdtKR0TZjjT39kdPC5Aq+jjf
         om0fSAkBE9CCPRpezSh8nKCN1ktzcG9IQy5NaJ+qJEy23XbcybaSRDFveA5gt37bIBAL
         3ofqJ1tpE8jGxajBSGFyx7dQsdl9crktTfCmh1l+c7kRUocGSjEtYc0DWCl/JikULJCB
         gzrZgaMG2j+36W7Wenyd+14JegNcOuThc3JI0QvVIR0UlA4XJxFr3namPrTnA08q9yyq
         CKDZEcZxJ7I/BjUFaNiqywuAGCR4q9KA/qu21o3PzOyyxzj3AmpOR1GRJUOMvB4HT5nE
         8hAg==
X-Gm-Message-State: APjAAAUhWNtbB/W9Y+KciVNCCT7278BcUeO+CX1JOd9DuGl4L/Kk+sJk
        DTP6/HttI+thuBBiFgMJEY9K3l5yXbZSJa56Ort3JJhfy+Lf
X-Google-Smtp-Source: APXvYqy//1Z6TJg7L9QtS1YDVHSXuBfWZAserqESBK+3V3MFQd08PU3irJDL5DnKxie//iGiYXFX5QYQMsf8aLbMwC+2ab2kb+lP
MIME-Version: 1.0
X-Received: by 2002:a92:8394:: with SMTP id p20mr20701579ilk.73.1572267729866;
 Mon, 28 Oct 2019 06:02:09 -0700 (PDT)
Date:   Mon, 28 Oct 2019 06:02:09 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000087dae30595f81b6e@google.com>
Subject: KASAN: use-after-free Read in as102_release
From:   syzbot <syzbot+17c206675b3da3f91a29@syzkaller.appspotmail.com>
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

HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=167d6170e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5fe29bc39eff9627
dashboard link: https://syzkaller.appspot.com/bug?extid=17c206675b3da3f91a29
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+17c206675b3da3f91a29@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in atomic_read  
include/asm-generic/atomic-instrumented.h:26 [inline]
BUG: KASAN: use-after-free in refcount_sub_and_test_checked+0x75/0x1c0  
lib/refcount.c:182
Read of size 4 at addr ffff8881cf500140 by task syz-executor.1/11762

CPU: 0 PID: 11762 Comm: syz-executor.1 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  atomic_read include/asm-generic/atomic-instrumented.h:26 [inline]
  refcount_sub_and_test_checked+0x75/0x1c0 lib/refcount.c:182
  kref_put include/linux/kref.h:64 [inline]
  as102_release+0x48/0x80 drivers/media/usb/as102/as102_usb_drv.c:458
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413ad1
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48  
83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffda9b2bc30 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000005 RCX: 0000000000413ad1
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 0000000000000001 R08: 00000000dbb17c24 R09: 00000000dbb17c28
R10: 00007ffda9b2bd10 R11: 0000000000000293 R12: 000000000075bf20
R13: 00000000000919fe R14: 0000000000761f98 R15: 000000000075bf2c

Allocated by task 2794:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:690 [inline]
  as102_usb_probe+0x4e/0x3c5 drivers/media/usb/as102/as102_usb_drv.c:350
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5183 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
  port_event drivers/usb/core/hub.c:5469 [inline]
  hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 2794:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
  slab_free_hook mm/slub.c:1424 [inline]
  slab_free_freelist_hook mm/slub.c:1475 [inline]
  slab_free mm/slub.c:3018 [inline]
  kfree+0xe4/0x320 mm/slub.c:3967
  as102_usb_probe.cold+0x133/0x369  
drivers/media/usb/as102/as102_usb_drv.c:412
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5183 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
  port_event drivers/usb/core/hub.c:5469 [inline]
  hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881cf500000
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 320 bytes inside of
  4096-byte region [ffff8881cf500000, ffff8881cf501000)
The buggy address belongs to the page:
page:ffffea00073d4000 refcount:1 mapcount:0 mapping:ffff8881da00c280  
index:0xffff8881cf506000 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea0007323408 ffffea0007396008 ffff8881da00c280
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cf500000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cf500080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cf500100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                            ^
  ffff8881cf500180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cf500200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
