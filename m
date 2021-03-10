Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C43333FE2
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 15:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbhCJOET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 09:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhCJODp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 09:03:45 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE39C061760;
        Wed, 10 Mar 2021 06:03:45 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id u75so17914120ybi.10;
        Wed, 10 Mar 2021 06:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SptRU5csDKyRkHUh2vesq2rOpNfQ4e/o0TWWVsGVoVg=;
        b=OHHcfex8bWtFD2qyUxAuH/fuY78+VCTWpXStT/bYf0Ldev4fMVE9jt7tfbXzWf4G2N
         uk97owC5DoexuPg8ObpvMW8SYdYGH9iK8xiDQrVFzVjxn4G+0QtOa2sMeOS6lDgwYAL0
         hjMg7m4HUVxZ+nsTjcMCY5IIWrVjozgvxkc+DUgjVqeBlIx2DC3waxkZxk+GyA3WgBoa
         yJVvWAEVtDflWR3S8UxyyD6X1GZyMdPU0LAhW1TO02B/ZTvnPK+zacWq6c1ybAKyGMS4
         1R8neb90LXbLDVeEZ1MaVPh6FKj7ewHLXvU6/GHewDSjuiBBgcutStyRFbnE/lZkx6as
         YFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SptRU5csDKyRkHUh2vesq2rOpNfQ4e/o0TWWVsGVoVg=;
        b=tLz2WKzi1W2WCV7d2WyfCUJxbRGQiapcz70ZE5JxojnHo/AES/ybQgQl0oLMibHjvc
         kp/5HYQrMTZucD7TMmclrJ7tINOtLYwoh/KH45/R9MRKUgBFZ0iv/QSp1t3ns1nTzo1e
         TCzljnV4ppl2D5Adrjlm9ewzgaiyP+MNnZyY1oaoxB1R9x3rc+x3UjNP0Wz4sYteai8n
         0FSKZAm1PjO7k2JgTKCb0+Wary5ISMHME3DDclLxYjXum3kf+SWwNCEdF/9+bkPe7Fi3
         i1ECBl1vlw1FJLfAk1jeOHL+cP2I+hpxdOLbhWSCruIYKHdL5gx+Ol7jeGpPDs2dCXQ7
         UtdA==
X-Gm-Message-State: AOAM531arKIHtC8uskURvelcMZexwJuSrdhCBOc8HgZ3eiPQhv7JtFte
        78Mnzc2+q0UNM+m6ledXSxzdHi4zoFKchj60/6g=
X-Google-Smtp-Source: ABdhPJwqwh3GVhIajNSoH79DrrNmbqswz+c+8ZrR1yvBbOTMgJFTUkVdHs20oiDtDEvy8Hz9l0zBq+Ky0AaOK+ltrdo=
X-Received: by 2002:a25:4204:: with SMTP id p4mr4237702yba.76.1615385024462;
 Wed, 10 Mar 2021 06:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20210310122014.28353-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210310122014.28353-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <YEi/Mcb3KX/Q6vwa@pendragon.ideasonboard.com>
In-Reply-To: <YEi/Mcb3KX/Q6vwa@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 10 Mar 2021 14:03:18 +0000
Message-ID: <CA+V-a8uq-zWPdM_F0C-D9pPQKCntaVNgX+RDL8Mm3u0Q=zY75g@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: imx219: Enable vflip and hflip controls
 on stream stop
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

On Wed, Mar 10, 2021 at 12:45 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Wed, Mar 10, 2021 at 12:20:12PM +0000, Lad Prabhakar wrote:
> > Enable vflip and hflip controls in resume error path when streaming
> > is stopped.
> >
> > Fixes: 1283b3b8f82b9 ("media: i2c: Add driver for Sony IMX219 sensor")
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/i2c/imx219.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 6e3382b85a90..f0cf1985a4dc 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -1195,6 +1195,8 @@ static int __maybe_unused imx219_resume(struct device *dev)
> >  error:
> >       imx219_stop_streaming(imx219);
> >       imx219->streaming = false;
> > +     __v4l2_ctrl_grab(imx219->vflip, false);
> > +     __v4l2_ctrl_grab(imx219->hflip, false);
>
> It's not very nice to do this manually in imx219_resume(). Shouldn't we
> move the __v4l2_ctrl_grab() calls from imx219_set_stream() to
> imx219_start_streaming() and imx219_stop_streaming() instead ?
>
Agreed, moved to respective functions.

Cheers,
Prabhakar

> >
> >       return ret;
> >  }
>
> --
> Regards,
>
> Laurent Pinchart
