Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4742CFAF2
	for <lists+linux-media@lfdr.de>; Sat,  5 Dec 2020 11:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgLEKGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Dec 2020 05:06:51 -0500
Received: from mail-pl1-f200.google.com ([209.85.214.200]:52624 "EHLO
        mail-pl1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbgLEKFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Dec 2020 05:05:31 -0500
Received: by mail-pl1-f200.google.com with SMTP id x11so4512711plo.19
        for <linux-media@vger.kernel.org>; Sat, 05 Dec 2020 02:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=X3Q4iorsKYAg9y8vXtf4DLwQF963WQWAtNd5Uoco39g=;
        b=HnoWp2lq6s6q6hLtxrT8i5HtLuME9tb21oVCS8vWnSpCSGNvqhNVYM1yagpeQ/CUKA
         h12xuGF6lMPBonsrYcSpp6Eke4memHmKCCnzzq7HgKTyKQcD+dN6B42t0gUNJTS04QDr
         BxCfNH6IAecIQJHoYs3COjGpB+Tw0LFmhAM/vpw3kazFmGrYeE49DceCFRdmo3q6ETZS
         yQi2CR95+QAZrl6YnvYIDr7A4Sj0oYVV+GYZiJlM9+LUB6BPYcD7yiprZXeP/+A5UYKN
         2yvRyb6FK5759WtZX/wKVXcp2zmbSE0O5R9R7Kc+PCtntOFN1+Cd0q3cd+qIAF6ONe8T
         dT0Q==
X-Gm-Message-State: AOAM532OeKY8gAcLtslIuK/iwjgwlMkn0IdQBErhes0TMsCRTKbXO+iE
        1kVMTime1syBnrM2cT2ItuvA1em+Q1N/1oHDqLfL8URbMnNo
X-Google-Smtp-Source: ABdhPJyIeLqIvkfYrLstDpLLu/VrkVVKWih7ED1QleNkOGFPkm2EVerw3KmsY2MTopRvoR9B9OvBQ7+ssvi8Eqaumb0FJ5lw+28A
MIME-Version: 1.0
X-Received: by 2002:a5d:9b8f:: with SMTP id r15mr10323367iom.35.1607162229535;
 Sat, 05 Dec 2020 01:57:09 -0800 (PST)
Date:   Sat, 05 Dec 2020 01:57:09 -0800
In-Reply-To: <0000000000002e09ef05b44f501a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c9bba405b5b49d6d@google.com>
Subject: Re: KMSAN: uninit-value in dvb_usb_adapter_dvb_init (2)
From:   syzbot <syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com>
To:     glider@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    73d62e81 kmsan: random: prevent boot-time reports in _mix_..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=170babf7500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eef728deea880383
dashboard link: https://syzkaller.appspot.com/bug?extid=e27b4fd589762b0b9329
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=158833f7500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=102a3437500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e27b4fd589762b0b9329@syzkaller.appspotmail.com

dvb-usb: bulk message failed: -22 (5/0)
dvb-usb: bulk message failed: -22 (5/0)
dvb-usb: bulk message failed: -22 (5/0)
=====================================================
BUG: KMSAN: uninit-value in mac_address_string+0x1040/0x1170 lib/vsprintf.c:1281
CPU: 1 PID: 3485 Comm: kworker/1:2 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 mac_address_string+0x1040/0x1170 lib/vsprintf.c:1281
 pointer+0x9fe/0x1ca0 lib/vsprintf.c:2241
 vsnprintf+0x1a4f/0x3610 lib/vsprintf.c:2622
 vscnprintf+0xbe/0x1c0 lib/vsprintf.c:2721
 vprintk_store+0xff/0x14a0 kernel/printk/printk.c:1954
 vprintk_emit+0x2ae/0x820 kernel/printk/printk.c:2018
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2052
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2083
 dvb_usb_adapter_dvb_init+0x818/0x1300 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:166
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:83 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
 dvb_usb_device_init+0x27fd/0x3350 drivers/media/usb/dvb-usb/dvb-usb-init.c:287
 nova_t_probe+0x73/0x80 drivers/media/usb/dvb-usb/nova-t-usb2.c:156
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_set_configuration+0x39cf/0x4010 drivers/usb/core/message.c:2159
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5222 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 port_event drivers/usb/core/hub.c:5508 [inline]
 hub_event+0x5bc9/0x8890 drivers/usb/core/hub.c:5590
 process_one_work+0x121c/0x1fc0 kernel/workqueue.c:2272
 worker_thread+0x10cc/0x2740 kernel/workqueue.c:2418
 kthread+0x51c/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Uninit was stored to memory at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:121 [inline]
 kmsan_internal_chain_origin+0xad/0x130 mm/kmsan/kmsan.c:289
 __msan_chain_origin+0x57/0xa0 mm/kmsan/kmsan_instr.c:147
 nova_t_read_mac_address+0x2d4/0x2f0 drivers/media/usb/dvb-usb/nova-t-usb2.c:144
 dvb_usb_adapter_dvb_init+0x774/0x1300 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:165
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:83 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
 dvb_usb_device_init+0x27fd/0x3350 drivers/media/usb/dvb-usb/dvb-usb-init.c:287
 nova_t_probe+0x73/0x80 drivers/media/usb/dvb-usb/nova-t-usb2.c:156
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_set_configuration+0x39cf/0x4010 drivers/usb/core/message.c:2159
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5222 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 port_event drivers/usb/core/hub.c:5508 [inline]
 hub_event+0x5bc9/0x8890 drivers/usb/core/hub.c:5590
 process_one_work+0x121c/0x1fc0 kernel/workqueue.c:2272
 worker_thread+0x10cc/0x2740 kernel/workqueue.c:2418
 kthread+0x51c/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Uninit was stored to memory at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:121 [inline]
 kmsan_internal_chain_origin+0xad/0x130 mm/kmsan/kmsan.c:289
 __msan_chain_origin+0x57/0xa0 mm/kmsan/kmsan_instr.c:147
 dibusb_read_eeprom_byte+0x513/0x540 drivers/media/usb/dvb-usb/dibusb-common.c:233
 nova_t_read_mac_address+0x1e3/0x2f0 drivers/media/usb/dvb-usb/nova-t-usb2.c:142
 dvb_usb_adapter_dvb_init+0x774/0x1300 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:165
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:83 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
 dvb_usb_device_init+0x27fd/0x3350 drivers/media/usb/dvb-usb/dvb-usb-init.c:287
 nova_t_probe+0x73/0x80 drivers/media/usb/dvb-usb/nova-t-usb2.c:156
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_set_configuration+0x39cf/0x4010 drivers/usb/core/message.c:2159
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5222 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 port_event drivers/usb/core/hub.c:5508 [inline]
 hub_event+0x5bc9/0x8890 drivers/usb/core/hub.c:5590
 process_one_work+0x121c/0x1fc0 kernel/workqueue.c:2272
 worker_thread+0x10cc/0x2740 kernel/workqueue.c:2418
 kthread+0x51c/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:121 [inline]
 kmsan_internal_poison_shadow+0x5c/0xf0 mm/kmsan/kmsan.c:104
 kmsan_slab_alloc+0x8d/0xe0 mm/kmsan/kmsan_hooks.c:76
 slab_alloc_node mm/slub.c:2906 [inline]
 slab_alloc mm/slub.c:2915 [inline]
 kmem_cache_alloc_trace+0x869/0x1020 mm/slub.c:2932
 kmalloc include/linux/slab.h:552 [inline]
 dibusb_read_eeprom_byte+0xad/0x540 drivers/media/usb/dvb-usb/dibusb-common.c:226
 nova_t_read_mac_address+0x1e3/0x2f0 drivers/media/usb/dvb-usb/nova-t-usb2.c:142
 dvb_usb_adapter_dvb_init+0x774/0x1300 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:165
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:83 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
 dvb_usb_device_init+0x27fd/0x3350 drivers/media/usb/dvb-usb/dvb-usb-init.c:287
 nova_t_probe+0x73/0x80 drivers/media/usb/dvb-usb/nova-t-usb2.c:156
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_set_configuration+0x39cf/0x4010 drivers/usb/core/message.c:2159
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5222 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 port_event drivers/usb/core/hub.c:5508 [inline]
 hub_event+0x5bc9/0x8890 drivers/usb/core/hub.c:5590
 process_one_work+0x121c/0x1fc0 kernel/workqueue.c:2272
 worker_thread+0x10cc/0x2740 kernel/workqueue.c:2418
 kthread+0x51c/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
=====================================================

