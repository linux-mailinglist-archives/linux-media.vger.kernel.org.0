Return-Path: <linux-media+bounces-31201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB8BA9EF61
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739E61A806A4
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 11:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68A8266EF7;
	Mon, 28 Apr 2025 11:36:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB2265628;
	Mon, 28 Apr 2025 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840202; cv=none; b=pXqcL4ApMZRACy3WIklFXxTzSP8zptxYomKl0j/EtJP+jzusK9J9Hs5r0VMLUaaT9GARSsn7bAHOgVZAT97L61giwcedVvEMV2ioJx+FcPoTMJ4z8MFXs238K7G+kfTEKgpJi1ucQFYUJ9vCEiVMiy4bA2gL1hch0NTkKHqwLbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840202; c=relaxed/simple;
	bh=brw6cD+MyRzvOq+j3wdA1CB1N4qYHm1kugOJhBYLGLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rmg2wy7Ex4B3jASLjxn68PONsn4GHuBvZCcVpkHuI8vlo02FMXIMw2ofcwttmqdX0xh3Eo/yYvNbfh8TKKLxm3J9rCmEdqIwuE5yDLXC4P9qsI8QX6fP+HTEBzLjegeYEb2Ttcw3/qvIUFxmGdXvg/5rGvx0y1WJeX5U93+7ELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-524038ba657so5623822e0c.0;
        Mon, 28 Apr 2025 04:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840199; x=1746444999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOjDueyRXwjDw+FAw77LpZcp2ajow6qiWjH4m9CiW4s=;
        b=U2f2Wok3t3apvknwJUQjSjX2oHo8jORSrFiGHW1OaVHWFmglce+vtm6fOu8VtoCHt8
         nQh4okvcx992qpMjib8hqrFpn5g0ECbINvMsYCoa84zQqwiVCDxhB4EeL8DOyd+R82Bz
         exJmFtcr+6YffVYOVNmSwTi2cdkrUQeYsGWIvom6HSsGx5Zc+1ezm2XO/3+mtVK1wcm0
         lxGm5n3mdV8ihllEWXdig0XdK/0ZMnWP42uSyUGIYmUWw2DvKYIeN0L3/ONVtQ2EbWog
         fCVPlUTEUpFxrOn4BhOqDVTZ15NxE0U+E31/QhcTV3nOm85m8eg9K9CjNA+TtHwjddIa
         GAGg==
X-Forwarded-Encrypted: i=1; AJvYcCVa9BlTZOvoTD2AFjegkZXqqj39V5r0VD/hKiItigcbjc2qiznJOSubkK2JiDNQ5lDaGbyW5Uyv2a8+/PQ2hYZzZdE=@vger.kernel.org, AJvYcCX1Y4Xe5193BG/08Bf9Be9QNhht6Q8EmCxLNP/6kWU3PP5agDvJaAR7x2yUuztWDMKUiDcY+rZgyXuzZ30=@vger.kernel.org, AJvYcCXz3hSdyP01nnBz75E63t34TT3tOu3FfMql3E69lTyeoWrHGAZ9XVJUkJ1pP6ncOCFsuTIv9+igr3P4VWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7dfVPIB2kd1lfWMbrd2ABExtmjjYAVpr6Rl7txzn6gt863N3
	aKNKiiCVnQnv5ZdFQbdRccmtDbm1L3u6WYhUjT+oSWczDDznJWqLb4pvbTyn
X-Gm-Gg: ASbGnctEqQoCG6dDJqPB4rgpQSI7vwARwxrHMtSL0ZyMagSRo/o43FCMNoNN4p0eXCQ
	fAh/yqXkaDrbtdhO3hoGVhHsDSr9wos4p21ETVbuln9uyzAFo7m2qw/Gr2x4lURwU3KR3rA3bfZ
	D8LWT7FuBHbAHTiw9T/SkPNARfG+S4qrxB5PHP47IKCGDMWB+ENpPKMppk/wUyWt+kggI1hpYEG
	YAK3Ez7nftriR7m1OK9YhTd9EXhrAirGRCL36EkR7YetGC7NYHBc621J0h8N4RaAUhZ2GfQDaXA
	oyltWCoGEMm4xLgFPbre8xaFfV8PGLcLR9F0hJNEdfbIXTAR6ggPaXCCopF2La/pLovMcfaSnNT
	+BUA=
