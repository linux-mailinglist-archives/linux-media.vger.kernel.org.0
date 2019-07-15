Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F19AB681C3
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 02:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbfGOAYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jul 2019 20:24:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:42270 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728914AbfGOAYH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jul 2019 20:24:07 -0400
Received: by mail-io1-f69.google.com with SMTP id f22so18172222ioj.9
        for <linux-media@vger.kernel.org>; Sun, 14 Jul 2019 17:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=qLgSYNBGdF4FKCoyudzsDW6K0ec3aChkvRwHXBGC66I=;
        b=F1aaIRv5PvyxE2jhDATPS+zSCViC5Orwfd00P8vo+52PIRvkaiafvRkWbJoqynaU9o
         3ZyiOyl61xHJXoXjaVk5hA6hJvDqJToa5mXxWQE1l89aAToAnMUWUJcypZWexBqulRXd
         UO1gyAabcaa8LPyESsPBWmfaWRtJjNUFqYnIShx3EBQ6IBsGye+aVDxPf2b1iv9tvqFR
         4Tr3TJYOdC2ePiyY8nHN650ey49OUeQvb1TeAhus/yR1VEPLq+ST4Gh/cCkI3GLfiDkb
         HlO8qxb77DqmnQphgki2icu0pU6oheqTlkiMUryr+fJWbCi0F4uTzKFajb/jc4SSpyob
         Y5Mw==
X-Gm-Message-State: APjAAAUI+97cYHvdVt7bqXW68MykW0x/iTMQKYIXFGhkNTm/huGKzG4L
        45+ncj9zlwgG/buOUaEp0ZfDXRPAmrmt9Ko/onAiQA1IhjSY
X-Google-Smtp-Source: APXvYqx6AgaQFqkKvH7GAySlMs1i7B8f5tEht8Nj1F9DbTMNgBmYNXIaMn76HLydwnqFAjiw5GjGh1s4UacfNgwLIHSpDzYtv9Dz
MIME-Version: 1.0
X-Received: by 2002:a6b:c9d8:: with SMTP id z207mr21389001iof.184.1563150245894;
 Sun, 14 Jul 2019 17:24:05 -0700 (PDT)
Date:   Sun, 14 Jul 2019 17:24:05 -0700
In-Reply-To: <00000000000014c6b305868311d3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000232355058dad479e@google.com>
Subject: Re: KASAN: use-after-free Read in __video_do_ioctl
From:   syzbot <syzbot+5b7575b3f6820232e17c@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, ezequiel@collabora.com,
        hans.verkuil@cisco.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        niklas.soderlund+renesas@ragnatech.se,
        niklas.soderlund@ragnatech.se, paul.kocialkowski@bootlin.com,
        sakari.ailus@linux.intel.com, samitolvanen@google.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        treding@nvidia.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=169777b8600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
dashboard link: https://syzkaller.appspot.com/bug?extid=5b7575b3f6820232e17c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11dd33b8600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+5b7575b3f6820232e17c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __lock_acquire+0x3a5d/0x5340  
kernel/locking/lockdep.c:3665
Read of size 8 at addr ffff8881cfd80808 by task v4l_id/3788

CPU: 1 PID: 3788 Comm: v4l_id Not tainted 5.2.0-rc6+ #14
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  __lock_acquire+0x3a5d/0x5340 kernel/locking/lockdep.c:3665
  lock_acquire+0x100/0x2b0 kernel/locking/lockdep.c:4303
  __mutex_lock_common kernel/locking/mutex.c:926 [inline]
  __mutex_lock+0xf9/0x12b0 kernel/locking/mutex.c:1073
  __video_do_ioctl+0x5c7/0xb30 drivers/media/v4l2-core/v4l2-ioctl.c:2839
  video_usercopy+0x446/0xee0 drivers/media/v4l2-core/v4l2-ioctl.c:3053
  v4l2_ioctl+0x147/0x1a0 drivers/media/v4l2-core/v4l2-dev.c:360
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xcda/0x12e0 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7fbaeda44347
Code: 90 90 90 48 8b 05 f1 fa 2a 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff  
ff c3 90 90 90 90 90 90 90 90 90 90 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 01 c3 48 8b 0d c1 fa 2a 00 31 d2 48 29 c2 64
RSP: 002b:00007ffeeb4faf58 EFLAGS: 00000202 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fbaeda44347
RDX: 00007ffeeb4faf60 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000400884
R13: 00007ffeeb4fb0b0 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 107:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:489 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
  slab_post_alloc_hook mm/slab.h:437 [inline]
  slab_alloc_node mm/slub.c:2748 [inline]
  __kmalloc_node_track_caller+0xee/0x370 mm/slub.c:4363
  alloc_dr drivers/base/devres.c:103 [inline]
  devm_kmalloc+0x87/0x190 drivers/base/devres.c:815
  devm_kzalloc include/linux/device.h:679 [inline]
  usb_raremono_probe+0x2f/0x231 drivers/media/radio/radio-raremono.c:298
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
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b3d/0x35f0 drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
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
  release_nodes+0x4a1/0x910 drivers/base/devres.c:508
  devres_release_all+0x74/0xc3 drivers/base/devres.c:529
  __device_release_driver drivers/base/dd.c:1085 [inline]
  device_release_driver_internal+0x21b/0x4c0 drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x460/0xb80 drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2199
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x143d/0x35f0 drivers/usb/core/hub.c:5441
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881cfd80000
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 2056 bytes inside of
  4096-byte region [ffff8881cfd80000, ffff8881cfd81000)
The buggy address belongs to the page:
page:ffffea00073f6000 refcount:1 mapcount:0 mapping:ffff8881dac02600  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000200 ffff8881dac02600
raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cfd80700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cfd80780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cfd80800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                       ^
  ffff8881cfd80880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cfd80900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

