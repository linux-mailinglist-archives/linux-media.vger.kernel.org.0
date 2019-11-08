Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4368EF4D15
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 14:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbfKHNYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 08:24:10 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:33210 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbfKHNYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 08:24:10 -0500
Received: by mail-il1-f197.google.com with SMTP id z14so6891762ill.0
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2019 05:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=N7idjJ2WZG0PfBmowKBwGjFpannAqkPlZj0m46g9pEs=;
        b=nFsyM4SHUxvZvsq5B/q36k2G6UHo4LESNpeGGy+3iy0q6DvkLfmajCIwlgoYTZh4KV
         mpvSNuetZg513eEOk+dMBsCazN0mssJ3pXUfd7cVn4lsn50YihruTpOwnvyM2RqMc+zr
         +O43EeqVmZdDBYwVoDysXFMInzdUd+fF4BMtI0SXuORDKeEeRL2m8ON1jHYY7KVarNF+
         8eJkEzH8iLbmbYAPo4Ezmyw34nh3EGtI3llPhKuZZUN/HUAuqWSGdOhIHYP8mwi/2bTP
         nWsTiMM3+W7mQOBKhqTvo9zriXEpwokZZNCzr4wp0VaAv0McW2Vh/XDmvRdjXaeHHatM
         gKMA==
X-Gm-Message-State: APjAAAXc+UJoY+9I8gat3mXS7LRNC2Jn5KsF46ZtbfpI7w3qLPxQ3C44
        eK0rmK8TS8xVy1cEcOeKKnA5cBEh2JZJHvNyJ+7KZXOkAiXW
X-Google-Smtp-Source: APXvYqwqLk3ZzNpv8jVp8owRJGkbeaaDpIThJOKLDE43Zlf5p8aQBhAVveg/JNeDFmDevyuIU9+WxHUf4RjD5wrIkcKZI8P3LweP
MIME-Version: 1.0
X-Received: by 2002:a6b:8d8f:: with SMTP id p137mr6165701iod.53.1573219449059;
 Fri, 08 Nov 2019 05:24:09 -0800 (PST)
Date:   Fri, 08 Nov 2019 05:24:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006a44570596d5b2d1@google.com>
Subject: KMSAN: uninit-value in number
From:   syzbot <syzbot+9d42b7773d2fecd983ab@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org,
        kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        rfontana@redhat.com, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    ba606e9d Revert "printk_safe: externalize printk_context"
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=1251b828e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c07a3d4f8a59e198
dashboard link: https://syzkaller.appspot.com/bug?extid=9d42b7773d2fecd983ab
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=140be8e4e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13eb1edf600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+9d42b7773d2fecd983ab@syzkaller.appspotmail.com

usb 1-1: config 0 has no interface number 0
usb 1-1: New USB device found, idVendor=15a4, idProduct=9020,  
bcdDevice=ba.2a
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
=====================================================
BUG: KMSAN: uninit-value in number+0x32e/0x1e40 lib/vsprintf.c:436
CPU: 1 PID: 3904 Comm: kworker/1:2 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x128/0x220 mm/kmsan/kmsan_report.c:108
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:245
  number+0x32e/0x1e40 lib/vsprintf.c:436
  vsnprintf+0x1e99/0x3210 lib/vsprintf.c:2576
  vscnprintf+0xc2/0x180 lib/vsprintf.c:2613
  vprintk_store+0xef/0x11e0 kernel/printk/printk.c:1921
  vprintk_emit+0x2fd/0x8d0 kernel/printk/printk.c:1984
  vprintk_default+0x90/0xa0 kernel/printk/printk.c:2029
  vprintk_func+0x635/0x810 kernel/printk/printk_safe.c:386
  printk+0x180/0x1c3 kernel/printk/printk.c:2062
  af9005_boot_packet+0xedc/0x17d0 drivers/media/usb/dvb-usb/af9005.c:607
  af9005_identify_state+0x13e/0x420 drivers/media/usb/dvb-usb/af9005.c:969
  dvb_usb_find_device drivers/media/usb/dvb-usb/dvb-usb-init.c:221 [inline]
  dvb_usb_device_init+0xb72/0x2e10  
drivers/media/usb/dvb-usb/dvb-usb-init.c:258
  af9005_usb_probe+0x73/0x80 drivers/media/usb/dvb-usb/af9005.c:992
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

Local variable description: ----act_len@af9005_boot_packet
Variable was created at:
  af9005_boot_packet+0x98/0x17d0 drivers/media/usb/dvb-usb/af9005.c:559
  af9005_boot_packet+0x98/0x17d0 drivers/media/usb/dvb-usb/af9005.c:559
=====================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
