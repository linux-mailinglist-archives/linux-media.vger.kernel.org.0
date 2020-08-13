Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBBF0243B80
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 16:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgHMOZL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 10:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgHMOZI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 10:25:08 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D7EC061757;
        Thu, 13 Aug 2020 07:25:07 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id p191so3424741ybg.0;
        Thu, 13 Aug 2020 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LxOS0yxf9O0+Zm/ztDeMxh4hKGod7IlFrT/bAFmH7TM=;
        b=rFrWBs6tw/+UYBqTd1/CBkR7cdjKTuce7LNDUuhR7RUj961k9XTsbmkT5ugdDEFlyT
         gVjVF06W3bIe2wlMpEAwRi3H9NUAqmMSVkwRuI1FDXvMnLSu8B7HCYvplcB94TNKU8lt
         G8O7jjnk/1i5esft+Y9LgyCj6iCaxfCn+cYnI9e1MaOts7r1HotEpKETBXx8lzJoI8X0
         /5/dPNMzCagxfJMnAhRGB7/C7qz+udqLp0dob5TCwJMo26WSb87SWGLvbWHKZZ/hwK15
         aPm3LOnWEKybfhhQPWY+sPUr4OC95dOFHJd8UCReheiLTmyQqvWys7CpSeQ8zhp6YXWI
         4bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LxOS0yxf9O0+Zm/ztDeMxh4hKGod7IlFrT/bAFmH7TM=;
        b=If5JcVHhYfsLmUGAjmUrLOBlf4u++48GNv31raqyXUrEWiu5XTK9oWvB25Ww9Lc2ma
         gMVWhBPH2rweM0DvMxaA2ubyks5KxHNuQRN24WVXJ0RfA0CHrQIOfSh6NWjk3iX3MCVJ
         waep0dk+psR0mS5N3emKVZDAvsCLloF/d2kj4wWeiPwSIzHVGUpVngEg10KOv95DvOlw
         Xk5Hc4yVj1QCJVhER3MVJVqq19mEANjKsIFrNIvUKzKKeSNmrWbTDxDMpgDwBqt63TQH
         EqsaPr7dbqiIeB93Ze3mBUFqMMppkNP+V4c69JU+R6BZaTnSfyRz0p7PHjXtlMb7nZ/o
         A45A==
X-Gm-Message-State: AOAM531ubftU4aDMXgv80AQ4S8KTQ2AyR9Wkp7iGUbplyNkwY7phOmxT
        fvZdSgm/7g7rH/YL1fCiF1J/qxh3cw5Slh+ke5FmdVZK
X-Google-Smtp-Source: ABdhPJwV6EyBG1sjrI53VK3nCnCvlShpks5x4dhz7OlOg/dHOZTrt+GfTsW54Gqq+ZNhR9dwj9H51mTTh2JvzRJFHz4=
X-Received: by 2002:a25:b74b:: with SMTP id e11mr6889924ybm.395.1597328706845;
 Thu, 13 Aug 2020 07:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200801090456.GB1379367@oden.dyn.berto.se> <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
 <20200803192108.GB2297236@oden.dyn.berto.se>
In-Reply-To: <20200803192108.GB2297236@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 13 Aug 2020 15:24:40 +0100
Message-ID: <CA+V-a8uqf33LXqnc-cV=UU_b1m0xKgrSUS9S8oYnYVz_nwSyUw@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans and Laurent,

On Mon, Aug 3, 2020 at 8:21 PM Niklas <niklas.soderlund@ragnatech.se> wrote=
:
>
> Hi Lad, Hans,
>
> On 2020-08-03 19:11:32 +0100, Lad, Prabhakar wrote:
> > Hi Hans,
> >
> > On Sat, Aug 1, 2020 at 10:04 AM Niklas <niklas.soderlund@ragnatech.se> =
wrote:
> > >
> > > Hi Lad,
> > >
> > > Thanks for your work.
> > >
> > > On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> > > > The crop and compose settings for VIN in non mc mode werent updated
> > > > in s_fmt call this resulted in captured images being clipped.
> > > >
> > > > With the below sequence on the third capture where size is set to
> > > > 640x480 resulted in clipped image of size 320x240.
> > > >
> > > > high(640x480) -> low (320x240) -> high (640x480)
> > > >
> > > > This patch makes sure the VIN crop and compose settings are updated=
.
> > >
> > > This is clearly an inconsistency in the VIN driver that should be fix=
ed.
> > > But I think the none-mc mode implements the correct behavior. That is
> > > that S_FMT should not modify the crop/compose rectangles other then m=
ake
> > > sure they don't go out of bounds. This is an area we tried to clarify=
 in
> > > the past but I'm still not sure what the correct answer to.
> > >
> > What should be the exact behaviour of the bridge driver  for s_fmt
> > call. Should the crop/compose settings be updated for every s_fmt
> > callback or should they be only updated on s_selection callback.
> > Currently the non-mc rcar-vin doesnt update the crop/compose setting
> > in s_fmt callback due to which I see the above issue as mentioned.
>
> This is not entirely correct. It does update the crop and compose
> rectangles on s_fmt, it makes sure they are not out-of-bounds for the
> new format if it's accepted by s_fmt. See v4l2_rect_map_inside() calls
> in the snippet bellow.
>
> That being said there is a difference how this is handled in the VIN
> driver between it's MC and non-MC modes and I would love to learn the
> correct mode of operation and seeing VIN being updated to doing it
> correct in both cases. Thanks Lad for dealing with this!
>
Can I have your feedback on this please.

Cheers,
Prabhakar
> >
> > Cheers,
> > Prabhakar
> >
> > > >
> > > > Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and com=
pose rectangles in s_fmt")
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/=
media/platform/rcar-vin/rcar-v4l2.c
> > > > index f421e25..a9b13d9 100644
> > > > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > > > @@ -319,6 +319,12 @@ static int rvin_s_fmt_vid_cap(struct file *fil=
e, void *priv,
> > > >       fmt_rect.width =3D vin->format.width;
> > > >       fmt_rect.height =3D vin->format.height;
> > > >
> > > > +     vin->crop.top =3D 0;
> > > > +     vin->crop.left =3D 0;
> > > > +     vin->crop.width =3D vin->format.width;
> > > > +     vin->crop.height =3D vin->format.height;
> > > > +     vin->compose =3D vin->crop;
> > > > +
> > > >       v4l2_rect_map_inside(&vin->crop, &src_rect);
> > > >       v4l2_rect_map_inside(&vin->compose, &fmt_rect);
> > > >       vin->src_rect =3D src_rect;
> > > > --
> > > > 2.7.4
> > > >
> > >
> > > --
> > > Regards,
> > > Niklas S=C3=B6derlund
>
> --
> Regards,
> Niklas S=C3=B6derlund
