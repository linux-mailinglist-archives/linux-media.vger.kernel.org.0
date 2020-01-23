Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D291468E3
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 14:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgAWNRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 08:17:11 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:55369 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgAWNRL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 08:17:11 -0500
Received: by mail-io1-f70.google.com with SMTP id z21so1932846iob.22
        for <linux-media@vger.kernel.org>; Thu, 23 Jan 2020 05:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=M/T56jh5ZjLwzBjohUJv3CPw6EZc5CaN+pPMp5UPMi8=;
        b=CZvEL8yzSQtDnoIkY4bfnLw0/m3qAPluc53r0R+FneMo8dNxxOfsctt56flccsh7FB
         +fKuG/6IM3ZFxjQAOz+voHtha2p4ocXGBuRYT3Ktkl9vvc7rENmIKa2L4lD2umHEsW7+
         tJhImCn77iR2qKxnuSzjD+tw4t86gLNNndj7qjCGjHGmpJGMmEjV7qQkk3bNFGIi4AW3
         x476hK1cviBs0D//YS6r+X8MdI9byxfQ0hTKQE0X/zt/4XjoU/sfIJ03gwJuuOrAGYVd
         x1vRFOxoRo7DCH0/6n9jwShLsrnQMrZsANg4c/hZQeZlyjS2Sy63Rpq6gL09d5c3M1tL
         B3mA==
X-Gm-Message-State: APjAAAVQEOgsNr/QEwAWE1FbBtlNDeWPcRPf4DT7KW3Xuu3Ondr2X2C/
        pvBt8n3vfJzsq/cZbEZCSdADRq0NrQ1sKak8cdKdooqZb4Jr
X-Google-Smtp-Source: APXvYqwsg5y57hY5025HrdixFMdwrZEyUk/g+pM7hsnTs15k9799/GGmSVH6lvg8jb7EHZSh1E0VDLugipmv5mqvJ1+Ipylnthdw
MIME-Version: 1.0
X-Received: by 2002:a5d:8451:: with SMTP id w17mr5679243ior.303.1579785430679;
 Thu, 23 Jan 2020 05:17:10 -0800 (PST)
Date:   Thu, 23 Jan 2020 05:17:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006ac90f059cce75d4@google.com>
Subject: BUG: corrupted list in em28xx_init_extension
From:   syzbot <syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com>
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

HEAD commit:    4cc301ee usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=15de59c9e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9ba75825443d54bd
dashboard link: https://syzkaller.appspot.com/bug?extid=a6969ef522a36d3344c9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11934d85e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c70721e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a6969ef522a36d3344c9@syzkaller.appspotmail.com

em28xx 1-1:0.200: Audio interface 200 found (Vendor Class)
em28xx 1-1:0.200: unknown em28xx chip ID (0)
em28xx 1-1:0.200: Config register raw data: 0xfffffffb
em28xx 1-1:0.200: AC97 chip type couldn't be determined
em28xx 1-1:0.200: No AC97 audio processor
list_add corruption. prev->next should be next (ffffffff87a1a960), but was ffffffff85a00184. (prev=ffff8881cd5e0240).
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:26!
invalid opcode: 0000 [#1] SMP KASAN
CPU: 1 PID: 94 Comm: kworker/1:2 Not tainted 5.5.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:__list_add_valid.cold+0x3a/0x3c lib/list_debug.c:26
Code: 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 a0 fc fb 85 e8 04 17 40 ff 0f 0b 48 89 f1 48 c7 c7 20 fc fb 85 4c 89 e6 e8 f0 16 40 ff <0f> 0b 48 89 ee 48 c7 c7 c0 fd fb 85 e8 df 16 40 ff 0f 0b 4c 89 ea
RSP: 0018:ffff8881d5d570c8 EFLAGS: 00010282
RAX: 0000000000000075 RBX: ffff8881cd764120 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8129598d RDI: ffffed103abaae0b
RBP: ffff8881cd764240 R08: 0000000000000075 R09: ffffed103b666210
R10: ffffed103b66620f R11: ffff8881db33107f R12: ffffffff87a1a960
R13: ffff8881cd764000 R14: ffff8881cd76412c R15: ffff8881cd5a2000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7f37b26000 CR3: 00000001c5fe1000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __list_add include/linux/list.h:60 [inline]
 list_add_tail include/linux/list.h:93 [inline]
 em28xx_init_extension+0x44/0x1f0 drivers/media/usb/em28xx/em28xx-core.c:1125
 em28xx_init_dev.isra.0+0xa7b/0x15d8 drivers/media/usb/em28xx/em28xx-cards.c:3540
 em28xx_usb_probe.cold+0xcac/0x2515 drivers/media/usb/em28xx/em28xx-cards.c:3889
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
 process_scheduled_works kernel/workqueue.c:2326 [inline]
 worker_thread+0x7ab/0xe20 kernel/workqueue.c:2412
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 8bae0db31a929c42 ]---
RIP: 0010:__list_add_valid.cold+0x3a/0x3c lib/list_debug.c:26
Code: 0b 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 a0 fc fb 85 e8 04 17 40 ff 0f 0b 48 89 f1 48 c7 c7 20 fc fb 85 4c 89 e6 e8 f0 16 40 ff <0f> 0b 48 89 ee 48 c7 c7 c0 fd fb 85 e8 df 16 40 ff 0f 0b 4c 89 ea
RSP: 0018:ffff8881d5d570c8 EFLAGS: 00010282
RAX: 0000000000000075 RBX: ffff8881cd764120 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8129598d RDI: ffffed103abaae0b
RBP: ffff8881cd764240 R08: 0000000000000075 R09: ffffed103b666210
R10: ffffed103b66620f R11: ffff8881db33107f R12: ffffffff87a1a960
R13: ffff8881cd764000 R14: ffff8881cd76412c R15: ffff8881cd5a2000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7f37b26000 CR3: 00000001c5fe1000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
