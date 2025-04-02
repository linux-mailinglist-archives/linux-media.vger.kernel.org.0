Return-Path: <linux-media+bounces-29200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82408A789C0
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 10:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A35D7A4B9B
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72144234977;
	Wed,  2 Apr 2025 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKBgBBmy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806B9444;
	Wed,  2 Apr 2025 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582334; cv=none; b=chHodMYgG/wEfT/H2PwAoQHRaOZAU4tNHI/M+KVj8/NNBCxAGMRd4Jz8lVyjUZPjG+Bej3wwK+i8dAo/t8eI354i6dKc1EX2B+hWeGM+kZbd54+YiorKU8ICuVkKVlrNyYWsTSiCLB1PVXc4VlCz9w1VaZKdM1Ik3pmQzpVbVYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582334; c=relaxed/simple;
	bh=zlFt7xTIP5SFpdSJFTXcqz9RHlPuF2E34wMlfeMVbps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0RfHrvqwu+dAh2zTamrKmVB/CBxDzMmpwogMWFQxwrQ7grJy300D8dL6BNVLoj2hw1gWYwJx0KNNtT1ch1RawCWizTFtcMDoytxgMwwJ/UDmwsE4isSIFRdK6jefcKAx3QOjLNj20l+BooSe4vI7E2Z7/eKovu4DW+/5Wnr9fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKBgBBmy; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso7399904e0c.1;
        Wed, 02 Apr 2025 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743582332; x=1744187132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiMvA2R0QAEb0vWod2q2PapwyW50uwj1io/aQ/jToHU=;
        b=KKBgBBmyJDqByeATbZ7LZWzZ2VhJzBEqiiDnFalnT/FNxc+ooyajn7j1udbpaWsmNv
         KTvI8EF9FxvgOvIKdKI7Mx6FlVwEQWf+/PG8Re8us8oK4X4kmbw42Po2WHYyNczfKMgI
         lzUqg9Gj4+erzfhnN33l+NnlLPMjmpzBvhgwXsY6lzh2ugO/5YtGKR0KBDcVCaR0EZfm
         hgo84kdWIx9LBVW1RuJ5ZOq8azxm66E59h3Q0ZQvTTJxmwT5myLrrHQstJ5K1iYDKdbi
         oObNYq2rYR0dXkwDAeIUi/P9FTIrlYyDXIugoAY2KHHIfszgs3clQyHl+iBarQVJ0NNa
         NiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743582332; x=1744187132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiMvA2R0QAEb0vWod2q2PapwyW50uwj1io/aQ/jToHU=;
        b=tj8E2MEWqA3fhA0+IwNMoiahST8aIxznD77w3Jaq02JKCUxUiEt7Pc46HXDD7CVBfA
         950rpVn3nG3bmSBx9SfMkbQugV+RPtDHPYo4nxAdDjoey9ZoFcrMem0bmunUH/Q1fYHL
         kwT7VMvOW7TyGubFWvmeYG4NrU2tZgR9Trvrux82AUI7fd3q7CWT63x5nVG4YFwNTwUB
         SuG9fJE2XCKPfYymBgJuRJPkkplgEbVm8ae0/PdjuOTP59MzZr/MmExfnWT0QXifGDC7
         hOsbrzTkPrO08dHNnhncsD3KQLooyZhDxtpxERInwb9hoO6Sx9t+orG7O4vWglHcZTY3
         C8vw==
X-Forwarded-Encrypted: i=1; AJvYcCU1zCiOrR9E2Nb4tkZFUelIrtSU/qNVQMcFApgaRi+LjTeTwCDIUAKHaTbqTJkP41UGJ3ey5kcYsuJF@vger.kernel.org, AJvYcCX9VmsTJscoLE3DzLO5RfQL6jiP8O1P1E3BHfVxHyk1CshZCg34cigVA9op0f0Ya7fLGvQgjV4xWemyTjU6Zd6Y/iA=@vger.kernel.org, AJvYcCXLcNvAp5jO7Dd1eib+oi80oLjTVrVZ6HEk3mpLVfbdzpL3nxAImpsRh6a58jTnR7La9GJeJrK6N3l2oPI=@vger.kernel.org, AJvYcCXM/zEYmJ3Ryd/MdVPgmOxb83kpsOviZOFkGZ0KXp+9txqdf9sWYMMgSZt/upliZZjt1dW0xkqiHcEBBjTl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhv2/OSXb1Q3ns96F4nm3No7O1CqBUcB3tsSq7TJWaE2qGYIfl
	J1b4H/55EZovwgeQNnJmw+KpHMIeOBX83TDl3chxy954YInIZaqvN7O0UO8c5P/asPCD2cxJx6k
	+n2jk1JgIdUOWWMewOv7iybBT+ec=
X-Gm-Gg: ASbGncssRnBFQiMRI6FnUn+RyF8gCirveI4KLuVuw7HVTju6UZ5MPKX3zUnGHae23jd
	bfyVdAPzsNls+P92Ni1dVkOUBtaw7IKyc71OGk58lKgJXmShsLIwk7sNbNX/lMOjtoL3+A8Kkwt
	nTRgakniKCrhlsv095sAdhp7IIkw==
X-Google-Smtp-Source: AGHT+IGEza2bVtTwtRmSAs/NNDaZtNvXBtS/D0th8cc1Is+4i46Iq1wBx+fD6hlSsRdGu0AYMBrPkbyoT7nfU9LC3ug=
X-Received: by 2002:a05:6122:1244:b0:526:2356:f3fb with SMTP id
 71dfb90a1353d-5262356f58emr7130706e0c.11.1743582332025; Wed, 02 Apr 2025
 01:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com> <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Apr 2025 08:25:06 +0000
X-Gm-Features: AQ5f1Jp8NGZw00CGd-a4AZnjRUOyrLaWrs-yExBW6FK3j1kIvzzjEC3LTPcS2Ng
Message-ID: <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
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

On Wed, Apr 2, 2025 at 9:20=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 02 April 2025 08:35
> > Subject: Re: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping su=
pport
> >
> > Hi Biju,
> >
> > Thank you for the review.
> >
> > On Wed, Apr 2, 2025 at 7:31=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > >
> > > Hi Tommaso,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > Sent: 28 March 2025 17:30
> > > > Subject: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping
> > > > support
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have =
a
> > > > CRU-IP that is mostly identical to RZ/G2L but with different
> > > > register offsets and additional registers. Introduce a flexible reg=
ister mapping mechanism to
> > handle these variations.
> > > >
> > > > Define the `rzg2l_cru_info` structure to store register mappings an=
d
> > > > pass it as part of the OF match data. Update the read/write
> > > > functions to check out-of-bound accesses and use indexed register o=
ffsets from `rzg2l_cru_info`,
> > ensuring compatibility across different SoC variants.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > > Changes since v2:
> > > >  - Implemented new rzg2l_cru_write/read() that now are checking out=
-of-bound
> > > >    accesses as suggested by LPinchart.
> > > >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> > > >  - Update commit body
> > > >
> > > > Changes since v4:
> > > >  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
> > > >    as __always_inline
> > > >
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++-----=
----
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++-=
-
> > > >  4 files changed, 139 insertions(+), 35 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > index eed9d2bd08414..abc2a979833aa 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > @@ -22,6 +22,7 @@
> > > >  #include <media/v4l2-mc.h>
> > > >
> > > >  #include "rzg2l-cru.h"
> > > > +#include "rzg2l-cru-regs.h"
> > > >
> > > >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct
> > > > v4l2_async_notifier *n)  { @@ -269,6
> > > > +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> > > >
> > > >       cru->dev =3D dev;
> > > >       cru->info =3D of_device_get_match_data(dev);
> > > > +     if (!cru->info)
> > > > +             return dev_err_probe(dev, -EINVAL,
> > > > +                                  "Failed to get OF match data\n")=
;
> > > >
> > > >       irq =3D platform_get_irq(pdev, 0);
> > > >       if (irq < 0)
> > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_d=
evice *pdev)
> > > >       rzg2l_cru_dma_unregister(cru);  }
> > > >
> > > > +static const u16 rzg2l_cru_regs[] =3D {
> > > > +     [CRUnCTRL] =3D 0x0,
> > > > +     [CRUnIE] =3D 0x4,
> > > > +     [CRUnINTS] =3D 0x8,
> > > > +     [CRUnRST] =3D 0xc,
> > > > +     [AMnMB1ADDRL] =3D 0x100,
> > > > +     [AMnMB1ADDRH] =3D 0x104,
> > > > +     [AMnMB2ADDRL] =3D 0x108,
> > > > +     [AMnMB2ADDRH] =3D 0x10c,
> > > > +     [AMnMB3ADDRL] =3D 0x110,
> > > > +     [AMnMB3ADDRH] =3D 0x114,
> > > > +     [AMnMB4ADDRL] =3D 0x118,
> > > > +     [AMnMB4ADDRH] =3D 0x11c,
> > > > +     [AMnMB5ADDRL] =3D 0x120,
> > > > +     [AMnMB5ADDRH] =3D 0x124,
> > > > +     [AMnMB6ADDRL] =3D 0x128,
> > > > +     [AMnMB6ADDRH] =3D 0x12c,
> > > > +     [AMnMB7ADDRL] =3D 0x130,
> > > > +     [AMnMB7ADDRH] =3D 0x134,
> > > > +     [AMnMB8ADDRL] =3D 0x138,
> > > > +     [AMnMB8ADDRH] =3D 0x13c,
> > > > +     [AMnMBVALID] =3D 0x148,
> > > > +     [AMnMBS] =3D 0x14c,
> > > > +     [AMnAXIATTR] =3D 0x158,
> > > > +     [AMnFIFOPNTR] =3D 0x168,
> > > > +     [AMnAXISTP] =3D 0x174,
> > > > +     [AMnAXISTPACK] =3D 0x178,
> > > > +     [ICnEN] =3D 0x200,
> > > > +     [ICnMC] =3D 0x208,
> > > > +     [ICnMS] =3D 0x254,
> > > > +     [ICnDMR] =3D 0x26c,
> > > > +};
> > >
> > > Do we need enum, can't we use struct instead with all these entries i=
nstead?
> > >
> > What benefit do you foresee when using struct? With the current approac=
h being used a minimal diff is
> > generated when switched to struct there will be lots of changes.
>
> The mapping is convinient when you want to iterate throught it. Here, if
> you just want to access the offset value from its name, a structure
> looks more appropriate.
>
Thanks, as this patch has been reviewed by Laurent a couple of times
we will change this to struct If he insists.

Cheers,
Prabhakar

