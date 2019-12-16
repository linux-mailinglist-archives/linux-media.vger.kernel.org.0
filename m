Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15ACD1206E6
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbfLPNPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:15:20 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:32838 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbfLPNPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:15:11 -0500
Received: by mail-io1-f72.google.com with SMTP id i8so5729583ioi.0
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 05:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=jrC1hy+B+ZUZUUL3zO0Ty88a7c56IoHN5y2LItNpz4g=;
        b=d3qtEqcDKQ4kBfcCqW32w9NJRq0P5quhjGjQbEOeOQWa7s+Cbj7V30J5HCo6KqGN2O
         QcF3Ioghxx9PHOZELk98GT48co2BYz54ciYWyWuhRWih2OxMVyC74D6pWQVIt4Ue0bGf
         xL+Gu5JsXk0gBYWLVJ2ZrgUWnAKOwONTZzSmIv+gNCpGIG+inD2s5HTs576I5G+efoIy
         /shxLaG3I15cGS+6kKCnyszOfLEoBl4U5mAlBptwj3Y7b3RFa1cOD3IFVK2JiYiRX9hM
         cjhoGtLW6Q8JVGeBKPRKxrFR7oIBiVwzHSv+Z95LC0dR+nbIEn3aaJMPRioC+dPgUb5U
         Rr2w==
X-Gm-Message-State: APjAAAU1ZYVfCdq8Pa8rzZaatYJ63HrYVtOUvxBIt2uPG7u9rnLdlxq1
        ODTomezBTtepBXOIjKoPj8IV7Tc+yaJX5UfPq4GUcVVMaC+p
X-Google-Smtp-Source: APXvYqwsKRh3vgeP21Wrq9YSX6ApLsb7V4nNezP2v/oMJABOflvdEuhucLI0lb7fvR7rsC91k6055RuFLZiFiQg9WpNkkLtGhn5Y
MIME-Version: 1.0
X-Received: by 2002:a6b:7e48:: with SMTP id k8mr4574965ioq.39.1576502109853;
 Mon, 16 Dec 2019 05:15:09 -0800 (PST)
Date:   Mon, 16 Dec 2019 05:15:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003ee3610599d20096@google.com>
Subject: KASAN: use-after-free Read in __media_entity_remove_links
From:   syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    4cc037ec usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=104e177ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e9c2b6de462bc469
dashboard link: https://syzkaller.appspot.com/bug?extid=0b0095300dfeb8a83dc8
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117f2fb1e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16842d2ee00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com

usb 1-1: USB disconnect, device number 2
==================================================================
BUG: KASAN: use-after-free in __media_entity_remove_links+0x134/0x160  
drivers/media/mc/mc-entity.c:779
Read of size 8 at addr ffff8881d199f120 by task kworker/1:2/1719

CPU: 1 PID: 1719 Comm: kworker/1:2 Not tainted 5.5.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xef/0x16e lib/dump_stack.c:118
  print_address_description.constprop.0+0x16/0x200 mm/kasan/report.c:374
  __kasan_report.cold+0x37/0x7f mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:639
  __media_entity_remove_links+0x134/0x160 drivers/media/mc/mc-entity.c:779
  __media_device_unregister_entity+0x187/0x300  
drivers/media/mc/mc-device.c:596
  media_device_unregister_entity+0x49/0x70 drivers/media/mc/mc-device.c:688
  v4l2_device_unregister_subdev+0x257/0x380  
drivers/media/v4l2-core/v4l2-device.c:283
  v4l2_device_unregister drivers/media/v4l2-core/v4l2-device.c:100 [inline]
  v4l2_device_unregister+0x139/0x220 drivers/media/v4l2-core/v4l2-device.c:88
  uvc_unregister_video+0x11a/0x210 drivers/media/usb/uvc/uvc_driver.c:1929
  uvc_disconnect+0xbc/0x160 drivers/media/usb/uvc/uvc_driver.c:2242
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
  device_del+0x481/0xd30 drivers/base/core.c:2664
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
  hub_port_connect drivers/usb/core/hub.c:5035 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1753/0x3860 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2264
  worker_thread+0x96/0xe20 kernel/workqueue.c:2410
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 22:
  save_stack+0x1b/0x80 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  __kasan_kmalloc mm/kasan/common.c:513 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:486
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:670 [inline]
  media_add_link+0x47/0x180 drivers/media/mc/mc-entity.c:592
  media_create_pad_link+0x1fb/0x530 drivers/media/mc/mc-entity.c:684
  uvc_mc_create_links drivers/media/usb/uvc/uvc_entity.c:50 [inline]
  uvc_mc_register_entities+0x468/0x77a drivers/media/usb/uvc/uvc_entity.c:114
  uvc_register_chains drivers/media/usb/uvc/uvc_driver.c:2075 [inline]
  uvc_probe.cold+0x2137/0x29de drivers/media/usb/uvc/uvc_driver.c:2201
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

Freed by task 1719:
  save_stack+0x1b/0x80 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  kasan_set_free_info mm/kasan/common.c:335 [inline]
  __kasan_slab_free+0x129/0x170 mm/kasan/common.c:474
  slab_free_hook mm/slub.c:1425 [inline]
  slab_free_freelist_hook mm/slub.c:1458 [inline]
  slab_free mm/slub.c:3005 [inline]
  kfree+0xda/0x310 mm/slub.c:3957
  __media_entity_remove_link+0x25c/0x5d0 drivers/media/mc/mc-entity.c:622
  __media_entity_remove_links+0x86/0x160 drivers/media/mc/mc-entity.c:780
  __media_device_unregister_entity+0x187/0x300  
drivers/media/mc/mc-device.c:596
  media_device_unregister_entity+0x49/0x70 drivers/media/mc/mc-device.c:688
  v4l2_device_unregister_subdev+0x257/0x380  
drivers/media/v4l2-core/v4l2-device.c:283
  v4l2_device_unregister drivers/media/v4l2-core/v4l2-device.c:100 [inline]
  v4l2_device_unregister+0x139/0x220 drivers/media/v4l2-core/v4l2-device.c:88
  uvc_unregister_video+0x11a/0x210 drivers/media/usb/uvc/uvc_driver.c:1929
  uvc_disconnect+0xbc/0x160 drivers/media/usb/uvc/uvc_driver.c:2242
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1134 [inline]
  device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:532
  device_del+0x481/0xd30 drivers/base/core.c:2664
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2200
  hub_port_connect drivers/usb/core/hub.c:5035 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1753/0x3860 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2264
  worker_thread+0x96/0xe20 kernel/workqueue.c:2410
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d199f100
  which belongs to the cache kmalloc-96 of size 96
The buggy address is located 32 bytes inside of
  96-byte region [ffff8881d199f100, ffff8881d199f160)
The buggy address belongs to the page:
page:ffffea00074667c0 refcount:1 mapcount:0 mapping:ffff8881da002f00  
index:0xffff8881d199fe80
raw: 0200000000000200 ffffea0007474e40 0000000e0000000e ffff8881da002f00
raw: ffff8881d199fe80 0000000080200016 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d199f000: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
  ffff8881d199f080: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
> ffff8881d199f100: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                                ^
  ffff8881d199f180: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
  ffff8881d199f200: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
