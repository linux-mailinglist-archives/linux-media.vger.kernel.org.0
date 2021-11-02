Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A4C442723
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 07:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhKBGe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 02:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhKBGe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 02:34:28 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4071DC061714;
        Mon,  1 Nov 2021 23:31:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g10so71883134edj.1;
        Mon, 01 Nov 2021 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ktlQsEl/uXY5S8VgXswNGcdh6f3Clxg6BLcX0sqgXWw=;
        b=lifm3RZ+e6/2rJGOh87ById9wyCzQzBSyulLwGf09VbjfbKDFZl7bzyxHKJYOSacKM
         7hhZCgTG6Tlmux0dvqduVIDzIivRiHaOxnarj9yhMSsi4PQISCnreAAQWFDgwX2CkHTi
         If7bmVuWBClL6gOQbzhkyP/9x2iss0Ob5s0VVCDMOiAKUXQRYGQgGyjCdwmTiB1/mwif
         frHxqfZMR8SPSg1wBTOsU2muEAmS+5HGQyHWGZQ7L3y6EH26ycb/smViOdmJjdJxTT2j
         eBfr5FG+rIFkVwN0F/Ma9vBLh8mj3fPkl3vapvvGUrMe/x0DWtf2mghB1iOa+KR5IzfD
         zMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ktlQsEl/uXY5S8VgXswNGcdh6f3Clxg6BLcX0sqgXWw=;
        b=pN60mhgIUg4E2B472SPHbbr6XAC7D3efu+DESUoBXJfQ6fc9te2ycDC/2qiwsnO9qR
         7oEXiNSyFY93qEU/95nRLol8wUJQuDof89YByGENyqj7AbsiwBjxskylNPoO8QKp8MkZ
         0MoC2Lqi+gsKNsANbo17lsmpRkwhGj8l06mVen/VQhvzUhFR0PqtURGOLGl4PMbz6Q3V
         1mN0bWxQOKjDQKLp4zEZUGg4S8DYmkEQWVpnLHSNtR8fyu8kqCyqkFZIR+1WWtSrhyB4
         pCj2BkDSyKiSezpyHgJELkQvUlq8idrBb9mP49kvh3onarO7fpn6ufbU9OD89fRU0yza
         kIig==
X-Gm-Message-State: AOAM531vZKKCGqyikvmn+s1PqX22mBzy/7fth+Z2Ai7Y+70UIX4FkO4N
        1lC5a/Rv6dZjjF7t/YXvJIXPj48pCeod8UT6TIg=
X-Google-Smtp-Source: ABdhPJxH2JkCGZaufzHmykN94qQoVDIMzYWgfxPFoH6GKjilHtL/0bgAUpQoQnkljvUfxyHoKLyXz1lTlctCIXu6Ow0=
X-Received: by 2002:a50:c909:: with SMTP id o9mr47545850edh.122.1635834712767;
 Mon, 01 Nov 2021 23:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211101095539.423246-1-mudongliangabcd@gmail.com>
 <20211101183249.GA28019@kili> <76e1264b-87d3-c7cb-c9d5-bcf461fbb2bf@gmail.com>
In-Reply-To: <76e1264b-87d3-c7cb-c9d5-bcf461fbb2bf@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Tue, 2 Nov 2021 14:31:26 +0800
Message-ID: <CAD-N9QVxOObXE-voToHxFTDyJtyZ0PjWg6JQ-rQB5dB2ivrjtA@mail.gmail.com>
Subject: Re: [PATCH] media: em28xx: fix memory leak in em28xx_init_dev
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot <syzkaller@googlegroups.com>, linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 2, 2021 at 3:28 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/1/21 21:32, Dan Carpenter wrote:
> > On Mon, Nov 01, 2021 at 05:55:39PM +0800, Dongliang Mu wrote:
> >> In the em28xx_init_rev, if em28xx_audio_setup fails, this function fails
> >> to deallocate the media_dev allocated in the em28xx_media_device_init.
> >>
> >> Fix this by adding em28xx_unregister_media_device to free media_dev.
> >>
> >> BTW, this patch is tested in my local syzkaller instance, and it can
> >> prevent the memory leak from occurring again.
> >>
> >> CC: Pavel Skripkin <paskripkin@gmail.com>
> >> Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
> >> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >> Reported-by: syzbot <syzkaller@googlegroups.com>
> >
> > Is this really a syzbot warning?  If so it should be in the format:
> >
> > Reported-by: syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com
> >
> > Syzbot is different from syzkaller.  Syzkaller is the fuzzer and syzbot
> > is the program which reports syzkaller bugs.
> >
>
> Bug report is from his local instance. He just wants to give credit to
> syzbot for finding it

Hi Dan,

just as explained by Pavel, I leveraged the local syzkaller instance
to find this bug.

I can modify it to "Reported-by: syzkaller
<syzkaller@googlegroups.com>", this one looks better.

>
> >> ---
> >>  drivers/media/usb/em28xx/em28xx-cards.c | 19 +++++++++++++------
> >>  1 file changed, 13 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> >> index c1e0dccb7408..fca68939ca50 100644
> >> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> >> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> >> @@ -3625,8 +3625,10 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
> >>
> >
> > There is no check to see if the em28xx_media_device_init() fails.  I
>
> I guess, it should work, since there a lot of checks to see if this
> pointer is valid, i.e driver can work even without this pointer, AFAIK
>
> > don't love that we call unregister() to undo the init() but it seems
> > like it should work...
>
> Same here, but it is out of scope of this patch :)

From the implementation, em28xx_media_device_init and
em28xx_unregister_media_device should not be a pair of functions
(do/undo).

Maybe I can write em28xx_free_media_device to be paired with
em28xx_media_device_init, like below. And then only call it from the
error handling context.

static void em28xx_free_media_device(struct em28xx *dev)
{
#ifdef CONFIG_MEDIA_CONTROLLER
                kfree(dev->media_dev);
                dev->media_dev = NULL;
#endif
}

>
>
>
> With regards,
> Pavel Skripkin
