Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D266F333CDA
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhCJMrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:47:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbhCJMrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:47:06 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F0CC061760;
        Wed, 10 Mar 2021 04:47:05 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id m9so17703942ybk.8;
        Wed, 10 Mar 2021 04:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PNzo7/za+7Ji2NXrydXkGbcYF4yb4UI6vFbARFR5yJw=;
        b=O8cuTDdRfZbiEcuzkumf8xI1xSM9i1M65gHKEvhVuHqMfms7EfYDqO5WnDX67dqPx0
         /SqKq0U2tUDmOXJLOnWdbWklvQpiSFq8Y1cPbLeOEp7ImTx7oCE9ELHw/APMVi/kFP3d
         IhDGX53iFRT/XrqLkMYgidkSIjxPLfzZPhIeGUHZS00URhs81NjCsn5kC9jTXdR6olmc
         herIR/XMM+2CJYmvGaHL0bdXVTUiR4lAWmOTxrMn/jgsmV+TkvPuZXzYSJiMBvYq/5in
         n6QZ9hzA416rHUDifs+ObU1BhR7Q/KCTqb4wanrfEYJ6G3+mpOEwwsys5qHJsjSX1caB
         7d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PNzo7/za+7Ji2NXrydXkGbcYF4yb4UI6vFbARFR5yJw=;
        b=Ut/FIOICUnoIlqeBv2SXFaEaiA1/xcV0X13V+Mq1jd03ccoDlb+hmx2LNxdl8CpMXu
         cGnNeuE23fQ6WvK2rT7RJCyfooCbAXYUasb2XyEHdzbRkIaLgko7rQ6V2SvMcqxo6Ut1
         sxua2RUuov+CTS5vAxla4bCsqjXvo9hl5DtVrZYPEk6Fpm6TH3q1Z3TJbhxLt3HmuowW
         VJb+LVoJnZpkcPOCdWHjW0qtH0YqScTuoyb/fMHgV1fhenO1Z5FVEHZ7K2dapmg+nKit
         b08tU/altHkP3daQreunUipYYevqbt73Prs0wRVydGNoFCbLgZcr3vvO92hZArUEtZjj
         zhBA==
X-Gm-Message-State: AOAM531dy+oJTU3BEXoSvP8Jh8ncw5PAgSOs2Q74pY05t7FlO48OLkW1
        ygpsnebIgVkoSr3Dt//Aa0UhopKCVdnSFZb5zH4=
X-Google-Smtp-Source: ABdhPJx3bd3wgVd6ZNplHpk/sMPkOg47+qu0M56c5gAlaA71roGVz+M7tm0hWdyKNpfMA9Iuh9Is2mPBnpzoEc/38o0=
X-Received: by 2002:a25:4204:: with SMTP id p4mr3791705yba.76.1615380425254;
 Wed, 10 Mar 2021 04:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210310122014.28353-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <YEi+FBRbXBJch1DM@pendragon.ideasonboard.com>
In-Reply-To: <YEi+FBRbXBJch1DM@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 10 Mar 2021 12:46:39 +0000
Message-ID: <CA+V-a8vPm7EM=MoxRt1nXnvpVVL5vQvSupd79GRNaGULpxS-kQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: imx219: Serialize during stream start/stop
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the review.

On Wed, Mar 10, 2021 at 12:40 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Wed, Mar 10, 2021 at 12:20:13PM +0000, Lad Prabhakar wrote:
> > Serialize during stream start/stop in suspend/resume callbacks.
>
> Could you please explain why this is needed ?
>
The streaming variable in this driver has serialized access, but this
wasn't taken care during suspend/resume callbacks.

Cheers,
Prabhakar

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/imx219.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index f0cf1985a4dc..87c021de1460 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -1172,8 +1172,10 @@ static int __maybe_unused imx219_suspend(struct device *dev)
> >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >       struct imx219 *imx219 = to_imx219(sd);
> >
> > +     mutex_lock(&imx219->mutex);
> >       if (imx219->streaming)
> >               imx219_stop_streaming(imx219);
> > +     mutex_unlock(&imx219->mutex);
> >
> >       return 0;
> >  }
> > @@ -1184,11 +1186,13 @@ static int __maybe_unused imx219_resume(struct device *dev)
> >       struct imx219 *imx219 = to_imx219(sd);
> >       int ret;
> >
> > +     mutex_lock(&imx219->mutex);
> >       if (imx219->streaming) {
> >               ret = imx219_start_streaming(imx219);
> >               if (ret)
> >                       goto error;
> >       }
> > +     mutex_unlock(&imx219->mutex);
> >
> >       return 0;
> >
> > @@ -1197,6 +1201,7 @@ static int __maybe_unused imx219_resume(struct device *dev)
> >       imx219->streaming = false;
> >       __v4l2_ctrl_grab(imx219->vflip, false);
> >       __v4l2_ctrl_grab(imx219->hflip, false);
> > +     mutex_unlock(&imx219->mutex);
> >
> >       return ret;
> >  }
>
> --
> Regards,
>
> Laurent Pinchart
