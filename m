Return-Path: <linux-media+bounces-31212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE29A9F288
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 15:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE00617E697
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BDD26F469;
	Mon, 28 Apr 2025 13:38:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1826D4F7;
	Mon, 28 Apr 2025 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847495; cv=none; b=gwXb/afGDrGcDfLxxX8psOpiN69V34+0Ll3UyOZ8MKwuZEFW1luCpr+crizXdrqZCRxiva4rxoNUGWk1+g56e///mqeF0V13HQIuB64BDE78kAv4pKYwlRUAfC32JGiRt5H4D+eU4R8chfdGt4nosrdnCBW/Ft2JFbkDO2X0HBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847495; c=relaxed/simple;
	bh=Y8a9r3EgWkVGW/NaaXXnSZIWyMg0dEIj3OYjoGicD5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeI4Az825KFnVSscBJTGKMmN8oQLoyWNGn6FxWm4Sj9Y/yrVlzKkxOkN3ZsVUwiyChbohJeRM90MLuDyed7g3F68tsT3DR0LKM3dBFPPzB81+bAukPwff8swphZtnOXHZTHzAx73EOLWFbn2x/1sAbRtrphHO3k74ypw2ULNNjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5240a432462so4921361e0c.1;
        Mon, 28 Apr 2025 06:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847491; x=1746452291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckIN8bioKf6xmw0I7uAg33/9/Yp1zTgcen6pbefLTOo=;
        b=EOaz6XVNy1vjFPvZ3fzbwSycJieeSk0fQiuDVa1jyXJRRr+H4jtKOxV4Qr6ii/kYZa
         RoyiVCFBjZPkYPaaSE4nW5uPz99D6Pw7NTxxWbMkmYCRYWLHOIUKLRmhvlLw9S8+YEUr
         UKchWF0T+cln4AUQpIbvU9BlOm6zezV4LO2U5gJbP0w8LIKmsGG65tnqTzTFPV6OQ5og
         ZSxSPH9xZBL8T0t1Brc4BJrN+V2W69aGL4rQ9TjbWhG91NRyCK5PoQCiq8IQEbVLV7SN
         muP9sMF5rm1tq9sSuVTI7yCCWrYtx9riDvBpOHFNB7dwf90IjnN9unJLOvLr7AlNN3dA
         YScg==
X-Forwarded-Encrypted: i=1; AJvYcCUC9xUdkkos1LuE6AgwaFTNmaGxgVH5B7JxVM3sQVZfC53j3OhbZmXgMlJvWIR4vBgOVu7PFkSus+88atIiBU+h00M=@vger.kernel.org, AJvYcCUq8hL7E32B+pQzwr+EMlqsgkYTx+52h8849um+LA+KmcU2JcMEpX8o+rp84B4y2CQ+QYryZBE9srjLtQE=@vger.kernel.org, AJvYcCWxe0/LYKQctnlwXueAark9QPOxCsfZiWf6zv93BtuqqRy88FwwekbCaNp/b6vNRGVfD1xmKGGISEGp+Zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxTL0qSg7/3V3pKK7CoqjY6Kptel7cE1zjFjfoi9r8CAdQYCAR
	AnaOmnHaksGKo3fesGOgiOcnjfqTbRs2AH3b3lxei/BGNMXCtiRklVuOGZUi
X-Gm-Gg: ASbGnctVPqWD+Ol9CmBBQ7RYsppjYOY0+gQQp6QF0vmFH4LlBiL4hq4AAvxSynsExvo
	hJMs/n+JJpQ/uNow1x1kWu2XY4I09CFu//xGfB9f9fOYaor2feYeBg+kTLXo+i8qaVHxFqsbZri
	6UlwE+qZzdo2awbQyELZ9YtuEC47nPRPJlby0MLmZlFP0TP32evmSzoLD+8OdWkUqjL2JlmI0Un
	1wRq4MjELPveXiYK/idwbhOYcnnw9vb9oWacmxuSMgQRUY5Coy6B9ZbY9UkGlPvbDi4V+WjIc92
	b3x2pwntFui2FgnrZAzQeJHIyiXC89J0lkxE4D8NlylD0b5hgKBaHjNQ6TAiQ0vH5SUYeTUI4ZJ
	mGEY=
X-Google-Smtp-Source: AGHT+IFfx99XTesXD3jEWAhHpG6pFjn3I5bkN8HBbGweYPiR5Ji+aOt0wbW/EdQ14uAo5ZTFm2fH1Q==
X-Received: by 2002:a05:6122:c84:b0:527:b7a3:dda8 with SMTP id 71dfb90a1353d-52a8a7973bfmr7135596e0c.7.1745847491286;
        Mon, 28 Apr 2025 06:38:11 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52a993d518dsm909508e0c.47.2025.04.28.06.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:38:10 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso6901584241.0;
        Mon, 28 Apr 2025 06:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgcstAHYDsfdy/unB2+12rX4t6xx04SNZv0ZBfZE+x75vxbkiGF2K7WfupewrcVvgX2g9lB1wwZ7PFk0U=@vger.kernel.org, AJvYcCVHB1MkPac8BBAa8+sPQpSpkuVVbIGaynTYd81J05q/+J70S1P+WPCeGavLrJMKPJIVrzQy11agyi969qw=@vger.kernel.org, AJvYcCXXOey2HS3Si1wpqC6Ig5pxI++6NyKA29lGApXuZnKs/hp9kUBM/KZESv3U0vVccu35LIooHgtgp+c+ioSSufnWhks=@vger.kernel.org
