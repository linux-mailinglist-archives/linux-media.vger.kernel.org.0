Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFD4B3B52
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 15:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733276AbfIPN3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 09:29:17 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:35296 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733267AbfIPN3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 09:29:15 -0400
Received: by mail-io1-f69.google.com with SMTP id 18so50767912iof.2
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 06:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=qLNORXdlbsWjGAZLAd3piPYffVWHIm2TyIyzvE96vw8=;
        b=RUxcvy9r5Th2NZl4+m/56AUOGvOfIp26+TIhSLfWS2jNXgSNVok8Qdlq0ogYjxdGkw
         lhvhWB63030m4H1IfmKY4012q8b+0YmO6BvnTah4CIv/EYRVqHAsGwMmUXXyPT4+A2Ce
         Ib72xJVrZ3XRI38p93sbdnprocj9uQBmEM6+AL/w9YMIAHlWszMTQ0rJXer1sVmkxcQX
         DcPbGSf2wia9Um5ubLPcyHlWL9jMvl/ywr4WuVCdPBxKbQx15mShjuH3umGGdBTrs6IE
         FCSJTFfEFWnMV6rZ3hXPUf/IBO0EgCVmNJ73pBjgoUQ5ebqXhwsWsG+qPyCPubBeVytp
         QMew==
X-Gm-Message-State: APjAAAXmJ0W4adixsmY32e5opfJ1bZ7XV6X1cp9AUNRYH3w9NqH3wNYH
        W8mttaHQg8LMWQQXwhexh6cIscGTEaXEoGiIsgKmTT5W+BOr
X-Google-Smtp-Source: APXvYqxvfnLKWVljKr1lxbJm/wgfFozfNZKDbTfhv3oWfXtRyJ6c3Hz79xdiwwM8f9F1XjG9gUGU2hL3rLIj2NorZ38hDxZNHWrq
MIME-Version: 1.0
X-Received: by 2002:a6b:fe11:: with SMTP id x17mr16821546ioh.6.1568640552994;
 Mon, 16 Sep 2019 06:29:12 -0700 (PDT)
Date:   Mon, 16 Sep 2019 06:29:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f111a20592ab9671@google.com>
Subject: KASAN: invalid-free in usbvision_release
From:   syzbot <syzbot+0350a2346edac2799574@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com, hverkuil@xs4all.nl,
        kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=11caf595600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=0350a2346edac2799574
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+0350a2346edac2799574@syzkaller.appspotmail.com

usb 6-1: usbvision_write_reg: failed: error -2
usbvision_set_audio: can't write iopin register for audio switching
usb 6-1: usbvision_write_reg: failed: error -19
usbvision_audio_off: can't write reg
usbvision_radio_close: Final disconnect
==================================================================
BUG: KASAN: double-free or invalid-free in usbvision_release+0x13b/0x1c0  
drivers/media/usb/usbvision/usbvision-video.c:1353

CPU: 1 PID: 7362 Comm: v4l_id Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  kasan_report_invalid_free+0x61/0xa0 mm/kasan/report.c:444
  __kasan_slab_free+0x162/0x180 mm/kasan/common.c:434
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3957
  usbvision_release+0x13b/0x1c0  
drivers/media/usb/usbvision/usbvision-video.c:1353
  usbvision_radio_close.cold+0x6f/0x74  
drivers/media/usb/usbvision/usbvision-video.c:1125
  v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
  __fput+0x2d7/0x840 fs/file_table.c:280
  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f0c157b92b0
Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0  
07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
RSP: 002b:00007fff5c949928 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007f0c157b92b0
RDX: 00007f0c15a6fdf0 RSI: 0000000000000001 RDI: 0000000000000003
RBP: 0000000000000000 R08: 00007f0c15a6fdf0 R09: 000000000000000a
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
R13: 00007fff5c949a80 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 1995:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:493 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
  kmalloc_array include/linux/slab.h:676 [inline]
  usbvision_probe.cold+0xaae/0x1e57  
drivers/media/usb/usbvision/usbvision-video.c:1484
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 1995:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3957
  usbvision_release+0x13b/0x1c0  
drivers/media/usb/usbvision/usbvision-video.c:1353
  usbvision_disconnect+0x16c/0x1d0  
drivers/media/usb/usbvision/usbvision-video.c:1582
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x420/0xb10 drivers/base/core.c:2339
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d41ad420
  which belongs to the cache kmalloc-32 of size 32
The buggy address is located 0 bytes inside of
  32-byte region [ffff8881d41ad420, ffff8881d41ad440)
The buggy address belongs to the page:
page:ffffea0007506b40 refcount:1 mapcount:0 mapping:ffff8881da003400  
index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 ffffea0007662c40 0000000f0000000f ffff8881da003400
raw: 0000000000000000 0000000080550055 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d41ad300: fb fb fb fb fc fc fb fb fb fb fc fc fb fb fb fb
  ffff8881d41ad380: fc fc fb fb fb fb fc fc fb fb fb fb fc fc fb fb
> ffff8881d41ad400: fb fb fc fc fb fb fb fb fc fc fb fb fb fb fc fc
                                ^
  ffff8881d41ad480: fb fb fb fb fc fc fb fb fb fb fc fc fb fb fb fb
  ffff8881d41ad500: fc fc 00 00 00 00 fc fc fb fb fb fb fc fc fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
