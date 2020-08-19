Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9196A249BEC
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 13:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgHSLgT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 07:36:19 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:44310 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgHSLgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 07:36:16 -0400
Received: by mail-io1-f71.google.com with SMTP id m12so14002922iov.11
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 04:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=6Izm6KZJGkoT4ry2D4FMOXAmvEF08wicPMAS6AKBkCQ=;
        b=ec/yclpl81abxN8htd97jmspGgbEtGWGJ3FZNmafa1Yx0m0ifV+6AL06xWu5WSO+iX
         tRrPrik7tf0J2rx1UaY9p1mbgSLLWq+xpA/gv87VNMpHou4GYnYaW7oLATRv6srK4vrq
         o+3Se8K8xh8U6YfQ3bKTLD+61jSoapN+UkxB/FKdA1W35BQZuBFIxicCSQMcaSEJc1aL
         GSdFYjY20yMiuNFPWU03vW1PoGGuw4T8mcj4IFkhUAd0Upi3USUVIEVfKn1/RpTFKv5U
         Po5LGbYsuwTuNIZE9TJ4fNCgeXeDg7b1DZcVxEqZDORJA8LVAlQJtvZjNs6D80XClJau
         DINg==
X-Gm-Message-State: AOAM533uNAns9+LQswGI6KteV3JJTTOUjePctD2p0a0Z2zXbr+hIORGX
        c2CV2zChHCGLoiDDOcJS8chF14OCo1w9ZO8I5PkKQBAKU8fF
X-Google-Smtp-Source: ABdhPJyjk22LAvM0RK3pKXgF1KEeAJU6yYWQZUwekpox3+ieHfoCpkOr1HpO57I819EkY8XvvSXM7bi3zVEuYquMvQ5FSqDm6YDg
MIME-Version: 1.0
X-Received: by 2002:a02:852c:: with SMTP id g41mr23876031jai.58.1597836975423;
 Wed, 19 Aug 2020 04:36:15 -0700 (PDT)
Date:   Wed, 19 Aug 2020 04:36:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000544b0205ad3969d7@google.com>
Subject: KASAN: slab-out-of-bounds Read in mxl5007t_attach
From:   syzbot <syzbot+59c4a4184685764d112a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, mkrufky@linuxtv.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    28157b8c USB: Better name for __check_usb_generic()
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=13a6a929900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccafc70ac3d5f49c
dashboard link: https://syzkaller.appspot.com/bug?extid=59c4a4184685764d112a
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+59c4a4184685764d112a@syzkaller.appspotmail.com

au0828: recv_control_msg() Failed receiving control message, error -71.
au8522_writereg: writereg error (reg == 0x106, val == 0x0001, ret == -5)
==================================================================
BUG: KASAN: slab-out-of-bounds in i2c_adapter_id include/linux/i2c.h:902 [inline]
BUG: KASAN: slab-out-of-bounds in mxl5007t_attach+0x2b6/0x2e0 drivers/media/tuners/mxl5007t.c:853
Read of size 4 at addr ffff8881d01247c8 by task kworker/0:3/136

CPU: 0 PID: 136 Comm: kworker/0:3 Not tainted 5.9.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xf6/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0+0x1c/0x210 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x37/0x7c mm/kasan/report.c:530
 i2c_adapter_id include/linux/i2c.h:902 [inline]
 mxl5007t_attach+0x2b6/0x2e0 drivers/media/tuners/mxl5007t.c:853
 au0828_dvb_register+0x451/0x1360 drivers/media/usb/au0828/au0828-dvb.c:597
 au0828_usb_probe+0x56f/0x5d5 drivers/media/usb/au0828/au0828-core.c:738
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:374
 really_probe+0x291/0xde0 drivers/base/dd.c:553
 driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:738
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:844
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:912
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xb51/0x1c70 drivers/base/core.c:2930
 usb_set_configuration+0xf05/0x18a0 drivers/usb/core/message.c:2032
 usb_generic_driver_probe+0xba/0xf2 drivers/usb/core/generic.c:239
 usb_probe_device+0xd9/0x250 drivers/usb/core/driver.c:272
 really_probe+0x291/0xde0 drivers/base/dd.c:553
 driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:738
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:844
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:912
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xb51/0x1c70 drivers/base/core.c:2930
 usb_new_device.cold+0x71d/0xfd4 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x2361/0x4390 drivers/usb/core/hub.c:5576
 process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x392/0x470 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Allocated by task 25209:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc.constprop.0+0xc2/0xd0 mm/kasan/common.c:461
 kmalloc include/linux/slab.h:554 [inline]
 kzalloc include/linux/slab.h:666 [inline]
 ep_alloc.constprop.0+0xff/0x370 fs/eventpoll.c:1016
 do_epoll_create+0x97/0x1c0 fs/eventpoll.c:2064
 __do_sys_epoll_create1 fs/eventpoll.c:2095 [inline]
 __se_sys_epoll_create1 fs/eventpoll.c:2093 [inline]
 __x64_sys_epoll_create1+0x2d/0x40 fs/eventpoll.c:2093
 do_syscall_64+0x2d/0x40 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 25209:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:56
 kasan_set_free_info+0x1b/0x30 mm/kasan/generic.c:355
 __kasan_slab_free+0xf3/0x130 mm/kasan/common.c:422
 slab_free_hook mm/slub.c:1548 [inline]
 slab_free_freelist_hook+0x53/0x140 mm/slub.c:1581
 slab_free mm/slub.c:3142 [inline]
 kfree+0xbe/0x470 mm/slub.c:4123
 ep_eventpoll_release+0x41/0x60 fs/eventpoll.c:864
 __fput+0x282/0x920 fs/file_table.c:281
 task_work_run+0xdd/0x1a0 kernel/task_work.c:141
 exit_task_work include/linux/task_work.h:25 [inline]
 do_exit+0xbaf/0x2890 kernel/exit.c:806
 do_group_exit+0x125/0x310 kernel/exit.c:903
 __do_sys_exit_group kernel/exit.c:914 [inline]
 __se_sys_exit_group kernel/exit.c:912 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:912
 do_syscall_64+0x2d/0x40 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff8881d0124400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 456 bytes to the right of
 512-byte region [ffff8881d0124400, ffff8881d0124600)
The buggy address belongs to the page:
page:00000000182cf651 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff8881d0124000 pfn:0x1d0124
head:00000000182cf651 order:2 compound_mapcount:0 compound_pincount:0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea0007296508 ffffea00074f9908 ffff8881da041280
raw: ffff8881d0124000 000000000010000d 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881d0124680: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8881d0124700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8881d0124780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                              ^
 ffff8881d0124800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881d0124880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
