Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B004336FAD
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhCKKQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:16:27 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:46320 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbhCKKQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:16:18 -0500
Received: by mail-il1-f198.google.com with SMTP id j5so15059583ila.13
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 02:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=pz8+zqAK2akixe3dIV64WVmHO2VaI0t+YN34HYQ794o=;
        b=sI1Nr8VmLsLS13xN0Gf4aC3Hm+LhyiuH6EZL0NvFQhDYwEFCvNINLVw8nCJk7+bVoS
         CDqgqOky3kjtRl2j/M/yNW2DPiwYuVgz0ooIc0H56WFG/K/UJO+eJbo63ydDRNQSQ5Ws
         CkbQsnRxvF/Tn8JomoN4phZS7X5cOGosa7Sc7iYwD1gNQD6s2Aaven2XG5YpuPSzCcLq
         rILvfzjgmVLJNfTxbxiDeHC4jTESUann5GdMa+xHBw9tS3SCgNp1DklzsVNneJlAO7JE
         JZBkjSD/J6aOegsbSqW8CTtfImlwbjEyk4JEvu7/QWI4i+zewdvJOritjv33qJKWOxbP
         d4uA==
X-Gm-Message-State: AOAM530RsBQ365OIS5V50O1Y2rMauHhGB9fSXAFTXYz2H2qW3IaohrNs
        h4OM2y1wugTgLrdepJUk1MgTbn5j0b02j++2v9WTzRRAGYl7
X-Google-Smtp-Source: ABdhPJxZUjTo588cmxcsepX55BknBzqLE4CVSGWPS0rOQr1jYeflliA9su2rONb0rOpxzUHAKGbMfyKWNgiDUQX39O2gEu4Lp6oz
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1069:: with SMTP id q9mr6192959ilj.97.1615457778344;
 Thu, 11 Mar 2021 02:16:18 -0800 (PST)
Date:   Thu, 11 Mar 2021 02:16:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000007287c05bd401384@google.com>
Subject: [syzbot] KMSAN: uninit-value in number (3)
From:   syzbot <syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com>
To:     glider@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    29ad81a1 arch/x86: add missing include to sparsemem.h
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=148ba78ed00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e17cc03a91bb1ac1
dashboard link: https://syzkaller.appspot.com/bug?extid=a4e309017a5f3a24c7b3
compiler:       Debian clang version 11.0.1-2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in number+0x54f/0x2540 lib/vsprintf.c:442
CPU: 0 PID: 8467 Comm: kworker/0:4 Not tainted 5.11.0-rc7-syzkaller #0
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


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
