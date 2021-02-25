Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB5E325407
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 17:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhBYQvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 11:51:06 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:45289 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233944AbhBYQs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 11:48:59 -0500
Received: by mail-il1-f197.google.com with SMTP id h17so4780416ila.12
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 08:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=nX0Cf5vZFbT+N+HBBohCxcH2b8JvYZMgS6veByKimgw=;
        b=Zvb2dyF7nJFlf2Dv+RTj6ZUPVIL1aTKary+XTvusjRGMSKRCMp7uLcca1V8X8s2vxH
         yuplOieyV6D+dqwbvdnRGqyxyKdGzJZrpyPKAfojCM+ZG2E7TgnMvjHx7pBhG+8nW4xT
         XQYZhhzWu1/QeDgFyh/IEWGEF3Kz8EgtSdYTkQFDnPxUq2+P79C44dek0KyN5rQrhCzu
         q+sh5jeJX9i2hdHmGe+a8XePkZ+wPbGRacT9aWNgKux7uoE21r9Lq3UTWeKeRnV/4fev
         XJsj/eTVqxTn3mHgnYcJ7osPZpsHYf38iZSttbh8xmLdysaKmfGxErrWiA4T04Cawt44
         kCWQ==
X-Gm-Message-State: AOAM531ZVFZdBu6xuxPLqI19bUMEiaq+HpV1TdW/rH1ZEowHb/bgz4m0
        iqCbDAmBSG3iLfchqeWCDlCVMUxM7/cnJveS9JNTvjLuy4+R
X-Google-Smtp-Source: ABdhPJzVbbZrL1uatl5r1j83gRzAUg3IfR++bWUoAsgWUs4PQwKmsx8zWff7yFvb3+RNTNOFSS7v3/NRMYdV+XajBroLoAWlOUlR
MIME-Version: 1.0
X-Received: by 2002:a92:8e0c:: with SMTP id c12mr3290064ild.35.1614271697116;
 Thu, 25 Feb 2021 08:48:17 -0800 (PST)
Date:   Thu, 25 Feb 2021 08:48:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000013eb5105bc2bebd9@google.com>
Subject: memory leak in v4l2_ctrl_handler_init_class
From:   syzbot <syzbot+efe9aefc31ae1e6f7675@syzkaller.appspotmail.com>
To:     ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        jacopo@jmondi.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    c03c21ba Merge tag 'keys-misc-20210126' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1590796cd00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=24acb838051d8b5b
dashboard link: https://syzkaller.appspot.com/bug?extid=efe9aefc31ae1e6f7675
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13f1bf5ad00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=158a8632d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+efe9aefc31ae1e6f7675@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888110ed0800 (size 32):
  comm "kworker/0:2", pid 3639, jiffies 4294942900 (age 8.280s)
  hex dump (first 32 bytes):
    00 63 ec 0c 81 88 ff ff 00 00 00 00 00 00 00 00  .c..............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000e17942dc>] kmalloc_node include/linux/slab.h:577 [inline]
    [<00000000e17942dc>] kvmalloc_node+0x61/0xf0 mm/util.c:587
    [<00000000a704dd11>] kvmalloc include/linux/mm.h:785 [inline]
    [<00000000a704dd11>] kvmalloc_array include/linux/mm.h:803 [inline]
    [<00000000a704dd11>] v4l2_ctrl_handler_init_class+0x86/0xb0 drivers/media/v4l2-core/v4l2-ctrls.c:2525
    [<0000000062f5fe33>] zr364xx_probe+0x110/0x851 drivers/media/usb/zr364xx/zr364xx.c:1427
    [<000000002a7dee6e>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<0000000042b3f5b0>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
    [<00000000bb6e5b5c>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740
    [<00000000968b09c2>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:846
    [<00000000516485c0>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<000000003b640743>] __device_attach+0x122/0x250 drivers/base/dd.c:914
    [<000000008dc09474>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000247c2336>] device_add+0x5be/0xc30 drivers/base/core.c:3115
    [<0000000083594ecc>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<0000000093a9f7aa>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000000a86609a>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000042b3f5b0>] really_probe+0x159/0x4a0 drivers/base/dd.c:554
    [<00000000bb6e5b5c>] driver_probe_device+0x84/0x100 drivers/base/dd.c:740



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
