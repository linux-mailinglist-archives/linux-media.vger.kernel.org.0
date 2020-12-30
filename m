Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1708F2E7C90
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 22:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgL3VLw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 16:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgL3VLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 16:11:52 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B6DC061573;
        Wed, 30 Dec 2020 13:11:11 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id n3so2380327pjm.1;
        Wed, 30 Dec 2020 13:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dITDeAVQqbAJC+bViLCMOybM8JFelzh7y6oxhCI9HYA=;
        b=Ra6bva28fCC9ooJd54OAky+E7F51npHfpcaDui02PzOtNGhWDU9olHVS2KvfRhi4fm
         +e//bNd6IVqRP+H6x23Shgl113PGg/GNryhDXFRXO/S812Zgp5renFoqmM6TR90DQwqy
         67K6XwZn5Cy/HqilpyKwITSshsJqk13+H8v5gIaOBFejyWaBnSBb9keOtEfKFwSvystO
         1GvmdizDpiEDr2Qr8PEXbwO5+7MAjMVwr+g2Krq7baK2VX9hAhUeY7mGSt7ZXY89K5Bg
         WCT3oNOfWc8wU7JWQ1miyUap8GfXfj9646Jhgzj//iWxoe1HWd3jcz6/loPcx/BYsWn2
         LTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dITDeAVQqbAJC+bViLCMOybM8JFelzh7y6oxhCI9HYA=;
        b=Eh0G2ggYVQcf0JNqKT0AQtOaTmjB+REVCbiTy/UKeRYJes/7I/L2LSKc3SK6ztg2rG
         z9jcvDP3iP8KiByDQr+Es7/seZDFImgm67jiS8mkyIgye2cl6/cUKeCSKU/2Q8yF83sj
         jA7RK2aq3w3irP46f6Pn6pGDKE2VlRRfun/tLgUPdmbYNJ+XIV5RdwH1kmsW/vJmfz+7
         L3xti6nf3ivEg2+mCsCZUtWQoytXUou/7VR0vg7hDlyjz6pSCMmWjNc0qC6IrRJT2ury
         Iq32LpcN79cgqMb2uWUGi22SF6Ps1HCCe4wBrxZO7AW9xAQQbrVeu6WWiou6N2VBN0n3
         mgmA==
X-Gm-Message-State: AOAM531vm+wj8mApMPvIvntPso9ByUuCLnwMTr8IvPhbckx+AJsjPXAt
        56Y+hMvxqKOU79wN5I5/aktkzAT4Dl4Add5PZFPqyfENZvRCBfsj
X-Google-Smtp-Source: ABdhPJzEoyPB3YY+jMlHGQAwpHQ0WotZQRpB+D5w/pwyOM+XP8zJh/ZFClZrT8l0lWb1HNHyvvMw3/TCpVGgKC1opkM=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr10432508pjd.181.1609362668453;
 Wed, 30 Dec 2020 13:11:08 -0800 (PST)
MIME-Version: 1.0
References: <0000000000006b86be05b7234cc1@google.com>
In-Reply-To: <0000000000006b86be05b7234cc1@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Dec 2020 23:10:51 +0200
Message-ID: <CAHp75VeudJO5Y0Zmv1rgWSJxPojG8-YW07R=i+f129di9oAspw@mail.gmail.com>
Subject: Re: memory leak in zr364xx_probe
To:     syzbot <syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        royale@zerezo.com, syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 23, 2020 at 5:26 PM syzbot
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

If I am not mistaken the following should work and fix the issue (can
somebody in syzcaller test below patch, sorry it may be mangled?):

--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -1533,9 +1533,7 @@ static int zr364xx_probe(struct usb_interface *intf,
        return 0;

 fail:
-       v4l2_ctrl_handler_free(hdl);
-       v4l2_device_unregister(&cam->v4l2_dev);
-       kfree(cam);
+       v4l2_device_put(&cam->v4l2_dev);
        return err;
 }

-- 
With Best Regards,
Andy Shevchenko
