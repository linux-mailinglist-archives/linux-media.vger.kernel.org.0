Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08AB3C29B2
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 00:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbfI3WjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 18:39:16 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:47280 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfI3WjP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 18:39:15 -0400
Received: by mail-io1-f72.google.com with SMTP id k14so33334709iot.14
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2019 15:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=m8sUaKT7crraQNp1bJulsuqpJCNWCNZ+AvUePawvzjg=;
        b=oDiK14pt3C6JP2vHkPqxVxLkcRIlEH3fiyH/+T0jdKes6rxPbZ6wvD7sBfE0tfOPkW
         QL7NdD/pafHbVbuhmuzxAPmEUC8fqdIioCANAJ5nFcuRNI32UyHeV/4WhYnvY3j+joIP
         yvmGzBsDEjLnt21MxdmOmJ/3e2JYY6Gc45RR9jStBFAfPGHYht5GBD3cgMFREsCjeh3F
         tO7O0dr4TD1pipvqITHdhsHmFsbu9Tm6VP4r9qIT7T0VVf4ZlLr1ayXYi3zOefMWIrxd
         d4fWQ94ftox4BbDXYQfJxBzWA4hgJ5FAVEa204uLtWpb6uzBtJ3SSWX6YiTu2MfmR2V3
         e2mg==
X-Gm-Message-State: APjAAAWVZNMSE0euDQhxv4x6AFkOyWc2bCs86xbNE+Rf7iBDG2CwUlqT
        qthlE1EjyfC4if7VQ4/62vUxCPzAdtCJ6nlFHwJ3CKYeeRSU
X-Google-Smtp-Source: APXvYqy+UvgN4s8+JrV8VP8ug0x2BtZT0z2lXdmmW7i4uJmn+BEVWAHncONEz83/eTP9vll7iKYdSCASMjzUGr71zeOg5T8VJlbj
MIME-Version: 1.0
X-Received: by 2002:a5e:8618:: with SMTP id z24mr17197396ioj.67.1569883154531;
 Mon, 30 Sep 2019 15:39:14 -0700 (PDT)
Date:   Mon, 30 Sep 2019 15:39:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c3ce010593cce73a@google.com>
Subject: KMSAN: uninit-value in dvb_usb_device_exit
From:   syzbot <syzbot+20a83e47e94e371740d2@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mail@maciej.szmigiero.name,
        mchehab@kernel.org, oneukum@suse.com, sean@mess.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    61ccdad1 Revert "drm/bochs: Use shadow buffer for bochs fr..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=11b7d1ac600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27abc558ecb16a3b
dashboard link: https://syzkaller.appspot.com/bug?extid=20a83e47e94e371740d2
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15aff61e600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105a0f22600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+20a83e47e94e371740d2@syzkaller.appspotmail.com

input: TeVii S632 USB as  
/devices/platform/dummy_hcd.0/usb1/1-1/rc/rc0/input5
dvb-usb: schedule remote query interval to 150 msecs.
dw2102: su3000_power_ctrl: 0, initialized 1
dvb-usb: TeVii S632 USB successfully initialized and connected.
usb 1-1: USB disconnect, device number 2
==================================================================
BUG: KMSAN: uninit-value in strscpy+0x33f/0x4c0 lib/string.c:207
CPU: 0 PID: 3148 Comm: kworker/0:2 Not tainted 5.3.0-rc3+ #17
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x162/0x2d0 mm/kmsan/kmsan_report.c:109
  __msan_warning+0x75/0xe0 mm/kmsan/kmsan_instr.c:294
  strscpy+0x33f/0x4c0 lib/string.c:207
  dvb_usb_device_exit+0x1c8/0x270  
drivers/media/usb/dvb-usb/dvb-usb-init.c:305
  dw2102_disconnect+0x256/0x2a0 drivers/media/usb/dvb-usb/dw2102.c:2446
  usb_unbind_interface+0x3a2/0xdd0 drivers/usb/core/driver.c:423
  __device_release_driver drivers/base/dd.c:1120 [inline]
  device_release_driver_internal+0x911/0xd20 drivers/base/dd.c:1151
  device_release_driver+0x4b/0x60 drivers/base/dd.c:1174
  bus_remove_device+0x4bf/0x670 drivers/base/bus.c:556
  device_del+0xcd5/0x1d10 drivers/base/core.c:2288
  usb_disable_device+0x567/0x1150 drivers/usb/core/message.c:1241
  usb_disconnect+0x51e/0xd60 drivers/usb/core/hub.c:2199
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x3fd0/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  process_scheduled_works kernel/workqueue.c:2331 [inline]
  worker_thread+0x189c/0x2460 kernel/workqueue.c:2417
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was created at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:187 [inline]
  kmsan_internal_poison_shadow+0x53/0xa0 mm/kmsan/kmsan.c:146
  kmsan_slab_free+0x8d/0x100 mm/kmsan/kmsan_hooks.c:195
  slab_free_freelist_hook mm/slub.c:1472 [inline]
  slab_free mm/slub.c:3038 [inline]
  kfree+0x4c1/0x2db0 mm/slub.c:3980
  dw2102_probe+0xbd1/0xce0 drivers/media/usb/dvb-usb/dw2102.c:2387
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0x1373/0x1dc0 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:709
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:816
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:882
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:929
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2114
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0x1373/0x1dc0 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:709
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:816
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:882
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:929
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2114
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
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
