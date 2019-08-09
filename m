Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD5A87AF3
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 15:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407002AbfHINSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 09:18:08 -0400
Received: from mail-ot1-f71.google.com ([209.85.210.71]:48362 "EHLO
        mail-ot1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406676AbfHINSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 09:18:08 -0400
Received: by mail-ot1-f71.google.com with SMTP id b4so68746702otf.15
        for <linux-media@vger.kernel.org>; Fri, 09 Aug 2019 06:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=VXzutlNhDah6arTUyAYrVcxlR7yZHCjN1bYgiV3eUos=;
        b=KitR4o/6uW1/dyQyUaODuJehLYs4Mhu9J11YT8IV+9CEraYlkKu0ntk2TpOlJ0Chzy
         tobMPqg6IBZkoa0qfTG2Q4PDXLH7Jnwev5cgPLCgtDm3LSLkuwiV5kdxxCHBjvqGn22t
         f/4gMAOJCGX723w19NXEYULmi3lnklP+jRAzAek5VgNxGEwyZLb5PPpdERDyKjYfmiLV
         6dK0SwifoWuG+ZrsZi3iKilEIa9L/EoXxPhA3LiOYKWxj3hvdxPlvuvEEhHpmI3vQeHb
         yzZq1vKhDajq6vJA7MQJn4fNRqxuRv9Vc8gcFJN2JboXuWoT8PtHvOjYeDNxcZX1FxvH
         mW6Q==
X-Gm-Message-State: APjAAAVP+wy9yI3q8ccv+mFeCPjbxh1r/LsAoCEXVedKdjkFZLtk3dJ5
        DvFHboWGsPBAqcbFgJHXw0xru8iUeA75Td9tYHjMN7OPL2Gu
X-Google-Smtp-Source: APXvYqw7xOGcwZAOmlCHadLqenE0yz5Y2uP/Qs3apYDikEK1TrXBlpoOUWv9W5d1Sm72DxkpYEyRKD7SW0/LI/OqOvotczfIChx9
MIME-Version: 1.0
X-Received: by 2002:a05:6638:348:: with SMTP id x8mr14322147jap.31.1565356686812;
 Fri, 09 Aug 2019 06:18:06 -0700 (PDT)
Date:   Fri, 09 Aug 2019 06:18:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000043b599058faf0145@google.com>
Subject: possible deadlock in display_open
From:   syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>
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

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=13b29b26600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=c558267ad910fc494497
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15427002600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111cb61c600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c558267ad910fc494497@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
5.3.0-rc2+ #25 Not tainted
------------------------------------------------------
syz-executor626/1723 is trying to acquire lock:
000000001a0d74d7 (driver_lock#2){+.+.}, at: display_open+0x1f/0x1d0  
drivers/media/rc/imon.c:475

but task is already holding lock:
00000000076a0058 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
drivers/usb/core/file.c:39

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (minor_rwsem){++++}:
        down_write+0x92/0x150 kernel/locking/rwsem.c:1500
        usb_register_dev drivers/usb/core/file.c:187 [inline]
        usb_register_dev+0x131/0x6a0 drivers/usb/core/file.c:156
        imon_init_display drivers/media/rc/imon.c:2343 [inline]
        imon_probe+0x244d/0x2af0 drivers/media/rc/imon.c:2426
        usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
        really_probe+0x281/0x650 drivers/base/dd.c:548
        driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
        __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
        bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
        __device_attach+0x217/0x360 drivers/base/dd.c:882
        bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
        device_add+0xae6/0x16f0 drivers/base/core.c:2114
        usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
        generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
        usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
        really_probe+0x281/0x650 drivers/base/dd.c:548
        driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
        __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
        bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
        __device_attach+0x217/0x360 drivers/base/dd.c:882
        bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
        device_add+0xae6/0x16f0 drivers/base/core.c:2114
        usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
        hub_port_connect drivers/usb/core/hub.c:5098 [inline]
        hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
        port_event drivers/usb/core/hub.c:5359 [inline]
        hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
        process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
        worker_thread+0x96/0xe20 kernel/workqueue.c:2415
        kthread+0x318/0x420 kernel/kthread.c:255
        ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

-> #1 (&ictx->lock){+.+.}:
        __mutex_lock_common kernel/locking/mutex.c:930 [inline]
        __mutex_lock+0x158/0x1360 kernel/locking/mutex.c:1077
        imon_init_intf0 drivers/media/rc/imon.c:2188 [inline]
        imon_probe+0xf0c/0x2af0 drivers/media/rc/imon.c:2387
        usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
        really_probe+0x281/0x650 drivers/base/dd.c:548
        driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
        __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
        bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
        __device_attach+0x217/0x360 drivers/base/dd.c:882
        bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
        device_add+0xae6/0x16f0 drivers/base/core.c:2114
        usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
        generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
        usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
        really_probe+0x281/0x650 drivers/base/dd.c:548
        driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
        __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
        bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
        __device_attach+0x217/0x360 drivers/base/dd.c:882
        bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
        device_add+0xae6/0x16f0 drivers/base/core.c:2114
        usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
        hub_port_connect drivers/usb/core/hub.c:5098 [inline]
        hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
        port_event drivers/usb/core/hub.c:5359 [inline]
        hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
        process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
        worker_thread+0x96/0xe20 kernel/workqueue.c:2415
        kthread+0x318/0x420 kernel/kthread.c:255
        ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

-> #0 (driver_lock#2){+.+.}:
        check_prev_add kernel/locking/lockdep.c:2405 [inline]
        check_prevs_add kernel/locking/lockdep.c:2507 [inline]
        validate_chain kernel/locking/lockdep.c:2897 [inline]
        __lock_acquire+0x1f7c/0x3b50 kernel/locking/lockdep.c:3880
        lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
        __mutex_lock_common kernel/locking/mutex.c:930 [inline]
        __mutex_lock+0x158/0x1360 kernel/locking/mutex.c:1077
        display_open+0x1f/0x1d0 drivers/media/rc/imon.c:475
        usb_open+0x1df/0x270 drivers/usb/core/file.c:48
        chrdev_open+0x219/0x5c0 fs/char_dev.c:414
        do_dentry_open+0x494/0x1120 fs/open.c:797
        do_last fs/namei.c:3416 [inline]
        path_openat+0x1430/0x3f50 fs/namei.c:3533
        do_filp_open+0x1a1/0x280 fs/namei.c:3563
        do_sys_open+0x3c0/0x580 fs/open.c:1089
        do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
        entry_SYSCALL_64_after_hwframe+0x49/0xbe

other info that might help us debug this:

Chain exists of:
   driver_lock#2 --> &ictx->lock --> minor_rwsem

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(minor_rwsem);
                                lock(&ictx->lock);
                                lock(minor_rwsem);
   lock(driver_lock#2);

  *** DEADLOCK ***

1 lock held by syz-executor626/1723:
  #0: 00000000076a0058 (minor_rwsem){++++}, at: usb_open+0x23/0x270  
drivers/usb/core/file.c:39

stack backtrace:
CPU: 1 PID: 1723 Comm: syz-executor626 Not tainted 5.3.0-rc2+ #25
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  check_noncircular+0x345/0x3e0 kernel/locking/lockdep.c:1741
  check_prev_add kernel/locking/lockdep.c:2405 [inline]
  check_prevs_add kernel/locking/lockdep.c:2507 [inline]
  validate_chain kernel/locking/lockdep.c:2897 [inline]
  __lock_acquire+0x1f7c/0x3b50 kernel/locking/lockdep.c:3880
  lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
  __mutex_lock_common kernel/locking/mutex.c:930 [inline]
  __mutex_lock+0x158/0x1360 kernel/locking/mutex.c:1077
  display_open+0x1f/0x1d0 drivers/media/rc/imon.c:475
  usb_open+0x1df/0x270 drivers/usb/core/file.c:48
  chrdev_open+0x219/0x5c0 fs/char_dev.c:414
  do_dentry_open+0x494/0x1120 fs/open.c:797
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3f50 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1089
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x401300
Code: 01 f0 ff ff 0f 83 00 0b 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f  
44 00 00 83 3d 8d 0a 2d 00 00 75 14 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 d4 0a 00 00 c3 48 83 ec 08 e8 3a 00 00 00
RSP: 002b:00007ffc59dcdec8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 0000000000401300
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00007ffc59dcdee0
RBP: 00000


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
