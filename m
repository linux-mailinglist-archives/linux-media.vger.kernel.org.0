Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46474157F30
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 16:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbgBJPvE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 10:51:04 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:56146 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgBJPvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 10:51:03 -0500
Received: by mail-io1-f72.google.com with SMTP id z21so4907481iob.22
        for <linux-media@vger.kernel.org>; Mon, 10 Feb 2020 07:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=0Z4mZBtI2gdriykPJmN0mwKGOFirSgbNkIa1x0WQpo0=;
        b=O9HjgytnKi2vQKEGfaTsA6w2M1Nb1MtvaWfbWiNxoQ9vHu7ud5IlFR5Bc1eOqNzxVC
         HvIYVevDuq59i+B+gfak67MRTaka8zxNlczofnlbh8vt3K6NnBgQL9Zb+cooY8kPHlP1
         wnFnVvM1RWXNde9eAtyJ+dQHMVQhMS1MZwf7PmM/dGNmllJHVu6hgZcARLJr2K2mZla4
         1FFQS69Y2nAKSVjeGuVXuamdYNhZcPltqOEDivJEPUA+ofu+LZChIOTWKztw1Pk1e/2x
         MwexIZNf8H214ikhlahNFHlmXZJtw5qqUWsVtZrltEgaw5PtelR7trfa8yqNtzdbMvHc
         KifA==
X-Gm-Message-State: APjAAAWAlmdADUz5/DhW7UUzIVja+CxgDg/wPVX8ur3RHVmohDfwnWIg
        RELq3+ixhs+uFwZsgsMP4jLTz3dS+gySnIWk3CEf0Apprb2I
X-Google-Smtp-Source: APXvYqzrR5X28Dnt9QIyHtOREXF6/SoFdK8vY+UvCcSf6Yn4HXv9ZCCXIJFDJ/8bdQ1WykzyXtTzj5ZLi9hnqNV22qR+5N7lMqze
MIME-Version: 1.0
X-Received: by 2002:a5d:9708:: with SMTP id h8mr9858742iol.141.1581349861783;
 Mon, 10 Feb 2020 07:51:01 -0800 (PST)
Date:   Mon, 10 Feb 2020 07:51:01 -0800
In-Reply-To: <1581344006.26936.7.camel@suse.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c6fdac059e3ab4c6@google.com>
Subject: Re: KASAN: use-after-free Read in uvc_probe
From:   syzbot <syzbot+9a48339b077c5a80b869@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.de,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered crash:
KASAN: use-after-free Read in uvc_probe

usb 2-1: string descriptor 0 read error: -71
uvcvideo: Found UVC 0.00 device <unnamed> (0bd3:0555)
==================================================================
BUG: KASAN: use-after-free in uvc_register_terms drivers/media/usb/uvc/uvc_driver.c:2038 [inline]
BUG: KASAN: use-after-free in uvc_register_chains drivers/media/usb/uvc/uvc_driver.c:2071 [inline]
BUG: KASAN: use-after-free in uvc_probe.cold+0x2193/0x29fe drivers/media/usb/uvc/uvc_driver.c:2202
Read of size 2 at addr ffff8881d933182e by task kworker/0:2/95

CPU: 0 PID: 95 Comm: kworker/0:2 Not tainted 5.5.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x85 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:639
 uvc_register_terms drivers/media/usb/uvc/uvc_driver.c:2038 [inline]
 uvc_register_chains drivers/media/usb/uvc/uvc_driver.c:2071 [inline]
 uvc_probe.cold+0x2193/0x29fe drivers/media/usb/uvc/uvc_driver.c:2202
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
 usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2537
 hub_port_connect drivers/usb/core/hub.c:5184 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
 port_event drivers/usb/core/hub.c:5470 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5552
 process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 95:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:513 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:486
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:670 [inline]
 uvc_alloc_chain+0x48/0xfa drivers/media/usb/uvc/uvc_driver.c:1692
 uvc_scan_device drivers/media/usb/uvc/uvc_driver.c:1818 [inline]
 uvc_probe.cold+0x15f0/0x29fe drivers/media/usb/uvc/uvc_driver.c:2198
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
 usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2537
 hub_port_connect drivers/usb/core/hub.c:5184 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
 port_event drivers/usb/core/hub.c:5470 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5552
 process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 95:
 save_stack+0x1b/0x80 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:335 [inline]
 __kasan_slab_free+0x117/0x160 mm/kasan/common.c:474
 slab_free_hook mm/slub.c:1425 [inline]
 slab_free_freelist_hook mm/slub.c:1458 [inline]
 slab_free mm/slub.c:3005 [inline]
 kfree+0xd5/0x300 mm/slub.c:3957
 uvc_scan_device drivers/media/usb/uvc/uvc_driver.c:1825 [inline]
 uvc_probe.cold+0x16fd/0x29fe drivers/media/usb/uvc/uvc_driver.c:2198
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
 generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
 usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
 really_probe+0x290/0xad0 drivers/base/dd.c:548
 driver_probe_device+0x223/0x350 drivers/base/dd.c:721
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
 __device_attach+0x217/0x390 drivers/base/dd.c:894
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
 device_add+0x1459/0x1bf0 drivers/base/core.c:2487
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2537
 hub_port_connect drivers/usb/core/hub.c:5184 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
 port_event drivers/usb/core/hub.c:5470 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5552
 process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d9331800
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 46 bytes inside of
 256-byte region [ffff8881d9331800, ffff8881d9331900)
The buggy address belongs to the page:
page:ffffea000764cc00 refcount:1 mapcount:0 mapping:ffff8881da002780 index:0x0 compound_mapcount: 0
raw: 0200000000010200 ffffea0007648d80 0000000e0000000e ffff8881da002780
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881d9331700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8881d9331780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8881d9331800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                  ^
 ffff8881d9331880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881d9331900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         ae179410 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13d466e9e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ad1d751a3a72ae57
dashboard link: https://syzkaller.appspot.com/bug?extid=9a48339b077c5a80b869
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16022395e00000

