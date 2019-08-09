Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9045687AF6
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 15:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407066AbfHINSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 09:18:25 -0400
Received: from mail-ot1-f71.google.com ([209.85.210.71]:47006 "EHLO
        mail-ot1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406935AbfHINSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 09:18:08 -0400
Received: by mail-ot1-f71.google.com with SMTP id g6so7921207otq.13
        for <linux-media@vger.kernel.org>; Fri, 09 Aug 2019 06:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=nWHe0S+V90Nx6X3NKPT0jWYFZ1rMcSIf8jk+Kp2biVo=;
        b=uEW323GuK/WdYgmg5eBpQYIrE+ugn+bBOycQdybK3vIwPoHSqNZ9fugs+VGid4Vpim
         idKJiN3nwg0vQkjUGEcwrl2OTwfwc0rW1uXn0uGfpOUTInFiQXmx3xtaPgEmNi/ls6X8
         qxhDAhNB5KH1jLSmPIh+ziu0HgnDgCtASRLVLlfdaBkxKGvoHFWC5pqPSEQ87zg+nWGg
         0q4KkvnK3XeIUW5rXJ5wW1NhJoql0ywkT6VKiLF4M90bCLuHdpXbXT4+hjLVCfCwM6/r
         9GEy65JHhbChXLS78yWob3pWNewqX5LDUY1X6M6uvX31KyjPM3iazPtExDS0gcWEDtGB
         l5mQ==
X-Gm-Message-State: APjAAAV81UPMw15grBuwnauF2bD7flc17phZ8TnxU+GregUx2RaPmhsH
        AYFlZFrdj0QNQ1SG1D27sxt9Cvx/TmqgtzMxOKNQzN/ahGjy
X-Google-Smtp-Source: APXvYqxisCa09pCrUIJdr2jqOhsEVR7LdHBnNo9Fx9xC3D5Lxz1QB4qiba5wbjN0sZ2U+eyNQuDXVpj6b39bFVCn06UPrELPUJEV
MIME-Version: 1.0
X-Received: by 2002:a05:6602:104:: with SMTP id s4mr20896182iot.200.1565356687343;
 Fri, 09 Aug 2019 06:18:07 -0700 (PDT)
Date:   Fri, 09 Aug 2019 06:18:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004bcc0d058faf01c4@google.com>
Subject: WARNING in em28xx_usb_disconnect
From:   syzbot <syzbot+b7f57261c521087d89bb@syzkaller.appspotmail.com>
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

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=15ef3cba600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=b7f57261c521087d89bb
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ceae36600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12816f26600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+b7f57261c521087d89bb@syzkaller.appspotmail.com

usb 1-1: USB disconnect, device number 2
em28xx 1-1:1.153: Disconnecting em28xx #1
------------[ cut here ]------------
WARNING: CPU: 0 PID: 12 at kernel/workqueue.c:3031  
__flush_work.cold+0x2c/0x36 kernel/workqueue.c:3031
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #25
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
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
RIP: 0010:__flush_work.cold+0x2c/0x36 kernel/workqueue.c:3031
Code: 9a 22 00 48 c7 c7 20 e4 c5 85 e8 d9 3a 0d 00 0f 0b 45 31 e4 e9 98 86  
ff ff e8 51 9a 22 00 48 c7 c7 20 e4 c5 85 e8 be 3a 0d 00 <0f> 0b 45 31 e4  
e9 7d 86 ff ff e8 36 9a 22 00 48 c7 c7 20 e4 c5 85
RSP: 0018:ffff8881da20f720 EFLAGS: 00010286
RAX: 0000000000000024 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed103b441ed6
RBP: ffff8881da20f888 R08: 0000000000000024 R09: fffffbfff11acd9a
R10: fffffbfff11acd99 R11: ffffffff88d66ccf R12: 0000000000000000
R13: 0000000000000001 R14: ffff8881c6685df8 R15: ffff8881d2a85b78
  flush_request_modules drivers/media/usb/em28xx/em28xx-cards.c:3325 [inline]
  em28xx_usb_disconnect.cold+0x280/0x2a6  
drivers/media/usb/em28xx/em28xx-cards.c:4023
  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1120 [inline]
  device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1151
  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
  device_del+0x420/0xb10 drivers/base/core.c:2288
  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
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
