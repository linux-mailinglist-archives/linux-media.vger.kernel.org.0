Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688FB382B42
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 13:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236881AbhEQLip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 07:38:45 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:38697 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236867AbhEQLij (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 07:38:39 -0400
Received: by mail-io1-f70.google.com with SMTP id i13-20020a5e9e0d0000b029042f7925649eso3091407ioq.5
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 04:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=ZxlfFUA1ZFPdvmAdb7MpX2nnEcE+L+QT1GC1K9yFm58=;
        b=TTPHjd/IEgVohHMtRiUA1fAIo7KkQzc5tGu688kaYKln4mwBXZl6Fm6TUTEJ0TAaAv
         D3icGVIMYZHyZWB0bgXuq6is28Esgp3VofY6aawyE3h25lqR43LgWw9+LbqSmgMEqBQ2
         UlC32TMk4iRESE4kVe1F8f16W1h1zwl3tBUWHF8Fq0q5LOpf9PIsh/PkCA0XO/sLy/XM
         OalMupU4xEuf9SScjbvk6yOyiAmh3qrbHlKui+DpImyV/mHUCTiQGseukOsPIX9iSLHg
         CgAhp3NUjbaTR2uqcYs3EHBw9PaOjJK+jZumkipnif2y1CJU9EtQUQG1SrL4ULXSPUqh
         +J+A==
X-Gm-Message-State: AOAM533RcHkcnVEYmraJoY8r28eJ73DjccWkuVa9+IsNgC+QLdz3Q6iJ
        UcEsW6N6VeZfW2ihO1H09PgY6nD7OKpY37HAzhdF44Ekc8MQ
X-Google-Smtp-Source: ABdhPJwEdhJwE49luVwPPf+MnA1aYmvj7uDIGctkI4Pos8O38NjTsCbcepQyqaVK7v/aLFRGi5k59wa5+7E6d8/X37fhVzxRN3Ws
MIME-Version: 1.0
X-Received: by 2002:a05:6602:21d7:: with SMTP id c23mr20765311ioc.147.1621251442052;
 Mon, 17 May 2021 04:37:22 -0700 (PDT)
Date:   Mon, 17 May 2021 04:37:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004b90e405c285040f@google.com>
Subject: [syzbot] memory leak in zr364xx_start_readpipe
From:   syzbot <syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, royale@zerezo.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    d72cd4ad Merge tag 'scsi-misc' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=107c2b85d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=337dc545ba10a406
dashboard link: https://syzkaller.appspot.com/bug?extid=af4fa391ef18efdd5f69
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1245a733d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f13de1d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881112c1600 (size 192):
  comm "kworker/1:5", pid 8088, jiffies 4294943845 (age 8.070s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 18 16 2c 11 81 88 ff ff  ..........,.....
  backtrace:
    [<ffffffff82baedf6>] kmalloc include/linux/slab.h:561 [inline]
    [<ffffffff82baedf6>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<ffffffff82f7cce8>] zr364xx_start_readpipe+0x78/0x130 drivers/media/usb/zr364xx/zr364xx.c:1022
    [<ffffffff84251dfc>] zr364xx_board_init drivers/media/usb/zr364xx/zr364xx.c:1383 [inline]
    [<ffffffff84251dfc>] zr364xx_probe+0x6a3/0x851 drivers/media/usb/zr364xx/zr364xx.c:1516
    [<ffffffff82bb6507>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<ffffffff826018a9>] really_probe+0x159/0x500 drivers/base/dd.c:576
    [<ffffffff82601cdb>] driver_probe_device+0x8b/0x100 drivers/base/dd.c:763
    [<ffffffff82602406>] __device_attach_driver+0xf6/0x120 drivers/base/dd.c:870
    [<ffffffff825fe797>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<ffffffff82601f82>] __device_attach+0x122/0x260 drivers/base/dd.c:938
    [<ffffffff82600436>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<ffffffff825fc855>] device_add+0x5d5/0xd70 drivers/base/core.c:3319
    [<ffffffff82bb3aa9>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
    [<ffffffff82bc3e3c>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82bb5c6c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff826018a9>] really_probe+0x159/0x500 drivers/base/dd.c:576
    [<ffffffff82601cdb>] driver_probe_device+0x8b/0x100 drivers/base/dd.c:763



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
