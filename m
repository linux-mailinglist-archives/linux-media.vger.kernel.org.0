Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B2223AC28
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 20:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgHCSMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 14:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgHCSMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 14:12:00 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C666C06174A;
        Mon,  3 Aug 2020 11:12:00 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id p191so4375768ybg.0;
        Mon, 03 Aug 2020 11:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J7r7YpmcchYGchQNEBkoeTg3Nnece6VxKk14FSGb/wg=;
        b=KI+YOp/8fZfo8O25o8ruNnOpVKqngH04wZu7j4+45EG69hqJEJrNj3YJqLyKderBRb
         FqcnzqGp51v+YqnWzfdPXbTlMvi85BzASMDf8cxJciN7iM00LQ2nXXYUBw3uXOstD0fL
         ehG61mzYsgxMHpAdCe59A1MI86zAiAjLpYFGZSgfGIdyZ7rjtIB2msfMFfsTuZG8XspJ
         Pc1KaKSskqbDRoq96nYvH5h2f1+qr1qc6/Tg1fuyXo/F5OMhzWnXPNN5+J9OIkFghrGR
         WJsSX+jUlp2fIaAoCpP3aGN8JZfjvoMffk6MYgyyXx4kkEbEhGZTsKFlZyR0TA9HKEfW
         Q6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J7r7YpmcchYGchQNEBkoeTg3Nnece6VxKk14FSGb/wg=;
        b=J8RWaOluSqyOteb6EpFUTDF9UJb8ILGy1/2tYAcjMBivFoKWcmLjrRGH8Gi0T5AUGQ
         WYqeu/FlnNLaPI6Kq1SR4XFGV5pjkqmA6fBskSApzwx+O0ZCXGmUQUkKHI/UoOCqPybL
         kYtTKze+AZu5O/CfJsI87Bocvc7FZNDYSr+0AYZeb79ag2S9GjKEwJtO3Mp24xRn5Q7h
         FalxdUXdg+LePeHa5ot6sqqs3YBCKdJ+nzNxtsA+YzRPABmJ8toPriMBX3lujq6y7RHk
         3CbA/X2Hpj/raxms0sjaKU6V48T4nDnNfebRcfBqvtzViJnl/1pBBqFRa4R3vGF1Rmdt
         EwYA==
X-Gm-Message-State: AOAM531qDm4JaLHki0kHZTeR6zBkaUp3p97kv3ncp/U4TrhciE0DTbrk
        VoNltYfEZRTZHLt16p8u2Jl7cIELtPNyKXLy2HI=
X-Google-Smtp-Source: ABdhPJyrr530gC4Jdav1r+XBP0uq3CXKHqcK+f26v2g+FqCFA9k5lH1XYBneFu3632cOeHFdUVjHKitJaafwPbdo2oI=
X-Received: by 2002:a25:4fd6:: with SMTP id d205mr28216774ybb.214.1596478319311;
 Mon, 03 Aug 2020 11:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200801090456.GB1379367@oden.dyn.berto.se>
In-Reply-To: <20200801090456.GB1379367@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 3 Aug 2020 19:11:32 +0100
Message-ID: <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Niklas <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Aug 1, 2020 at 10:04 AM Niklas <niklas.soderlund@ragnatech.se> wrot=
e:
>
> Hi Lad,
>
> Thanks for your work.
>
> On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> > The crop and compose settings for VIN in non mc mode werent updated
> > in s_fmt call this resulted in captured images being clipped.
> >
> > With the below sequence on the third capture where size is set to
> > 640x480 resulted in clipped image of size 320x240.
> >
> > high(640x480) -> low (320x240) -> high (640x480)
> >
> > This patch makes sure the VIN crop and compose settings are updated.
>
> This is clearly an inconsistency in the VIN driver that should be fixed.
> But I think the none-mc mode implements the correct behavior. That is
> that S_FMT should not modify the crop/compose rectangles other then make
> sure they don't go out of bounds. This is an area we tried to clarify in
> the past but I'm still not sure what the correct answer to.
>
What should be the exact behaviour of the bridge driver  for s_fmt
call. Should the crop/compose settings be updated for every s_fmt
callback or should they be only updated on s_selection callback.
Currently the non-mc rcar-vin doesnt update the crop/compose setting
in s_fmt callback due to which I see the above issue as mentioned.

Cheers,
Prabhakar

> >
> > Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and compose=
 rectangles in s_fmt")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/medi=
a/platform/rcar-vin/rcar-v4l2.c
> > index f421e25..a9b13d9 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -319,6 +319,12 @@ static int rvin_s_fmt_vid_cap(struct file *file, v=
oid *priv,
> >       fmt_rect.width =3D vin->format.width;
> >       fmt_rect.height =3D vin->format.height;
> >
> > +     vin->crop.top =3D 0;
> > +     vin->crop.left =3D 0;
> > +     vin->crop.width =3D vin->format.width;
> > +     vin->crop.height =3D vin->format.height;
> > +     vin->compose =3D vin->crop;
> > +
> >       v4l2_rect_map_inside(&vin->crop, &src_rect);
> >       v4l2_rect_map_inside(&vin->compose, &fmt_rect);
> >       vin->src_rect =3D src_rect;
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund
