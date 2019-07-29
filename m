Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD9179199
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 18:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387596AbfG2Q6I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 12:58:08 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:53196 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbfG2Q6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 12:58:08 -0400
Received: by mail-io1-f71.google.com with SMTP id p12so68128872iog.19
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 09:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=zYSkCumP1m3hb2mgGhDNo5Y0jDgglbE754iR6vBUBG0=;
        b=PcDxSsXX4A+bIYeePyix3Ca7gows6nkRpZZTUwA1CdDEqxYKxY9stlK416UdiNGlUM
         uMSp6vuLTPyDBw9jx/jUw7B4IgSy8R5rh+K8PNGNQRyDu2DCUvkayWj4qP3EYjw8+svw
         jDzs3Z4uTov61ecVJjJExal6qhCluLhhvzUJDMXhuoNFSpP2pSP6FPIqy+kT8NkuuR0a
         ZgfuLj5idMb0IttKTYz66jfcp4RDhXX8CEE72+o49BiUn4EFRjB68brMkKtBWrm8069D
         N2ZWPuWnUs0FQyN7JU4rn6rN2oYS6qn0gYJtYd3PrWDBoMMHBSd6u06yAjtPrXoDpU2M
         lwPg==
X-Gm-Message-State: APjAAAVQBGYxUAm1sFNnK+cG2jmbl/HHU9EhqVHIqsJlXQ0cOenZxSAt
        EQfS1w2H7sPEW3mcByWU8i7JtbovxwIoV2pQ75zR9VLOzxsX
X-Google-Smtp-Source: APXvYqwuAgYNcogscmSVDpjnPxCyHn2aBg3ZoPD8eQBq+t81HbZYsudho/QxwG2zDw+sZzNmhiXgQ+5V54xCJdOGzWLkw7wZrAaz
MIME-Version: 1.0
X-Received: by 2002:a5d:94d7:: with SMTP id y23mr80916050ior.296.1564419487345;
 Mon, 29 Jul 2019 09:58:07 -0700 (PDT)
Date:   Mon, 29 Jul 2019 09:58:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d2b175058ed4cb3f@google.com>
Subject: INFO: trying to register non-static key in ida_destroy
From:   syzbot <syzbot+c86454eb3af9e8a4da20@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16ee1d7c600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
dashboard link: https://syzkaller.appspot.com/bug?extid=c86454eb3af9e8a4da20
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15eacab4600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178293c8600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c86454eb3af9e8a4da20@syzkaller.appspotmail.com

usb 1-1: config 0 interface 197 altsetting 0 bulk endpoint 0xA has invalid  
maxpacket 0
usb 1-1: New USB device found, idVendor=972f, idProduct=41a3,  
bcdDevice=d9.98
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #23
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  assign_lock_key kernel/locking/lockdep.c:813 [inline]
  register_lock_class+0x1022/0x11d0 kernel/locking/lockdep.c:1122
  __lock_acquire+0xfc/0x3b50 kernel/locking/lockdep.c:3762
  lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0x32/0x50 kernel/locking/spinlock.c:159
  ida_destroy+0xb0/0x3a0 lib/idr.c:551
  media_device_cleanup+0x15/0x70 drivers/media/mc/mc-device.c:722
  uvc_delete+0x8e/0x2f0 drivers/media/usb/uvc/uvc_driver.c:1872
  kref_put include/linux/kref.h:65 [inline]
  uvc_probe+0xf95/0x64e4 drivers/media/usb/uvc/uvc_driver.c:2223
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


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
