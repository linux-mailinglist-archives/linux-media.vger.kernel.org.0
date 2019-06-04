Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8692341E8
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbfFDIe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:34:29 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:32904 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfFDIe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:34:28 -0400
Received: by mail-vs1-f65.google.com with SMTP id m8so3897816vsj.0;
        Tue, 04 Jun 2019 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJ45MV+BASoppHJ2PxusDyNNyvOx4jaha4ViGHy9S30=;
        b=sLtbsS60jUXae/oFGfWV5MmP+uLUlWMKyghbv0ZpgLYhhcUvwUlavdh+GkBAu9OyFd
         w531oCcELQZlq3aHLYJB/rhKJgZCj407l70vI7ifKd74N3+oXzdYrz6vb8aqoLkhCbNC
         /AfkFJhC0C3Xh0YAGO3cx0qqOdJrz0L4m7TgZTEy746aAlEEiqWxrSQLSN9WoaKtI47J
         Bb/Bv+AGzf5uhMnP8jC68uLnhmHVH1jxY/HfOi95NzWSVFDldifZ+RvXwb3l8EWH0t+s
         SQ1rKdS4VwvbbcXgeT4ihZoJrvoFDH3X4uwgkr840QSjXfcHtc2CsYfNLDdtyNLFGtnY
         GycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJ45MV+BASoppHJ2PxusDyNNyvOx4jaha4ViGHy9S30=;
        b=SL70RGi2sdC/DBVaLn/GuGHhV0dSTf0nqYszxPGWMbYPjMO9tpvuZw1FolKmpRqlBq
         pOUrnpUseHBv/jao42vNpy1+/FgwsoZVamiQRe6WxuUoPHwP6pDDuVsmNINDCq5RmZPy
         Uu4ujyHH2LPKHVkNJIWsALJTdnBGt6HmTJBw7O6KG4dn5/5Wj6Pw/1ckC1Z4WrYAnOl3
         LfVYQchGHl38bF/vov76TeAOBMFiF2flkbNfNIrAAPSSirBAfD8qTiCAq7oMpQGDgevO
         OV3ne0pOSEyeZUVU2fSL79jEpTBsxeItuVrWjhbeOPtlF+IQULk/yJpwJtV+kGrqbwKa
         MHHw==
X-Gm-Message-State: APjAAAWObiXSbCHdhtWVBUCsGfNY+uU01ZoUH+iCxNsx6W+LPtTmSJnL
        OPteFI8XiMrcOkSqPFEFZtmXwT7pwMkalxpneVQ=
X-Google-Smtp-Source: APXvYqz11SlOdEtHhoNRCSHJLqv23rahUXYBd5IOv93Ntslow05io8QmeQVMzPhAbaOGAQnXwb1kUhx4m3YGFtzHfyI=
X-Received: by 2002:a67:c295:: with SMTP id k21mr92148vsj.140.1559637267073;
 Tue, 04 Jun 2019 01:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <1559634617-16264-1-git-send-email-92siuyang@gmail.com> <CA+V-a8sBe53iZASaT+uJH0kMvJKNJOHYJLbTfEF+9FOVz3H=Rg@mail.gmail.com>
In-Reply-To: <CA+V-a8sBe53iZASaT+uJH0kMvJKNJOHYJLbTfEF+9FOVz3H=Rg@mail.gmail.com>
From:   Yang Xiao <92siuyang@gmail.com>
Date:   Tue, 4 Jun 2019 16:33:46 +0800
Message-ID: <CAKgHYH2VN0NvEi=kStJPVSgenabnM6GpAGHYZa9YXz+o36GRKg@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix memory leak in vpif_probe()
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 4, 2019 at 4:15 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Young,
>
> Thanks for the patch.
>
> On Tue, Jun 4, 2019 at 8:49 AM Young Xiao <92siuyang@gmail.com> wrote:
> >
> > If vpif_probe() fails on v4l2_device_register() and vpif_probe_complete(),
> > then memory allocated at initialize_vpif() for global vpif_obj.dev[i]
> > become unreleased.
> >
> > The patch adds deallocation of vpif_obj.dev[i] on the error path.
> >
> > Signed-off-by: Young Xiao <92siuyang@gmail.com>
> > ---
> >  drivers/media/platform/davinci/vpif_capture.c | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> > index b5aacb0..277d500 100644
> > --- a/drivers/media/platform/davinci/vpif_capture.c
> > +++ b/drivers/media/platform/davinci/vpif_capture.c
> > @@ -1385,6 +1385,14 @@ static int initialize_vpif(void)
> >         return err;
> >  }
> >
> > +static void free_vpif_objs(void)
> > +{
> function could be made inline.
>
> > +       int i;
> > +
> > +       for (i = 0; i < VPIF_DISPLAY_MAX_DEVICES; i++)
>
> VPIF_DISPLAY_MAX_DEVICES ? this should be  VPIF_CAPTURE_MAX_DEVICES
>
> > +               kfree(vpif_obj.dev[i]);
> > +}
> > +
> >  static int vpif_async_bound(struct v4l2_async_notifier *notifier,
> >                             struct v4l2_subdev *subdev,
> >                             struct v4l2_async_subdev *asd)
> > @@ -1654,7 +1662,7 @@ static __init int vpif_probe(struct platform_device *pdev)
> >         err = v4l2_device_register(vpif_dev, &vpif_obj.v4l2_dev);
> >         if (err) {
> >                 v4l2_err(vpif_dev->driver, "Error registering v4l2 device\n");
> > -               goto cleanup;
> > +               goto vpif_free;
> >         }
> >
> >         while ((res = platform_get_resource(pdev, IORESOURCE_IRQ, res_idx))) {
> > @@ -1701,7 +1709,10 @@ static __init int vpif_probe(struct platform_device *pdev)
> >                                   "registered sub device %s\n",
> >                                    subdevdata->name);
> >                 }
> > -               vpif_probe_complete();
> > +               err = vpif_probe_complete();
> > +               if (err) {
> > +                       goto probe_subdev_out;
> > +               }
>
> No need for { and } as per kernel coding style.

Sorry, I can not get your point here.
There is no need to check the return value of vpif_probe_complete(), isn't it?
So, we just fix the memory leak in the error path of v4l2_device_register()?

>
> >         } else {
> >                 vpif_obj.notifier.ops = &vpif_async_ops;
> >                 err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
> > @@ -1720,6 +1731,8 @@ static __init int vpif_probe(struct platform_device *pdev)
> >         kfree(vpif_obj.sd);
> >  vpif_unregister:
> >         v4l2_device_unregister(&vpif_obj.v4l2_dev);
> > +vpif_free:
> > +       free_vpif_objs();
> >  cleanup:
> >         v4l2_async_notifier_cleanup(&vpif_obj.notifier);
> >
> > @@ -1748,8 +1761,8 @@ static int vpif_remove(struct platform_device *device)
> >                 ch = vpif_obj.dev[i];
> >                 /* Unregister video device */
> >                 video_unregister_device(&ch->video_dev);
> > -               kfree(vpif_obj.dev[i]);
> >         }
> > +       free_vpif_objs();
>
> no need for this change, leave it as it is.
>
> Cheers,
> Prabhakar Lad



-- 
Best regards!

Young
-----------------------------------------------------------
