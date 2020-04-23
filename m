Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14BC61B5D05
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 15:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgDWN7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 09:59:06 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:35470 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbgDWN7G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 09:59:06 -0400
Received: by mail-io1-f72.google.com with SMTP id s26so5767181ioj.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 06:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=dpbkYCqNwiya7LvDlfQG8V+VIE3Sl4BpSmb11y1lkGI=;
        b=VuJRYfVmQXByvqaksFynhLSlrV7Xb/3QfuPa3WYSZt93z2dPObvR+j3W1pX2oHA8R1
         /BrdaTW7OgvRFhqmOLybZq9RLlZ6EHrcL63AtNdVbupUscx0P/h1JtbRNMjcV1y2V4Uf
         JOC1frxSI4Z5Mvslu1aFO5bAWuNgBWa7jlt/cr9b2cOR4tJRu1bTcV6UKwpCnM7Ls/5X
         AzMsMWxIlKf86yxacfyRuVLR99awC6GbIKkC+ppTbL4xM/+JjAUQ7JXw++W651TGJFrG
         CMW9vp3zZaMLWTS2f1RREb3TEHW43Xw4jZer1nxXorJXsNXU/8KzdQgUUSyIBKrUPZxC
         Wi3A==
X-Gm-Message-State: AGi0PuaMUSlM0epDnBEM4naoiylDpHzE4gngiY2C630KJ6zwrPl7jUS2
        KOrt6vsZpHO5r1wiLVBzVXDAQCVxtTlsNEwO6j+1jmbOHTVa
X-Google-Smtp-Source: APiQypJC6MDg/0aIVVcBeCfiSeeypJEdYyejUKpZAtN6rtzzlYUG5E69//6Oj7KkicPbf/rKLGOXHGUZTUqPe/D3w7bEbAaXiNNQ
MIME-Version: 1.0
X-Received: by 2002:a5e:a607:: with SMTP id q7mr3846471ioi.109.1587650343840;
 Thu, 23 Apr 2020 06:59:03 -0700 (PDT)
Date:   Thu, 23 Apr 2020 06:59:03 -0700
In-Reply-To: <1587649702.23108.10.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c5b43705a3f5a69f@google.com>
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

usb 3-1: string descriptor 0 read error: -71
general protection fault, probably for non-canonical address 0xdffffc00000000bd: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000005e8-0x00000000000005ef]
CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.7.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:go7007_usb_probe+0x1ff/0x1de4 drivers/media/usb/go7007/go7007-usb.c:1130
Code: 03 80 3c 02 00 0f 85 00 19 00 00 4d 8b ae 98 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bd e8 05 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 cd 18 00 00 4d 8b ad e8 05 00 00 4d 85 ed 0f 84
RSP: 0018:ffff8881da317190 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881d5768000 RCX: 1ffffffff126c1fa
RDX: 00000000000000bd RSI: ffffffff845438b9 RDI: 00000000000005e8
RBP: ffff8881cbc94000 R08: 0000000000000001 R09: fffffbfff1268ad6
R10: ffffffff893456af R11: fffffbfff1268ad5 R12: ffffffff867853e0
R13: 0000000000000000 R14: ffff8881cbd02400 R15: ffff8881c7f23000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056141ffa7578 CR3: 00000001ccc54000 CR4: 00000000001406e0
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
---[ end trace 3c58732c46bcaa36 ]---
RIP: 0010:go7007_usb_probe+0x1ff/0x1de4 drivers/media/usb/go7007/go7007-usb.c:1130
Code: 03 80 3c 02 00 0f 85 00 19 00 00 4d 8b ae 98 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bd e8 05 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 cd 18 00 00 4d 8b ad e8 05 00 00 4d 85 ed 0f 84
RSP: 0018:ffff8881da317190 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881d5768000 RCX: 1ffffffff126c1fa
RDX: 00000000000000bd RSI: ffffffff845438b9 RDI: 00000000000005e8
RBP: ffff8881cbc94000 R08: 0000000000000001 R09: fffffbfff1268ad6
R10: ffffffff893456af R11: fffffbfff1268ad5 R12: ffffffff867853e0
R13: 0000000000000000 R14: ffff8881cbd02400 R15: ffff8881c7f23000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056141ffa7578 CR3: 00000001ccc54000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         e9010320 usb: cdns3: gadget: make a bunch of functions sta..
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=158aba87e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd14feb44652cfaf
dashboard link: https://syzkaller.appspot.com/bug?extid=cabfa4b5b05ff6be4ef0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12d0bfd7e00000

