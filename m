Return-Path: <linux-media+bounces-29210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A55A78B31
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 11:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 021E27A408D
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 09:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81711E8358;
	Wed,  2 Apr 2025 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKTP0IeI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2A62356B2;
	Wed,  2 Apr 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586630; cv=none; b=hRngIFmROtQeMLkxuqQrOCKqM/oCDAXkXVKP2+8USoO904ViGy7jPFXvrknDIMB+hQD7iO6Fys8Ky4r45fJ5NqaOUqy1KzSRru9i8mAOuqrc3IK7pq0bmG/bNXVTP3Bn+ySEwmfMPh2BYR91MfMzxxkZM3cubVjl3N12K8U8dVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586630; c=relaxed/simple;
	bh=t3mFS6OckXH3Afml9ZCKG2xKNNiK36cVOhzvEgyHPfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQEUpgXrcoLAHOC55VGcaAbhvjLOtmoDfREB1qsYy+Jnty2/cyGSlQuC0SC5ap9bPzMhSRMMXTq/bASjA7o3LtgTtQiSaRASaIZhofc4hBUqelHC3j3AH3h83EfOG3WxCYEZrrzlmYMXAb97p8mXTDcGsIkYya81pvX/VBbLPA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKTP0IeI; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523fa0df55dso665103e0c.1;
        Wed, 02 Apr 2025 02:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743586627; x=1744191427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMeq7yNGUEta54mjsa1NjWFHIosEVWhv5GnDy/WQ2ys=;
        b=HKTP0IeICVz04p7A8CmPiLRPmJS6ltSKBtiqb1Qavi+oMZdcN1Sj+riudI4ZEyRL2F
         MC86/ohk/tPXBzkMKv9VonRq8rN54u+ayJF9wqUZc4EG1cfwd30I69Z+mKLTLeISJ3FG
         kmmzDoAluHs2iOup0BrwbnxkXDowBAzfhf/CJs0RVUcLgH2PXBz88z5Yullq7JpYOiRq
         fwjvwUvn9ZIrvSOSccw8WUP3xioJsUmt+Ur0OI8G3t5AQlK9B7emshNElurNLJ1bsyK6
         EYVQVYEb/7X/sAgIB/ybFL8ylpw7Y8ndsgOVNjn+MI9c0gbx0mq7DqesEv5O9bxfjjy8
         4d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586627; x=1744191427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMeq7yNGUEta54mjsa1NjWFHIosEVWhv5GnDy/WQ2ys=;
        b=FsLpWMQElNVT28XthFCIetKhBm1VmsyM8DQeEUiMwa3G6fBkvDeM+bjzntV1ZJ20Wc
         jT9x2g5Mj7EaHsqG2kxEZyYeN8zQApMFWmfaazXs7bF0XAXKB5FTwC4awxaMfNmq/ja1
         b2VFe7b00VKw7MN5GniP4eyFpJ8MAhAxAImuEfTGex+dxchoUCQi1rKCKDje/1pXxXqw
         93KqAXZm6HqzSAUWhfYDOibK1MsLIUajrAuPxUAUxriyLPiQ8OeWsgS5ejSWiuwt29B/
         Q8rbxQDOxDsgl9CpjPTWTPW/kBDlpVa5oWai954V678UguGuaCOx831ttEBt5+tm0xro
         pdXA==
