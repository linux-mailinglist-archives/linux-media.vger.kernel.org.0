Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463562E8203
	for <lists+linux-media@lfdr.de>; Thu, 31 Dec 2020 21:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgLaUsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Dec 2020 15:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgLaUsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Dec 2020 15:48:18 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC60C061575
        for <linux-media@vger.kernel.org>; Thu, 31 Dec 2020 12:47:37 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id r5so19027647eda.12
        for <linux-media@vger.kernel.org>; Thu, 31 Dec 2020 12:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ze4fAniD8t8zL30FOVhogcZXST4Ja2pBwJkY3ZmBt1Y=;
        b=AYUdEx9gibeI2HiJgKOYaVzyQUR69pMwZqQQfl1wHDGFaq86jBwQTne8+OgsYdE0y6
         FWowS5/xMXlHD7KBrpA15AeQvNmL3VAO6HceiOo7jPJ0duDHHETYzUqbNN3VwTj5q/LJ
         KgI2Jbci2YAKEy/DfyAg+nvxHgQB+qOeXHtsr7L3hbqNxecwBZtJonWFvlEFQmIeYZJC
         B61cTg0L1LqBic3PbdLk9SmElvQz+47Nf30rHDWcFXY5lEztzpTGvoWaMUJcjRxFzTEF
         Njl4tGl+jOyILcImI2nOy6RnQHWBXL2n8F5wlCIxV8QLrb7lyDevwCz81fuYBMZWckTP
         qQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ze4fAniD8t8zL30FOVhogcZXST4Ja2pBwJkY3ZmBt1Y=;
        b=A83Yo2/wzRptj2aD7yOLs9g9TPvh9+V7bfQwF3BitgK2QsHm3ed7FIMitqrLYPMUj1
         ijZWTxuC4SrDUq+D/9Cyi1drbMh4Q+SYuGSIifIE93wckZbzV+GkuBRtugumlhF3atHK
         1/ZRjsdDSM1av0VzBPR2WOzEM5BmDaF3gysvkGhek5uISr29xnDpWlt+V3sqQgo4MBrY
         0PIFWKujbz+1+jRa7GxeKnbjFzUgGIx/gJFV98V6FsEnjmQHOXRXm9kjJsr91kWxOMz1
         Is/6l5tEZE0aRGPr/mcPvUQDO26w8mtaqmpMsxWz2Gmok152iyQfJJE3iL2LzFunwJ8R
         /hTw==
X-Gm-Message-State: AOAM5336XWD8jRI0TSSGI48hLvi4hrYQLFbAS+7Bjb7gkXGr+zIqgs6s
        2UOND/OAfjAHyCIdZHxRLdELHd/NZdIKJ8jYPRsrLQ==
X-Google-Smtp-Source: ABdhPJydbAIci8yM+sHmrJmZ9m80Y7Cxfjt7bCaSdSomgUXGCltBysRywVgNmIo3EptpSamtr8bEqy4bU4R0eNt28Ug=
X-Received: by 2002:a50:d484:: with SMTP id s4mr56473916edi.13.1609447656475;
 Thu, 31 Dec 2020 12:47:36 -0800 (PST)
MIME-Version: 1.0
References: <0000000000006b86be05b7234cc1@google.com>
In-Reply-To: <0000000000006b86be05b7234cc1@google.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 31 Dec 2020 17:47:20 -0300
Message-ID: <CAAEAJfADBQpyfgBjWtnnF-y0g_jRryrcHQd_J-123KxSrid5=Q@mail.gmail.com>
Subject: Re: memory leak in zr364xx_probe
To:     syzbot <syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        royale@zerezo.com, syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's see if this works:

#syz test: https://gitlab.collabora.com/linux/0day.git
a1714d224e516b579d09cc1b4c3d85042e42f14c

On Wed, 23 Dec 2020 at 12:27, syzbot
<syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    3644e2d2 mm/filemap: fix infinite loop in generic_file_buf..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16f80eff500000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=37c889fb8b2761af
> dashboard link: https://syzkaller.appspot.com/bug?extid=b4d54814b339b5c6bbd4
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1089df07500000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1671c77f500000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
>
> BUG: memory leak
> unreferenced object 0xffffc90000e71000 (size 200704):
>   comm "kworker/0:2", pid 3653, jiffies 4294942426 (age 13.820s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<00000000110a155e>] __vmalloc_node_range+0x3a5/0x410 mm/vmalloc.c:2585
>     [<000000008a1ee970>] __vmalloc_node mm/vmalloc.c:2617 [inline]
>     [<000000008a1ee970>] vmalloc+0x49/0x50 mm/vmalloc.c:2650
>     [<00000000a6a3abfa>] zr364xx_board_init drivers/media/usb/zr364xx/zr364xx.c:1348 [inline]
>     [<00000000a6a3abfa>] zr364xx_probe+0x60b/0x833 drivers/media/usb/zr364xx/zr364xx.c:1509
>     [<0000000014a572f5>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
>     [<00000000f30ee977>] really_probe+0x159/0x480 drivers/base/dd.c:561
>     [<00000000ddb29374>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
>     [<0000000073c89cb9>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
>     [<000000009f56a99c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
>     [<00000000848d591a>] __device_attach+0x122/0x250 drivers/base/dd.c:919
>     [<00000000168be5bb>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
>     [<00000000464f40a6>] device_add+0x5be/0xc30 drivers/base/core.c:3091
>     [<000000008c75a2b5>] usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
>     [<00000000071d14a5>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
>     [<00000000f325b973>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
>     [<00000000f30ee977>] really_probe+0x159/0x480 drivers/base/dd.c:561
>     [<00000000ddb29374>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches
