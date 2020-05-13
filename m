Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2631D10F7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 13:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732140AbgEMLQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 07:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730286AbgEMLQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 07:16:28 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6BFC061A0C;
        Wed, 13 May 2020 04:16:27 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id v17so5140186ote.0;
        Wed, 13 May 2020 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kmT3haoKYL7RaHgaxSv/OLDSB0fCvleON4tKRznJs/E=;
        b=pKvPSW2tdPeQB7JcDzETIxB6dRyvhPkU+ceLt8PJLxG9l3jxbkO8KzEEXdCAkMbKUK
         8OX/PCIzHtwVt4kfQqPiuZDAKqaaOyesvpj66CcWN5+PlXG52diEmq/TFYj5npR1xCFP
         Vxdc+RBudn6c+QsTEpBx33ku6ZSlNn3vRdHgYdurFQ0dxuRKkXtqKwrgYZ0O7chkqylB
         6bma4N2RvLfkz8RyyiF64ouT+rVUA0ktFFfMuow8NBCH0LQQBB//TTJ+TbAohu/ZTv0E
         aYukrRFoxouG0LpdV1L9zeaRYERlz0FwKl9sf51XCPW6xycf5/luehiY+s58kSR1y4L5
         YwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kmT3haoKYL7RaHgaxSv/OLDSB0fCvleON4tKRznJs/E=;
        b=b0+jopkOfYGtRPGmHDjrF8l+O3hxkjVCokG5ShaBmrcDzEayB10QGbKqwKIyf/948H
         66SdhyLJPOmVIqCJYOqAxZ7EmmNbbuOqCf8gRBlstK4eqHbsWlfOZ06d6HQ+7NR/Np9W
         s0ue9zLAbhyUTUebPUjVhoLO3Moxr2PDiM3LHngQEZlzMYXtS3i/qvdKiB59pDNobvq5
         SGXGA+OYANy3nevkWGwfABo7rPIRJcJfdjRrmX8WsI5onCLdMXFiE4zb5hbgUq+hk2ld
         BK3tc76D36V5hi6TDHIjREMHl1rqKu3C6rJEIQadLJ6aVlxs5M/sPXCoXPfkAbaFdOYG
         VI7A==
X-Gm-Message-State: AGi0PuZwg4Ugh0xj06GMqQtLjFlpYo5Z/BLhLUNOOAlQx4bzAFkWr70k
        tT0xHQ7chO3t301/4hUCbUMOMJjmpm2D1H6IVCxdnVKGzfqdTg==
X-Google-Smtp-Source: APiQypKCiadeMjqy4HJtxD3P1eyF9SmDO+r0O/RiOm5MGnBXerJmlguCBMcOgC8R7fErOqw5TY8VqepeP/PyfymSizA=
X-Received: by 2002:a9d:7390:: with SMTP id j16mr18834815otk.43.1589368586398;
 Wed, 13 May 2020 04:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586945948-11026-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200512222648.GD2542285@oden.dyn.berto.se>
In-Reply-To: <20200512222648.GD2542285@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 13 May 2020 12:16:00 +0100
Message-ID: <CA+V-a8tC2KrspKWGHn8=+7DYjOUNuBXn+biS9NDB+qcqnd6f9w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: rcar-vin: Invalidate pipeline if conversion
 is not possible on input formats
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the review.

On Tue, May 12, 2020 at 11:26 PM Niklas <niklas.soderlund@ragnatech.se> wro=
te:
>
> Hi Lad,
>
> Thanks for your work.
>
> On 2020-04-15 11:19:06 +0100, Lad Prabhakar wrote:
> > Up until now the VIN was capable to convert any of its supported input =
mbus
> > formats to any of it's supported output pixel formats. With the additio=
n of
> > RAW formats this is no longer true.
>
> Add blank line.
>
> > This patch invalidates the pipeline by adding a check if given vin inpu=
t
> > format can be converted to supported output pixel format.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> I like this patch I think there is a typo bellow and patch [1] have been
> merged in the media-tree which unfortunately addes one more thing to do
> in this patch. In rvin_enum_fmt_vid_cap() there is a TODO noted for what
> needs to be done. In imagine the fix is simple and the end result would
> look something like this.
>
>     switch (f->mbus_code) {
>     case 0:
>     case MEDIA_BUS_FMT_YUYV8_1X16:
>     case MEDIA_BUS_FMT_UYVY8_1X16:
>     case MEDIA_BUS_FMT_UYVY8_2X8:
>     case MEDIA_BUS_FMT_UYVY10_2X10:
>     case MEDIA_BUS_FMT_RGB888_1X24:
>         break;
>     case MEDIA_BUS_FMT_SRGGB8_1X8:
>         if (f->index)
>             return -EINVAL;
>
>         f->pixelformat =3D V4L2_PIX_FMT_SRGGB8;
>         return 0;
>     case default:
>         return -EINVAL;
>     }
>
> 1. d5f74a1eff9aef3b ("media: rcar-vin: Make use of V4L2_CAP_IO_MC")
>
Sure Ill take of care of this and just repost this patch is that OK with yo=
u ?

> > ---
> >  drivers/media/platform/rcar-vin/rcar-dma.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media=
/platform/rcar-vin/rcar-dma.c
> > index 1a30cd036371..48bd9bfc3948 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > @@ -1109,13 +1109,17 @@ static int rvin_mc_validate_format(struct rvin_=
dev *vin, struct v4l2_subdev *sd,
> >       case MEDIA_BUS_FMT_UYVY8_1X16:
> >       case MEDIA_BUS_FMT_UYVY8_2X8:
> >       case MEDIA_BUS_FMT_UYVY10_2X10:
> > +             break;
> >       case MEDIA_BUS_FMT_RGB888_1X24:
> > -             vin->mbus_code =3D fmt.format.code;
>
> This is not right is it?
>
> Should you not add a case for MEDIA_BUS_FMT_SRGGB8_1X8 instead of taking
> over MEDIA_BUS_FMT_RGB888_1X24?
>
Agreed, I blindly took this suggestion from your previous comments [1].

[1] https://lkml.org/lkml/2020/3/19/858

Cheers,
--Prabhakar Lad

> > +             if (vin->format.pixelformat !=3D V4L2_PIX_FMT_SRGGB8)
> > +                     return -EPIPE;
> >               break;
> >       default:
> >               return -EPIPE;
> >       }
> >
> > +     vin->mbus_code =3D fmt.format.code;
> > +
> >       switch (fmt.format.field) {
> >       case V4L2_FIELD_TOP:
> >       case V4L2_FIELD_BOTTOM:
> > --
> > 2.20.1
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund
