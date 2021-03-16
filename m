Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AE333D01D
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 09:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbhCPIwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 04:52:36 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:57168 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbhCPIvS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 04:51:18 -0400
Received: by mail-il1-f198.google.com with SMTP id g9so523996ilq.23
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 01:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=4QUdhKjlsSq0ONrUjGfj14EmJ4tiOuVx+A6yHTuWHx0=;
        b=M6KJodL75z7qoQLqLHhILDrPj7XBd60KeDK/vsn2CN+wHTGNf0C2zA11MCiNCP0Ll8
         AdnLF+7SdEIxVhC7xxKB499P9s/XmrfAXnZyzAjk/xN2mohomhznmSdzUKhbgTxgkxHL
         SBdP6cdhHK/UjxNkbExuZ9oTFPGgxXC9NENNVGNBJ3inBdB5om7EBg3hZWyGtkHQT+rF
         nT/ThNY8vLU1u6zNSow3fVPqjeiFRB12VOU7//apQ2oMYJrU1+xL1OPZeBkuGqwr22nT
         vkA6hwTdUihMlwvqa2YgIMMaWe29uA0GPnOl1WgIuM/Bw/Wr3GJLlXhgI4N81GXTji2R
         BtRA==
X-Gm-Message-State: AOAM532WJqFswZg4L5hws/D4JeEPuizuOeGhOY7axWdTO2Gt2B09txjN
        g1L/JlUX13NDtICM+zxlko0emR2K1NPebb0RWRirdKFS3j1q
X-Google-Smtp-Source: ABdhPJxUrnc3gunKqba2bVgfn2w+0mX2XveK7Foo2gwEUHtgrSjMx2zAsr+BF2CLc8DmPxHrG09i6azSUi5+9aMNalj0nNJCyegN
MIME-Version: 1.0
X-Received: by 2002:a6b:d20e:: with SMTP id q14mr2645087iob.200.1615884677498;
 Tue, 16 Mar 2021 01:51:17 -0700 (PDT)
Date:   Tue, 16 Mar 2021 01:51:17 -0700
In-Reply-To: <00000000000007287c05bd401384@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000334b4905bda378e9@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in number (3)
From:   syzbot <syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com>
To:     glider@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, paskripkin@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    29ad81a1 arch/x86: add missing include to sparsemem.h
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=115abb3ed00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b976581f6bd1e7d
dashboard link: https://syzkaller.appspot.com/bug?extid=a4e309017a5f3a24c7b3
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1488adc6d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c409b2d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in number+0x54f/0x2540 lib/vsprintf.c:442
CPU: 0 PID: 1983 Comm: kworker/0:2 Not tainted 5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 number+0x54f/0x2540 lib/vsprintf.c:442
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 worker_thread+0x10ec/0x2340 kernel/workqueue.c:2421
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
=====================================================
BUG: KMSAN: uninit-value in number+0x8d9/0x2540 lib/vsprintf.c:463
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 number+0x8d9/0x2540 lib/vsprintf.c:463
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 worker_thread+0x10ec/0x2340 kernel/workqueue.c:2421
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
=====================================================
BUG: KMSAN: uninit-value in put_dec+0x1dc/0x260 lib/vsprintf.c:258
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 put_dec+0x1dc/0x260 lib/vsprintf.c:258
 number+0x896/0x2540 lib/vsprintf.c:476
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 worker_thread+0x10ec/0x2340 kernel/workqueue.c:2421
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
=====================================================
BUG: KMSAN: uninit-value in put_dec_trunc8+0x31a/0x3c lib/vsprintf.c:193
Lost 539 message(s)!
=====================================================
BUG: KMSAN: uninit-value in number+0x54f/0x2540 lib/vsprintf.c:442
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 number+0x54f/0x2540 lib/vsprintf.c:442
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 process_scheduled_works kernel/workqueue.c:2337 [inline]
 worker_thread+0x12bc/0x2340 kernel/workqueue.c:2423
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
=====================================================
BUG: KMSAN: uninit-value in number+0x8d9/0x2540 lib/vsprintf.c:463
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 number+0x8d9/0x2540 lib/vsprintf.c:463
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 process_scheduled_works kernel/workqueue.c:2337 [inline]
 worker_thread+0x12bc/0x2340 kernel/workqueue.c:2423
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
=====================================================
BUG: KMSAN: uninit-value in put_dec+0x1dc/0x260 lib/vsprintf.c:258
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 put_dec+0x1dc/0x260 lib/vsprintf.c:258
 number+0x896/0x2540 lib/vsprintf.c:476
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 process_scheduled_works kernel/workqueue.c:2337 [inline]
 worker_thread+0x12bc/0x2340 kernel/workqueue.c:2423
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
======================================
Lost 547 message(s)!
=====================================================
BUG: KMSAN: uninit-value in number+0x54f/0x2540 lib/vsprintf.c:442
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 number+0x54f/0x2540 lib/vsprintf.c:442
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 process_scheduled_works kernel/workqueue.c:2337 [inline]
 worker_thread+0x12bc/0x2340 kernel/workqueue.c:2423
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
=====================================================
BUG: KMSAN: uninit-value in number+0x8d9/0x2540 lib/vsprintf.c:463
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 number+0x8d9/0x2540 lib/vsprintf.c:463
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 process_scheduled_works kernel/workqueue.c:2337 [inline]
 worker_thread+0x12bc/0x2340 kernel/workqueue.c:2423
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
=====================================================
BUG: KMSAN: uninit-value in put_dec+0x1dc/0x260 lib/vsprintf.c:258
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 put_dec+0x1dc/0x260 lib/vsprintf.c:258
 number+0x896/0x2540 lib/vsprintf.c:476
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984
 vprintk_emit+0x29a/0x7f0 kernel/printk/printk.c:2092
 vprintk_default+0x86/0xa0 kernel/printk/printk.c:2126
 vprintk_func+0x2ed/0x2f0 kernel/printk/printk_safe.c:393
 printk+0x180/0x1cd kernel/printk/printk.c:2157
 sq905_read_data+0x630/0x650 drivers/media/usb/gspca/sq905.c:184
 sd_init+0x184/0x530 drivers/media/usb/gspca/sq905.c:329
 gspca_dev_probe2+0x129f/0x23f0 drivers/media/usb/gspca/gspca.c:1532
 gspca_dev_probe+0x3db/0x440 drivers/media/usb/gspca/gspca.c:1606
 sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_set_configuration+0x3872/0x3eb0 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xe15/0x24d0 drivers/base/dd.c:558
 driver_probe_device+0x29d/0x3a0 drivers/base/dd.c:740
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:846
 bus_for_each_drv+0x2c8/0x3f0 drivers/base/bus.c:431
 __device_attach+0x56a/0x890 drivers/base/dd.c:914
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:961
 bus_probe_device+0x17e/0x3d0 drivers/base/bus.c:491
 device_add+0x2c15/0x31d0 drivers/base/core.c:3109
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x5b99/0x8870 drivers/usb/core/hub.c:5591
 process_one_work+0x1219/0x1fe0 kernel/workqueue.c:2275
 process_scheduled_works kernel/workqueue.c:2337 [inline]
 worker_thread+0x12bc/0x2340 kernel/workqueue.c:2423
 kthread+0x521/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----act_len@sq905_read_data created at:
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
 sq905_read_data+0x87/0x650 drivers/media/usb/gspca/sq905.c:163
=====================================================
======================================
Lost 547 message(s)!
=====================================================
BUG: KMSAN: uninit-value in number+0x54f/0x2540 lib/vsprintf.c:442
CPU: 0 PID: 1983 Comm: kworker/0:2 Tainted: G    B             5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:120
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 number+0x54f/0x2540 lib/vsprintf.c:442
 vsnprintf+0x1cd6/0x3600 lib/vsprintf.c:2685
 vprintk_store+0x2ab/0x1df0 kernel/printk/printk.c:1984