X-Forwarded-Encrypted: i=1; AJvYcCV11RhchLiBZLIBi7m9j+gxTqfC7aKtWgpXudbJkefy3l5ifsp3uNAmAYYeRYHb8fz0pnYSaquyVHj3@vger.kernel.org, AJvYcCVTaBgY7iKFcDWxZ+S7MAzk16g58JrSpkOA1dtCJdd/fcdDa3HF2jGoQ07+5qgW2paTfts2g811oIJHbGh3nuNtA1A=@vger.kernel.org, AJvYcCWTtkp5gNP7BTb8ItoErr/zoMhZGppijU9xCIpSZfKbFKrs7Wo59jwZpWfTLNwq2FDEbSFwACIWBZw5bkiF@vger.kernel.org, AJvYcCXT/D5sJ5JmpLpPWVC+T/N7ZLf+Ybvga0U7ifmEjlD1nYMbd1kCKZU7BgM+qDpU7afUTlk+Asxs5eh9mv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoCvqH5mrkCvAuvVngjLDwDJ58pnWIldhBAr0H87HG52D0R5EQ
	tW8wOnyYPfNeNecgjgHbmJ+mRWiBwW7rnbeAb6PQs/4hVIgyRzssZQs9Rrn7BMRhzuKMXStsrvy
	Ape7pWN11Z5IYmp1mBbJchbPPI7I=
X-Gm-Gg: ASbGncvNuy5RhyehomAesKGjFc+b18ekZht6M5D+dnW3pTtrQa083kKgksS/NE9YfHg
	pIx87RMDR1Nhr1BHEqZrLIz/JN8BUhDeErdzFd7H8VcROofj5m0EmmqjkZNJYhFd1ziT4nBzMZJ
	HIV/06iu7j51SgxdZW1AFAHLLVdNyqv+Wgp1UXXcFXDF33673tKZyysbMGpWc=
X-Google-Smtp-Source: AGHT+IGuw/XBD+Ekqv7DghryCmw+w72lKEox3CENDSVzgiwNwzK/HLvoytQXUTtB9ZeiwxtlbLRh29tHI9leOwYLw0c=
X-Received: by 2002:a05:6122:888:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-5274e8c2928mr590316e0c.0.1743586626869; Wed, 02 Apr 2025
 02:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
 <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com> <20250402092618.GH4845@pendragon.ideasonboard.com>
In-Reply-To: <20250402092618.GH4845@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Apr 2025 10:36:40 +0100
X-Gm-Features: AQ5f1JoeUkVJpakNsYw43BX9_QLPBh8T7CiCQojtIH3S8OJBigglcLSArnVymr0
Message-ID: <CA+V-a8uQBqqMPMwtx337thXfQ1ai-_j5mq38GEaFf_+my6223A@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Wed, Apr 2, 2025 at 10:26=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 02, 2025 at 08:25:06AM +0000, Lad, Prabhakar wrote:
> > On Wed, Apr 2, 2025 at 9:20=E2=80=AFAM Biju Das wrote:
> > > On 02 April 2025 08:35, Lad, Prabhakar wrote:
> > > > On Wed, Apr 2, 2025 at 7:31=E2=80=AFAM Biju Das wrote:
> > > > > > On 28 March 2025 17:30, Tommaso Merciai wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which h=
ave a
> > > > > > CRU-IP that is mostly identical to RZ/G2L but with different
> > > > > > register offsets and additional registers. Introduce a
> > > > > > flexible register mapping mechanism to handle these
> > > > > > variations.
> > > > > >
> > > > > > Define the `rzg2l_cru_info` structure to store register mapping=
s and
> > > > > > pass it as part of the OF match data. Update the read/write
> > > > > > functions to check out-of-bound accesses and use indexed
> > > > > > register offsets from `rzg2l_cru_info`, ensuring compatibility
> > > > > > across different SoC variants.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renes=
as.com>
> > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.c=
om>
> > > > > > ---
> > > > > > Changes since v2:
> > > > > >  - Implemented new rzg2l_cru_write/read() that now are checking=
 out-of-bound
> > > > > >    accesses as suggested by LPinchart.
> > > > > >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinch=
art.
> > > > > >  - Update commit body
> > > > > >
> > > > > > Changes since v4:
> > > > > >  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
> > > > > >    as __always_inline
> > > > > >
> > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 +++++++++++=
+-
> > > > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++-=
--------
> > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 +++++++++++=
+++--
> > > > > >  4 files changed, 139 insertions(+), 35 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cor=
e.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > index eed9d2bd08414..abc2a979833aa 100644
> > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > @@ -22,6 +22,7 @@
> > > > > >  #include <media/v4l2-mc.h>
> > > > > >
> > > > > >  #include "rzg2l-cru.h"
> > > > > > +#include "rzg2l-cru-regs.h"
> > > > > >
> > > > > >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l=
2_async_notifier *n)
> > > > > >  {
> > > > > > @@ -269,6 +270,9 @@ static int rzg2l_cru_probe(struct platform_=
device *pdev)
> > > > > >
> > > > > >       cru->dev =3D dev;
> > > > > >       cru->info =3D of_device_get_match_data(dev);
> > > > > > +     if (!cru->info)
> > > > > > +             return dev_err_probe(dev, -EINVAL,
> > > > > > +                                  "Failed to get OF match data=
\n");
> > > > > >
> > > > > >       irq =3D platform_get_irq(pdev, 0);
> > > > > >       if (irq < 0)
> > > > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platfo=
rm_device *pdev)
> > > > > >       rzg2l_cru_dma_unregister(cru);  }
> > > > > >
> > > > > > +static const u16 rzg2l_cru_regs[] =3D {
> > > > > > +     [CRUnCTRL] =3D 0x0,
> > > > > > +     [CRUnIE] =3D 0x4,
> > > > > > +     [CRUnINTS] =3D 0x8,
> > > > > > +     [CRUnRST] =3D 0xc,
> > > > > > +     [AMnMB1ADDRL] =3D 0x100,
> > > > > > +     [AMnMB1ADDRH] =3D 0x104,
> > > > > > +     [AMnMB2ADDRL] =3D 0x108,
> > > > > > +     [AMnMB2ADDRH] =3D 0x10c,
> > > > > > +     [AMnMB3ADDRL] =3D 0x110,
> > > > > > +     [AMnMB3ADDRH] =3D 0x114,
> > > > > > +     [AMnMB4ADDRL] =3D 0x118,
> > > > > > +     [AMnMB4ADDRH] =3D 0x11c,
> > > > > > +     [AMnMB5ADDRL] =3D 0x120,
> > > > > > +     [AMnMB5ADDRH] =3D 0x124,
> > > > > > +     [AMnMB6ADDRL] =3D 0x128,
> > > > > > +     [AMnMB6ADDRH] =3D 0x12c,
> > > > > > +     [AMnMB7ADDRL] =3D 0x130,
> > > > > > +     [AMnMB7ADDRH] =3D 0x134,
> > > > > > +     [AMnMB8ADDRL] =3D 0x138,
> > > > > > +     [AMnMB8ADDRH] =3D 0x13c,
> > > > > > +     [AMnMBVALID] =3D 0x148,
> > > > > > +     [AMnMBS] =3D 0x14c,
> > > > > > +     [AMnAXIATTR] =3D 0x158,
> > > > > > +     [AMnFIFOPNTR] =3D 0x168,
> > > > > > +     [AMnAXISTP] =3D 0x174,
> > > > > > +     [AMnAXISTPACK] =3D 0x178,
> > > > > > +     [ICnEN] =3D 0x200,
> > > > > > +     [ICnMC] =3D 0x208,
> > > > > > +     [ICnMS] =3D 0x254,
> > > > > > +     [ICnDMR] =3D 0x26c,
> > > > > > +};
> > > > >
> > > > > Do we need enum, can't we use struct instead with all these entri=
es instead?
> > > > >
> > > > What benefit do you foresee when using struct? With the current app=
roach being used a minimal diff is
> > > > generated when switched to struct there will be lots of changes.
> > >
> > > The mapping is convinient when you want to iterate throught it. Here,=
 if
> > > you just want to access the offset value from its name, a structure
> > > looks more appropriate.
> >
> > Thanks, as this patch has been reviewed by Laurent a couple of times
> > we will change this to struct If he insists.
>
> How would a struct look like ? I'm not sure what is being proposed.
>
Something like below:

struct cru_regs {
   u16 ctrl;
   u16 ie;
   u16 ints;
  ...
  ...
};

Cheers,
Prabhakar