X-Received: by 2002:a05:6122:12d:b0:523:6eef:af62 with SMTP id
 71dfb90a1353d-52a79e74a4fmr7069801e0c.4.1745847490496; Mon, 28 Apr 2025
 06:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428095940.GE3371@pendragon.ideasonboard.com> <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>
 <20250428112516.GG3371@pendragon.ideasonboard.com> <CA+V-a8vDDLZ422nZds7pEEW+gZ1n7s-U3eJjmG8DsOJT9uJygQ@mail.gmail.com>
 <CAMuHMdVqQqg6oK_oxTNWbPbPues38BH+W125Ts5UEATXT8LWmg@mail.gmail.com> <CA+V-a8t1VGau1WbS4BtCdC-koZ1if8MfrG4Q3JGCrxkH9uLTrQ@mail.gmail.com>
In-Reply-To: <CA+V-a8t1VGau1WbS4BtCdC-koZ1if8MfrG4Q3JGCrxkH9uLTrQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 15:37:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZYsm_v=sh5yt2eVEMULoxumYuMPMsbzZQsLAp9cg7hw@mail.gmail.com>
X-Gm-Features: ATxdqUEO0z-b_p84X9LRS45f7A1tj0PkbcOdeBHXWi9z5HCegbCgt4syw8o0Pr4
Message-ID: <CAMuHMdUZYsm_v=sh5yt2eVEMULoxumYuMPMsbzZQsLAp9cg7hw@mail.gmail.com>
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

On Mon, 28 Apr 2025 at 15:25, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Apr 28, 2025 at 12:36=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, 28 Apr 2025 at 13:33, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > On Mon, Apr 28, 2025 at 12:25=E2=80=AFPM Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > > > On Mon, Apr 28, 2025 at 12:17:54PM +0100, Lad, Prabhakar wrote:
> > > > > On Mon, Apr 28, 2025 at 10:59=E2=80=AFAM Laurent Pinchart wrote:
> > > > > > On Mon, Apr 28, 2025 at 10:52:08AM +0100, Prabhakar wrote:
> > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > >
> > > > > > > Simplify the `rzg2l_fifo_empty()` helper by removing the redu=
ndant
> > > > > > > comparison in the return path. Now the function explicitly re=
turns `true`
> > > > > > > if the FIFO write and read pointers match, and `false` otherw=
ise, improving
> > > > > > > readability without changing behavior.
> > > > > > >
> > > > > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > > > Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.=
mountain/
> > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.ren=
esas.com>
> > > > > > > ---
> > > > > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +=
-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-v=
ideo.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > > index 067c6af14e95..97faefcd6019 100644
> > > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > > @@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_de=
v *cru)
> > > > > > >       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > > > > >               return true;
> > > > > > >
> > > > > > > -     return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > > > > > > +     return false;
> > > > > >
> > > > > > So the function always returned true. This seems to be a bug fi=
x, please
> > > > > > add a Fixes: tag. The commit message should also make it clear =
that
> > > > > > you're fixing an issue, not just simplifying the code.
> > > > >
> > > > > No, the function returned true only if the pointers matched;
> > > > > otherwise, amnfifopntr_w =3D=3D amnfifopntr_r_y would return fals=
e. I was
> > > > > simply removing the repetitive pointer check and directly returni=
ng
> > > > > false at the end of the function, as we can be certain at that po=
int.
> > > > > Hence, I did not add a Fixes tag. Am I missing something?
> > > >
> > > > Oops, you're right, my bad.
> > > >
> > > > > > Personally I'd have written
> > > > > >
> > > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-vid=
eo.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > index 067c6af14e95..3d0810b3c35e 100644
> > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev =
*cru)
> > > > > >         amnfifopntr_w =3D amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> > > > > >         amnfifopntr_r_y =3D
> > > > > >                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> > > > > > -       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > > > > -               return true;
> > > > > >
> > > > > >         return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > > > > >  }
> > > > > >
> > > > > > but that's also a bit of a style preference.
> > > > >
> > > > > I wanted to keep this consistent with the rz3e_fifo_empty(). If y=
ou
> > > > > prefer the above I'll do that in v2.
> > > >
> > > > Up to you.
> > > >
> > > Thanks. OK, let's keep this patch as is to stay consistent with
> > > rz3e_fifo_empty().
> >
> > rz3e_fifo_empty() has a rather complex conditional expression.
> >
> Hmm yes.
>
> > This one will probably be converted to a simple return statement by
> > a random janitor, soon after its introduction ;-)
> >
> Agreed, are you already working on it?

Nice try ;-)

-EBUSY.

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

