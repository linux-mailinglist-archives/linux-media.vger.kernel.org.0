Return-Path: <linux-media+bounces-31209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F1A9F246
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 15:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C628D189E477
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 13:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D4E26B951;
	Mon, 28 Apr 2025 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLeovDA+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B751FFC45;
	Mon, 28 Apr 2025 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846746; cv=none; b=gl+Kzq0p0YLRGD2rBbulUDWLs/3amtm4nQpOyLV6afCpwYpzKCxiUvZnKbYxAhPZQZO2OyjsZtJ+QETL5Vd0w/UmL5HZi2oapszFVe4ScLyDVi5nHovqG8Bmyv7URgvToFyb6aMfOF52ZrQbOp38dfsclvfzCm9BCizrgpAz/yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846746; c=relaxed/simple;
	bh=OnB/nARGray61fwM/dwng/EIhRRxEOSxkKydDvTU7Sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJZd3BAZusvR6J2mzGjLS5R9kWXpJztNskL575vRfXTPST4MORZhbXfq/jWMb3bBuku6q1mMIB4aLYdplFxfZzgSi1Ettce1QP5RTEI4c7h1CRTnDbcBK3sjUwNTQPSwqs4XlSIozlyBWJyBjoxZAtnpkhAufkJX/br/xqVtrng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLeovDA+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2433723f8f.3;
        Mon, 28 Apr 2025 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745846742; x=1746451542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xoVsMrgvrhFFbx42G/dmm9QWGqviT/wAXJ3BloytIc=;
        b=OLeovDA+8QvopD+mr58G2XTv2p0m5MVXcjI2T19afZiPeC4WyWZYpQzJLHpHieG+98
         sp8lEXY/nbLmVcfN3fnqdSemGyNVXU8y0P0d24A/H8I8rZzq9MQkP8Q1DahAHvgNLgQa
         YhA6mOdkJHFepMIX6I84WnPfISz1tXjKZ6Vji61sLGFnGhDw4i/VzRYxCgdrDJ2kfYPQ
         ISIjZ/2FSEooldyJfXVT1eW3L1PE5JehDCWEeTcGH48GC1Qqbr8kHcQio3Eiqx3mx2Uk
         UWbD4MXmc7kCJ53P/7NTNXOvWDeQOKy4cLSI5LxK4B0rSDqK+2grBxPh7pF5H0kUhzoj
         xwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745846742; x=1746451542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xoVsMrgvrhFFbx42G/dmm9QWGqviT/wAXJ3BloytIc=;
        b=oSzmnzljfbXNEqKJIdyV05l1+Bi/Jpty7brRZC6cwpmk1chsOpkKQKWYXdue/+/SjG
         WUHu80cUzYeWz0O0f2G51W0M2f2v+SINOZMb4UEW9BGWoc0nukmmV6QKSStK8COldk8j
         vZUBGEkeeof+6kz7txrQmv+HT0Jer7zPacMJ6MSEjo3HFV9fNuSL3Mrw5As3fOFYLT4P
         AykYINRcRKcX3nIGNcaXmLTREhVDCyqKGgiwKYQG6du3Hr6xoRGBBlt1chHksPgnuDCC
         8ITduSaehnQGCWml4sKhn00z/NFswmUuBW4+rq5TX9UhsyE81GdOtx99GZ4wE8xPUQT2
         9ltg==
X-Forwarded-Encrypted: i=1; AJvYcCV2dKUlHp23b8bbZni8c4EF+jLmar8zh9Jlr1ZGSVqscvqlAG/SSx4TySXh8tA6xxAWQ7I8SJ6gZ6QtVXM=@vger.kernel.org, AJvYcCVyUqaKJV1MPiTGAl157Qhb49DcVk520hgps7lN2XahFB9FgZKn2gjdmXGFLyhw7yRBFFmW8glYoR2q8Rs=@vger.kernel.org, AJvYcCXCE7GWREra+/6f4UJK38UYpC1NAigchrL5q1zY9ntKr0U1Jz1XQANsCE2Mi16NbSmhSCom2TcKs2LjC5fKXpuh5AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu6GqwdVvnDwMtrhX9cd1OA1G7FDVG7bMuSiZ6TUN2/yIOk6nw
	SJ3VJeSfWXBA7UsCLyG/SC8KrdY59UB+MkUXC35dGGT26cgXgM2yv2fxYrMRtDxI+aOfy5iN7q7
	6KOosBkTnQ6QDP6Si4Ucw3Ru+QEQ=
X-Gm-Gg: ASbGnctZ8j0WwbzrTunKloTeVYPWPDCZsOXBb1+c97ejbC8OBHwpMr0s1kN3aHf6vcG
	Cq5v8uHHPG23vfG+EWygIQrM2n1l+RrHGhS/ehNKzt3442IkD/tcTpuKqlQjfCvxY8K3S6A2S/r
	CQVbLSqHwv/jar4oJnR3+5Lcs=
