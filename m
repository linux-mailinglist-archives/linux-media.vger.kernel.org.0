Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 095BF34221
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfFDIsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:48:11 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37416 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfFDIsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:48:11 -0400
Received: by mail-oi1-f193.google.com with SMTP id i4so14584319oih.4;
        Tue, 04 Jun 2019 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60qtclcriTCJgyXNXG6GAHptvalrj045wqbp5raOPsY=;
        b=mj6yspFwb5/Uk1RdZR2Nb55kpf6PrEJEZexMkPf0vRPdYtJG21fSUvXcbKaWSn5BnE
         g1GmMVtMbe04MGpHqjfiqbme2uBLUCR9PrxOMP32oJxo6Gp5JcEfEp5j4O/58pc30HNT
         kGHTjjXlq77Z2VX6J1IHESZq0zTi/EBfOU+rq6fXJ0ltHWtIjEzbEP4/s/hSaRQxjxL+
         5H23nW9cdyXiV5/AjlZ+PezgzFzz+p6XC+DSWrcQFhAlsbJ9flbkfvim8nDLd0wGa6gb
         OwK9pGelxhhC0r+Q25Dy44KQcExaQwYcMYCF7bclGlChLRmGcCvSjTZndvCTfRRGocbr
         ge4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60qtclcriTCJgyXNXG6GAHptvalrj045wqbp5raOPsY=;
        b=h6lu1twhyhj4hWDVzFrsNg675Je4IkLtNCOezbPZoF4/j2x9vTzB+kIzRqIRjXi9Il
         Icc+rVT0H0XYLbSW+Negb2wWWQpLPzgxRsvCQH4rJW0DxUBIZQC34XZfbN21P99rFmIi
         7V06dBaOudX+ONAB+mhAUI0MTLMSZHyPwR6Eq8KrEPihBsHqjfKKo2fppE40O7PP1f22
         Voqe2TkKQJbFD9/rlzhJJWaqvmO41itpb7APR/Fc+v0np8MHF7zPjz/xeOfdyPlxHGYZ
         lbSMRygoHHbhjdE8/6MJULpxbKoUTPzkFcSgQ1Fqg7kg0DtquHQUJ6jdBZ+IWPKZucJQ
         cfNg==
X-Gm-Message-State: APjAAAVW91wGmGiXGO0TIGj+zypSVCJfnnKwJgOlYsx+qqQkCynd7fSv
        gJOiR7V5Xx90Kskxq/r7RogrECxGV634T2gYx4MRCM+Aht8=
X-Google-Smtp-Source: APXvYqyzoGigvQXxoqbv87+ErAoH9ENdhaGEpKzaEDLH4SzhJUyMCFwzBUzlVZGuR7TLwin2L6Z+FX6VFiLvcPsUeRw=
X-Received: by 2002:aca:b606:: with SMTP id g6mr1666340oif.101.1559638090383;
 Tue, 04 Jun 2019 01:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <1559634617-16264-1-git-send-email-92siuyang@gmail.com>
 <CA+V-a8sBe53iZASaT+uJH0kMvJKNJOHYJLbTfEF+9FOVz3H=Rg@mail.gmail.com> <CAKgHYH2VN0NvEi=kStJPVSgenabnM6GpAGHYZa9YXz+o36GRKg@mail.gmail.com>
In-Reply-To: <CAKgHYH2VN0NvEi=kStJPVSgenabnM6GpAGHYZa9YXz+o36GRKg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 4 Jun 2019 09:47:44 +0100
Message-ID: <CA+V-a8u6068HOEkrZizB6+bzbDdZyS=UQ0bA6OBch3_17j_GQQ@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix memory leak in vpif_probe()
To:     Yang Xiao <92siuyang@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cheers,
--Prabhakar Lad

On Tue, Jun 4, 2019 at 9:34 AM Yang Xiao <92siuyang@gmail.com> wrote:
>
> On Tue, Jun 4, 2019 at 4:15 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Young,
> >
> > Thanks for the patch.
> >
> > On Tue, Jun 4, 2019 at 8:49 AM Young Xiao <92siuyang@gmail.com> wrote:
> > >
> > > If vpif_probe() fails on v4l2_device_register() and vpif_probe_complete(),
> > > then memory allocated at initialize_vpif() for global vpif_obj.dev[i]
> > > become unreleased.
> > >
> > > The patch adds deallocation of vpif_obj.dev[i] on the error path.
> > >
> > > Signed-off-by: Young Xiao <92siuyang@gmail.com>
> > > ---
> > >  drivers/media/platform/davinci/vpif_capture.c | 19 ++++++++++++++++---
> > >  1 file changed, 16 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> > > index b5aacb0..277d500 100644
> > > --- a/drivers/media/platform/davinci/vpif_capture.c
> > > +++ b/drivers/media/platform/davinci/vpif_capture.c
> > > @@ -1385,6 +1385,14 @@ static int initialize_vpif(void)
> > >         return err;
> > >  }
> > >
> > > +static void free_vpif_objs(void)
> > > +{
> > function could be made inline.
> >
> > > +       int i;
> > > +
> > > +       for (i = 0; i < VPIF_DISPLAY_MAX_DEVICES; i++)
> >
> > VPIF_DISPLAY_MAX_DEVICES ? this should be  VPIF_CAPTURE_MAX_DEVICES
> >
> > > +               kfree(vpif_obj.dev[i]);
> > > +}
> > > +
> > >  static int vpif_async_bound(struct v4l2_async_notifier *notifier,
> > >                             struct v4l2_subdev *subdev,
> > >                             struct v4l2_async_subdev *asd)
> > > @@ -1654,7 +1662,7 @@ static __init int vpif_probe(struct platform_device *pdev)
> > >         err = v4l2_device_register(vpif_dev, &vpif_obj.v4l2_dev);
> > >         if (err) {
> > >                 v4l2_err(vpif_dev->driver, "Error registering v4l2 device\n");
> > > -               goto cleanup;
> > > +               goto vpif_free;
> > >         }
> > >
> > >         while ((res = platform_get_resource(pdev, IORESOURCE_IRQ, res_idx))) {
> > > @@ -1701,7 +1709,10 @@ static __init int vpif_probe(struct platform_device *pdev)
> > >                                   "registered sub device %s\n",
> > >                                    subdevdata->name);
> > >                 }
> > > -               vpif_probe_complete();
> > > +               err = vpif_probe_complete();
> > > +               if (err) {
> > > +                       goto probe_subdev_out;
> > > +               }
> >
> > No need for { and } as per kernel coding style.
>
> Sorry, I can not get your point here.
> There is no need to check the return value of vpif_probe_complete(), isn't it?
> So, we just fix the memory leak in the error path of v4l2_device_register()?
>
Not sure if you got my statement here, it means do not add {} braces
around the if statement,
so for example the code should look like something below (refer the
link [1] for more reading)

 err = vpif_probe_complete();
 if (err)
    goto probe_subdev_out;


[1] https://www.kernel.org/doc/html/v4.10/process/coding-style.html#placing-braces-and-spaces

Cheers,
--Prabhakar Lad
