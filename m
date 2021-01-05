Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DF12EA376
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 03:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbhAECt5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 21:49:57 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:56160 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbhAECt5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 21:49:57 -0500
Received: by mail-io1-f72.google.com with SMTP id j25so13072719iog.22
        for <linux-media@vger.kernel.org>; Mon, 04 Jan 2021 18:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Qw/22jOZ8d9ckeL7b+PrbTIdW53/o+UBIWUIwEw3J0Q=;
        b=P2RWGtzzT0wEsnawJ4XfiCr+0SsZujAzZw196PvVt6ro0op+Gi1kZmNOeYi8PLa49f
         IQtSvb37tnEYTJS5iU6ekka4nDKANim+LU2i/P4l2XzPuc1HP8h5kEeKaTjM7G17CmEm
         BuCjk6/auKvHUTauLDlg1SNwob53CsrFbmZQX3AsMEQ1AyEd7g+9G9u+Lq5a94sbDWth
         YHTVpWnty87WKvRoMC5BkWR5YhfVBcHQ1H3gaTWgL3e7bShAtDV66GTHz1bjR49D49ru
         7Vi35ltL9SnA9+AiFguJhH6sL2DiVnBnUTebgVv6a1TMpr+H4pfFH4wriCyesLvOwRrU
         LGUQ==
X-Gm-Message-State: AOAM530/Di4qQ/293uyiEE/JupyBc/DlHa1m1X5kZOOUHt4K4xNKbCOc
        lhrDy2RZVZP+Z9Ms2pdqTrckAaFzCzKtZhBK6kHzlqV6pICj
X-Google-Smtp-Source: ABdhPJxBaQLizthDThzIt1ZAtGhrdmxMzQ7Fdi/4JaJ7KDjS9Vco3Uxvce8OZyRQPW5O04Fqhy0AS1nBJYitS5rUZj7dzkNTX4LS
MIME-Version: 1.0
X-Received: by 2002:a92:ad05:: with SMTP id w5mr69783289ilh.226.1609814956132;
 Mon, 04 Jan 2021 18:49:16 -0800 (PST)
Date:   Mon, 04 Jan 2021 18:49:16 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009d50ae05b81e4091@google.com>
Subject: memory leak in usb_urb_init
From:   syzbot <syzbot+3c2be7424cea3b932b0e@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f6e1ea19 Merge tag 'ceph-for-5.11-rc2' of git://github.com..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=102e814f500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1dcbf163b62a8256
dashboard link: https://syzkaller.appspot.com/bug?extid=3c2be7424cea3b932b0e
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1509c9c0d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e15e0b500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3c2be7424cea3b932b0e@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888114a12180 (size 192):
  comm "kworker/1:3", pid 8132, jiffies 4294980969 (age 13.460s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 98 21 a1 14 81 88 ff ff  .........!......
  backtrace:
    [<00000000270adc89>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000270adc89>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000007ddd474e>] usb_bulk_urb_init drivers/media/usb/dvb-usb/usb-urb.c:148 [inline]
    [<000000007ddd474e>] usb_urb_init+0x17a/0x3d0 drivers/media/usb/dvb-usb/usb-urb.c:229
    [<00000000bdcce353>] dvb_usb_adapter_stream_init+0x5b/0x120 drivers/media/usb/dvb-usb/dvb-usb-urb.c:108
    [<00000000adc3ae74>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:82 [inline]
    [<00000000adc3ae74>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
    [<00000000adc3ae74>] dvb_usb_device_init.cold+0x483/0x6ae drivers/media/usb/dvb-usb/dvb-usb-init.c:287
    [<00000000979fb93a>] m920x_probe+0x1d7/0x470 drivers/media/usb/dvb-usb/m920x.c:834
    [<00000000dc58d155>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<0000000011b900cd>] really_probe+0x159/0x480 drivers/base/dd.c:561
    [<000000003bf38880>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
    [<000000003450ad28>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
    [<000000005a93a91d>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<0000000058084795>] __device_attach+0x122/0x250 drivers/base/dd.c:919
    [<00000000e0d09782>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000004566d8b7>] device_add+0x5be/0xc30 drivers/base/core.c:3091
    [<000000000471371f>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<00000000d93dc50f>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000a0057c67>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293

BUG: memory leak
unreferenced object 0xffff888114a126c0 (size 192):
  comm "kworker/1:3", pid 8132, jiffies 4294980969 (age 13.460s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 d8 26 a1 14 81 88 ff ff  .........&......
  backtrace:
    [<00000000270adc89>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000270adc89>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000007ddd474e>] usb_bulk_urb_init drivers/media/usb/dvb-usb/usb-urb.c:148 [inline]
    [<000000007ddd474e>] usb_urb_init+0x17a/0x3d0 drivers/media/usb/dvb-usb/usb-urb.c:229
    [<00000000bdcce353>] dvb_usb_adapter_stream_init+0x5b/0x120 drivers/media/usb/dvb-usb/dvb-usb-urb.c:108
    [<00000000adc3ae74>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:82 [inline]
    [<00000000adc3ae74>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
    [<00000000adc3ae74>] dvb_usb_device_init.cold+0x483/0x6ae drivers/media/usb/dvb-usb/dvb-usb-init.c:287
    [<00000000979fb93a>] m920x_probe+0x1d7/0x470 drivers/media/usb/dvb-usb/m920x.c:834
    [<00000000dc58d155>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<0000000011b900cd>] really_probe+0x159/0x480 drivers/base/dd.c:561
    [<000000003bf38880>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
    [<000000003450ad28>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
    [<000000005a93a91d>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<0000000058084795>] __device_attach+0x122/0x250 drivers/base/dd.c:919
    [<00000000e0d09782>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000004566d8b7>] device_add+0x5be/0xc30 drivers/base/core.c:3091
    [<000000000471371f>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<00000000d93dc50f>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000a0057c67>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293

BUG: memory leak
unreferenced object 0xffff888114bbf900 (size 192):
  comm "kworker/1:3", pid 8132, jiffies 4294980969 (age 13.460s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 18 f9 bb 14 81 88 ff ff  ................
  backtrace:
    [<00000000270adc89>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000270adc89>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<000000007ddd474e>] usb_bulk_urb_init drivers/media/usb/dvb-usb/usb-urb.c:148 [inline]
    [<000000007ddd474e>] usb_urb_init+0x17a/0x3d0 drivers/media/usb/dvb-usb/usb-urb.c:229
    [<00000000bdcce353>] dvb_usb_adapter_stream_init+0x5b/0x120 drivers/media/usb/dvb-usb/dvb-usb-urb.c:108
    [<00000000adc3ae74>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:82 [inline]
    [<00000000adc3ae74>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
    [<00000000adc3ae74>] dvb_usb_device_init.cold+0x483/0x6ae drivers/media/usb/dvb-usb/dvb-usb-init.c:287
    [<00000000979fb93a>] m920x_probe+0x1d7/0x470 drivers/media/usb/dvb-usb/m920x.c:834
    [<00000000dc58d155>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<0000000011b900cd>] really_probe+0x159/0x480 drivers/base/dd.c:561
    [<000000003bf38880>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
    [<000000003450ad28>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
    [<000000005a93a91d>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<0000000058084795>] __device_attach+0x122/0x250 drivers/base/dd.c:919
    [<00000000e0d09782>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000004566d8b7>] device_add+0x5be/0xc30 drivers/base/core.c:3091
    [<000000000471371f>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<00000000d93dc50f>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000a0057c67>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
