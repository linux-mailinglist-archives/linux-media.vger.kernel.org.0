Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7DCE1F3
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 14:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfD2MGc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 08:06:32 -0400
Received: from mail-it1-f199.google.com ([209.85.166.199]:44903 "EHLO
        mail-it1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbfD2MGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 08:06:08 -0400
Received: by mail-it1-f199.google.com with SMTP id v193so9210926itv.9
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2019 05:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=wj6fLx0DbQ6fBhMkAy+RVA3Qi0FbrV2Dz7SLdx6mXsY=;
        b=HGsz5Xxxo5cyqiulsVOCCLLqMGkFU35UuJA24sRsjyseAZSAKGrUQ4VsuYI7r2x+nF
         Z/daqXJEkutTAnWTqE/6Uo4j1fF8fRrDv7iiE7iY6/A89333d1FOd8aQ4IbiiDTCuM2f
         2P+8RY7XRB9G6eNNJcbqogdhU3cQgCI3+02Kpu3ba+jXRqupCIHLylFI/zrV0l+CBeN3
         uOSauELd1n2t2JSCKiUpXtf4P+SblU8Y+2Icuvh8Zvv0u2GAqHqR+tJwkGbPHbs/wien
         9UIq0ny+T7g37kBFcz7aV/QDBtiLMxlhpS+fTeRW6xBjQcKJxgnDv8NibMZbimh64JYP
         b5QQ==
X-Gm-Message-State: APjAAAVg7d7plAzZp+nRk2KuYQRVRjov/DC4Q81cRpPEfgiXJsFe1GKx
        gTM9R/86vnsqv/pdGmlBVFq9YW9VtqgaZpvPOHmIwCf+w4Ad
X-Google-Smtp-Source: APXvYqyyrwio/l9VPnBGrCfTpcNZABNUSruyO028bEFLLyvoWMSoMYKDXEQhqESPhr1N5A/uKzEO5kcJdF3hNxoB0G1h889N74En
MIME-Version: 1.0
X-Received: by 2002:a24:50cc:: with SMTP id m195mr17995253itb.160.1556539567199;
 Mon, 29 Apr 2019 05:06:07 -0700 (PDT)
Date:   Mon, 29 Apr 2019 05:06:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fb811f0587aa1b7f@google.com>
Subject: KASAN: use-after-free Write in v4l2_device_release
From:   syzbot <syzbot+62d0ec9a8d05fffcf12e@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, ezequiel@collabora.com,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com, sque@chromium.org,
        syzkaller-bugs@googlegroups.com, tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan/tree/usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=13f56538a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
dashboard link: https://syzkaller.appspot.com/bug?extid=62d0ec9a8d05fffcf12e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+62d0ec9a8d05fffcf12e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in v4l2_device_release+0x3ce/0x408  
drivers/media/v4l2-core/v4l2-dev.c:197
Write of size 8 at addr ffff88809a266c08 by task v4l_id/7544

CPU: 1 PID: 7544 Comm: v4l_id Not tainted 5.1.0-rc3-319004-g43151d6 #6
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xe8/0x16e lib/dump_stack.c:113
  print_address_description+0x6c/0x236 mm/kasan/report.c:187
  kasan_report.cold+0x1a/0x3c mm/kasan/report.c:317
  v4l2_device_release+0x3ce/0x408 drivers/media/v4l2-core/v4l2-dev.c:197
  device_release+0x7d/0x210 drivers/base/core.c:1064
  kobject_cleanup lib/kobject.c:662 [inline]
  kobject_release lib/kobject.c:691 [inline]
  kref_put include/linux/kref.h:67 [inline]
  kobject_put+0x1df/0x4f0 lib/kobject.c:708
  put_device+0x21/0x30 drivers/base/core.c:2205
  video_put drivers/media/v4l2-core/v4l2-dev.c:174 [inline]
  v4l2_release+0x2d1/0x390 drivers/media/v4l2-core/v4l2-dev.c:469
  __fput+0x2df/0x8c0 fs/file_table.c:278
  task_work_run+0x149/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x243/0x270 arch/x86/entry/common.c:166
  prepare_exit_to_usermode arch/x86/entry/common.c:197 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:268 [inline]
  do_syscall_64+0x40c/0x4f0 arch/x86/entry/common.c:293
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7fc1f5f952b0
Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0  
07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
RSP: 002b:00007ffd270a0138 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007fc1f5f952b0
RDX: 00007fc1f624bdf0 RSI: 0000000000000001 RDI: 0000000000000003
RBP: 0000000000000000 R08: 00007fc1f624bdf0 R09: 000000000000000a
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
R13: 00007ffd270a0290 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 5354:
  set_track mm/kasan/common.c:87 [inline]
  __kasan_kmalloc mm/kasan/common.c:497 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:470
  slab_post_alloc_hook mm/slab.h:437 [inline]
  slab_alloc_node mm/slub.c:2756 [inline]
  __kmalloc_node_track_caller+0xf3/0x320 mm/slub.c:4372
  alloc_dr drivers/base/devres.c:103 [inline]
  devm_kmalloc+0x8c/0x190 drivers/base/devres.c:793
  devm_kzalloc include/linux/device.h:679 [inline]
  usb_raremono_probe+0x34/0x235 drivers/media/radio/radio-raremono.c:298
  usb_probe_interface+0x31d/0x820 drivers/usb/core/driver.c:361
  really_probe+0x2da/0xb10 drivers/base/dd.c:509
  driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
  __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
  bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
  __device_attach+0x223/0x3a0 drivers/base/dd.c:844
  bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
  device_add+0xad2/0x16e0 drivers/base/core.c:2106
  usb_set_configuration+0xdf7/0x1740 drivers/usb/core/message.c:2023
  generic_probe+0xa2/0xda drivers/usb/core/generic.c:210
  usb_probe_device+0xc0/0x150 drivers/usb/core/driver.c:266
  really_probe+0x2da/0xb10 drivers/base/dd.c:509
  driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
  __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
  bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
  __device_attach+0x223/0x3a0 drivers/base/dd.c:844
  bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
  device_add+0xad2/0x16e0 drivers/base/core.c:2106
  usb_new_device.cold+0x537/0xccf drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x138e/0x3b00 drivers/usb/core/hub.c:5432
  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7b0/0xe20 kernel/workqueue.c:2417
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352

Freed by task 5354:
  set_track mm/kasan/common.c:87 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:459
  slab_free_hook mm/slub.c:1429 [inline]
  slab_free_freelist_hook+0x5e/0x140 mm/slub.c:1456
  slab_free mm/slub.c:3003 [inline]
  kfree+0xce/0x290 mm/slub.c:3958
  release_nodes+0x4ac/0x920 drivers/base/devres.c:508
  devres_release_all+0x79/0xc8 drivers/base/devres.c:529
  __device_release_driver drivers/base/dd.c:1086 [inline]
  device_release_driver_internal+0x23a/0x4f0 drivers/base/dd.c:1113
  bus_remove_device+0x302/0x5c0 drivers/base/bus.c:556
  device_del+0x467/0xb90 drivers/base/core.c:2269
  usb_disable_device+0x242/0x790 drivers/usb/core/message.c:1237
  usb_disconnect+0x298/0x870 drivers/usb/core/hub.c:2197
  hub_port_connect drivers/usb/core/hub.c:4940 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0xcd2/0x3b00 drivers/usb/core/hub.c:5432
  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7b0/0xe20 kernel/workqueue.c:2417
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff88809a266600
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1544 bytes inside of
  4096-byte region [ffff88809a266600, ffff88809a267600)
The buggy address belongs to the page:
page:ffffea0002689800 count:1 mapcount:0 mapping:ffff88812c3f4600 index:0x0  
compound_mapcount: 0
flags: 0xfff00000010200(slab|head)
raw: 00fff00000010200 dead000000000100 dead000000000200 ffff88812c3f4600
raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff88809a266b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88809a266b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff88809a266c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                       ^
  ffff88809a266c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88809a266d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
