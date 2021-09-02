Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B783FF806
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 01:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344217AbhIBXr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 19:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343725AbhIBXrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 19:47:23 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A283C061575;
        Thu,  2 Sep 2021 16:46:24 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ia27so8200376ejc.10;
        Thu, 02 Sep 2021 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUf+JWeZbHFab9pkUWeRbxdnVOJKI+sj2SLxpfTX21M=;
        b=eo0zYnqGWAEmfut+g12fbTjlB01IxOxtCd+UpVfFwRcxjjke+JOjQH17//XgwedXf9
         QXMXoBvCbYg0OihyGVvtj0oEsUjWrPsewLcURvuu4yoYGCAb+ahhORAn9OsZ5T99H59N
         oai8kgjoYrWxlPBg7doOZRZOLoNZpR/1ezn2pwVYKSUIXpmK7RS8YChvEPknxaNDYXN0
         x3K6Aa25iTrijwol68SnJm0VEVxfY9oIG6iHpx7qwloCKZcP7QnXjXKQciXOPBMVwnEN
         80Mi0mJlW/tZSCcaBr2ekQPROLUE0GAI1iG3iHGV9++vA7qxTd19vO/lSAl064Z3pbWX
         /muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uUf+JWeZbHFab9pkUWeRbxdnVOJKI+sj2SLxpfTX21M=;
        b=WYJOZYa5sAvKVwnlGP9cLBeCREi2j/wKg0Tzh1oMWDYozy+9cQi38hvljbN5T3ptPr
         WRcC3SGO0cUoXVOibgELwZym19eixPnuQV7+2dzqd0rv48AP+OSqqtJohdU/BMkOq/QI
         8se+RU7P4VT6vyiQ6vKA/vyC1tCtTbrIc8pBcOcCtTDhhTcxkSXw/HmxWKcO8IrLnHJF
         7EUx9mle2IgWTqq6Ym432+Lw0hKC8xUMWfMCZuNtbZelehWvZ3ZlAcK/AqcW9Wy1msyn
         PRP602ZqIXP3Kc8Ckpz7zP32TIDxhj2lwhdRHokseHS4oc+mhmmRKd9Jq1t6rNgCmNA7
         +ipw==
X-Gm-Message-State: AOAM532jJyhiC+81wWyyqrUNxj5Jc2v4qTAhyuablNURLxjlt+GLGvbn
        AkJQp62pv3aDiZRf/v64JaPCydLyrZwlmY2gJFQ=
X-Google-Smtp-Source: ABdhPJybZeCeGWrYHAOIPRAUlYAG9ZRq1QLjGCmXrCzBZoWnEikcFuxPh8qX3KW7jtTPGBftRcDxh5NCLCutKUYozBo=
X-Received: by 2002:a17:907:3393:: with SMTP id zj19mr762816ejb.535.1630626382997;
 Thu, 02 Sep 2021 16:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com> <20210902141745.GD2129@kadam>
In-Reply-To: <20210902141745.GD2129@kadam>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Fri, 3 Sep 2021 07:45:56 +0800
Message-ID: <CAD-N9QUD_H9R=gZyZ9YAx7h7bzNncGxZuivp=MKXmTtvDvXyAQ@mail.gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 2, 2021 at 10:18 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
> > On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > >
> > > On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > > >
> > > > stk_camera_probe mistakenly execute usb_get_intf and increase the
> > > > refcount of interface->dev.
> > > >
> > > > Fix this by removing the execution of usb_get_intf.
> > >
> > > Any idea about this patch?
> >
> > +cc Dan Carpenter, gregkh
> >
> > There is no reply in this thread in one month. Can someone give some
> > feedback on this patch?
> >
> > >
> > > >
> > > > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > > Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> > > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > > ---
> > > >  drivers/media/usb/stkwebcam/stk-webcam.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
> > > > index a45d464427c4..5bd8e85b9452 100644
> > > > --- a/drivers/media/usb/stkwebcam/stk-webcam.c
> > > > +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
> > > > @@ -1311,7 +1311,6 @@ static int stk_camera_probe(struct usb_interface *interface,
> > > >
> > > >         dev->udev = udev;
> > > >         dev->interface = interface;
> > > > -       usb_get_intf(interface);
>
>
> The patch is wrong.  We're storing a reference to "interface".
>
>         dev->interface = interface;
>
> So we need to boost the refcount of interface.  Pavel Skripkin was on
> the right patch but you need to add a:
>
>         usb_put_intf(interface);
>
> to the stk_camera_disconnect() function as you sort of mentioned.
> That's the correct fix.

Thanks for your explanation, Dan. It's really helpful.

I sent the inquiry email in this thread because I did not receive the
notification of patchwork to mark my patch as obsolete and did not
notice Pavel had sent one patch before.

Now, this patch is marked as obsolete. Let's ignore it now.

>
> regards,
> dan carpenter
