Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3691371B8
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 16:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgAJPus (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 10:50:48 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40955 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgAJPus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 10:50:48 -0500
Received: by mail-pj1-f67.google.com with SMTP id bg7so1157760pjb.5
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2020 07:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FKmyaQb3K8/JWPnwt6kYl9qKMdt9SBc733vonAR7tFE=;
        b=RqfxTTvwgqQF6Gky5lrnl9iAb1hGlF2lKuylrlrF1uBw0C0dh06KiHIaqm4fGIqrJx
         tv94wN6fY4INBusRdXAPcXTYRdLHvWY7SmYjmrOCe45RdhjiOkutZFdtaxeGEoTw+hRP
         5XBZFw71sYM4rKv4iIgbuW+vEpWjvqLlvElJkNvx9Bnq3E4R6QycOIZF0t3fSxEWPw6M
         ShAKKXIP9QiIAOXRe29Wm8wcL0jB/Bhaip4BhFn2Z7/qxQyJ0IvvEGoeAeri1lDDhYUd
         LNDaw2u61lhb2b6ka2S+v2hARM74+MXZTRHnTRXy0wZ959cUiTnPpYYY6vg6aQU57D3O
         KwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FKmyaQb3K8/JWPnwt6kYl9qKMdt9SBc733vonAR7tFE=;
        b=ojDkTcHNmIL/RLRtp1wjyk6n/IwPEIo8PZjyj3Bfwd4xLXUzAEE3aOB/nBxCzr/6GW
         e5RhGDMtlw0sqN/Y/lyXMowY4NOn5/+KnyoHi8IjmNVEDnf+ws9zoC1lQhcLxvhBKUuT
         NIE3zVbEQRS6K6myIXnki81uX/qOHLgVnNziFRNFy6n8m1jGPOSoOllWHx69x7JAr1Rl
         b5jtE2MEd7DuE/ItK5AR/NVlGllW+u+o2j7iXuq4x4sfqzyI0BTWqE64c4paL495ifw6
         CnRSRBjp9hraY8tbYKCbHfO5iB6xLnWsC0mEIdmFcdQmq/X/2/ZBMiLUcYjW+9GUry1O
         /QCg==
X-Gm-Message-State: APjAAAWb6pdDLDIo1kAChm7MCFFox6VWQvYhZ4oGrhdVCIGMmoEXxkwo
        BHWjV+zi5QDkKq/9tzFqiLSKeo7zcmifjZS34G+19A==
X-Google-Smtp-Source: APXvYqwyPcmcag9iDNC7OxgRf3FSEsbxkjeru2bYQwCaOqz3htptTgv/Ap+iQ7/EjT4U3xyiUTvG08rEMhAyjd9ftac=
X-Received: by 2002:a17:90a:300b:: with SMTP id g11mr5523754pjb.123.1578671447363;
 Fri, 10 Jan 2020 07:50:47 -0800 (PST)
MIME-Version: 1.0
References: <000000000000617449059bcadbd1@google.com>
In-Reply-To: <000000000000617449059bcadbd1@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 10 Jan 2020 16:50:36 +0100
Message-ID: <CAAeHK+xFWszE3aTuXC7qq1t1JdN8EygnwgG8HrBB2wv5x=zQ7w@mail.gmail.com>
Subject: Re: BUG: corrupted list in uvc_scan_chain_forward
To:     syzbot <syzbot+636c17630dbe1250025a@syzkaller.appspotmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 10, 2020 at 4:34 PM syzbot
<syzbot+636c17630dbe1250025a@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    ae179410 usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=168765c6e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4b345df402514029
> dashboard link: https://syzkaller.appspot.com/bug?extid=636c17630dbe1250025a
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b316aee00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13332d49e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+636c17630dbe1250025a@syzkaller.appspotmail.com
>
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: syz
> usb 1-1: Manufacturer: syz
> usb 1-1: SerialNumber: syz
> usb 1-1: config 0 descriptor??
> uvcvideo: Found UVC 0.00 device syz (18cd:cafe)
> list_add double add: new=ffff8881cdea0010, prev=ffff8881cdea0010,
> next=ffff8881d718f218.
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:29!
> invalid opcode: 0000 [#1] SMP KASAN
> CPU: 0 PID: 95 Comm: kworker/0:2 Not tainted 5.5.0-rc3-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:__list_add_valid.cold+0x26/0x3c lib/list_debug.c:29
> Code: 57 ff ff ff 4c 89 e1 48 c7 c7 c0 fa fb 85 e8 4b 20 40 ff 0f 0b 48 89
> f2 4c 89 e1 48 89 ee 48 c7 c7 00 fc fb 85 e8 34 20 40 ff <0f> 0b 48 89 f1
> 48 c7 c7 80 fb fb 85 4c 89 e6 e8 20 20 40 ff 0f 0b
> RSP: 0018:ffff8881d5d8f080 EFLAGS: 00010286
> RAX: 0000000000000058 RBX: ffff8881cdea0010 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff812959ad RDI: ffffed103abb1e02
> RBP: ffff8881cdea0010 R08: 0000000000000058 R09: fffffbfff1269aae
> R10: fffffbfff1269aad R11: ffffffff8934d56f R12: ffff8881d718f218
> R13: ffff8881cdea0000 R14: dffffc0000000000 R15: ffff8881d718f218
> FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f514c22d000 CR3: 00000001c6507000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   __list_add include/linux/list.h:60 [inline]
>   list_add_tail include/linux/list.h:93 [inline]
>   uvc_scan_chain_forward.isra.0+0x4df/0x637
> drivers/media/usb/uvc/uvc_driver.c:1526
>   uvc_scan_chain drivers/media/usb/uvc/uvc_driver.c:1640 [inline]
>   uvc_scan_device drivers/media/usb/uvc/uvc_driver.c:1824 [inline]
>   uvc_probe.cold+0x1aee/0x29de drivers/media/usb/uvc/uvc_driver.c:2197
>   usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
>   really_probe+0x290/0xad0 drivers/base/dd.c:548
>   driver_probe_device+0x223/0x350 drivers/base/dd.c:721
>   __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x390 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0x1459/0x1bf0 drivers/base/core.c:2487
>   usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
>   really_probe+0x290/0xad0 drivers/base/dd.c:548
>   driver_probe_device+0x223/0x350 drivers/base/dd.c:721
>   __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x390 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0x1459/0x1bf0 drivers/base/core.c:2487
>   usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2537
>   hub_port_connect drivers/usb/core/hub.c:5184 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
>   port_event drivers/usb/core/hub.c:5470 [inline]
>   hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5552
>   process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2410
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Modules linked in:
> ---[ end trace 8c363b461f6a7f0a ]---
> RIP: 0010:__list_add_valid.cold+0x26/0x3c lib/list_debug.c:29
> Code: 57 ff ff ff 4c 89 e1 48 c7 c7 c0 fa fb 85 e8 4b 20 40 ff 0f 0b 48 89
> f2 4c 89 e1 48 89 ee 48 c7 c7 00 fc fb 85 e8 34 20 40 ff <0f> 0b 48 89 f1
> 48 c7 c7 80 fb fb 85 4c 89 e6 e8 20 20 40 ff 0f 0b
> RSP: 0018:ffff8881d5d8f080 EFLAGS: 00010286
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

#syz dup: WARNING in uvc_scan_chain_forward
