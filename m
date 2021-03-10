Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2003333FD4
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 15:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbhCJOBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 09:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232727AbhCJOB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 09:01:29 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC5FC061760;
        Wed, 10 Mar 2021 06:01:29 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id x19so17975645ybe.0;
        Wed, 10 Mar 2021 06:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7a2OeopqH0Y4h1owU3t7VkDKxd93A5ERI3FGH0Y4yUA=;
        b=CaJtkQrEXLtU6IB+EaQnvDWDwXLsgL8YDPUo7TBqmxyEH0m7zo05lmLwDQ75aR+m/p
         W9efunnt6u80BLcojGaLbMyRBPXn+GEuB3eGLcdIITvsH2n3xe33Rw6n6sblg6WTL1AV
         TpOt7otXdFIhKc9jPtm5ZFebaC3ngUdkJzrrKniJp9ezHwYgB9DAD5BJa4Yo/VlLHV/d
         NyOu5Pj6aLui1jKyKpkCkEv7OdSBmcnEJ3gVxpeZ5xyNn+lPgjqMWrD0EucFfjeGcuKE
         sePuGgK+g9J9d7llBo7rzQ/wh4clMNQnJHKE9V+WT1m4hhX8BRYhDXOIOZ3U/gu5yFMa
         JFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7a2OeopqH0Y4h1owU3t7VkDKxd93A5ERI3FGH0Y4yUA=;
        b=Q8Uq/XFCE8eAVEL4Ew4GVbc5+E8IzhlZWXYcB3VZAkkTxXeS90FvyW/kIp6HozMCYH
         3dNCFrAZD05aCXFhI7YnA/80iqit1h4qODW9vmoY0r98h6NYSVDLLVSgHAMM1xbxg14e
         lK1Tw/giUwrcvVq5IvIArhe+qqM9k/OX7AROtyhAoyNGvWcjJv+e3Crp0e6VyAqgNAek
         46kTs3RtRuo3nvvphgD4uVpO3VQ5ojjMqQ08uIX1vnjSj+zkA+NMqbKoJCPTW762t3wy
         eHTQ+d34yKb1hnr3pykcnFiBXIWpEEH2ktHfC3+ih34YN5o+uhXbH4MA5lUqHdqwnUbL
         Sapw==
X-Gm-Message-State: AOAM532uQCkeADWl9el41tR/4Pj4YSGxXHL74dZlOqH15XrEbyImkB/z
        Thaz4TPPobAVQA9D2jQSEwbIZTxtouy7lW4ZWlo=
X-Google-Smtp-Source: ABdhPJxXaxlVuYIZd3Mum1Ha9lwUcrH3kN15/FT06kJc+7h/6Tn4pZu8buSiIP3XwauBNHtw51+Zvmbtqw5jLto54Qo=
X-Received: by 2002:a25:cec8:: with SMTP id x191mr4151186ybe.214.1615384888127;
 Wed, 10 Mar 2021 06:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210310122014.28353-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <YEjAL22jNXvpe23W@pendragon.ideasonboard.com>
In-Reply-To: <YEjAL22jNXvpe23W@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 10 Mar 2021 14:01:02 +0000
Message-ID: <CA+V-a8ua38zhCPW+Vu+8XmEUNt4rWGpPbg9BtojUK9_0SPhJuw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx219: Balance runtime PM use-count in
 resume callback
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

On Wed, Mar 10, 2021 at 12:49 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Wed, Mar 10, 2021 at 12:20:14PM +0000, Lad Prabhakar wrote:
> > The runtime PM use-count gets incremented in imx219_set_stream() call
> > when streaming is started this needs to be balanced by calling
> > pm_runtime_put() upon failure to start stream in resume callback.
> >
> > Fixes: 1283b3b8f82b9 ("media: i2c: Add driver for Sony IMX219 sensor")
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/imx219.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 87c021de1460..afffc85cd265 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -1184,6 +1184,7 @@ static int __maybe_unused imx219_resume(struct device *dev)
> >  {
> >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >       struct imx219 *imx219 = to_imx219(sd);
> > +     struct i2c_client *client;
> >       int ret;
> >
> >       mutex_lock(&imx219->mutex);
> > @@ -1197,7 +1198,9 @@ static int __maybe_unused imx219_resume(struct device *dev)
> >       return 0;
> >
> >  error:
> > +     client = v4l2_get_subdevdata(&imx219->sd);
> >       imx219_stop_streaming(imx219);
> > +     pm_runtime_put(&client->dev);
> >       imx219->streaming = false;
> >       __v4l2_ctrl_grab(imx219->vflip, false);
> >       __v4l2_ctrl_grab(imx219->hflip, false);
>
> Similarly to the __v4l2_ctrl_grab(), it could be better to move
> pm_runtime_put() to imx219_stop_streaming().
>
Agreed, moved this to imx219_stop_streaming().

Cheers,
Prabhakar

> --
> Regards,
>
> Laurent Pinchart
