Return-Path: <linux-media+bounces-29196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B085A788E1
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 550977A4CE7
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 07:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF9E23314E;
	Wed,  2 Apr 2025 07:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXgDK0Jx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE22E336E;
	Wed,  2 Apr 2025 07:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579355; cv=none; b=ck30fgoamnMz6nqNFxfGldWuJFenHgD4F1QnBjfGJLAXXwYVJ0SVH4HQlTSuF8lNtT8U5kizNHUeiM99Q9Uv8sYslisIHUvoNrYaydXvVYR4aHXBQ8SEQa8bP1D0Rsuks4w4uJrolCL0rk+FoUeg0JD8p7yg4xhov0UYkLhE9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579355; c=relaxed/simple;
	bh=UdkrDqGVQENJ2NUUgndJpnHFPzT34y+CT5Ow52zPIog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=todXTYC1yDL3lp7ZgwFScl75iDbZnpLMU4aSUH9EUj1bw9nBlL/5oPLNkOigZDmUPHqoMrv3ij7ewxSRNJYr/BBvWuB3w1VE13XvdN4RU7Y/SbV2nfb5wWTFYQjm2ZT2pa5QT/cnkMvGgvXlZAxFIJxl8niHkh+BxsKp0sYApzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXgDK0Jx; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5240a432462so523162e0c.1;
        Wed, 02 Apr 2025 00:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743579352; x=1744184152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT57pCrBJh8f0NhZW8jlqS4usCi8ONUHwiXdsxXYTRw=;
        b=OXgDK0JxSVJlTVe7D5WLo4J6khhyWXzYDRNXo0nEJSt+kxNNOPG/WHE6Vpp6pmb67n
         w+YMtF2ZDL5ZFj8kwbzmr5fI8tQGJgt2+OH+2XoOo4W4mx5yFyYFyIb/njHiDJ+Uiyba
         ZA9EMGQuQMtO/9ZrEsbzRSHNBXMoYPKn9LESVsAVBPEOjsuqPLlVTK0186XASRNuTHX3
         TsQkaLAcMgpddzxJkViDq0zNPnmsF9+yQ1H+vV6gkuy49mqbTtobrQgqOuEbpd505gae
         b3SvnRlcOxHDEPJ9t8kv4b+iWqRTtSB7TS03gQ4tKCBQWvknfOfyvfKoaOlx5NP9Z2jI
         JeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743579352; x=1744184152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT57pCrBJh8f0NhZW8jlqS4usCi8ONUHwiXdsxXYTRw=;
        b=jUcl14W7/Z9vKFVjCUaI0rqRvtlK21gzVUU4SLMoanWb26qEXdw9NZ4XxTWnqtQ7MV
         g5Yrp6R7digPmQppt3gVl1bgvNGGo3FNPw577w7/dAaJG2VG7e6XfaSjsRhnUhYInROU
         5oedWBFnkoToNHg1hlpPntdPXPl2gCJehmUeY4usO3nlaax7tmjcjodCfxlyhpxA6M6t
         wfb9RS4udvIBYEStw3oTgzVUUmZmxFzizUkG3E6vrPeWBuQAzNzVvfXJ9v2hN/ggmz/8
         lc40quKuFysbn4A5Y0+8geBZTsRndGpnNHgsvedIWW4pZXXZnfaFC5ABXCjR5gNIbNEX
         cDlA==
X-Forwarded-Encrypted: i=1; AJvYcCUWzFsyMFt0q5Yr8UesAzz1sN6JRuT0cc5cPOlYV7QYaiIQWct9z4otG0x7yx0a5Lk9QAzK/FuPsTv+@vger.kernel.org, AJvYcCUjEoKrTaWMoANS5kdsYt2zJzNqv+Fj5T0m2NCPcOg1bVE25QVMcKh7kYIocAujt9syS2JfgGY9MUAe0TT8@vger.kernel.org, AJvYcCW6sXsyhxdu5QJouN0ltiznQgwtScqaKsK/618NLPDvaBzlPa4YUC6fGwuXzA1zLQl7jaY9DQCMrvefKWsB0ib700c=@vger.kernel.org, AJvYcCXmMJoKaOPbw8W0DPNFDhDUO19ILRjiGygSXZrRx9gM1PUvJjQxmt5Y9xP8ckRcPZml8kv2TKEnWJG4Sz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0oaQnH1kfwYB6RZWwpkUD+3w8SLgrOAH61ZyHpqjcxYPluuB
	UFiVnbfHT2pDXsUqlV96nZIijAW3ELwJpZHZqaJhv2fPZW0WR8Q8eFK3Gb4x09hMZNBF5ndbXhx
	m6rTpeTSGTKzfKH01U9zk0dmigpY=
X-Gm-Gg: ASbGncuHtEBFYangKSN2nkO7XLZ2TU8DGB2Uaz3fbha/Xh7yLJyK0qmR7iqctitmrwQ
	5d5D+cMqP/gkJKqu3YjISctfFGc88Kf/7miHWldQV1IqO590FBbAJ52Rtb7lm05c8zp2i1PG3pS
	/VKizGwHwwaae6WUrfEGdu0emTwQ==
X-Google-Smtp-Source: AGHT+IEdTYC0s4S3VpURZQ2f7vxFy8vBgDmOAWMr3zm4bj62F+hU24dApE13GC9px5VsZNFNyJK57nY1IsAhwoyVFKE=
X-Received: by 2002:a05:6122:17a0:b0:524:2fe0:61bc with SMTP id
 71dfb90a1353d-5274ea87ce7mr373480e0c.5.1743579351814; Wed, 02 Apr 2025
 00:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com> <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Apr 2025 07:35:25 +0000
X-Gm-Features: AQ5f1JoOTAY_FuDrd8gbd4_dnz012avh5auQ3Llx2ni7UijsTWeIv3OKEmDiFsk
Message-ID: <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Wed, Apr 2, 2025 at 7:31=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Tommaso,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 28 March 2025 17:30
> > Subject: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping suppor=
t
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a CR=
U-IP that is mostly identical
> > to RZ/G2L but with different register offsets and additional registers.=
 Introduce a flexible register
> > mapping mechanism to handle these variations.
> >
> > Define the `rzg2l_cru_info` structure to store register mappings and pa=
ss it as part of the OF match
> > data. Update the read/write functions to check out-of-bound accesses an=
d use indexed register offsets
> > from `rzg2l_cru_info`, ensuring compatibility across different SoC vari=
ants.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > Changes since v2:
> >  - Implemented new rzg2l_cru_write/read() that now are checking out-of-=
bound
> >    accesses as suggested by LPinchart.
> >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> >  - Update commit body
> >
> > Changes since v4:
> >  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
> >    as __always_inline
> >
> >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
> >  4 files changed, 139 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index eed9d2bd08414..abc2a979833aa 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -22,6 +22,7 @@
> >  #include <media/v4l2-mc.h>
> >
> >  #include "rzg2l-cru.h"
> > +#include "rzg2l-cru-regs.h"
> >
> >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_=
notifier *n)  { @@ -269,6
> > +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> >
> >       cru->dev =3D dev;
> >       cru->info =3D of_device_get_match_data(dev);
> > +     if (!cru->info)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "Failed to get OF match data\n");
> >
> >       irq =3D platform_get_irq(pdev, 0);
> >       if (irq < 0)
> > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_devic=
e *pdev)
> >       rzg2l_cru_dma_unregister(cru);
> >  }
> >
> > +static const u16 rzg2l_cru_regs[] =3D {
> > +     [CRUnCTRL] =3D 0x0,
> > +     [CRUnIE] =3D 0x4,
> > +     [CRUnINTS] =3D 0x8,
> > +     [CRUnRST] =3D 0xc,
> > +     [AMnMB1ADDRL] =3D 0x100,
> > +     [AMnMB1ADDRH] =3D 0x104,
> > +     [AMnMB2ADDRL] =3D 0x108,
> > +     [AMnMB2ADDRH] =3D 0x10c,
> > +     [AMnMB3ADDRL] =3D 0x110,
> > +     [AMnMB3ADDRH] =3D 0x114,
> > +     [AMnMB4ADDRL] =3D 0x118,
> > +     [AMnMB4ADDRH] =3D 0x11c,
> > +     [AMnMB5ADDRL] =3D 0x120,
> > +     [AMnMB5ADDRH] =3D 0x124,
> > +     [AMnMB6ADDRL] =3D 0x128,
> > +     [AMnMB6ADDRH] =3D 0x12c,
> > +     [AMnMB7ADDRL] =3D 0x130,
> > +     [AMnMB7ADDRH] =3D 0x134,
> > +     [AMnMB8ADDRL] =3D 0x138,
> > +     [AMnMB8ADDRH] =3D 0x13c,
> > +     [AMnMBVALID] =3D 0x148,
> > +     [AMnMBS] =3D 0x14c,
> > +     [AMnAXIATTR] =3D 0x158,
> > +     [AMnFIFOPNTR] =3D 0x168,
> > +     [AMnAXISTP] =3D 0x174,
> > +     [AMnAXISTPACK] =3D 0x178,
> > +     [ICnEN] =3D 0x200,
> > +     [ICnMC] =3D 0x208,
> > +     [ICnMS] =3D 0x254,
> > +     [ICnDMR] =3D 0x26c,
> > +};
>
> Do we need enum, can't we use struct instead with all these entries inste=
ad?
>
What benefit do you foresee when using struct? With the current
approach being used a minimal diff is generated when switched to
struct there will be lots of changes.

> > +
> > +static const struct rzg2l_cru_info rzgl2_cru_info =3D {
> > +     .regs =3D rzg2l_cru_regs,
> > +};
>
> For a single entry, why you need struct?
>
This struct will grow further, see the later patches.

Cheers,
Prabhakar

