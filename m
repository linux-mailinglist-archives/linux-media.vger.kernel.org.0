Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F63D94D05
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 20:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbfHSSdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 14:33:04 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36534 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbfHSSdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 14:33:03 -0400
Received: by mail-pl1-f194.google.com with SMTP id f19so962177plr.3
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 11:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ojr/O6oun/GFD6xLw/uXlQ0tzTXuY5yucR0ZRn3HQTs=;
        b=DroCpEFRlEL0f4n6y8ihKOBuR+fTJEK0sSfXVfk+ZrwBcN/Og2xFYkoXV6Pg88+WdW
         P+gzkGekzTVhsFAm/ZGZPvF4Dq6DH+yWV5vCdcnusWsTVmIUQoZntDmj42WWvzAgx3Nb
         Qq6I+QdyyuhlRZBwHsXa5LHBq8wRWPs/nA/u3agfB4FKDfuXtTcU0pmCpibHPFougZD8
         uEF9RnQb7qgUbNYSS+n9hLNwIO2Exx6ziG6TF1QA/WdIPDtIPfUmCR0FOAOYk7Qq2yqF
         iVZPhPunSUF+wiqQlLictyoimv/f4jMmhQ8ML9uuEqiNLtr/U1FxM/eQy6Ud0hnfa6ue
         JGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ojr/O6oun/GFD6xLw/uXlQ0tzTXuY5yucR0ZRn3HQTs=;
        b=apQu4jde/OOp9T6JYHyvGkh/YcWEGMiszlmbHltq2cuPJTRmq5TV0lZP34DjeI/xCV
         msGBJdsAgAbI6JMzObLmJw31azmUz0+NKHbAewGNFB5/etL2eeW6xb4Nwz+Ctp6UPxBa
         FvhWQzwKU239I3fyY7qD4UtNtiutffwwjbWXG0qUnRWO7p2+kyGI2gMppngpNDzugmT8
         uvRXhEwCkZdua1ZkHAm/8yycEg/IbJ8w9tqUaUE25fYXSDwiS3w9tJHvSHSbFk4zljo6
         oF3p2MErdxSoWGztQlIBt+wtJxffD07BCc5HhvBP/4OvZ7F5gHmaq1TKfcAPGUv4e7Lw
         KJtA==
X-Gm-Message-State: APjAAAX78NCgJMIcBSS9FrTXKWVoO2DNbKSBVXi59c8QvQTDhgJGpN+t
        tnBM0dHK7XYyWAysqhd93usZASokXuEC56C/6S7rgl4YuuK2mw==
X-Google-Smtp-Source: APXvYqy1fvOspt56T/CjBE0KRsUOkII1CxSXvxx9xJyPz98ZBpfPWosdXRfZ297EO26R0UZKM8spfDmbiupWQJuVifA=
X-Received: by 2002:a17:902:8649:: with SMTP id y9mr22304702plt.252.1566239582529;
 Mon, 19 Aug 2019 11:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000e9e1990586cd3e40@google.com>
