Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B968C1B4537
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 14:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgDVMcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 08:32:08 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:33609 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgDVMcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 08:32:05 -0400
Received: by mail-il1-f200.google.com with SMTP id l18so1679687ilg.0
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2020 05:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=tzmc/J6pdYWcPHC/FRUpW2ZreqYOzWhKdSOcplGNH/E=;
        b=q6qlkwwLk5X+2ejdvQz8O2e07pVp4u8oBqcGd6CPcck+80VZJ4pJM+66b5M726dcDn
         MVkD9EKBjDTCgVAgH4oo/tsvVI/WrZKl/PkEhSIX3Q/zoxZCR4DRrg0fhb4s/2lqBctA
         lENM+BmzFQVH/VIqDR4cws0/0xthQZhQA3F0c3OzjgOVV8pIqVdwCTfnj9sLtyG7+WGw
         oVGaZsNqMab1dUvPFtIqKZ3v9txN433C5NBU11IUt8djbVIjfsk1WfxB0SNY+CM7c5RO
         8dpRG7Dv/Yk1jhVrwNISqi2NHlbwpizmfC/Do/h7M8i5REke/Lh0JG4Wg7Na0qZAEG8g
         vl9Q==
X-Gm-Message-State: AGi0PuaSSy77lX51Zeh9I8ipy4hOD1zV1QY0wTc/VscMRkQRBjssRS2h
        1csc6UHa43o4jZ9aQX0FIr7fYvPIr6i+1T+8x0hr46XmRuEZ
X-Google-Smtp-Source: APiQypJ7GKmm28jgRt/IFIudqnsuH0dUQTZFSxmp3hsRUmk/AQkXhEIZ9cILyr+mhxq54TxmZvNjdsPQ+1QYroZIGQBCo90q4cKj
MIME-Version: 1.0
X-Received: by 2002:a92:794f:: with SMTP id u76mr12148187ilc.269.1587558725080;
 Wed, 22 Apr 2020 05:32:05 -0700 (PDT)
Date:   Wed, 22 Apr 2020 05:32:05 -0700
In-Reply-To: <1587556788.26476.13.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000de5eaa05a3e05173@google.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered crash:
general protection fault in go7007_usb_probe

usb 2-1: string descriptor 0 read error: -71
general protection fault, probably for non-canonical address 0xdffffc00000000bd: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000005e8-0x00000000000005ef]
CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.7.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:go7007_usb_probe+0x1e0/0x1dc5 drivers/media/usb/go7007/go7007-usb.c:1125
Code: 03 80 3c 02 00 0f 85 df 18 00 00 4d 8b ae 98 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bd e8 05 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 ac 18 00 00 4d 8b ad e8 05 00 00 4d 85 ed 0f 84
RSP: 0018:ffff8881d8aff190 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881d8caf000 RCX: 1ffffffff126c284
RDX: 00000000000000bd RSI: ffffffff8454389a RDI: 00000000000005e8
RBP: ffff8881d7270000 R08: 0000000000000001 R09: fffffbfff1268ad6
R10: ffffffff893456af R11: fffffbfff1268ad5 R12: ffffffff86785360
R13: 0000000000000000 R14: ffff8881cf6dc400 R15: ffff8881d9741000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055a840964160 CR3: 00000001d2972000 CR4: 00000000001406e0
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
---[ end trace 67047f68f48827d5 ]---
RIP: 0010:go7007_usb_probe+0x1e0/0x1dc5 drivers/media/usb/go7007/go7007-usb.c:1125
Code: 03 80 3c 02 00 0f 85 df 18 00 00 4d 8b ae 98 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bd e8 05 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 ac 18 00 00 4d 8b ad e8 05 00 00 4d 85 ed 0f 84
RSP: 0018:ffff8881d8aff190 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881d8caf000 RCX: 1ffffffff126c284
RDX: 00000000000000bd RSI: ffffffff8454389a RDI: 00000000000005e8
RBP: ffff8881d7270000 R08: 0000000000000001 R09: fffffbfff1268ad6
R10: ffffffff893456af R11: fffffbfff1268ad5 R12: ffffffff86785360
R13: 0000000000000000 R14: ffff8881cf6dc400 R15: ffff8881d9741000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055a840964160 CR3: 00000001d2972000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         e9010320 usb: cdns3: gadget: make a bunch of functions sta..
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11ef7dbfe00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd14feb44652cfaf
dashboard link: https://syzkaller.appspot.com/bug?extid=cabfa4b5b05ff6be4ef0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1155b758100000

