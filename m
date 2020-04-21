Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC95D1B33A0
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 01:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgDUXpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 19:45:20 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:49664 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgDUXpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 19:45:19 -0400
Received: by mail-il1-f199.google.com with SMTP id z18so166936ilp.16
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 16:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=jTIxAe9T+4WkiAVG73kHih2hhaSLgZCpyY1ft6c8qGg=;
        b=Eh6N2wofK6gm1jLTijaEW32uKOipZVckc6dU1nZjSG3xOCAuHVJb2Tgx7EOZoYmXT7
         nYH57FPMoac82+gOzVl3eBRWgVAA4nVxOkbdzwVr8ywu/2AnRQrLO6JxiYMsQ8qiD7Cr
         CtmvwLESIpWB2SUVdwUPwaXG16ZISEBB2n8ovaMSCVZOwZsE5+IIMzmxBUiO2zgHNmLv
         SVKZfaNWnit7HtEyxUh207HHEukDQcra/h6LLlo/1IzVBLgWTghVW0yJR9oewzH9OxOA
         f0tgZjhI5GhhxauhndK7Z+dFZLawEHUs0CIwp6fqqUwaisuogIg6i34PONIKC1pG/74V
         7s1w==
X-Gm-Message-State: AGi0Pua/xR4pbDUVE3IkBrowwWZcISpoKlH4+7AoAvCodqbtLr546SkV
        QYYrYIq1G1CDibrOlxp8z/2qXuqezuXcXA8MVVldZEbTG0e9
X-Google-Smtp-Source: APiQypLvkDHTqXH5797LHKlltA3GcfkoYFrxZV+TVupKDNdFevLY9T11EVZjotcaZ8+uqYJjMJu1x5G/gZvle2H/ny3P2kzVapHy
MIME-Version: 1.0
X-Received: by 2002:a92:ba46:: with SMTP id o67mr23216384ili.66.1587512717930;
 Tue, 21 Apr 2020 16:45:17 -0700 (PDT)
Date:   Tue, 21 Apr 2020 16:45:17 -0700
In-Reply-To: <0000000000003cbf8e05a3d57b98@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a0f56c05a3d59b69@google.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    e9010320 usb: cdns3: gadget: make a bunch of functions sta..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=12da0b58100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd14feb44652cfaf
dashboard link: https://syzkaller.appspot.com/bug?extid=cabfa4b5b05ff6be4ef0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1146eb17e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=159d136fe00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=0eb1, idProduct=7007, bcdDevice= 2.08
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
usb 1-1: string descriptor 0 read error: -71
general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.7.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:go7007_usb_probe+0x4ba/0x1d49 drivers/media/usb/go7007/go7007-usb.c:1145
Code: c1 ee 03 80 3c 0e 00 0f 85 59 16 00 00 4c 8b a2 e8 05 00 00 48 b9 00 00 00 00 00 fc ff df 49 8d 7c 24 03 48 89 fe 48 c1 ee 03 <0f> b6 0c 0e 48 89 fe 83 e6 07 40 38 f1 7f 08 84 c9 0f 85 11 16 00
RSP: 0018:ffff8881da21f190 EFLAGS: 00010246
RAX: ffff8881cd522800 RBX: ffff8881cd9de000 RCX: dffffc0000000000
RDX: ffff8881cd9dd000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: ffff8881cd5ac000 R08: 0000000000000001 R09: fffffbfff1268ad6
R10: ffffffff893456af R11: fffffbfff1268ad5 R12: 0000000000000000
R13: ffff8881cd9dd0a0 R14: ffff8881cf81c800 R15: ffffffff86786240
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c401d2c160 CR3: 0000000007024000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374
 really_probe+0x290/0xac0 drivers/base/dd.c:527
 driver_probe_device+0x223/0x350 drivers/base/dd.c:701
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:808
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x390 drivers/base/dd.c:874
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1367/0x1c20 drivers/base/core.c:2533
 usb_set_configuration+0xed4/0x1850 drivers/usb/core/message.c:2025
 usb_generic_driver_probe+0x9d/0xe0 drivers/usb/core/generic.c:241
 usb_probe_device+0xd9/0x230 drivers/usb/core/driver.c:272
 really_probe+0x290/0xac0 drivers/base/dd.c:527
 driver_probe_device+0x223/0x350 drivers/base/dd.c:701
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:808
 bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:431
 __device_attach+0x21a/0x390 drivers/base/dd.c:874
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0x1367/0x1c20 drivers/base/core.c:2533
 usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2548
 hub_port_connect drivers/usb/core/hub.c:5195 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5335 [inline]
 port_event drivers/usb/core/hub.c:5481 [inline]
 hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5563
 process_one_work+0x965/0x1630 kernel/workqueue.c:2268
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 kthread+0x326/0x430 kernel/kthread.c:268
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 822665be1be4fef9 ]---
RIP: 0010:go7007_usb_probe+0x4ba/0x1d49 drivers/media/usb/go7007/go7007-usb.c:1145
Code: c1 ee 03 80 3c 0e 00 0f 85 59 16 00 00 4c 8b a2 e8 05 00 00 48 b9 00 00 00 00 00 fc ff df 49 8d 7c 24 03 48 89 fe 48 c1 ee 03 <0f> b6 0c 0e 48 89 fe 83 e6 07 40 38 f1 7f 08 84 c9 0f 85 11 16 00
RSP: 0018:ffff8881da21f190 EFLAGS: 00010246
RAX: ffff8881cd522800 RBX: ffff8881cd9de000 RCX: dffffc0000000000
RDX: ffff8881cd9dd000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: ffff8881cd5ac000 R08: 0000000000000001 R09: fffffbfff1268ad6
R10: ffffffff893456af R11: fffffbfff1268ad5 R12: 0000000000000000
R13: ffff8881cd9dd0a0 R14: ffff8881cf81c800 R15: ffffffff86786240
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c401d2c160 CR3: 0000000007024000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

