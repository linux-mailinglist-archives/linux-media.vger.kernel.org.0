Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA561333D54
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 14:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhCJNJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 08:09:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232710AbhCJNIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 08:08:47 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27188C061760;
        Wed, 10 Mar 2021 05:08:47 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 133so17764055ybd.5;
        Wed, 10 Mar 2021 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AuIkG5mFalgNcUDwhfpUKnF07Cv7k5E48oJPkOG41VA=;
        b=VYtNRqZ6X1ixEPGetG5UzE4NmdWJ+xCmwr86X9AhSM1nJWwpRZvdDqhxK6DX3MfIog
         6ABMb4FuUquBo45lj1qEz/vnIo58z6QhfAuNU7DAmPf0a6Pw8WHHCCEl5Wwi12+rViVz
         CCGErfTOIbrWVMk+4WEK6opS3ZUwC8oCYhtxR0Jn4N1mZBreYUma4aoPPTdCdKssRz0d
         AT2eGOwqQCr6ssnwoCUUH/voPIDY0fTBo8LZ6LCcF1iazklGSTlqov9Opf8iHRsXNJeR
         esdPHWUlidbCxaIOYcLio7mgb3coJ3tJpxCtKsb1R3emOZsm90I2S8EQxS3tH0L4NcKg
         oFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AuIkG5mFalgNcUDwhfpUKnF07Cv7k5E48oJPkOG41VA=;
        b=bCvX7Fa/29JjJAA16n6Xmx75qLBoSTrou5yBZ2qQCMdlzErcC4AIMJRIRDnWjoJrPe
         mNgnQAbL0Q3Xgcn3PyGYXLhGi+SMQTGno1mwtwzRxXj9uTteBmlD2TOhsQg/bvFatYGo
         Kcq8B39gbOxM2apaLQwuc2f6QAbUs7n3CmeapiCNkEWzsbOiA4FAujgnGtZixi6do8Og
         yNUsXDNqEeFyrljTLvPDmf7Xhr72HYT1hsImAaLvefvMYFpNCG6kRt3g91CHAtdxQPFP
         gVDvkw4Qo6CR8JniFtGeZrreYClXCjSHfNHsejnxxSnCxS0umAlg9JDZUQ7//RHHf9WZ
         OlEA==
X-Gm-Message-State: AOAM533Q5DnL7j3iJp+Wn37we96O9xRNSYX11D5wgMkPiJ2gNtMgDCFq
        y1MzQDPQtHfYjTjB27uVluNFnU3+3rEtHMurH8s=
X-Google-Smtp-Source: ABdhPJwjZRLi35tc7kXY5jKQJUb/vWLh3EhoN40+47KDwF4/i1niwKOwlVJhgaZTIC9yWWuyRkKjp32svOyDCF/DZvo=
X-Received: by 2002:a25:d54:: with SMTP id 81mr3736951ybn.401.1615381726302;
 Wed, 10 Mar 2021 05:08:46 -0800 (PST)
MIME-Version: 1.0
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210310122014.28353-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YEi+FBRbXBJch1DM@pendragon.ideasonboard.com> <CA+V-a8vPm7EM=MoxRt1nXnvpVVL5vQvSupd79GRNaGULpxS-kQ@mail.gmail.com>
 <YEjBc0rdAoaw+8lo@pendragon.ideasonboard.com>
In-Reply-To: <YEjBc0rdAoaw+8lo@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 10 Mar 2021 13:08:20 +0000
Message-ID: <CA+V-a8sSmQkXDf5CZZWKVipWWdKpE55DLLbOgktR-4VmQqmkWQ@mail.gmail.com>
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

On Wed, Mar 10, 2021 at 12:54 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Wed, Mar 10, 2021 at 12:46:39PM +0000, Lad, Prabhakar wrote:
> > On Wed, Mar 10, 2021 at 12:40 PM Laurent Pinchart wrote:
> > > On Wed, Mar 10, 2021 at 12:20:13PM +0000, Lad Prabhakar wrote:
> > > > Serialize during stream start/stop in suspend/resume callbacks.
> > >
> > > Could you please explain why this is needed ?
> > >
> > The streaming variable in this driver has serialized access, but this
> > wasn't taken care during suspend/resume callbacks.
>
> But nothing that touches the streaming variable can run concurrently to
> suspend/resume, isn't it ?
>
You are right, we could drop this patch.

> I'm actually even quite dubious about the need to start and stop
> streaming during resume and suspend, the driver using the subdev should
> start/stop the whole video pipeline at suspend/resume time.
>
I see, do we have any documentation on how bridge/subdevs should
behave on suspend/resume ?

I did have a quick look at the omp3isp bridge driver and it does
start/stop on resume/suspend callbacks.

Cheers,
Prabhakar

> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index f0cf1985a4dc..87c021de1460 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -1172,8 +1172,10 @@ static int __maybe_unused imx219_suspend(struct device *dev)
> > > >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > >       struct imx219 *imx219 = to_imx219(sd);
> > > >
> > > > +     mutex_lock(&imx219->mutex);
> > > >       if (imx219->streaming)
> > > >               imx219_stop_streaming(imx219);
> > > > +     mutex_unlock(&imx219->mutex);
> > > >
> > > >       return 0;
> > > >  }
> > > > @@ -1184,11 +1186,13 @@ static int __maybe_unused imx219_resume(struct device *dev)
> > > >       struct imx219 *imx219 = to_imx219(sd);
> > > >       int ret;
> > > >
> > > > +     mutex_lock(&imx219->mutex);
> > > >       if (imx219->streaming) {
> > > >               ret = imx219_start_streaming(imx219);
> > > >               if (ret)
> > > >                       goto error;
> > > >       }
> > > > +     mutex_unlock(&imx219->mutex);
> > > >
> > > >       return 0;
> > > >
> > > > @@ -1197,6 +1201,7 @@ static int __maybe_unused imx219_resume(struct device *dev)
> > > >       imx219->streaming = false;
> > > >       __v4l2_ctrl_grab(imx219->vflip, false);
> > > >       __v4l2_ctrl_grab(imx219->hflip, false);
> > > > +     mutex_unlock(&imx219->mutex);
> > > >
> > > >       return ret;
> > > >  }
>
> --
> Regards,
>
> Laurent Pinchart
