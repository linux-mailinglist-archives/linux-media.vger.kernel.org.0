Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09660BB6C2
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 16:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439900AbfIWObK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 10:31:10 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:49954 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394504AbfIWObJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 10:31:09 -0400
Received: by mail-io1-f71.google.com with SMTP id e14so15615994iot.16
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 07:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Vkdmbe+GWD0cjkCzxWqyKt4qjm4iES/NEwWg2SLjoyw=;
        b=moByKhoHQFtEyRbEuLxpboW0EjNlsyQeO6F7XhwKLR5/g2lv94aWuCZ+W+t5cMnEgo
         z7Lxfsc+OWwCFRpWeEMi0Q3ksA6wn8Q/4UO13+dXWpRCI6tykmpEU1l5AJPr3K051Ouq
         zQdg7zjUremNKMTgMVClqJFub2sagSKztnMeoNmUkpR+TbSd+CUe6eOmQQ6I4IZHTK+m
         aGn2Ffa6TkcnOEhejBMpD+OaRI2+IpgKjAmlZgegzcrNkQ6e8tQ0uxed7HNp3xUWXlTo
         xBUYJJ3LPsss2A3Y1iIUrhFXZIrUe2cd8Ight0Ftt1AvVQirxDA8zrP+fj4tC7PRoH2C
         +XQg==
X-Gm-Message-State: APjAAAWs/8vfu+1+5pENqSrrEfh3cPiM+1zYOqMNvd7yz3jPzSAe/cPS
        lfc/3YYVp2HzJU9WcXGdSEe0QHOi+HNPpAU/DmFiree1oeHf
X-Google-Smtp-Source: APXvYqxbBjBdOi612p+MjGiFKhsNUPUhUlDpOcVXJ4R/tT08mrl4PmVKhaa2bxbJQmjzfUK5xdjsvSjsXHe3v09EjvDSqGciDvwY
MIME-Version: 1.0
X-Received: by 2002:a6b:d307:: with SMTP id s7mr3818884iob.39.1569249068674;
 Mon, 23 Sep 2019 07:31:08 -0700 (PDT)
Date:   Mon, 23 Sep 2019 07:31:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004d79d20593394516@google.com>
Subject: KASAN: use-after-free Read in em28xx_init_extension
From:   syzbot <syzbot+e8fe6fd37e640743df98@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=114d95ad600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
dashboard link: https://syzkaller.appspot.com/bug?extid=e8fe6fd37e640743df98
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1692f991600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145d05b1600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e8fe6fd37e640743df98@syzkaller.appspotmail.com

em28xx 1-1:0.240: Audio interface 240 found (Vendor Class)
em28xx 1-1:0.240: unknown em28xx chip ID (0)
em28xx 1-1:0.240: Config register raw data: 0xfffffffb
em28xx 1-1:0.240: AC97 chip type couldn't be determined
em28xx 1-1:0.240: No AC97 audio processor
==================================================================
BUG: KASAN: use-after-free in __list_add_valid+0xd8/0xf0 lib/list_debug.c:26
Read of size 8 at addr ffff8881d31d0240 by task kworker/1:1/21

CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:618
  __list_add_valid+0xd8/0xf0 lib/list_debug.c:26
  __list_add include/linux/list.h:60 [inline]
  list_add_tail include/linux/list.h:93 [inline]
  em28xx_init_extension+0x44/0x1f0  
drivers/media/usb/em28xx/em28xx-core.c:1125
  em28xx_init_dev.isra.0+0xa7b/0x15d8  
drivers/media/usb/em28xx/em28xx-cards.c:3520
  em28xx_usb_probe.cold+0xcac/0x2516  
drivers/media/usb/em28xx/em28xx-cards.c:3869
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 238:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:493 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
  slab_post_alloc_hook mm/slab.h:520 [inline]
  slab_alloc_node mm/slub.c:2770 [inline]
  slab_alloc mm/slub.c:2778 [inline]
  kmem_cache_alloc+0xd6/0x2d0 mm/slub.c:2783
  shmem_alloc_inode+0x18/0x40 mm/shmem.c:3630
  alloc_inode+0x61/0x1e0 fs/inode.c:227
  new_inode_pseudo+0x14/0xe0 fs/inode.c:916
  new_inode+0x1b/0x40 fs/inode.c:945
  shmem_get_inode+0x84/0x7e0 mm/shmem.c:2228
  shmem_mknod+0x5a/0x1f0 mm/shmem.c:2864
  lookup_open+0x119a/0x18d0 fs/namei.c:3224
  do_last fs/namei.c:3314 [inline]
  path_openat+0x1045/0x3f50 fs/namei.c:3525
  do_filp_open+0x1a1/0x280 fs/namei.c:3555
  do_sys_open+0x3c0/0x580 fs/open.c:1089
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 0:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kmem_cache_free+0xb9/0x380 mm/slub.c:3032
  i_callback+0x3f/0x70 fs/inode.c:216
  __rcu_reclaim kernel/rcu/rcu.h:222 [inline]
  rcu_do_batch kernel/rcu/tree.c:2157 [inline]
  rcu_core+0x630/0x1ca0 kernel/rcu/tree.c:2377
  __do_softirq+0x221/0x912 kernel/softirq.c:292

The buggy address belongs to the object at ffff8881d31d0000
  which belongs to the cache shmem_inode_cache of size 1184
The buggy address is located 576 bytes inside of
  1184-byte region [ffff8881d31d0000, ffff8881d31d04a0)
The buggy address belongs to the page:
page:ffffea00074c7400 refcount:1 mapcount:0 mapping:ffff8881da115180  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da115180
raw: 0000000000000000 00000000800c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d31d0100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d31d0180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d31d0200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                            ^
  ffff8881d31d0280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d31d0300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