In-Reply-To: <000000000000e9e1990586cd3e40@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 19 Aug 2019 20:32:51 +0200
Message-ID: <CAAeHK+zvaTAUueJYPj4OmdVJT5jchyNZRLAOzzx7_wGngtoQPQ@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel paging request in osq_lock
To:     syzbot <syzbot+e5c9afc3e1eed1dfc2b0@syzkaller.appspotmail.com>
Cc:     brad@nextdimension.cc, Hans Verkuil <hans.verkuil@cisco.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 18, 2019 at 2:36 PM syzbot
<syzbot+e5c9afc3e1eed1dfc2b0@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    d34f9519 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=1338d3e3200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
> dashboard link: https://syzkaller.appspot.com/bug?extid=e5c9afc3e1eed1dfc2b0
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+e5c9afc3e1eed1dfc2b0@syzkaller.appspotmail.com
>
> au0828: recv_control_msg() Failed receiving control message, error -71.
> au8522_writereg: writereg error (reg == 0x106, val == 0x0001, ret == -5)
> usb 1-1: selecting invalid altsetting 5
> au0828: Failure setting usb interface0 to as5
> au0828: au0828_usb_probe() au0828_analog_register failed to register on V4L2
> BUG: unable to handle kernel paging request at fffffffc45040758
> #PF error: [normal kernel read fault]
> PGD 1167e067 P4D 1167e067 PUD 0
> Oops: 0000 [#1] SMP KASAN PTI
> CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.1.0-rc5-319617-gd34f951 #4
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:decode_cpu kernel/locking/osq_lock.c:34 [inline]
> RIP: 0010:osq_lock+0xfd/0x5a0 kernel/locking/osq_lock.c:111
> Code: 48 63 e8 48 b8 00 00 00 00 00 fc ff df 48 8d 3c ed 60 c0 39 91 48 89
> f9 48 c1 e9 03 80 3c 01 00 0f 85 2c 04 00 00 48 8d 53 08 <4c> 03 2c ed 60
> c0 39 91 48 b8 00 00 00 00 00 fc ff df 48 89 d6 48
> RSP: 0018:ffff8880a846f0e8 EFLAGS: 00010246
> RAX: dffffc0000000000 RBX: ffff8880ad02dfc0 RCX: 1fffffff88a080eb
> RDX: ffff8880ad02dfc8 RSI: 0000000000000004 RDI: fffffffc45040758
> RBP: ffffffff967948df R08: 0000000000000000 R09: ffffed1012299b1e
> R10: ffffed1012299b1d R11: ffff8880914cd8eb R12: ffff8880ad02dfd0
> R13: 000000000002dfc0 R14: ffff8880a8443100 R15: ffff8880914cd8e8
> FS:  0000000000000000(0000) GS:ffff8880ad000000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: fffffffc45040758 CR3: 000000009f4ac000 CR4: 00000000001406f0
> Call Trace:
>   mutex_optimistic_spin kernel/locking/mutex.c:630 [inline]
>   __mutex_lock_common kernel/locking/mutex.c:928 [inline]
>   __mutex_lock+0x27d/0x12b0 kernel/locking/mutex.c:1072
>   au0828_usb_disconnect+0xa3/0x130 drivers/media/usb/au0828/au0828-core.c:194
>   au0828_usb_probe.cold+0x121/0x7d8
> drivers/media/usb/au0828/au0828-core.c:661
>   usb_probe_interface+0x31d/0x820 drivers/usb/core/driver.c:361
>   really_probe+0x2da/0xb10 drivers/base/dd.c:509
>   driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
>   __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
>   bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x223/0x3a0 drivers/base/dd.c:844
>   bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
>   device_add+0xad2/0x16e0 drivers/base/core.c:2106
>   usb_set_configuration+0xdf7/0x1740 drivers/usb/core/message.c:2021
>   generic_probe+0xa2/0xda drivers/usb/core/generic.c:210
>   usb_probe_device+0xc0/0x150 drivers/usb/core/driver.c:266
>   really_probe+0x2da/0xb10 drivers/base/dd.c:509
>   driver_probe_device+0x21d/0x350 drivers/base/dd.c:671
>   __device_attach_driver+0x1d8/0x290 drivers/base/dd.c:778
>   bus_for_each_drv+0x163/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x223/0x3a0 drivers/base/dd.c:844
>   bus_probe_device+0x1f1/0x2a0 drivers/base/bus.c:514
>   device_add+0xad2/0x16e0 drivers/base/core.c:2106
>   usb_new_device.cold+0x537/0xccf drivers/usb/core/hub.c:2534
>   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0x1398/0x3b00 drivers/usb/core/hub.c:5432
>   process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7b0/0xe20 kernel/workqueue.c:2417
>   kthread+0x313/0x420 kernel/kthread.c:253
>   ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
> Modules linked in:
> CR2: fffffffc45040758
> ---[ end trace 41843cb8c360ab9e ]---
> RIP: 0010:decode_cpu kernel/locking/osq_lock.c:34 [inline]
> RIP: 0010:osq_lock+0xfd/0x5a0 kernel/locking/osq_lock.c:111
> Code: 48 63 e8 48 b8 00 00 00 00 00 fc ff df 48 8d 3c ed 60 c0 39 91 48 89
> f9 48 c1 e9 03 80 3c 01 00 0f 85 2c 04 00 00 48 8d 53 08 <4c> 03 2c ed 60
> c0 39 91 48 b8 00 00 00 00 00 fc ff df 48 89 d6 48
> RSP: 0018:ffff8880a846f0e8 EFLAGS: 00010246
> RAX: dffffc0000000000 RBX: ffff8880ad02dfc0 RCX: 1fffffff88a080eb
> RDX: ffff8880ad02dfc8 RSI: 0000000000000004 RDI: fffffffc45040758
> RBP: ffffffff967948df R08: 0000000000000000 R09: ffffed1012299b1e
> R10: ffffed1012299b1d R11: ffff8880914cd8eb R12: ffff8880ad02dfd0
> R13: 000000000002dfc0 R14: ffff8880a8443100 R15: ffff8880914cd8e8
> FS:  0000000000000000(0000) GS:ffff8880ad000000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: fffffffc45040758 CR3: 000000009f4ac000 CR4: 00000000001406f0
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

#syz dup: BUG: unable to handle kernel paging request in au0828_usb_disconnect
