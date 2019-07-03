Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5695DA1A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 03:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfGCBBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 21:01:08 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:55507 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfGCBBI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 21:01:08 -0400
Received: by mail-io1-f72.google.com with SMTP id f22so628099ioh.22
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2019 18:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+jAjzkxOy88eEU8Ro2pPWiTTvCPP5IpFAzSx1DNnSMI=;
        b=P3sXi0PtQrGgy6Q+oGx2/B4oWPslGfcjG7NOTW3NTt0wGHJs02cViL1EECOHfZZi85
         Pmntpaw6SWrnO7padLrMUdPAfG1oZj+MgKYFZjsMOwDeZ7aWEkwHGc+C3ZeGNPjhD16U
         8yfpxx6bRiLHOaFIw2TjQtChUKKOORSrmGFkc7qAaw6BzyYVnHfeP+nqZm+UYro65OSl
         eWVPW/mWhy7PcEKwiFRXjxR6urQVWguCvoNz9HDbwxJFTlSMDj1GLptVrS10gSFo40/+
         o/DNQTQkDN4r6UKIRgmdz61bjh8Ub1iCyyIXj6ozOGBCL9iZkJHgTN8mXS26Aqzmv718
         yNhA==
X-Gm-Message-State: APjAAAXTJJ4Xo0mFEcfucS6ge2hUQ061UdnDmVoZ3eLpPydTQbX6WVDe
        g/JUHcA8c7MuKuq0agWSN2PiJ1pAmaxqBZSnjEJ/OB5/R9Nv
X-Google-Smtp-Source: APXvYqzjtwIxcClrQ8XIltsZj2funW9a0OSCqz+qgF2HIq0hhl1QFKSyjXAm4ZoAahCxLQd8iP/64TBx7P5Tka13hq8b4LlO4o9H
MIME-Version: 1.0
X-Received: by 2002:a02:a581:: with SMTP id b1mr40177373jam.84.1562115666965;
 Tue, 02 Jul 2019 18:01:06 -0700 (PDT)
Date:   Tue, 02 Jul 2019 18:01:06 -0700
In-Reply-To: <0000000000002e03f40586a3e512@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006d7e14058cbc6545@google.com>
Subject: Re: KASAN: use-after-free Read in cpia2_usb_disconnect
From:   syzbot <syzbot+0c90fc937c84f97d0aa6@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com,
        hverkuil-cisco@xs4all.nl, keescook@chromium.org,
        kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=11e19043a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
dashboard link: https://syzkaller.appspot.com/bug?extid=0c90fc937c84f97d0aa6
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147d42eda00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=104c268ba00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+0c90fc937c84f97d0aa6@syzkaller.appspotmail.com

cpia2: Message: count = 1, register[0] = 0x0
cpia2: Unexpected error: -19
==================================================================
BUG: KASAN: use-after-free in cpia2_usb_disconnect+0x1a4/0x1c0  
drivers/media/usb/cpia2/cpia2_usb.c:898
Read of size 8 at addr ffff8881cf6c4e50 by task kworker/1:1/22

CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.2.0-rc6+ #13
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  cpia2_usb_disconnect+0x1a4/0x1c0 drivers/media/usb/cpia2/cpia2_usb.c:898
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x460/0xb80 drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2197
  hub_port_connect drivers/usb/core/hub.c:4940 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1409/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 22:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:489 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
  kmalloc include/linux/slab.h:547 [inline]
  kzalloc include/linux/slab.h:742 [inline]
  cpia2_init_camera_struct+0x40/0x110  
drivers/media/usb/cpia2/cpia2_core.c:2176
  cpia2_usb_probe.cold+0x37/0x45a drivers/media/usb/cpia2/cpia2_usb.c:833
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
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 22:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:451
  slab_free_hook mm/slub.c:1421 [inline]
  slab_free_freelist_hook mm/slub.c:1448 [inline]
  slab_free mm/slub.c:2994 [inline]
  kfree+0xd7/0x280 mm/slub.c:3949
  v4l2_device_release drivers/media/v4l2-core/v4l2-device.c:55 [inline]
  kref_put include/linux/kref.h:65 [inline]
  v4l2_device_put+0x76/0x90 drivers/media/v4l2-core/v4l2-device.c:60
  cpia2_usb_disconnect+0x79/0x1c0 drivers/media/usb/cpia2/cpia2_usb.c:896
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1081 [inline]
  device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1112
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x460/0xb80 drivers/base/core.c:2274
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2197
  hub_port_connect drivers/usb/core/hub.c:4940 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x1409/0x3590 drivers/usb/core/hub.c:5432
  process_one_work+0x905/0x1570 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x30b/0x410 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881cf6c4400
  which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 2640 bytes inside of
  4096-byte region [ffff8881cf6c4400, ffff8881cf6c5400)
The buggy address belongs to the page:
page:ffffea00073db000 refcount:1 mapcount:0 mapping:ffff8881dac02600  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 0000000000000000 0000000100000001 ffff8881dac02600
raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cf6c4d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cf6c4d80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cf6c4e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                  ^
  ffff8881cf6c4e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cf6c4f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

