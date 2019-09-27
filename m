Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7C1C0CDA
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbfI0UtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:49:08 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:54600 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfI0UtH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:49:07 -0400
Received: by mail-io1-f71.google.com with SMTP id w8so14828808iod.21
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2019 13:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=8QPGYslH7xbixxtcmS2ekXL3LroU9FXTwTMy0L8QLKo=;
        b=MCavZ4cDaJGbYV3YKuDiZrHnFds0NiQP1iI/CBzYGQBcwW30bhhTQ9KDwt/0rOtjQV
         NAY+t1ET5w/LSnyHC4zyKLEti3ga+JJ8QAZRJb64/PXg0UwvzLoP/id0ecBXzR7SY0ah
         OdmJrcGrnf0UBBpR+9xNC3z6FFElJ7XNCYj4DlYAPLITt1fDmYsbLnGTLyriYzTaFE0f
         5G6IvdNGJhf57vjvVxU1rUcymMVWQEdCcW5n+gNkEmjJwAjgFfc0GbHITYR1DYtHXz3g
         acTIN7nplo9qzdwec+NBoerhMR9tbouZAflkM7la8bRALOz8iXtClTQI7bWJoevkoILX
         Arfg==
X-Gm-Message-State: APjAAAW4krad9dBC+v/l1S+PuekkqlrVAhLeUfjYdDk7ut3oXRiBLqVN
        EVncDUFpaj/d+whuZs4efDVRgMAw9/0/ZlyVrzxxRMp9+AJw
X-Google-Smtp-Source: APXvYqwaj1Tn71oNrrMA7u7UKwUOjnjcOeFlg5oqYNxT2GYRAB9HTR6oX0okRBTbf6yw17g3dkNq5N2nSfUaXOBMfvhpSNz/QVfa
MIME-Version: 1.0
X-Received: by 2002:a92:db0c:: with SMTP id b12mr6713082iln.27.1569617346753;
 Fri, 27 Sep 2019 13:49:06 -0700 (PDT)
Date:   Fri, 27 Sep 2019 13:49:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000063015a05938f04f0@google.com>
Subject: WARNING in em28xx_init_extension
From:   syzbot <syzbot+76929be61691e7b3904b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    2994c077 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=171c4be3600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=69ddefac6929256a
dashboard link: https://syzkaller.appspot.com/bug?extid=76929be61691e7b3904b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137d73bd600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14f0c8cb600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+76929be61691e7b3904b@syzkaller.appspotmail.com

em28xx 1-1:0.221: Audio interface 221 found (Vendor Class)
em28xx 1-1:0.221: unknown em28xx chip ID (0)
em28xx 1-1:0.221: Config register raw data: 0xfffffffb
em28xx 1-1:0.221: AC97 chip type couldn't be determined
em28xx 1-1:0.221: No AC97 audio processor
------------[ cut here ]------------
list_add corruption. prev->next should be next (ffffffff87779de0), but was  
ffffffff8352fdcc. (prev=ffff8881d2ecc240).
WARNING: CPU: 1 PID: 83 at lib/list_debug.c:26 __list_add_valid+0x99/0xf0  
lib/list_debug.c:26
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.3.0+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x2a3/0x6da kernel/panic.c:219
  __warn.cold+0x20/0x4a kernel/panic.c:576
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:__list_add_valid+0x99/0xf0 lib/list_debug.c:26
Code: 48 c7 c7 60 06 db 85 e8 2a 7a 30 ff 0f 0b 48 83 c4 08 31 c0 5d 41 5c  
c3 48 89 f1 48 c7 c7 20 07 db 85 4c 89 e6 e8 0c 7a 30 ff <0f> 0b 31 c0 eb  
c5 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 a0 07 db 85
RSP: 0018:ffff8881d93cf120 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8881d2810120 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128d3fd RDI: ffffed103b279e16
RBP: ffff8881d2810240 R08: ffff8881d92a3000 R09: fffffbfff11f45af
R10: fffffbfff11f45ae R11: ffffffff88fa2d77 R12: ffffffff87779de0
R13: ffff8881d2810000 R14: ffff8881d281012c R15: ffff8881d2c84400
  __list_add include/linux/list.h:60 [inline]
  list_add_tail include/linux/list.h:93 [inline]
  em28xx_init_extension+0x44/0x1f0  
drivers/media/usb/em28xx/em28xx-core.c:1125
  em28xx_init_dev.isra.0+0xa7b/0x15d8  
drivers/media/usb/em28xx/em28xx-cards.c:3520
  em28xx_usb_probe.cold+0xcac/0x2516  
drivers/media/usb/em28xx/em28xx-cards.c:3869
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
