Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FFF2B68DE
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 16:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgKQPk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 10:40:26 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:49610 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgKQPk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 10:40:26 -0500
Received: by mail-io1-f71.google.com with SMTP id v15so13407776ioq.16
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 07:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=uGeuYqpVtihTj5/nHBNIe/i2cR/1M+L/pN2RP/KvK2o=;
        b=FnRxjlUfE8DIlbcySg5q33NOW19xNyHQmwNpAEhq/DvjndWcN89j3sUFu6J3eRT8o6
         /Bgd2oLiDZ2Jgq2KiQfQCGnUjQQLRYyPVvyDJ/MjVpTd5FhWutpjE0L0GeoBONJCwFW/
         OX90TlSIsn7UYkqxHUSuO4BLioLS7EnRgmIiZOBjUkIe36ADnkEaluUsaULUXVmWxMN4
         4/QM9t3EBeoD10TSZpzUn9LHVBGyTHA7PLMHEFSsgPRDXtV3Wr4hUskr8TkYP5Y67XGw
         ivuz016fpY9YpW5L51Nyk5Nnh1v7LHex8bNb3p1bHR21kcGSqrQQ1c56s20HX6VsQ6jn
         r6+w==
X-Gm-Message-State: AOAM533cP3dHMP8iIc46zcT/0unS1pjhD3suAumWFn5PBsC6DHoW3iIX
        PKxKHGOgwofHpaFa5VQNPT1gWw0qdfO0JHi5M933xQB9Qmz9
X-Google-Smtp-Source: ABdhPJzRoRo+2DfK77+NLdQWjCeQEDvaQoFh3DK6DwcUl6DBnkFMg3Ab+qUYOaZUfxvxSI6ha57WphkUhl2T7sV8CDJrj0T9VK0r
MIME-Version: 1.0
X-Received: by 2002:a92:d489:: with SMTP id p9mr11751059ilg.123.1605627624161;
 Tue, 17 Nov 2020 07:40:24 -0800 (PST)
Date:   Tue, 17 Nov 2020 07:40:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002e09ef05b44f501a@google.com>
Subject: KMSAN: uninit-value in dvb_usb_adapter_dvb_init (2)
From:   syzbot <syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com>
To:     glider@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    e1617422 kmsan: kmsan_percpu_tstate should be a scalar, no..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=164d4712500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c7345cc7efc5dc4
dashboard link: https://syzkaller.appspot.com/bug?extid=e27b4fd589762b0b9329
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com

