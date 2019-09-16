Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38CC1B3B57
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 15:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733255AbfIPN3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 09:29:13 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:46772 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733245AbfIPN3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 09:29:13 -0400
Received: by mail-io1-f71.google.com with SMTP id t11so9241827ioc.13
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2019 06:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=EkMMZHB3EbIkeShCeJ9qFKu38co2EiVjf80B4DMO6dU=;
        b=fDf8yn8GP0D3IEmdsqch9D8w5qZ0+ic02phJRTuwiNoqso/ujQFpBocxEHitBOno+n
         hz4IWoF2EySSxoqJj3TCYmUVXpEklO2LBfbflBlthjrgFN8g/gzPy2Z+Wgw6nlgL45DA
         5GuWzT4RoURDGVZ8fBTsg3duP2NbEYZofWorsf+uaU9NJg7nzGaHuVT8zRDlMkkpPqTA
         KbF69uY+MmO2B/fTYWgMIdw2z8Z1bUSYjl5kgUT22uSrCfOt9ynKNVHZRYCbCLAiImqn
         R/54PfNtJztR5Mcw2QzhlMOiXsByqgS+WdJprU1O7G2PRm7ro3alqsjvtxgkTHSM0ty9
         pS1Q==
X-Gm-Message-State: APjAAAWyUdZW6V/Q5ocSdRNtqNpkHMw85UBFfkxy8apmhgjQG8ep2DbV
        cUILmNoz4bTj+Uy/xm5Tu1tHhNE3ddqD/jM28k5xnZ1HnaXr
X-Google-Smtp-Source: APXvYqw9xNlxuBH3SE2H+WjyP/xzJfwaCvWcbemzs9/Lwoe67YDmbIfyjfIh1bJThQo5+3RYu8Q+2aQRIF7iQq7+DVYQgj+GMKty
MIME-Version: 1.0
X-Received: by 2002:a02:7113:: with SMTP id n19mr23675349jac.82.1568640552607;
 Mon, 16 Sep 2019 06:29:12 -0700 (PDT)
Date:   Mon, 16 Sep 2019 06:29:12 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000eb2d700592ab96a0@google.com>
Subject: KASAN: use-after-free Write in usbvision_decompress_alloc
From:   syzbot <syzbot+37e33be6d077b2c85b4a@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com, bigeasy@linutronix.de,
        gregkh@linuxfoundation.org, hverkuil@xs4all.nl, kjlu@umn.edu,
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

HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=176af9fa600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=37e33be6d077b2c85b4a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+37e33be6d077b2c85b4a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in usbvision_decompress_alloc+0x63/0x70  
drivers/media/usb/usbvision/usbvision-core.c:376
Write of size 8 at addr ffff8881d3989ca0 by task v4l_id/9731

CPU: 0 PID: 9731 Comm: v4l_id Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:618
  usbvision_decompress_alloc+0x63/0x70  
drivers/media/usb/usbvision/usbvision-core.c:376
  usbvision_v4l2_open+0x2b7/0x2f0  
drivers/media/usb/usbvision/usbvision-video.c:329
  v4l2_open+0x20f/0x3d0 drivers/media/v4l2-core/v4l2-dev.c:423
  chrdev_open+0x219/0x5c0 fs/char_dev.c:414
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3f50 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1089
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7fd7a6293120
Code: 48 8b 15 1b 4d 2b 00 f7 d8 64 89 02 83 c8 ff c3 90 90 90 90 90 90 90  
90 90 90 83 3d d5 a4 2b 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 31 c3 48 83 ec 08 e8 5e 8c 01 00 48 89 04 24
RSP: 002b:00007fff16a863b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007fff16a86518 RCX: 00007fd7a6293120
RDX: 00007fd7a6548138 RSI: 0000000000000000 RDI: 00007fff16a87f1b
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
R13: 00007fff16a86510 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 2755:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:493 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1310 [inline]
  usbvision_probe.cold+0x586/0x1e57  
drivers/media/usb/usbvision/usbvision-video.c:1464
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
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 2755:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1474 [inline]
  slab_free mm/slub.c:3016 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3957
  usbvision_release+0x181/0x1c0  
drivers/media/usb/usbvision/usbvision-video.c:1359
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
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d3988000
  which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 7328 bytes inside of
  8192-byte region [ffff8881d3988000, ffff8881d398a000)
The buggy address belongs to the page:
page:ffffea00074e6200 refcount:1 mapcount:0 mapping:ffff8881da00c500  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 ffffea0007174200 0000000300000003 ffff8881da00c500
raw: 0000000000000000 0000000080030003 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d3989b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d3989c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881d3989c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                ^
  ffff8881d3989d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d3989d80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
