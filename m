Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550942449F7
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 14:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgHNMuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 08:50:23 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:55530 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728469AbgHNMuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 08:50:22 -0400
Received: by mail-io1-f72.google.com with SMTP id k10so6106139ioh.22
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 05:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Q8X7Ko3i7KnMZ99PC1YBu5jXAHW6Ad87sQmjX7bZi58=;
        b=piF07CnHW2VgkONEeUw71SmV3HrTcZ4rC/U+yFWYPUOlIZr51RqO+8rh16sYsJhrAj
         lpoXuTHwdHNEd6ZMjfVNQi0GEBVK/hgSOMtMOuhKczQ36qv9NNzvR6JeT1ZfQw3k4MuX
         1TtIQhZJd5ygoMl+chVfBdu7ANEIDE5hK9T1mD+3hn5fvMl7nILMH6UXCexMBNPziWfD
         +H6nRjT5L5Oo3Z9MGZepdXoHyC1vKg5CqwNGs+y2ECtrwGhcm31TeH8p6g00DH02I3Nb
         HUZMs4H6INinNb7q5Og0zZyUeReMUPLi1Nu4sLDo0paUofL1ip0XZQ0FbvKjWIcR52GM
         ra4w==
X-Gm-Message-State: AOAM531u2nq8g8RkmgdxLfTVi4KYX4+5eAzY4yPUIznIGgCjLLrNsfRu
        PWvAUhRxEKzVvwJMeYODpw+TJs1B9TYRLFS+4kEeQWnzq0OX
X-Google-Smtp-Source: ABdhPJyMmeWIDWmWmUsXMphuU89IdTOiVP7xEfRWp/V7+QfBdUraCGUovj/amPvuFepZb/9WmMyzMt5ACquDkC9wJnRt6CZogi4O
MIME-Version: 1.0
X-Received: by 2002:a92:9854:: with SMTP id l81mr2411247ili.161.1597409420363;
 Fri, 14 Aug 2020 05:50:20 -0700 (PDT)
Date:   Fri, 14 Aug 2020 05:50:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000fcf8a05acd5dd72@google.com>
Subject: BUG: corrupted list in media_gobj_destroy
From:   syzbot <syzbot+4e886425af54bc69daea@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    449dc8c9 Merge tag 'for-v5.9' of git://git.kernel.org/pub/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=16663509900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ef84fa8ee48e528
dashboard link: https://syzkaller.appspot.com/bug?extid=4e886425af54bc69daea
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4e886425af54bc69daea@syzkaller.appspotmail.com

usb 1-1: USB disconnect, device number 97
list_del corruption. next->prev should be ffff8881c93dc010, but was ffff8883c93dc012
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:54!
invalid opcode: 0000 [#1] SMP KASAN
CPU: 1 PID: 3074 Comm: kworker/1:3 Not tainted 5.8.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:__list_del_entry_valid.cold+0x48/0x55 lib/list_debug.c:54
Code: e8 f1 71 3c ff 0f 0b 4c 89 e2 48 89 ee 48 c7 c7 20 85 1c 86 e8 dd 71 3c ff 0f 0b 48 89 ee 48 c7 c7 e0 85 1c 86 e8 cc 71 3c ff <0f> 0b cc cc cc cc cc cc cc cc cc cc cc 41 57 41 56 41 55 41 54 55
RSP: 0018:ffff8881d50b7498 EFLAGS: 00010286
RAX: 0000000000000054 RBX: ffff8881c93dc000 RCX: 0000000000000000
RDX: 0000000000040000 RSI: ffffffff8129ec93 RDI: ffffed103aa16e85
RBP: ffff8881c93dc010 R08: 0000000000000054 R09: ffff8881db32f54f
R10: 0000000000000000 R11: 000000000007e3b8 R12: ffff8881cdd8d108
R13: ffff8881c93dc090 R14: ffff8881c93dc000 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3cf3d4a380 CR3: 00000001ab4d2000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __list_del_entry include/linux/list.h:132 [inline]
 list_del include/linux/list.h:146 [inline]
 media_gobj_destroy drivers/media/mc/mc-entity.c:187 [inline]
 media_gobj_destroy+0xa1/0x232 drivers/media/mc/mc-entity.c:176
 __media_device_unregister_entity+0x236/0x300 drivers/media/mc/mc-device.c:603
 media_device_unregister_entity+0x49/0x70 drivers/media/mc/mc-device.c:688
 dvb_media_device_free+0x1d5/0x620 drivers/media/dvb-core/dvbdev.c:226
 dvb_remove_device.part.0+0x8f/0x240 drivers/media/dvb-core/dvbdev.c:561
 dvb_remove_device drivers/media/dvb-core/dvbdev.c:554 [inline]
 dvb_unregister_device+0x1b/0x60 drivers/media/dvb-core/dvbdev.c:583
 dvb_dmxdev_release+0x1a0/0x640 drivers/media/dvb-core/dmxdev.c:1459
 dvb_usb_adapter_dvb_exit+0xa9/0x240 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:224
 dvb_usb_adapter_exit drivers/media/usb/dvb-usb/dvb-usb-init.c:114 [inline]
 dvb_usb_exit.isra.0+0xaa/0x2a0 drivers/media/usb/dvb-usb/dvb-usb-init.c:129
 dvb_usb_device_exit+0x111/0x1a0 drivers/media/usb/dvb-usb/dvb-usb-init.c:306
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:436
 __device_release_driver+0x3c6/0x6f0 drivers/base/dd.c:1153
 device_release_driver_internal drivers/base/dd.c:1184 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1207
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd90 drivers/base/core.c:3107
 usb_disable_device+0x387/0x930 drivers/usb/core/message.c:1245
 usb_disconnect.cold+0x27d/0x780 drivers/usb/core/hub.c:2217
 hub_port_connect drivers/usb/core/hub.c:5059 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x1c93/0x4390 drivers/usb/core/hub.c:5576
 process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x392/0x470 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Modules linked in:
---[ end trace 409eb60372a6c4c3 ]---
RIP: 0010:__list_del_entry_valid.cold+0x48/0x55 lib/list_debug.c:54
Code: e8 f1 71 3c ff 0f 0b 4c 89 e2 48 89 ee 48 c7 c7 20 85 1c 86 e8 dd 71 3c ff 0f 0b 48 89 ee 48 c7 c7 e0 85 1c 86 e8 cc 71 3c ff <0f> 0b cc cc cc cc cc cc cc cc cc cc cc 41 57 41 56 41 55 41 54 55
RSP: 0018:ffff8881d50b7498 EFLAGS: 00010286
RAX: 0000000000000054 RBX: ffff8881c93dc000 RCX: 0000000000000000
RDX: 0000000000040000 RSI: ffffffff8129ec93 RDI: ffffed103aa16e85
RBP: ffff8881c93dc010 R08: 0000000000000054 R09: ffff8881db32f54f
R10: 0000000000000000 R11: 000000000007e3b8 R12: ffff8881cdd8d108
R13: ffff8881c93dc090 R14: ffff8881c93dc000 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3cf3d4a380 CR3: 00000001ab4d2000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
