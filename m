Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924A2F5221
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 18:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbfKHREN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 12:04:13 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:45231 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbfKHREM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 12:04:12 -0500
Received: by mail-il1-f197.google.com with SMTP id n84so7469900ila.12
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2019 09:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=QN5xS5KxvNGZu2HmRrYxKdf1XYg+BBOCeF8tFIXMLpk=;
        b=Og6PN/5CkN+Qg5qkq80aj8uedgv9QE+TMbACVMRHMi3RLVUXAWxzUpeT+XYfyfKLdr
         7L2tblZovadNNzAps20PHHf3VvGCGo7m/afazYwLp1bA8hZRS1VebsUztUucURajNCQ9
         Dmeb5ChybzQnZDgspRgqeDPm74621bEMHu8K1pnS1Fpv2ITBNfdpaIWvVfKJHcVKRR/A
         /eHpxGJOPT4wSTIN1fJrFJht0RJuoBxGqrS1uA5VFxH3RT6R0tyCPPGedl+ribLIQg/O
         JvFrYzD1ecsIdxE3qXvwdQKpz/Ndu3ZmS4GY0Qm4rNGWJ5lhhfG8uDkix4dE7Tmz6iVd
         croA==
X-Gm-Message-State: APjAAAXdLSEQjvQsqLqyv9I3LwSwRBwsptVY75I9+8moursbYKdu5FBj
        WWBz87GefoPEexVQWv5paUaylhd/CNNH7MxFIZFGhOE4xOFV
X-Google-Smtp-Source: APXvYqwfah+WRBuNfot/+FsmEaadmLZdjmyCmAoc7OZ+K9n3aLsgm20Mt9U+INGtJcCpiyawwzqG4R81xWqcoyDY1rlRPR171y1x
MIME-Version: 1.0
X-Received: by 2002:a6b:b886:: with SMTP id i128mr3112426iof.229.1573232651321;
 Fri, 08 Nov 2019 09:04:11 -0800 (PST)
Date:   Fri, 08 Nov 2019 09:04:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000054cbe40596d8c519@google.com>
Subject: KMSAN: uninit-value in i2c_w (2)
From:   syzbot <syzbot+99706d6390be1ac542a2@syzkaller.appspotmail.com>
To:     allison@lohutok.net, glider@google.com, gregkh@linuxfoundation.org,
        hverkuil@xs4all.nl, kstewart@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, opensource@jilayne.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    3c8ca708 test_kmsan.c: fix SPDX comment
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=163dccc4e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c07a3d4f8a59e198
dashboard link: https://syzkaller.appspot.com/bug?extid=99706d6390be1ac542a2
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12e74070e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13128d64e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+99706d6390be1ac542a2@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
usb 1-1: string descriptor 0 read error: -71
gspca_main: gspca_topro-2.14.0 probing 06a2:6810
gspca_topro: reg_w err -71
=====================================================
BUG: KMSAN: uninit-value in i2c_w+0xb7a/0xd70  
drivers/media/usb/gspca/topro.c:1031
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x14a/0x2f0 mm/kmsan/kmsan_report.c:110
  __msan_warning+0x73/0xf0 mm/kmsan/kmsan_instr.c:245
  i2c_w+0xb7a/0xd70 drivers/media/usb/gspca/topro.c:1031
  probe_6810 drivers/media/usb/gspca/topro.c:1114 [inline]
  sd_init+0xc10/0x7c10 drivers/media/usb/gspca/topro.c:4069
  gspca_dev_probe2+0xe93/0x2230 drivers/media/usb/gspca/gspca.c:1532
  gspca_dev_probe+0x346/0x3b0 drivers/media/usb/gspca/gspca.c:1605
  sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0xd91/0x1f90 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
  __device_attach+0x489/0x750 drivers/base/dd.c:894
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
  bus_probe_device+0x131/0x390 drivers/base/bus.c:490
  device_add+0x25b5/0x2df0 drivers/base/core.c:2201
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0xd91/0x1f90 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
  __device_attach+0x489/0x750 drivers/base/dd.c:894
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
  bus_probe_device+0x131/0x390 drivers/base/bus.c:490
  device_add+0x25b5/0x2df0 drivers/base/core.c:2201
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was created at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:151 [inline]
  kmsan_internal_poison_shadow+0x60/0x110 mm/kmsan/kmsan.c:134
  kmsan_slab_alloc+0xaa/0x130 mm/kmsan/kmsan_hooks.c:88
  slab_alloc_node mm/slub.c:2792 [inline]
  slab_alloc mm/slub.c:2801 [inline]
  kmem_cache_alloc_trace+0x8c5/0xd20 mm/slub.c:2818
  kmalloc include/linux/slab.h:556 [inline]
  gspca_dev_probe2+0x30d/0x2230 drivers/media/usb/gspca/gspca.c:1464
  gspca_dev_probe+0x346/0x3b0 drivers/media/usb/gspca/gspca.c:1605
  sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:511
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0xd91/0x1f90 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
  __device_attach+0x489/0x750 drivers/base/dd.c:894
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
  bus_probe_device+0x131/0x390 drivers/base/bus.c:490
  device_add+0x25b5/0x2df0 drivers/base/core.c:2201
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0xd91/0x1f90 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
  __device_attach+0x489/0x750 drivers/base/dd.c:894
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
  bus_probe_device+0x131/0x390 drivers/base/bus.c:490
  device_add+0x25b5/0x2df0 drivers/base/core.c:2201
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
=====================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
