Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3958A32EDA
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbfFCLlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:41:11 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:47620 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728476AbfFCLlH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 07:41:07 -0400
Received: by mail-io1-f71.google.com with SMTP id r27so13610373iob.14
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 04:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=bhQQCMoe6xPIhB2Fv3HqxvRnlBzDpLuZ7Y8s9DIRbgE=;
        b=ZnRb46TqAAI5Qb0C469htS1D2MuQZkdkVEUbx+Gbictgs6FqsebrmMTGMRJh4cz5y2
         ZdQfoaPmC9jyW/FVRlNkCBMyZ1NNJ33qbhKrtN+JkBI7krrR8rfJWxUFrUM/26MzQY56
         Z4/SDwf2WNcpav4sydm012iyfNsA+KxJzyKTzE27igQzP7zF+9tbD8X4o2fMyiy/LroC
         HWfyVzs16bGv6hL4pcxDrw0x7CmS0w9DNwlh7vWwIufK3HUQLfDzRp0JMzw6ALcQb+PF
         QvEpcktZJ1NqPEUnMaCC/AzAXGz6NJiL68X8PaUKvxBGiPCoQ7QAmmi+iS/s9bbdvoTv
         78kw==
X-Gm-Message-State: APjAAAUr5WVwE+8lf2B2N4iXZUwl5E2iK3JWczcJtgx4srh2gNlhDvOy
        WNeEyCJARZyTPyHJKswTfofYn+lB3osKcm4YFXYbDOnf7vG5
X-Google-Smtp-Source: APXvYqyPlO6vnRJSyc3hzDhLfNy7BkuowSIfOch06+5YCfj4AnEtaMrUAx+ZvZFXPcXMoVuoZSiyfEXaNResGzA5vY/gsEc03e3s
MIME-Version: 1.0
X-Received: by 2002:a02:3b55:: with SMTP id i21mr16663261jaf.128.1559562066262;
 Mon, 03 Jun 2019 04:41:06 -0700 (PDT)
Date:   Mon, 03 Jun 2019 04:41:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f7047d058a69d653@google.com>
Subject: KASAN: use-after-free Write in v4l2_prio_close
From:   syzbot <syzbot+a6566701042e6e3e4ed1@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, ezequiel@collabora.com,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com,
        tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    69bbe8c7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=142ef636a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=193d8457178b3229
dashboard link: https://syzkaller.appspot.com/bug?extid=a6566701042e6e3e4ed1
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a6566701042e6e3e4ed1@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in atomic_dec  
include/asm-generic/atomic-instrumented.h:329 [inline]
BUG: KASAN: use-after-free in v4l2_prio_close+0x45/0x60  
drivers/media/v4l2-core/v4l2-dev.c:285
Write of size 4 at addr ffff8881d4d21890 by task v4l_id/3238

CPU: 1 PID: 3238 Comm: v4l_id Not tainted 5.2.0-rc1+ #10
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  atomic_dec include/asm-generic/atomic-instrumented.h:329 [inline]
  v4l2_prio_close+0x45/0x60 drivers/media/v4l2-core/v4l2-dev.c:285
  v4l2_fh_release+0x41/0x70 drivers/media/v4l2-core/v4l2-fh.c:104
  v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
  __fput+0x2d7/0x790 fs/file_table.c:279
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1c5/0x1f0 arch/x86/entry/common.c:168
  prepare_exit_to_usermode arch/x86/entry/common.c:199 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:279 [inline]
  do_syscall_64+0x43f/0x560 arch/x86/entry/common.c:304
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f5bcbde22b0
Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0  
07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
RSP: 002b:00007ffd54ae7938 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007f5bcbde22b0
RDX: 0000000000000013 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
R13: 00007ffd54ae7a90 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 2762:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:489 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
  slab_post_alloc_hook mm/slab.h:437 [inline]
  slab_alloc_node mm/slub.c:2748 [inline]
  __kmalloc_node_track_caller+0xee/0x370 mm/slub.c:4363
  alloc_dr drivers/base/devres.c:103 [inline]
  devm_kmalloc+0x87/0x190 drivers/base/devres.c:793
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
  usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2268
  process_scheduled_works kernel/workqueue.c:2330 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2416
  kthread+0x30b/0x410 kernel/kthread.c:254
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 2762:
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
  usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2197
  hub_port_connect drivers/usb/core/hub.c:4940 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1409/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2268
  process_scheduled_works kernel/workqueue.c:2330 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2416
  kthread+0x30b/0x410 kernel/kthread.c:254
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d4d21100
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1936 bytes inside of
  4096-byte region [ffff8881d4d21100, ffff8881d4d22100)
The buggy address belongs to the page:
page:ffffea0007534800 refcount:1 mapcount:0 mapping:ffff8881dac02600  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000200 ffff8881dac02600
raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d4d21780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d4d21800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d4d21880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                          ^
  ffff8881d4d21900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d4d21980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
