Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667C32B081F
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 16:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgKLPHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 10:07:20 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:36194 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbgKLPHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 10:07:19 -0500
Received: by mail-il1-f200.google.com with SMTP id r12so4178627iln.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 07:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=ew8i7DHZkJq4r7+XIn3KNVeqj+PTLmKItdFJHhS81fo=;
        b=EzDGGgRlJRF+zg8DyjxDwdHd1TS1EHYmviixyY7M3vhq2bsa/ElvFaHFdSDe/PzY+T
         wLIELUDWZZuyismlyRxuQvvEaa5D+RHPHLotYJUR7/V0BrTsCuA4dV+uNM5IYZggbI6U
         zVkZC5M7uH9ZfiaSifTjAS7hWX5LPAf8Bj7SJSz5iwu6RsifwYnycX42mvakP6t+AZPt
         U9IQUgQjL3c3f+kYo0Bzym66qhU4xS7xDafJPBwnIoCaztYlpBLMK+ftnq/OnEsWDjzf
         4B3jyBejTLQf150Nzrhcyi3k7OApzMsEJjE3u8Mh7eYH8COYdcG8elL4aE0mUUCbosO8
         xstQ==
X-Gm-Message-State: AOAM5331Y4XbTk48q0+ibMBl55CkVJPaELQvXMEi6++J0ktDcvt68h+3
        LlqmVYhli6raWkgHMGGkDU1DH1fBHK/48lEa2mIqzb5uGwWA
X-Google-Smtp-Source: ABdhPJxZlubhyCppxONkZcKLgQi4LyWgIwWO9oEt90oyt+Pb7gzWC59p0v+UX8n21lrax7i/EWBYOr2Rs/mu6Y7M25rO1kK1hXzt
MIME-Version: 1.0
X-Received: by 2002:a02:cbde:: with SMTP id u30mr35198jaq.69.1605193638417;
 Thu, 12 Nov 2020 07:07:18 -0800 (PST)
Date:   Thu, 12 Nov 2020 07:07:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009d17f405b3ea44ab@google.com>
Subject: memory leak in cinergyt2_fe_attach
From:   syzbot <syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3d5e28bf Merge branch 'stable/for-linus-5.10-rc2' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10bae3aa500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3f13716fa0212fd
dashboard link: https://syzkaller.appspot.com/bug?extid=e1de8986786b3722050e
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1781dd4e500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1636b181500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810d626800 (size 2048):
  comm "kworker/0:1", pid 7, jiffies 4294946031 (age 8.260s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 54 65 72 72 61 54 65 63  ........TerraTec
    2f 71 61 6e 75 20 55 53 42 32 2e 30 20 48 69 67  /qanu USB2.0 Hig
  backtrace:
    [<000000001868ec69>] kmalloc include/linux/slab.h:552 [inline]
    [<000000001868ec69>] kzalloc include/linux/slab.h:664 [inline]
    [<000000001868ec69>] cinergyt2_fe_attach+0x21/0x80 drivers/media/usb/dvb-usb/cinergyT2-fe.c:271
    [<0000000069d80651>] cinergyt2_frontend_attach+0x21/0x70 drivers/media/usb/dvb-usb/cinergyT2-core.c:74
    [<00000000c12d6c47>] dvb_usb_adapter_frontend_init+0x11b/0x1b0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
    [<0000000012dc4d47>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:84 [inline]
    [<0000000012dc4d47>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
    [<0000000012dc4d47>] dvb_usb_device_init.cold+0x4d0/0x6ae drivers/media/usb/dvb-usb/dvb-usb-init.c:287
    [<000000009a40ba79>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<0000000092664fce>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000ac3ae41f>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<000000008558e2d5>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000562cb0b9>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<0000000056762cde>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000412c6765>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<000000000a5960bb>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<000000009ab6c3b2>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<00000000f4ffc3df>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000b38e25bd>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<0000000092664fce>] really_probe+0x159/0x480 drivers/base/dd.c:554



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
