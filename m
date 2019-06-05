Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37F04354A0
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 02:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfFEAMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 20:12:07 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:41115 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfFEAMH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 20:12:07 -0400
Received: by mail-io1-f70.google.com with SMTP id i7so17631495ioh.8
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 17:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=FGuzGX/odArR8Wasi2hmCQXeCrMlVsnJR2R5E+8BwFQ=;
        b=be9Q3cNueXnvrKOZymxwMPC0UbQXC1Dpdu8ooDw9MJWGKEkUa4aLgMxoDD8wDU03ff
         YFRhwXXPrjy/t44c/6QEUDLSPrZd5KivItQi1T4d2KQKqmdnlRkla3p49U0lGkxwKgjK
         nz1y1DTFWiSy8DqNLByx9XWE4xXDzknZ0RUns4tl44OeyhNwJbIBG9jnuIEvQm25apQT
         PgVNqxWQrZIxi9E/1mINGBiwV3hORWmgdt7JGYZ36+0ixC9UP9RuAcWclSoknrznVzmD
         Dvf/9ABws0LjyRgmjXU2fdGQRpqmhmEQz+Sn5qWUGps5L5YfSevPm+Kye62Lg/xBMM1j
         Z1cg==
X-Gm-Message-State: APjAAAWhNDPHD03MQdj1wk/C6JMkqOpIvu+TvVzOCIkCDLwBDQqmuJ+e
        W6zhvbZ0kRcxVQwK8EHOYzX3sgGBOQP+1P8eHuLTDl32zuF2
X-Google-Smtp-Source: APXvYqx0Aj831JIJffguwTlX4uz3Q/32KuSI38Eju+sXqcM9OTtpYBImR7kQ+fu2UKaBv4U7UIJd+hphh+G4QKtljQi9ZhVa2Txy
MIME-Version: 1.0
X-Received: by 2002:a24:7d08:: with SMTP id b8mr22607288itc.155.1559693526558;
 Tue, 04 Jun 2019 17:12:06 -0700 (PDT)
Date:   Tue, 04 Jun 2019 17:12:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009bf1bd058a887277@google.com>
Subject: KMSAN: uninit-value in sd_init
From:   syzbot <syzbot+1a35278dd0ebfb3a038a@syzkaller.appspotmail.com>
To:     glider@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    f75e4cfe kmsan: use kmsan_handle_urb() in urb.c
git tree:       kmsan
console output: https://syzkaller.appspot.com/x/log.txt?x=17eadebaa00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=602468164ccdc30a
dashboard link: https://syzkaller.appspot.com/bug?extid=1a35278dd0ebfb3a038a
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
06d00afa61eef8f7f501ebdb4e8612ea43ec2d78)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147f4136a00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17aec4f2a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+1a35278dd0ebfb3a038a@syzkaller.appspotmail.com

usb 1-1: config 0 has an invalid interface number: 142 but max is 0
usb 1-1: config 0 has no interface number 0
usb 1-1: New USB device found, idVendor=08ca, idProduct=2018,  
bcdDevice=95.4a
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
gspca_main: sunplus-2.14.0 probing 08ca:2018
gspca_sunplus: reg_w_riv err -71
==================================================================
BUG: KMSAN: uninit-value in spca504B_PollingDataReady  
drivers/media/usb/gspca/sunplus.c:409 [inline]
BUG: KMSAN: uninit-value in sd_init+0x5b6f/0x5e60  
drivers/media/usb/gspca/sunplus.c:643
CPU: 0 PID: 3902 Comm: kworker/0:2 Not tainted 5.1.0+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x130/0x2a0 mm/kmsan/kmsan.c:622
  __msan_warning+0x75/0xe0 mm/kmsan/kmsan_instr.c:310
  spca504B_PollingDataReady drivers/media/usb/gspca/sunplus.c:409 [inline]
  sd_init+0x5b6f/0x5e60 drivers/media/usb/gspca/sunplus.c:643
  gspca_dev_probe2+0xee0/0x2240 drivers/media/usb/gspca/gspca.c:1546
  gspca_dev_probe+0x346/0x3b0 drivers/media/usb/gspca/gspca.c:1619
  sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:523
  usb_probe_interface+0xd66/0x1320 drivers/usb/core/driver.c:361
  really_probe+0xdae/0x1d80 drivers/base/dd.c:513
  driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x454/0x730 drivers/base/dd.c:844
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
  bus_probe_device+0x137/0x390 drivers/base/bus.c:514
  device_add+0x288d/0x30e0 drivers/base/core.c:2106
  usb_set_configuration+0x30dc/0x3750 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x14c/0x200 drivers/usb/core/driver.c:266
  really_probe+0xdae/0x1d80 drivers/base/dd.c:513
  driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x454/0x730 drivers/base/dd.c:844
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
  bus_probe_device+0x137/0x390 drivers/base/bus.c:514
  device_add+0x288d/0x30e0 drivers/base/core.c:2106
  usb_new_device+0x23e5/0x2ff0 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x48d1/0x7290 drivers/usb/core/hub.c:5432
  process_one_work+0x1572/0x1f00 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:254
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was created at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:208 [inline]
  kmsan_internal_poison_shadow+0x92/0x150 mm/kmsan/kmsan.c:162
  kmsan_kmalloc+0xa4/0x130 mm/kmsan/kmsan_hooks.c:175
  kmem_cache_alloc_trace+0x503/0xae0 mm/slub.c:2801
  kmalloc include/linux/slab.h:547 [inline]
  gspca_dev_probe2+0x30c/0x2240 drivers/media/usb/gspca/gspca.c:1480
  gspca_dev_probe+0x346/0x3b0 drivers/media/usb/gspca/gspca.c:1619
  sd_probe+0x8d/0xa0 drivers/media/usb/gspca/gl860/gl860.c:523
  usb_probe_interface+0xd66/0x1320 drivers/usb/core/driver.c:361
  really_probe+0xdae/0x1d80 drivers/base/dd.c:513
  driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x454/0x730 drivers/base/dd.c:844
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
  bus_probe_device+0x137/0x390 drivers/base/bus.c:514
  device_add+0x288d/0x30e0 drivers/base/core.c:2106
  usb_set_configuration+0x30dc/0x3750 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x14c/0x200 drivers/usb/core/driver.c:266
  really_probe+0xdae/0x1d80 drivers/base/dd.c:513
  driver_probe_device+0x1b3/0x4f0 drivers/base/dd.c:671
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:778
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x454/0x730 drivers/base/dd.c:844
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:891
  bus_probe_device+0x137/0x390 drivers/base/bus.c:514
  device_add+0x288d/0x30e0 drivers/base/core.c:2106
  usb_new_device+0x23e5/0x2ff0 drivers/usb/core/hub.c:2534
  hub_port_connect drivers/usb/core/hub.c:5089 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
  port_event drivers/usb/core/hub.c:5350 [inline]
  hub_event+0x48d1/0x7290 drivers/usb/core/hub.c:5432
  process_one_work+0x1572/0x1f00 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:254
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
