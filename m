Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03DFF2E1DDC
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 16:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgLWPZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 10:25:58 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:34582 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgLWPZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 10:25:58 -0500
Received: by mail-il1-f198.google.com with SMTP id c72so14410948ila.1
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 07:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=ccI8XWc2bkBr3nAUmdNVuOgWrLgiP4ffUXMAehqESVc=;
        b=W+k94av83dPYBUaU+CdZ/V0KtDHuYqFndPflHoG1CApNdlIdDOnHwVIu3Ts/NyxChF
         AoFDqzlOkyyF37voXnZrAQknab6jTZ9OQ7NwywvTD4oqp3/T1+vPFjCwH9SQ20aVvgkl
         3TCanansI5Umx2Ig4ORaIrYqyIJZEfwwViT9v4KHgU6XmUbIpBP4Zdx+op2gxOmz36d2
         toJoStqPrHaXkLrjLdSeNS8GUfFUMpVsqtQuRrLc41j9yMo4U633zXVvL8r9k003J7Z/
         UvxAHoNhlQbhi+lFJc5ysUfU7owN6VI3+6f0DFd6180ssHwVRkxToryX8j6eOeGnqyE0
         bLHQ==
X-Gm-Message-State: AOAM5307FKGOyljwt2GjbLV4mJTXE6pwkUZ5fiEXO6NXP74zUDKrUCgy
        buXF0JL51LZrFtDlX+UDjKfNOWoMBxHsOcxjr8MhkqWAuvAC
X-Google-Smtp-Source: ABdhPJx8vo7Y8yQHtUlIQ7SkyfkLzF0E+/Q5kGXsq5O9xMo9J7lBurcirREzhK+dz6cv/+m3tOhl7tmLnP8Wj5+4rpQPQytNgWbu
MIME-Version: 1.0
X-Received: by 2002:a92:db42:: with SMTP id w2mr25735842ilq.113.1608737117405;
 Wed, 23 Dec 2020 07:25:17 -0800 (PST)
Date:   Wed, 23 Dec 2020 07:25:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006b86be05b7234cc1@google.com>
Subject: memory leak in zr364xx_probe
From:   syzbot <syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, royale@zerezo.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3644e2d2 mm/filemap: fix infinite loop in generic_file_buf..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f80eff500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=37c889fb8b2761af
dashboard link: https://syzkaller.appspot.com/bug?extid=b4d54814b339b5c6bbd4
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1089df07500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1671c77f500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffffc90000e71000 (size 200704):
  comm "kworker/0:2", pid 3653, jiffies 4294942426 (age 13.820s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000110a155e>] __vmalloc_node_range+0x3a5/0x410 mm/vmalloc.c:2585
    [<000000008a1ee970>] __vmalloc_node mm/vmalloc.c:2617 [inline]
    [<000000008a1ee970>] vmalloc+0x49/0x50 mm/vmalloc.c:2650
    [<00000000a6a3abfa>] zr364xx_board_init drivers/media/usb/zr364xx/zr364xx.c:1348 [inline]
    [<00000000a6a3abfa>] zr364xx_probe+0x60b/0x833 drivers/media/usb/zr364xx/zr364xx.c:1509
    [<0000000014a572f5>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000f30ee977>] really_probe+0x159/0x480 drivers/base/dd.c:561
    [<00000000ddb29374>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
    [<0000000073c89cb9>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
    [<000000009f56a99c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000848d591a>] __device_attach+0x122/0x250 drivers/base/dd.c:919
    [<00000000168be5bb>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000464f40a6>] device_add+0x5be/0xc30 drivers/base/core.c:3091
    [<000000008c75a2b5>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<00000000071d14a5>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<00000000f325b973>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000f30ee977>] really_probe+0x159/0x480 drivers/base/dd.c:561
    [<00000000ddb29374>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