dvb-usb: will pass the complete MPEG2 transport stream to the software demuxer.
dvbdev: DVB: registering new adapter (Hauppauge WinTV-NOVA-T usb2)
usb 5-1: media controller created
dvb-usb: bulk message failed: -22 (5/0)
dvb-usb: bulk message failed: -22 (5/0)
dvb-usb: bulk message failed: -22 (5/0)
=====================================================
BUG: KMSAN: uninit-value in mac_address_string+0x1040/0x1170 lib/vsprintf.c:1281
CPU: 1 PID: 9245 Comm: kworker/1:6 Not tainted 5.9.0-rc8-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:122
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:201
 mac_address_string+0x1040/0x1170 lib/vsprintf.c:1281
 pointer+0x9fe/0x1ca0 lib/vsprintf.c:2241
 vsnprintf+0x1a4f/0x3610 lib/vsprintf.c:2622
 vscnprintf+0xbe/0x1c0 lib/vsprintf.c:2721
 vprintk_store+0xf2/0x1440 kernel/printk/printk.c:1951
 vprintk_emit+0x320/0x990 kernel/printk/printk.c:2018
 vprintk_default+0x90/0xa0 kernel/printk/printk.c:2054
 vprintk_func+0x2f7/0x300 kernel/printk/printk_safe.c:393
 printk+0x180/0x1c3 kernel/printk/printk.c:2085
 dvb_usb_adapter_dvb_init+0x818/0x1300 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:166
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:83 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
 dvb_usb_device_init+0x27fd/0x3350 drivers/media/usb/dvb-usb/dvb-usb-init.c:287
 nova_t_probe+0x73/0x80 drivers/media/usb/dvb-usb/nova-t-usb2.c:156
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:557
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2926
 usb_set_configuration+0x395f/0x3f90 drivers/usb/core/message.c:2025
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:240
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:557
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2926
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x59b1/0x8640 drivers/usb/core/hub.c:5576
 process_one_work+0x1224/0x20a0 kernel/workqueue.c:2269
 process_scheduled_works kernel/workqueue.c:2331 [inline]
 worker_thread+0x129c/0x2740 kernel/workqueue.c:2417
 kthread+0x51c/0x560 kernel/kthread.c:293
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Uninit was stored to memory at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:129 [inline]
 kmsan_internal_chain_origin+0xad/0x130 mm/kmsan/kmsan.c:297
 __msan_chain_origin+0x57/0xa0 mm/kmsan/kmsan_instr.c:151
 nova_t_read_mac_address+0x2d4/0x2f0 drivers/media/usb/dvb-usb/nova-t-usb2.c:144
 dvb_usb_adapter_dvb_init+0x774/0x1300 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:165
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:83 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
 dvb_usb_device_init+0x27fd/0x3350 drivers/media/usb/dvb-usb/dvb-usb-init.c:287
 nova_t_probe+0x73/0x80 drivers/media/usb/dvb-usb/nova-t-usb2.c:156
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:557
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2926
 usb_set_configuration+0x395f/0x3f90 drivers/usb/core/message.c:2025
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:240
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:557
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2926
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x59b1/0x8640 drivers/usb/core/hub.c:5576
 process_one_work+0x1224/0x20a0 kernel/workqueue.c:2269
 process_scheduled_works kernel/workqueue.c:2331 [inline]
 worker_thread+0x129c/0x2740 kernel/workqueue.c:2417
 kthread+0x51c/0x560 kernel/kthread.c:293
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Uninit was stored to memory at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:129 [inline]
 kmsan_internal_chain_origin+0xad/0x130 mm/kmsan/kmsan.c:297
 __msan_chain_origin+0x57/0xa0 mm/kmsan/kmsan_instr.c:151
 dibusb_read_eeprom_byte+0x513/0x540 drivers/media/usb/dvb-usb/dibusb-common.c:233
 nova_t_read_mac_address+0x1e3/0x2f0 drivers/media/usb/dvb-usb/nova-t-usb2.c:142
 dvb_usb_adapter_dvb_init+0x774/0x1300 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:165
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:83 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
 dvb_usb_device_init+0x27fd/0x3350 drivers/media/usb/dvb-usb/dvb-usb-init.c:287
 nova_t_probe+0x73/0x80 drivers/media/usb/dvb-usb/nova-t-usb2.c:156
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:557
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2926
 usb_set_configuration+0x395f/0x3f90 drivers/usb/core/message.c:2025
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:240
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:557
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2926
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x59b1/0x8640 drivers/usb/core/hub.c:5576
 process_one_work+0x1224/0x20a0 kernel/workqueue.c:2269
 process_scheduled_works kernel/workqueue.c:2331 [inline]
 worker_thread+0x129c/0x2740 kernel/workqueue.c:2417
 kthread+0x51c/0x560 kernel/kthread.c:293
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:129 [inline]
 kmsan_internal_poison_shadow+0x5c/0xf0 mm/kmsan/kmsan.c:112
 kmsan_slab_alloc+0x8d/0xe0 mm/kmsan/kmsan_hooks.c:80
 slab_alloc_node mm/slub.c:2903 [inline]
 slab_alloc mm/slub.c:2912 [inline]
 kmem_cache_alloc_trace+0x61e/0xc90 mm/slub.c:2929
 kmalloc include/linux/slab.h:554 [inline]
 dibusb_read_eeprom_byte+0xad/0x540 drivers/media/usb/dvb-usb/dibusb-common.c:226
 nova_t_read_mac_address+0x1e3/0x2f0 drivers/media/usb/dvb-usb/nova-t-usb2.c:142
 dvb_usb_adapter_dvb_init+0x774/0x1300 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:165
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:83 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
 dvb_usb_device_init+0x27fd/0x3350 drivers/media/usb/dvb-usb/dvb-usb-init.c:287
 nova_t_probe+0x73/0x80 drivers/media/usb/dvb-usb/nova-t-usb2.c:156
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:557
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2926
 usb_set_configuration+0x395f/0x3f90 drivers/usb/core/message.c:2025
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:240
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:557
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2926
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x59b1/0x8640 drivers/usb/core/hub.c:5576
 process_one_work+0x1224/0x20a0 kernel/workqueue.c:2269
 process_scheduled_works kernel/workqueue.c:2331 [inline]
 worker_thread+0x129c/0x2740 kernel/workqueue.c:2417
 kthread+0x51c/0x560 kernel/kthread.c:293
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
