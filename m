Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816C44415B2
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 09:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhKAI6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 04:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhKAI6a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 04:58:30 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCC3C061714;
        Mon,  1 Nov 2021 01:55:57 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id j21so39111725edt.11;
        Mon, 01 Nov 2021 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9XsIezJvWX9t5s0gnSz6iv5/36zd6CZq37lxsqUAmoM=;
        b=WdylF9J7DSEXDkmeT6Kv8/usRrP+VvsjXw67CUtQhQEQ6PrTUd1qcKE5xovRHCbPCP
         BZ1tc9Ro4/pXzevInuH9lRi3IDyTl5WDQ/9Qc1Fp3oBkLhr5cxPvZW2LIZCpvapZtt2Q
         P7uxMCL9e7hR3BbnyTmPJOrML2bc+r3LyIaZ5XiLnTq88WHf3Li7IjiRzHB++tg96e2A
         TQg4Qi2Q8KBLCfW5wOowoC0/FcqeCyqKu/5Sk9RaqqL4hMFL8EJWWzkMk1rRMTvqEtzR
         OshvAlwBLJ9pemF46qAKxuiKHS/IMh8EdMQGOTj/QisacMmUUQH9GjrFNSCjG1M1PGhB
         NuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9XsIezJvWX9t5s0gnSz6iv5/36zd6CZq37lxsqUAmoM=;
        b=nVjDLzOKQTdVljzXLRVruQjQlsCcJ5BEOTWD17ZF15E2I3xnQmLgDSVOo21iO6Db9C
         TuxzBEN+g/PU/6jBk/OE+tR12jkyE/hrJkLTYwNQ+wvoq8Kh/b+i23gqwtpK8g1sjjPS
         mILpwheaii7z0PjPz06mNePyj5tqIJgrcqMNcaHmWZnKuQczjKIrOWFxn4gm2WB1MrHG
         5SMhy/LTTGe4kFhFq/yyH59Nln13A9kCyGDZ476dRY6FCHjVFAQXGUfhTsePFM7TjF/k
         TlSGtDVr3vMG+HeRAjma8XpL63tx8bCm5WzjUwSA5r0zqaUe0YYybBuF3UTr8bZMvzZr
         X6Qw==
X-Gm-Message-State: AOAM532v2yNRQPR4xZFCiP0vxpSxbMIMgCzML4hZ+0xcYSEC8nj6zCTx
        dVQUeMZUy3FgxuJz6YXNgDPPfqkr+MF2oB4DbLI=
X-Google-Smtp-Source: ABdhPJwTKEeyv3BfXyaog4ufLX39TwXT86/QDQZsnFgH3kEouVsmJKu0nFS89uh68tn7UNbgU/LOYqP3BULQih7MbXA=
X-Received: by 2002:a17:906:4b57:: with SMTP id j23mr13297132ejv.563.1635756956239;
 Mon, 01 Nov 2021 01:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
In-Reply-To: <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 1 Nov 2021 16:55:30 +0800
Message-ID: <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 1, 2021 at 3:50 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/1/21 06:02, Dongliang Mu wrote:
> > Hi all,
> >
> > My local syzkaller instance found one bug named "memory leak in
> > em28xx_init_dev" in 5.14-rc5. Kernel configuration and PoC file are
> > attached(I don't check if the latest kernel is vulnerable, but it
> > should be). The trace from memleak is as follows:
> >
> > backtrace:
> >      [<ffffffff842cc66d>] kmalloc include/linux/slab.h:591 [inline]
> >      [<ffffffff842cc66d>] kzalloc include/linux/slab.h:721 [inline]
> >      [<ffffffff842cc66d>] em28xx_media_device_init
> > drivers/media/usb/em28xx/em28xx-cards.c:3444 [inline]
> >      [<ffffffff842cc66d>] em28xx_init_dev.isra.0+0x366/0x9bf
> > drivers/media/usb/em28xx/em28xx-cards.c:3624
> >      [<ffffffff842cd1bd>] em28xx_usb_probe.cold+0x4f7/0xf95
> > drivers/media/usb/em28xx/em28xx-cards.c:3979
> >      [<ffffffff82bf0815>] usb_probe_interface+0x185/0x350
> > drivers/usb/core/driver.c:396
> >
>
>
> Looks like missing clean up on error handling path.
>
> ->probe()
>      em28xx_init_dev()
>        em28xx_media_device_init() <- dev->media_dev allocated
>        *error somewhere in em28xx_init_dev()*
>

Hi Pavel,

you're right. In some error handling code (em28xx_audio_setup fails),
em28xx_init_dev fails to deallocated the media_dev field.

>
> And then nothing unwinds em28xx_media_device_init() call, since
> disconnect won't be called in case of failure in ->probe()
>
>
> Just build tested, but, I guess, something like this should work.
>
>
>
> With regards,
> Pavel Skripkin
>
>
>