X-Google-Smtp-Source: AGHT+IHP+XoLq70CCNPxMMVvFPQO03PJd4K94K+CxerT9d7DnToAI7oPR4FF2pTYJ7YBXqf3f7GH7vn8ELflwvepBU4=
X-Received: by 2002:a05:6000:2911:b0:390:f2f1:2a17 with SMTP id
 ffacd0b85a97d-3a074f4868fmr9643443f8f.53.1745846741562; Mon, 28 Apr 2025
 06:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428095208.99062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428095940.GE3371@pendragon.ideasonboard.com> <CA+V-a8taFdmCgiUAwmDG93OA+P9UH-FEw3PeMFW4sLQ2KPnEPQ@mail.gmail.com>
 <20250428112516.GG3371@pendragon.ideasonboard.com> <CA+V-a8vDDLZ422nZds7pEEW+gZ1n7s-U3eJjmG8DsOJT9uJygQ@mail.gmail.com>
 <CAMuHMdVqQqg6oK_oxTNWbPbPues38BH+W125Ts5UEATXT8LWmg@mail.gmail.com>
In-Reply-To: <CAMuHMdVqQqg6oK_oxTNWbPbPues38BH+W125Ts5UEATXT8LWmg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Apr 2025 14:25:15 +0100
X-Gm-Features: ATxdqUHfjxrEs0TrSiZxJAc6iEf1g2oE8bq_kZNotWCKNeE2HSSkky6f_djj_3I
Message-ID: <CA+V-a8t1VGau1WbS4BtCdC-koZ1if8MfrG4Q3JGCrxkH9uLTrQ@mail.gmail.com>
Subject: Re: [PATCH] media: renesas: rzg2l-cru: Simplify FIFO empty check
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Mon, Apr 28, 2025 at 12:36=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 28 Apr 2025 at 13:33, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Apr 28, 2025 at 12:25=E2=80=AFPM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > On Mon, Apr 28, 2025 at 12:17:54PM +0100, Lad, Prabhakar wrote:
> > > > On Mon, Apr 28, 2025 at 10:59=E2=80=AFAM Laurent Pinchart wrote:
> > > > > On Mon, Apr 28, 2025 at 10:52:08AM +0100, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Simplify the `rzg2l_fifo_empty()` helper by removing the redund=
ant
> > > > > > comparison in the return path. Now the function explicitly retu=
rns `true`
> > > > > > if the FIFO write and read pointers match, and `false` otherwis=
e, improving
> > > > > > readability without changing behavior.
> > > > > >
> > > > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > > Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mo=
untain/
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renes=
as.com>
> > > > > > ---
> > > > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-vid=
eo.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > index 067c6af14e95..97faefcd6019 100644
> > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > @@ -348,7 +348,7 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev =
*cru)
> > > > > >       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > > > >               return true;
> > > > > >
> > > > > > -     return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > > > > > +     return false;
> > > > >
> > > > > So the function always returned true. This seems to be a bug fix,=
 please
> > > > > add a Fixes: tag. The commit message should also make it clear th=
at
> > > > > you're fixing an issue, not just simplifying the code.
> > > >
> > > > No, the function returned true only if the pointers matched;
> > > > otherwise, amnfifopntr_w =3D=3D amnfifopntr_r_y would return false.=
 I was
> > > > simply removing the repetitive pointer check and directly returning
> > > > false at the end of the function, as we can be certain at that poin=
t.
> > > > Hence, I did not add a Fixes tag. Am I missing something?
> > >
> > > Oops, you're right, my bad.
> > >
> > > > > Personally I'd have written
> > > > >
> > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video=
.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > index 067c6af14e95..3d0810b3c35e 100644
> > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *c=
ru)
> > > > >         amnfifopntr_w =3D amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> > > > >         amnfifopntr_r_y =3D
> > > > >                 (amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> > > > > -       if (amnfifopntr_w =3D=3D amnfifopntr_r_y)
> > > > > -               return true;
> > > > >
> > > > >         return amnfifopntr_w =3D=3D amnfifopntr_r_y;
> > > > >  }
> > > > >
> > > > > but that's also a bit of a style preference.
> > > >
> > > > I wanted to keep this consistent with the rz3e_fifo_empty(). If you
> > > > prefer the above I'll do that in v2.
> > >
> > > Up to you.
> > >
> > Thanks. OK, let's keep this patch as is to stay consistent with
> > rz3e_fifo_empty().
>
> rz3e_fifo_empty() has a rather complex conditional expression.
>
Hmm yes.

> This one will probably be converted to a simple return statement by
> a random janitor, soon after its introduction ;-)
>
Agreed, are you already working on it?

Cheers,
Prabhakar

