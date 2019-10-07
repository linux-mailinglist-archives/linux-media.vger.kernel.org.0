Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F641CE6B9
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbfJGPJT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:09:19 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:46909 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbfJGPJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:09:10 -0400
Received: by mail-io1-f70.google.com with SMTP id t11so27220102ioc.13
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 08:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=7KCg+f7TeFzvMI7Bp08YWruXFv6ujw5ZPTj7NmS2ZBg=;
        b=eA5qoxIxJ3J7APQhzovEJXdmbV8NWvxagTZK8Ql3CMulkHdWoQacwIq90eC4tFsl++
         WWnD9obE+xQ3yz1zViLec0yKRaeN0AA/hBEJu6Pjdzo1gs58337P/bMuNBQM1xPYEaMd
         El3o7a6QpsMmVBggisyVRPmDPydcGPNUsXaLgU9wepk5yj12nl11HRw9DL64woEU/KB9
         mD2AnZZsmGkQPeM87Q3u/2bHFEwVf0+uaU2IabXhRc5MhhDTSJh/FbJ/ZxzIuxDCwIQH
         N1Ik6/H/MUC3LuPjO2gb6z+RMHlea61AkgOcM9gF3+bEtU1Fk8lCS2YqZy3KRTcq/ztX
         z2DQ==
X-Gm-Message-State: APjAAAVysbNqXlO6l9f+7QRngND5m+hw0FK0zahgPUHvDxv5wF9joeA4
        YC7+LqDnpzeoaEXUgwnxEz+ZF+math/7+wCEHHj2zWeSAEVy
X-Google-Smtp-Source: APXvYqy7907YtOP193BqGe7qgENG1Enn1wt1Y4XWrAph4wkpHB4HgDQWbMZWedSuacnxilIEoIu/O8hykW5g6i3TstOFZwjCKt4K
MIME-Version: 1.0
X-Received: by 2002:a6b:7a06:: with SMTP id h6mr12529506iom.231.1570460948347;
 Mon, 07 Oct 2019 08:09:08 -0700 (PDT)
Date:   Mon, 07 Oct 2019 08:09:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f5c33b0594536e77@google.com>
Subject: kernel BUG at kernel/time/timer.c:LINE! (4)
From:   syzbot <syzbot+f49d12d34f2321cf4df2@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    58d5f26a usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=11e5b20d600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa5dac3cda4ffd58
dashboard link: https://syzkaller.appspot.com/bug?extid=f49d12d34f2321cf4df2
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d9c713600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f49d12d34f2321cf4df2@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at kernel/time/timer.c:956!
invalid opcode: 0000 [#1] SMP KASAN
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.0-rc1+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:__mod_timer kernel/time/timer.c:956 [inline]
RIP: 0010:__mod_timer kernel/time/timer.c:949 [inline]
RIP: 0010:mod_timer+0x5a2/0xb50 kernel/time/timer.c:1100
Code: 45 10 c7 44 24 14 ff ff ff ff 48 89 44 24 08 48 8d 45 20 48 c7 44 24  
18 00 00 00 00 48 89 04 24 e9 5a fc ff ff e8 ae ce 0e 00 <0f> 0b e8 a7 ce  
0e 00 4c 89 74 24 20 e9 37 fe ff ff e8 98 ce 0e 00
RSP: 0018:ffff8881db209930 EFLAGS: 00010006
RAX: ffffffff86c2b200 RBX: 00000000ffffa688 RCX: ffffffff83efc583
RDX: 0000000000000100 RSI: ffffffff812f4d82 RDI: ffff8881d2356200
RBP: ffff8881d23561e8 R08: ffffffff86c2b200 R09: ffffed103a46abeb
R10: ffffed103a46abea R11: ffff8881d2355f53 R12: dffffc0000000000
R13: 1ffff1103b64132d R14: ffff8881d2355f50 R15: 0000000000000006
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f75e2799000 CR3: 00000001d3b07000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  <IRQ>
  imon_touch_event drivers/media/rc/imon.c:1348 [inline]
  imon_incoming_packet.isra.0+0x2546/0x2f10 drivers/media/rc/imon.c:1603
  usb_rx_callback_intf0+0x151/0x1e0 drivers/media/rc/imon.c:1734
  __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1654
  usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1719
  dummy_timer+0x120f/0x2fa2 drivers/usb/gadget/udc/dummy_hcd.c:1965
  call_timer_fn+0x179/0x650 kernel/time/timer.c:1404
  expire_timers kernel/time/timer.c:1449 [inline]
  __run_timers kernel/time/timer.c:1773 [inline]
  __run_timers kernel/time/timer.c:1740 [inline]
  run_timer_softirq+0x5e3/0x1490 kernel/time/timer.c:1786
  __do_softirq+0x221/0x912 kernel/softirq.c:292
  invoke_softirq kernel/softirq.c:373 [inline]
  irq_exit+0x178/0x1a0 kernel/softirq.c:413
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0x12f/0x500 arch/x86/kernel/apic/apic.c:1137
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:830
  </IRQ>
RIP: 0010:default_idle+0x28/0x2e0 arch/x86/kernel/process.c:581
Code: 90 90 41 56 41 55 65 44 8b 2d 44 3a 8f 7a 41 54 55 53 0f 1f 44 00 00  
e8 36 ee d0 fb e9 07 00 00 00 0f 00 2d fa dd 4f 00 fb f4 <65> 44 8b 2d 20  
3a 8f 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
RSP: 0018:ffffffff86c07da8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: ffffffff86c2b200 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffffffff86c2ba4c
RBP: fffffbfff0d85640 R08: ffffffff86c2b200 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
  do_idle+0x3b6/0x500 kernel/sched/idle.c:263
  cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:355
  start_kernel+0x82a/0x864 init/main.c:784
  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:241
Modules linked in:
---[ end trace 3b8169377985e706 ]---
RIP: 0010:__mod_timer kernel/time/timer.c:956 [inline]
RIP: 0010:__mod_timer kernel/time/timer.c:949 [inline]
RIP: 0010:mod_timer+0x5a2/0xb50 kernel/time/timer.c:1100
Code: 45 10 c7 44 24 14 ff ff ff ff 48 89 44 24 08 48 8d 45 20 48 c7 44 24  
18 00 00 00 00 48 89 04 24 e9 5a fc ff ff e8 ae ce 0e 00 <0f> 0b e8 a7 ce  
0e 00 4c 89 74 24 20 e9 37 fe ff ff e8 98 ce 0e 00
RSP: 0018:ffff8881db209930 EFLAGS: 00010006
RAX: ffffffff86c2b200 RBX: 00000000ffffa688 RCX: ffffffff83efc583
RDX: 0000000000000100 RSI: ffffffff812f4d82 RDI: ffff8881d2356200
RBP: ffff8881d23561e8 R08: ffffffff86c2b200 R09: ffffed103a46abeb
R10: ffffed103a46abea R11: ffff8881d2355f53 R12: dffffc0000000000
R13: 1ffff1103b64132d R14: ffff8881d2355f50 R15: 0000000000000006
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f75e2799000 CR3: 00000001d3b07000 CR4: 00000000001406f0
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
