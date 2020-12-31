Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E522E820E
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 21:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgLaU4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Dec 2020 15:56:51 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:56027 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgLaU4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Dec 2020 15:56:51 -0500
Received: by mail-io1-f70.google.com with SMTP id j25so8544764iog.22
        for <linux-media@vger.kernel.org>; Thu, 31 Dec 2020 12:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7POGUMTtHouCI9iTNlKKRSwh5qvL2y+t8RWIhaDBDs0=;
        b=L75tS5qzjkcBWkrqIdJztGNQAoBfCtFiwb4rhCWbm5XGSw6fqwPrOwgEcqZQhhVFIZ
         aOKsEZo0sILzxm2Q0MICwh8S2GgEcHN9JdvDRBUIWs4SDQA5FR8OOi0wc3r2EvdEAyA/
         Orc8CC3zZZAKjtBytrJvEYrcqq0wBP5v4SfOOAEPpxLeAONZ4+DeCltz8PEBNl8MDtNt
         na+KQBPp4udPTfN3YDkWb7+RHYW6wNZ18qBdsz2L/BIPepgtSvGdAuh6kDXXmFr8kHYO
         olGVhmOyZR3+TDHPQTIk1xVQ99ICdPjuvxDFGjg2WQVVBxB/ojzGr9mM4Cd78A4hQMGI
         jGLg==
X-Gm-Message-State: AOAM531tifWLZHIOvpDARjaJ3v2KOnQrO52PItVBUBRPdbMeERiz4GqJ
        aCHQA9strXa+NotLWP2Q0PiH8xR1JLxyjGG382QXmfAlpaaq
X-Google-Smtp-Source: ABdhPJy9GQ6T+wBnHRrpmNVL2QEXGbU0MGvx1hy995GFt32OqlFUh0n35jUzVee0WMTav2UzKQ2zgRWCwGh+txVdPtdI0/CxIgEt
MIME-Version: 1.0
X-Received: by 2002:a02:c98d:: with SMTP id b13mr50113082jap.124.1609448170302;
 Thu, 31 Dec 2020 12:56:10 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:56:10 -0800
In-Reply-To: <CAAEAJfADBQpyfgBjWtnnF-y0g_jRryrcHQd_J-123KxSrid5=Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000079b74605b7c8da15@google.com>
Subject: Re: memory leak in zr364xx_probe
From:   syzbot <syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com>
To:     andriy.shevchenko@linux.intel.com, ezequiel@vanguardiasur.com.ar,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, royale@zerezo.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel NULL pointer dereference in __videobuf_free

zr364xx 4-1:0.0: model 06d6:003b detected
usb 4-1: 320x240 mode selected
zr364xx: start read pipe failed
BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0 
Oops: 0000 [#1] PREEMPT SMP
CPU: 1 PID: 8717 Comm: kworker/1:4 Not tainted 5.10.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:__videobuf_free+0x62/0x180 drivers/media/v4l2-core/videobuf-core.c:243
Code: 9d 70 01 00 00 31 ff 83 e3 03 89 de e8 b7 da 4a fe 84 db 0f 85 00 01 00 00 e8 2a e1 4a fe 48 8b 85 68 01 00 00 bf 03 10 26 12 <44> 8b 20 44 89 e6 e8 d3 da 4a fe 41 81 fc 03 10 26 12 0f 85 c4 2c
RSP: 0018:ffffc900024ef7b8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff82e82989
RDX: ffff88811813d040 RSI: ffffffff82e82996 RDI: 0000000012261003
RBP: ffff888125921780 R08: ffff888125ffe008 R09: 00000000000008fd
R10: 0000000000000000 R11: 3a7878343633727a R12: 0000000000000001
R13: ffff888125921000 R14: ffffc900032b1000 R15: 00000000ffffffa6
FS:  0000000000000000(0000) GS:ffff88813bd00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000109bb5000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 videobuf_mmap_free+0x1f/0x60 drivers/media/v4l2-core/videobuf-core.c:377
 zr364xx_release+0x26/0xa0 drivers/media/usb/zr364xx/zr364xx.c:1192
 v4l2_device_release drivers/media/v4l2-core/v4l2-device.c:51 [inline]
 kref_put include/linux/kref.h:65 [inline]
 v4l2_device_put+0x82/0xc0 drivers/media/v4l2-core/v4l2-device.c:56
 zr364xx_probe+0x80c/0x823 drivers/media/usb/zr364xx/zr364xx.c:1536
 usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
 really_probe+0x159/0x480 drivers/base/dd.c:554
 driver_probe_device+0x84/0x100 drivers/base/dd.c:738
 __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
 bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
 __device_attach+0x122/0x250 drivers/base/dd.c:912
 bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
 device_add+0x5ac/0xc30 drivers/base/core.c:2936
 usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
 usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
 usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
 really_probe+0x159/0x480 drivers/base/dd.c:554
 driver_probe_device+0x84/0x100 drivers/base/dd.c:738
 __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
 bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
 __device_attach+0x122/0x250 drivers/base/dd.c:912
 bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
 device_add+0x5ac/0xc30 drivers/base/core.c:2936
 usb_new_device.cold+0x166/0x578 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5222 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 port_event drivers/usb/core/hub.c:5508 [inline]
 hub_event+0x144a/0x20d0 drivers/usb/core/hub.c:5590
 process_one_work+0x27d/0x590 kernel/workqueue.c:2272
 worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
 kthread+0x178/0x1b0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Modules linked in:
CR2: 0000000000000000
---[ end trace 90e0be95dcb7e0d1 ]---
RIP: 0010:__videobuf_free+0x62/0x180 drivers/media/v4l2-core/videobuf-core.c:243
Code: 9d 70 01 00 00 31 ff 83 e3 03 89 de e8 b7 da 4a fe 84 db 0f 85 00 01 00 00 e8 2a e1 4a fe 48 8b 85 68 01 00 00 bf 03 10 26 12 <44> 8b 20 44 89 e6 e8 d3 da 4a fe 41 81 fc 03 10 26 12 0f 85 c4 2c
RSP: 0018:ffffc900024ef7b8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff82e82989
RDX: ffff88811813d040 RSI: ffffffff82e82996 RDI: 0000000012261003
RBP: ffff888125921780 R08: ffff888125ffe008 R09: 00000000000008fd
R10: 0000000000000000 R11: 3a7878343633727a R12: 0000000000000001
R13: ffff888125921000 R14: ffffc900032b1000 R15: 00000000ffffffa6
FS:  0000000000000000(0000) GS:ffff88813bd00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000109bb5000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         a1714d22 media: zr364xx: Fix memory leak in ->probe()
git tree:       https://gitlab.collabora.com/linux/0day.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11415e0b500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec2338be23ae163e
dashboard link: https://syzkaller.appspot.com/bug?extid=b4d54814b339b5c6bbd4
compiler:       gcc (GCC) 10.1.0-syz 20200507

