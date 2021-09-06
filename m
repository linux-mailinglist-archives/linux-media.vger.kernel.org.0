Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498A0401F7B
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 20:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244148AbhIFSTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 14:19:33 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:44764 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238942AbhIFSTd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 14:19:33 -0400
Received: by mail-io1-f69.google.com with SMTP id d15-20020a0566022befb02905b2e9040807so5474261ioy.11
        for <linux-media@vger.kernel.org>; Mon, 06 Sep 2021 11:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=CbFOppKerIOMfz01zxChfgriamnUUxzr6i/aOdK7d80=;
        b=WV0dJlrjZWutp1tZKN44fCQmYYm4norQxxLq7mQQ5e9VMMx5onq+3+oWqxRkuGeUvp
         lAMAodGD24zfRZGBkMxSHP5caTGlcYYccQvB/c+MhnyfPxqOWRiJ9sDmafiUsHargbvG
         BsRlqiWos6mHAHsXXYXLEvrOA5OT/KO1NF4NPTdf251f+3ArbSbjRn4PxPPGbKsbjt8O
         Po+pMS4iPVGfCHgjT6nwCVfZiZ8DgdYyxNb1sCQxxmWmz/w9G3UopKK/uwkdtcUSoEKc
         LcSn3FlQXT/v8T60ejtK7H3rLHo901iHyD49rnKuvKwVca+VrOQlkkusajk0/FYIVS61
         4Zow==
X-Gm-Message-State: AOAM531bK128SkPU2QvvpJ8AXQupBIJ/LJp0L5JH8Dx1HS6/dohAwGvA
        LqSWnpdrz5oqiXpQFsyvEUJcrO+J8FkeJb1OsWU6P/+z9PP/
X-Google-Smtp-Source: ABdhPJxBSOgQ9J+AR77+E5wk9XSzpkz+H8+KapnGDp4NJXf3Ud2RlQENfAytlX7iGjmu8NF37fI/oATHPxlbMyp7kcRLo/6TOHNN
MIME-Version: 1.0
X-Received: by 2002:a6b:296:: with SMTP id 144mr10583774ioc.114.1630952307961;
 Mon, 06 Sep 2021 11:18:27 -0700 (PDT)
Date:   Mon, 06 Sep 2021 11:18:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f6349105cb57accd@google.com>
Subject: [syzbot] WARNING in pvr2_send_request_ex/usb_submit_urb
From:   syzbot <syzbot+20fef510634faf733060@syzkaller.appspotmail.com>
To:     isely@pobox.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    1b4f3dfb4792 Merge tag 'usb-serial-5.15-rc1' of https://gi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=160b7ecd300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=63ae519fb23783f7
dashboard link: https://syzkaller.appspot.com/bug?extid=20fef510634faf733060
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1308a286300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1654f791300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+20fef510634faf733060@syzkaller.appspotmail.com

pvrusb2: Invalid read control endpoint
------------[ cut here ]------------
URB 00000000b3505d0d submitted while active
WARNING: CPU: 0 PID: 2391 at drivers/usb/core/urb.c:378 usb_submit_urb+0x14e2/0x18a0 drivers/usb/core/urb.c:378
Modules linked in:
CPU: 0 PID: 2391 Comm: pvrusb2-context Not tainted 5.14.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:usb_submit_urb+0x14e2/0x18a0 drivers/usb/core/urb.c:378
Code: 89 de e8 31 c0 ab fd 84 db 0f 85 a9 f3 ff ff e8 f4 b8 ab fd 4c 89 fe 48 c7 c7 20 26 84 86 c6 05 d8 3c ef 04 01 e8 11 8c 00 02 <0f> 0b e9 87 f3 ff ff 41 be ed ff ff ff e9 7c f3 ff ff e8 c7 b8 ab
RSP: 0018:ffffc90006996f78 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88810fc89b40 RSI: ffffffff812aca53 RDI: fffff52000d32de1
RBP: 00000000c0008200 R08: 0000000000000001 R09: 0000000000000000
R10: ffffffff814c6d1b R11: 0000000000000000 R12: ffff888119e0a000
R13: 0000000000000005 R14: 00000000fffffff0 R15: ffff888110825600
FS:  0000000000000000(0000) GS:ffff8881f6800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e769882928 CR3: 0000000100fbe000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 pvr2_send_request_ex+0x7c2/0x20e0 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3667
 pvr2_send_request+0x35/0x40 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3810
 pvr2_i2c_read drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:130 [inline]
 pvr2_i2c_basic_op+0x4af/0x900 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:172
 pvr2_i2c_xfer+0x375/0xb90 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:445
 __i2c_transfer+0x52b/0x16e0 drivers/i2c/i2c-core-base.c:2207
 i2c_smbus_xfer_emulated+0x1b5/0xfe0 drivers/i2c/i2c-core-smbus.c:468
 __i2c_smbus_xfer drivers/i2c/i2c-core-smbus.c:606 [inline]
 __i2c_smbus_xfer+0x4b9/0xfb0 drivers/i2c/i2c-core-smbus.c:552
 i2c_smbus_xfer drivers/i2c/i2c-core-smbus.c:544 [inline]
 i2c_smbus_xfer+0x100/0x380 drivers/i2c/i2c-core-smbus.c:534
 i2c_smbus_read_byte_data+0x107/0x1b0 drivers/i2c/i2c-core-smbus.c:141
 saa711x_detect_chip drivers/media/i2c/saa7115.c:1718 [inline]
 saa711x_probe+0x1e8/0x940 drivers/media/i2c/saa7115.c:1824
 i2c_device_probe+0xacc/0xc90 drivers/i2c/i2c-core-base.c:572
 call_driver_probe drivers/base/dd.c:517 [inline]
 really_probe+0x245/0xcc0 drivers/base/dd.c:596
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:751
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:781
 __device_attach_driver+0x20b/0x2f0 drivers/base/dd.c:898
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:427
 __device_attach+0x228/0x4a0 drivers/base/dd.c:969
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:487
 device_add+0xc35/0x21b0 drivers/base/core.c:3353
 i2c_new_client_device+0x613/0xaf0 drivers/i2c/i2c-core-base.c:1062
 v4l2_i2c_new_subdev_board+0xaf/0x2c0 drivers/media/v4l2-core/v4l2-i2c.c:80
 v4l2_i2c_new_subdev+0x102/0x170 drivers/media/v4l2-core/v4l2-i2c.c:135
 pvr2_hdw_load_subdev drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2022 [inline]
 pvr2_hdw_load_modules drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2074 [inline]
 pvr2_hdw_setup_low drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2155 [inline]
 pvr2_hdw_setup drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2261 [inline]
 pvr2_hdw_initialize+0xc97/0x37d0 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2338
 pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:109 [inline]
 pvr2_context_thread_func+0x250/0x850 drivers/media/usb/pvrusb2/pvrusb2-context.c:158
 kthread+0x3c2/0x4a0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