X-Google-Smtp-Source: AGHT+IFZrKGchqZmgB1fv2OV28L3euN05PgS8jM3KnTd5xF5w7T4bVeeF/E6Grk5LlZtrV+Wg7oV4Q==
X-Received: by 2002:a05:6122:3c4f:b0:523:771e:8b81 with SMTP id 71dfb90a1353d-52a79ee9116mr12124949e0c.7.1745840198729;
        Mon, 28 Apr 2025 04:36:38 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52a993d78a1sm869766e0c.48.2025.04.28.04.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 04:36:38 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso6786356241.0;
        Mon, 28 Apr 2025 04:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVibOs1pJyAtVi2MofFk1hHJmdRnjYRtbtHoBRwbH4JspsHJgYCgltW4L++CajuSpT76/XQB89uUt1ZDHA=@vger.kernel.org, AJvYcCW0YrYe1Qcl79kQ8BCG6zje0hCwKNBUZKzPh4L/9R4Jv51gFhC2JXReR5Td82wIdV1GFh/+N6S2xdu+ZTF9X31kW4k=@vger.kernel.org, AJvYcCWLnhYSdnOG6WGaWrn6CSAbtGfN2clVI9Ka6Cs3G3XQnzGk5eZzamroX/sUxNrZKitsNtgVJdyjdqFbTvI=@vger.kernel.org
X-Received: by 2002:a05:6102:161e:b0:4c3:64c0:8b14 with SMTP id
 ada2fe7eead31-4d3c73f1c0amr11737086137.3.1745840198388; Mon, 28 Apr 2025
 04:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428095940.GE3371@pendragon.ideasonboard.com> <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>
 <20250428112516.GG3371@pendragon.ideasonboard.com> <CA+V-a8vDDLZ422nZds7pEEW+gZ1n7s-U3eJjmG8DsOJT9uJygQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vDDLZ422nZds7pEEW+gZ1n7s-U3eJjmG8DsOJT9uJygQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 13:36:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqQqg6oK_oxTNWbPbPues38BH+W125Ts5UEATXT8LWmg@mail.gmail.com>
X-Gm-Features: ATxdqUHzSEMkbOxnqWv-iU1xYgK-wgs2AXQmaBU2UW2O5aU2M90XALDvVPt6FaM
Message-ID: <CAMuHMdVqQqg6oK_oxTNWbPbPues38BH+W125Ts5UEATXT8LWmg@mail.gmail.com>
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 28 Apr 2025 at 13:33, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Apr 28, 2025 at 12:25=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Mon, Apr 28, 2025 at 12:17:54PM +0100, Lad, Prabhakar wrote:
> > > On Mon, Apr 28, 2025 at 10:59=E2=80=AFAM Laurent Pinchart wrote:
> > > > On Mon, Apr 28, 2025 at 10:52:08AM +0100, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Simplify the `rzg2l_fifo_empty()` helper by removing the redundan=
t
> > > > > comparison in the return path. Now the function explicitly return=
s `true`
> > > > > if the FIFO write and read pointers match, and `false` otherwise,=
 improving
> > > > > readability without changing behavior.
> > > > >
> > > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.moun=
tain/
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > > > ---
> > > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video=
.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > index 067c6af14e95..97faefcd6019 100644
> > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > @@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *c=
ru)
> > > > >       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > > >               return true;
> > > > >
> > > > > -     return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > > > > +     return false;
> > > >
> > > > So the function always returned true. This seems to be a bug fix, p=
lease
> > > > add a Fixes: tag. The commit message should also make it clear that
> > > > you're fixing an issue, not just simplifying the code.
> > >
> > > No, the function returned true only if the pointers matched;
> > > otherwise, amnfifopntr_w =3D=3D amnfifopntr_r_y would return false. I=
 was
> > > simply removing the repetitive pointer check and directly returning
> > > false at the end of the function, as we can be certain at that point.
> > > Hence, I did not add a Fixes tag. Am I missing something?
> >
> > Oops, you're right, my bad.
> >
> > > > Personally I'd have written
> > > >
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c=
 b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index 067c6af14e95..3d0810b3c35e 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru=
)
> > > >         amnfifopntr_w =3D amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> > > >         amnfifopntr_r_y =3D
> > > >                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> > > > -       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > > -               return true;
> > > >
> > > >         return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > > >  }
> > > >
> > > > but that's also a bit of a style preference.
> > >
> > > I wanted to keep this consistent with the rz3e_fifo_empty(). If you
> > > prefer the above I'll do that in v2.
> >
> > Up to you.
> >
> Thanks. OK, let's keep this patch as is to stay consistent with
> rz3e_fifo_empty().

rz3e_fifo_empty() has a rather complex conditional expression.

This one will probably be converted to a simple return statement by
a random janitor, soon after its introduction ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

