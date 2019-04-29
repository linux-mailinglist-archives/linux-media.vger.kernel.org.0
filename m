Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59F17E1EF
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 14:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbfD2MGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 08:06:19 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:38678 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbfD2MGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 08:06:08 -0400
Received: by mail-io1-f69.google.com with SMTP id b16so8609099iot.5
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2019 05:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=rDeQFW7ur3bD5DVlx58zRUEpG0d8EGxbNzUv5hd9aJg=;
        b=HssL1yTF2ZXmH5IvmlzQxcIZgbJ+siSQVZL3Bbs8TKzASa/pTmpI1KEtullGgPRu4H
         rzqF4YeoNdwJa3m97wncTXySOp3s0uB/YxInm31tFfp3rfdsQl50z464rpOPPSbgpkl6
         w9slubN4kQrlk85NJVZQOhwhrrzO+EKkVrCqO6GC/8Z9Ytx+Rp4tM2F/9UwAvLxXctxw
         FE0UlB9WmnHXt2yGvYJakqTNrO1tdAv0fXXfwnzzxvO64utHQOhu5ZovLbAfkyoP1764
         8ERNtNbBjSWKKvUwb6I82kOAKKry4JugeMn0GLvBkiXSvYyfOjlyj233WFPCxTGG9Cmz
         IFLg==
X-Gm-Message-State: APjAAAVo6XEFkB3Wp30/uL2mLt9iUyzM5Vi/RLa+rakUDgZdAZHdGbp7
        FBAqwhrQbmJsquQR1ktunjbnytlC5nxa8yq5dpxWfCfMQ67E
X-Google-Smtp-Source: APXvYqxWAijp8HtMDdopw8UkXEtp9e/OiyQ3ux05IGIpuY2mfbZjMM+THEIzV7KtLPe6JzPQC/s7pJMB0OE8a8+OSiqakCebPZ6r
MIME-Version: 1.0
X-Received: by 2002:a6b:f008:: with SMTP id w8mr29131590ioc.251.1556539567488;
 Mon, 29 Apr 2019 05:06:07 -0700 (PDT)
Date:   Mon, 29 Apr 2019 05:06:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ffc8c80587aa1bb1@google.com>
Subject: BUG: unable to handle kernel paging request in au0828_usb_disconnect
From:   syzbot <syzbot+15e91d49c4c757c3d363@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, brad@nextdimension.cc,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan/tree/usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=106c9498a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
dashboard link: https://syzkaller.appspot.com/bug?extid=15e91d49c4c757c3d363
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+15e91d49c4c757c3d363@syzkaller.appspotmail.com

usb 5-1: selecting invalid altsetting 5
au0828: Failure setting usb interface0 to as5
au0828: au0828_usb_probe() au0828_analog_register failed to register on V4L2
BUG: unable to handle kernel paging request at fffffffc4508a958
#PF error: [normal kernel read fault]
PGD 1167e067 P4D 1167e067 PUD 0
Oops: 0000 [#1] SMP KASAN PTI
CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.1.0-rc3-319004-g43151d6 #6
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:decode_cpu kernel/locking/osq_lock.c:34 [inline]
RIP: 0010:osq_lock+0xfd/0x5a0 kernel/locking/osq_lock.c:111
Code: 48 63 e8 48 b8 00 00 00 00 00 fc ff df 48 8d 3c ed 60 b0 39 91 48 89  
f9 48 c1 e9 03 80 3c 01 00 0f 85 2c 04 00 00 48 8d 53 08 <4c> 03 2c ed 60  
b0 39 91 48 b8 00 00 00 00 00 fc ff df 48 89 d6 48
RSP: 0018:ffff8880a84f70e8 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff8880ad12dfc0 RCX: 1fffffff88a1152b
RDX: ffff8880ad12dfc8 RSI: 0000000000000004 RDI: fffffffc4508a958
RBP: ffffffff9679df1f R08: 0000000000000000 R09: ffffed10122cb31e
R10: ffffed10122cb31d R11: ffff8880916598eb R12: ffff8880ad12dfd0
R13: 000000000002dfc0 R14: ffff8880a84db100 R15: ffff8880916598e8
FS:  0000000000000000(0000) GS:ffff8880ad100000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffc4508a958 CR3: 00000000824b6000 CR4: 00000000001406e0
Call Trace:
  mutex_optimistic_spin kernel/locking/mutex.c:630 [inline]
  __mutex_lock_common kernel/locking/mutex.c:928 [inline]
  __mutex_lock+0x27d/0x12b0 kernel/locking/mutex.c:1072
  au0828_usb_disconnect+0xa3/0x130 drivers/media/usb/au0828/au0828-core.c:194
  au0828_usb_probe.cold+0x121/0x7d8  
drivers/media/usb/au0828/au0828-core.c:661
  usb_probe_interface+0x31d/0x820 drivers/usb/core/driver.c:361
  really_probe+0x2da/0xb10 drivers/base/dd.c:509
  driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
  __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
  bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
  __device_attach+0x223/0x3a0 drivers/base/dd.c:844
  bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
  device_add+0xad2/0x16e0 drivers/base/core.c:2106
  usb_set_configuration+0xdf7/0x1740 drivers/usb/core/message.c:2023
  generic_probe+0xa2/0xda drivers/usb/core/generic.c:210
  usb_probe_device+0xc0/0x150 drivers/usb/core/driver.c:266
  really_probe+0x2da/0xb10 drivers/base/dd.c:509
  driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
  __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
  bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
  __device_attach+0x223/0x3a0 drivers/base/dd.c:844
  bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
  device_add+0xad2/0x16e0 drivers/base/core.c:2106
  usb_new_device.cold+0x537/0xccf drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x138e/0x3b00 drivers/usb/core/hub.c:5432
  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
  worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
  kthread+0x313/0x420 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Modules linked in:
CR2: fffffffc4508a958
---[ end trace e04421c5fdf22ecf ]---
RIP: 0010:decode_cpu kernel/locking/osq_lock.c:34 [inline]
RIP: 0010:osq_lock+0xfd/0x5a0 kernel/locking/osq_lock.c:111
Code: 48 63 e8 48 b8 00 00 00 00 00 fc ff df 48 8d 3c ed 60 b0 39 91 48 89  
f9 48 c1 e9 03 80 3c 01 00 0f 85 2c 04 00 00 48 8d 53 08 <4c> 03 2c ed 60  
b0 39 91 48 b8 00 00 00 00 00 fc ff df 48 89 d6 48
RSP: 0018:ffff8880a84f70e8 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff8880ad12dfc0 RCX: 1fffffff88a1152b
RDX: ffff8880ad12dfc8 RSI: 0000000000000004 RDI: fffffffc4508a958
RBP: ffffffff9679df1f R08: 0000000000000000 R09: ffffed10122cb31e
R10: ffffed10122cb31d R11: ffff8880916598eb R12: ffff8880ad12dfd0
R13: 000000000002dfc0 R14: ffff8880a84db100 R15: ffff8880916598e8
FS:  0000000000000000(0000) GS:ffff8880ad100000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffc4508a958 CR3: 00000000824b6000 CR4: 00000000001406e0


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
