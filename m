Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5D3AA20F
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 13:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732980AbfIEL4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 07:56:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34572 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfIEL4a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 07:56:30 -0400
Received: by mail-pf1-f193.google.com with SMTP id r12so1620958pfh.1
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hQjgBHGvmm6cLhWASKb+Bb7AwJCJUdb2bnFuCs7Jtms=;
        b=K2qbfLgXLyDMYx3CT4itk56rqQZeUYICpAiwxY+bHziP0L0EtB4dRdLUgUM2QcBUfs
         W7ppzriDhlwCscxbAou1vfl55NzgsdM/0MfsnTKUslHf2cpjRrtDYcWKvv+eEN5mB/j6
         X71J+wI280prcddvuW9IFUeZsBbaG5I4ddkKgV/iEwWuXAx/Jid/VFlsrCi//5CfsCFu
         aASElFfTRJI+hIXO1uASEtUJJ+xUuYUxWMeEKPGoGDGbni065nojqjwzRb11k7bjF9Ab
         a2fsWOxEiemX0WN8auAnjYEtaAMBC4KNkA4Z9qS3fAPJCanYldj2VCni38+ux4H264oC
         YGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hQjgBHGvmm6cLhWASKb+Bb7AwJCJUdb2bnFuCs7Jtms=;
        b=l6RS92fszOJnn5oSt+s/1rzI7Mm/nAm1tu0fODLFex5t8VvKBs0YeVgCp9te/ogbNK
         Wc2cGpSAVT+KMPCo8ZFP9/EViqqRt9O5gxOqF44MvifYB4nPj2C+CphB8/OUYsiNgKtQ
         TxrjPqzT9TmGny7d0UBI4Rz6QhxPtMULHvfOiVy6AI+LBKwVgdO7DvRPAQlCqmzYPQiH
         fqUqmXGLyHlaH1gSLioIPnO9x6aB+/CrOFcUnx8MTwIZNyUqCVsjxA8UVaxy8xAixhMW
         KRQlpC4g0tdInDBUUikAT26ykRsuPPlS6dmht38Aq6TkdUUhKQt0NbyKddJ6hPQ20A2Y
         5pAg==
X-Gm-Message-State: APjAAAWRzeDY0DBYQmusTyfeUegljZetPlB6r50zs4a2jz2GuWvC/oEp
        wNqVd5vIzUxtGk7VAE7n7ZpKyT2bLRKlko8JnrBakw==
X-Google-Smtp-Source: APXvYqzc8tR+1Eei1+UeBt7tujh4w17l1GmAOgfTaJEUhSU/o2sU9X3F/1/mpAjyhMhQh1pRjBZvA67ly+YggunTZ0g=
X-Received: by 2002:a63:3006:: with SMTP id w6mr2822471pgw.440.1567684589317;
 Thu, 05 Sep 2019 04:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000005ae9c058ee5245c@google.com>
In-Reply-To: <00000000000005ae9c058ee5245c@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 5 Sep 2019 13:56:18 +0200
Message-ID: <CAAeHK+zxTpfNE9cT4u-PCQv6pgX=z4MXsbBM9h3iFG6Bf0_qXQ@mail.gmail.com>
Subject: Re: WARNING in mxl111sf_ctrl_msg
To:     syzbot <syzbot+48eb85867b8a4c16adf0@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 30, 2019 at 2:28 PM syzbot
<syzbot+48eb85867b8a4c16adf0@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=11a7957c600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> dashboard link: https://syzkaller.appspot.com/bug?extid=48eb85867b8a4c16adf0
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ac50f8600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1718c75c600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+48eb85867b8a4c16adf0@syzkaller.appspotmail.com
>
> usb 1-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the
> software demuxer
> dvbdev: DVB: registering new adapter (Hauppauge 126xxx ATSC+)
> usb 1-1: media controller created
> dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> usb 1-1: selecting invalid altsetting 1
> set interface failed
> ------------[ cut here ]------------
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:912 __mutex_lock_common
> kernel/locking/mutex.c:912 [inline]
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:912
> __mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #23
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   panic+0x2a3/0x6da kernel/panic.c:219
>   __warn.cold+0x20/0x4a kernel/panic.c:576
>   report_bug+0x262/0x2a0 lib/bug.c:186
>   fixup_bug arch/x86/kernel/traps.c:179 [inline]
>   fixup_bug arch/x86/kernel/traps.c:174 [inline]
>   do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
>   do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
>   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
> RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:912 [inline]
> RIP: 0010:__mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
> Code: d2 0f 85 f6 05 00 00 44 8b 05 bb 99 0a 02 45 85 c0 0f 85 0a f4 ff ff
> 48 c7 c6 00 87 a6 85 48 c7 c7 a0 84 a6 85 e8 f4 24 b8 fb <0f> 0b e9 f0 f3
> ff ff 65 48 8b 1c 25 00 ef 01 00 be 08 00 00 00 48
> RSP: 0018:ffff8881da206f40 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff812830fd RDI: ffffed103b440dda
> RBP: ffff8881da2070b0 R08: ffff8881da1f1800 R09: fffffbfff0d5eb25
> R10: fffffbfff0d5eb24 R11: ffffffff86af5923 R12: 0000000000000000
> R13: dffffc0000000000 R14: ffff8881d2ee6ec8 R15: ffff8881d2ee6ec8
>   mxl111sf_ctrl_msg+0xb8/0x210 drivers/media/usb/dvb-usb-v2/mxl111sf.c:66
>   mxl111sf_write_reg+0x8b/0x120 drivers/media/usb/dvb-usb-v2/mxl111sf.c:123
>   mxl1x1sf_soft_reset+0x6b/0x190
> drivers/media/usb/dvb-usb-v2/mxl111sf-phy.c:47
>   mxl111sf_lgdt3305_frontend_attach.constprop.0+0x23e/0x790
> drivers/media/usb/dvb-usb-v2/mxl111sf.c:447
>   mxl111sf_frontend_attach_atsc_mh+0x13/0x70
> drivers/media/usb/dvb-usb-v2/mxl111sf.c:984
>   dvb_usbv2_adapter_frontend_init
> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:641 [inline]
>   dvb_usbv2_adapter_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:804
> [inline]
>   dvb_usbv2_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:865 [inline]
>   dvb_usbv2_probe.cold+0x1e04/0x2567
> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:980
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x650 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:882
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2114
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x650 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:882
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2114
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

Looks like the same issue as:
https://syzkaller.appspot.com/bug?id=d7240bc21ef4b00a01e5ac7a7e616bdb7da26104

#syz dup: INFO: trying to register non-static key in mxl111sf_ctrl_msg
