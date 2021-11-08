Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F09144782B
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 02:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbhKHBJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 20:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhKHBJR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 20:09:17 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DA6C061570;
        Sun,  7 Nov 2021 17:06:33 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id m14so55224118edd.0;
        Sun, 07 Nov 2021 17:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SxkLDbGHglFcMJ320qkunpCfzACuTzqWrBM19bfpkyY=;
        b=YqcEw6vjqvRz+P2iMseihLSK3l3NVSC+XL4D6FhJnHvYpHwMhYMNWNIi4UMAnzV/ka
         RkDhHEKEH4s78/4uRbXPZ7Omr8L3lO6XNRlOviKaXsAfDQ5BZOcpoMjjANUl4rSsE3Sc
         EFKjAt8c9urY7VO2wAoLAmBbYmZrSHqYJqGJ6OQO/YwPmVkR8YyHgCj+3X/lyzHMUaeS
         ONgZbK5Kjng1ngleg8AGb59SjlDBgfWuf/vgY8LgsiY+lkYV6uaMb5zAJtinDmvomXA/
         XZq48dS0qC42/5JDT6ztELK9ZBHRSym7seckEAewncWuZ8687bRev9WF6253C3Z7tz2L
         xVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SxkLDbGHglFcMJ320qkunpCfzACuTzqWrBM19bfpkyY=;
        b=ASk/WsLS9d3+ryULFg8KlSslxFEz6yHdaV7uE4EkqO3Fz8RGYeGzdXphkoB8FxTFyC
         6YTKElXcwUkYntDlEpILLYsziIRt6ukGewz6g7aJGhWR7kVGF79Kj1UbLWdyxxP+cDjU
         hNUlCvrv1DZ0wPPnpsv7l2emJvz32H+ctKSV0G3+IDMF5lQFm/kIGFVNZ5nEYRs9ths4
         JqpfFsJyZVntooyEEGjpzCMtzl7DgRteCuR7OVDlHYVtxhGv/vtKFpB7elWGLhodcB66
         jk/33gTRCynJvT35mGaRcQwd/hhYp962j68hkxQ2HV78dQCLZAAN7TFxy6RrF/BJbbPq
         YaZA==
X-Gm-Message-State: AOAM530rs6dW9/++XPwyHSONelrP3UvaG2MNBYyksn8qYHYxPYc8YdIx
        vPG0eIUOwIqWpOuUWp7yazTd3xAvFfrgRyJwaMGW75TIACcb52K+
X-Google-Smtp-Source: ABdhPJzGAJzzLaQa4ReJP2Ms5Y5t+tpJHHEhHpHwiNuwmjTfexkyXaUX8kD2IcG9VNNAR6+xL3nvYP8fm+5ilEh87AM=
X-Received: by 2002:a17:907:7f25:: with SMTP id qf37mr57503825ejc.147.1636333592008;
 Sun, 07 Nov 2021 17:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20211101095539.423246-1-mudongliangabcd@gmail.com>
 <20211101183249.GA28019@kili> <76e1264b-87d3-c7cb-c9d5-bcf461fbb2bf@gmail.com>
 <CAD-N9QVxOObXE-voToHxFTDyJtyZ0PjWg6JQ-rQB5dB2ivrjtA@mail.gmail.com> <20211102135054.GG2914@kadam>
In-Reply-To: <20211102135054.GG2914@kadam>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 8 Nov 2021 09:06:06 +0800
Message-ID: <CAD-N9QVbdoD0_akRbaHrZiW4bQqBx=Z=3PC2V8_VDfUNaRdupg@mail.gmail.com>
Subject: Re: [PATCH] media: em28xx: fix memory leak in em28xx_init_dev
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot <syzkaller@googlegroups.com>, linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 2, 2021 at 9:51 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Nov 02, 2021 at 02:31:26PM +0800, Dongliang Mu wrote:
> > On Tue, Nov 2, 2021 at 3:28 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
> > >
> > > On 11/1/21 21:32, Dan Carpenter wrote:
> > > > On Mon, Nov 01, 2021 at 05:55:39PM +0800, Dongliang Mu wrote:
> > > >> In the em28xx_init_rev, if em28xx_audio_setup fails, this function fails
> > > >> to deallocate the media_dev allocated in the em28xx_media_device_init.
> > > >>
> > > >> Fix this by adding em28xx_unregister_media_device to free media_dev.
> > > >>
> > > >> BTW, this patch is tested in my local syzkaller instance, and it can
> > > >> prevent the memory leak from occurring again.
> > > >>
> > > >> CC: Pavel Skripkin <paskripkin@gmail.com>
> > > >> Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
> > > >> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > >> Reported-by: syzbot <syzkaller@googlegroups.com>
> > > >
> > > > Is this really a syzbot warning?  If so it should be in the format:
> > > >
> > > > Reported-by: syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com
> > > >
> > > > Syzbot is different from syzkaller.  Syzkaller is the fuzzer and syzbot
> > > > is the program which reports syzkaller bugs.
> > > >
> > >
> > > Bug report is from his local instance. He just wants to give credit to
> > > syzbot for finding it
> >
> > Hi Dan,
> >
> > just as explained by Pavel, I leveraged the local syzkaller instance
> > to find this bug.
> >
> > I can modify it to "Reported-by: syzkaller
> > <syzkaller@googlegroups.com>", this one looks better.
> >
>
> No need for a Reported-by at all, but if you want to credit syzkaller
> that's an okay format.
>

Hi all,

do I need to send a v2 patch with a new Reported-by tag?

> > >
> > > >> ---
> > > >>  drivers/media/usb/em28xx/em28xx-cards.c | 19 +++++++++++++------
> > > >>  1 file changed, 13 insertions(+), 6 deletions(-)
> > > >>
> > > >> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> > > >> index c1e0dccb7408..fca68939ca50 100644
> > > >> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> > > >> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> > > >> @@ -3625,8 +3625,10 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
> > > >>
> > > >
> > > > There is no check to see if the em28xx_media_device_init() fails.  I
> > >
> > > I guess, it should work, since there a lot of checks to see if this
> > > pointer is valid, i.e driver can work even without this pointer, AFAIK
> > >
> > > > don't love that we call unregister() to undo the init() but it seems
> > > > like it should work...
> > >
> > > Same here, but it is out of scope of this patch :)
> >
> > >From the implementation, em28xx_media_device_init and
> > em28xx_unregister_media_device should not be a pair of functions
> > (do/undo).
> >
>
> That's how it is now, but it's not necessarily how it should be.  Anyway,
> it's unrelated to you patch.  Just forget I mentioned it.
>
> regards,
> dan carpenter
>
