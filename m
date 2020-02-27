Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98924171D63
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 15:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389835AbgB0OUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 09:20:15 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:49666 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389718AbgB0OUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 09:20:12 -0500
Received: by mail-io1-f72.google.com with SMTP id v2so3621855ioq.16
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2020 06:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Hd0HpDzmbpNnrsFjBCVh0lTrAR3AwaF5k/G21OfNRZE=;
        b=RWt8/AxHf8//rfxv8oDExS0LZcaQ0nxzmKqLs3einZFe8hReBYd123CdaA0paIMHcD
         MVADst5CpyzPu+XYDoxuS8b4LmVUqC2Om1ev79Q6nA7NTeW6G3NxNvEMNoXvHfqlg5p6
         JZX//gQzoNwipLA8pUZPdKL5Rs6XnsHvY8SDIWK2UtHqfJLQo+EgMf2rFl3Mh7iIDsLL
         CcKQM8JhZ3B9x3E3j+LP31eKc5ZpT4Kcw48kXfFf1EAM11hC51GnMARwGZZ66EqAs4/X
         f+UaidpQLFweLTSy80jmrxJFuHk6thR4ZNJSp7OE/pzAqG6VlIQamiNUKjQBAml+6YVY
         WlIQ==
X-Gm-Message-State: APjAAAU3Iissc016QIhjwp+/irVJQ9HSHYJZG3Su1poiUN0AagdnVXj6
        Ac3wC1BzgXE+Jlaqcmk4qdHfMbkZJYUDIYmvG5PrRSSkaA9v
X-Google-Smtp-Source: APXvYqxrL+yfikkTvPKB29UhXktlBL4AiKejOtMiNK8Hhjlmbqchlq8feXCDyp/fSJLjlFl48Ik1xd73rIyf5UanbrxRlSowwVVh
MIME-Version: 1.0
X-Received: by 2002:a6b:5c0a:: with SMTP id z10mr4836117ioh.228.1582813212155;
 Thu, 27 Feb 2020 06:20:12 -0800 (PST)
Date:   Thu, 27 Feb 2020 06:20:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000041a20d059f8f6bd3@google.com>
Subject: KASAN: use-after-free Read in load_firmware_cb
From:   syzbot <syzbot+434bc1054077aac11da3@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d6ff8147 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=136b9c91e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90a3d9bed5648419
dashboard link: https://syzkaller.appspot.com/bug?extid=434bc1054077aac11da3
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c32fd9e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14fd1531e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+434bc1054077aac11da3@syzkaller.appspotmail.com

usb 1-1:0.254: Direct firmware load for xc3028-v27.fw failed with error -2
==================================================================
BUG: KASAN: use-after-free in load_firmware_cb+0x173/0x18c drivers/media/tuners/tuner-xc2028.c:1364
Read of size 8 at addr ffff8881cd828308 by task kworker/0:1/12

CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events request_firmware_work_func
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x77 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 load_firmware_cb+0x173/0x18c drivers/media/tuners/tuner-xc2028.c:1364
 request_firmware_work_func+0x126/0x242 drivers/base/firmware_loader/main.c:976
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 12:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:515 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:488
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 tuner_probe+0xa4/0x1182 drivers/media/v4l2-core/tuner-core.c:638
 i2c_device_probe+0x51a/0x800 drivers/i2c/i2c-core-base.c:396
 really_probe+0x290/0xac0 drivers/base/dd.c:551
 driver_probe_device+0x223/0x350 drivers/base/dd.c:724
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:831
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x217/0x390 drivers/base/dd.c:897
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 i2c_new_client_device+0x589/0xa70 drivers/i2c/i2c-core-base.c:784
 i2c_new_device+0x19/0x50 drivers/i2c/i2c-core-base.c:827
 v4l2_i2c_new_subdev_board+0xaf/0x2a0 drivers/media/v4l2-core/v4l2-i2c.c:80
 v4l2_i2c_new_subdev+0xb8/0xf0 drivers/media/v4l2-core/v4l2-i2c.c:135
 em28xx_v4l2_init drivers/media/usb/em28xx/em28xx-video.c:2627 [inline]
 em28xx_v4l2_init.cold+0x9cc/0x33eb drivers/media/usb/em28xx/em28xx-video.c:2520
 em28xx_init_extension+0x12f/0x1f0 drivers/media/usb/em28xx/em28xx-core.c:1128
 request_module_async+0x5d/0x70 drivers/media/usb/em28xx/em28xx-cards.c:3320
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 process_scheduled_works kernel/workqueue.c:2326 [inline]
 worker_thread+0x73e/0xe20 kernel/workqueue.c:2415
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 12:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x117/0x160 mm/kasan/common.c:476
 slab_free_hook mm/slub.c:1444 [inline]
 slab_free_freelist_hook mm/slub.c:1477 [inline]
 slab_free mm/slub.c:3024 [inline]
 kfree+0xd5/0x300 mm/slub.c:3976
 tuner_remove+0x198/0x200 drivers/media/v4l2-core/tuner-core.c:791
 i2c_device_remove+0xcf/0x250 drivers/i2c/i2c-core-base.c:426
 __device_release_driver drivers/base/dd.c:1135 [inline]
 device_release_driver_internal+0x231/0x500 drivers/base/dd.c:1168
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2664
 device_unregister+0x22/0xc0 drivers/base/core.c:2696
 i2c_unregister_device+0x38/0x40 include/linux/err.h:41
 v4l2_i2c_subdev_unregister+0xa2/0xc0 drivers/media/v4l2-core/v4l2-i2c.c:28
 v4l2_device_unregister drivers/media/v4l2-core/v4l2-device.c:102 [inline]
 v4l2_device_unregister+0x18a/0x220 drivers/media/v4l2-core/v4l2-device.c:88
 em28xx_v4l2_init drivers/media/usb/em28xx/em28xx-video.c:2908 [inline]
 em28xx_v4l2_init.cold+0xd26/0x33eb drivers/media/usb/em28xx/em28xx-video.c:2520
 em28xx_init_extension+0x12f/0x1f0 drivers/media/usb/em28xx/em28xx-core.c:1128
 request_module_async+0x5d/0x70 drivers/media/usb/em28xx/em28xx-cards.c:3320
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2264
 process_scheduled_works kernel/workqueue.c:2326 [inline]
 worker_thread+0x73e/0xe20 kernel/workqueue.c:2415
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881cd828000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 776 bytes inside of
 2048-byte region [ffff8881cd828000, ffff8881cd828800)
The buggy address belongs to the page:
page:ffffea0007360a00 refcount:1 mapcount:0 mapping:ffff8881da00c000 index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c000
raw: 0000000000000000 0000000080080008 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881cd828200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881cd828280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8881cd828300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff8881cd828380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881cd828400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
