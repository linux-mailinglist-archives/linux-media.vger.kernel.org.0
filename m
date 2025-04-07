Return-Path: <linux-media+bounces-29556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B28A7E7A7
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 19:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E42203A7CD4
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 16:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387B8215F50;
	Mon,  7 Apr 2025 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YULG6aPE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77520A5FC;
	Mon,  7 Apr 2025 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044962; cv=none; b=PReoetPgkl1UnbGds3AHpwfpECJqDeC07DdMDQyGiVdVHzrxEpdTme2gXEduUMTkJPAm7v7X9j9o518MpEbOz4JHby7SobYKP3WtJevtpGa5O4SoMdHM5+xe1YwzhzajsjfoalslXm59KY28uIHVCxQVQYyH8h5jn2c/VpL2LOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044962; c=relaxed/simple;
	bh=ycKZWL3iqPFb9bCn+6AZQXHefn1xucbuceSUbwq8nfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZwp2mIeVDr75tzzC/iEyUIA6OAHFawaRpEhD8pdiDuAmWN1N66+g18In9sRX6QnVNPv6YpxhTCqoyCANBRW4lkL5MvP/+Pr+Gv27eACl7Ks4bDbzzQ0AMCYV9GzlAufv00eF/QkjB8cBhzoc96sZFxwqrlxt0aL1H49Fqi0v/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YULG6aPE; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso5647346e0c.1;
        Mon, 07 Apr 2025 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044959; x=1744649759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKKPtP1Ze4dcUvLG7meGKWMsO5xW3JTdudD+gUOkK+E=;
        b=YULG6aPEinhrTUuyacL5nIHfjZ+7CawH79imJdVToBzNY+GEreJnSPdwX+D6mv3mME
         B8E+n93+AEOXgafPAYIy30rUPW95EkXAcGWFJCN/ZoGc9gEF08rV0Z0YCgmhwwezAh8K
         IZUeoqGY9g9PoxB6g3fjWFz6+kyc7b31Jf3IcXe7Ww28XQ6aH81Q4Rksro8mrnKbT4+E
         RX2tC/gL56jit/9mtXrWQRbZUPPvCzwaik3Wdai3AUCC6ppgX6YdsBcySJG0pEwqfwzs
         RYqGralieBscNkqQbKv1hAu9X8GgFcIx43mGMRBoRS8YJP58gl1AUXA6H44la+Rhzl5m
         Httg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044959; x=1744649759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKKPtP1Ze4dcUvLG7meGKWMsO5xW3JTdudD+gUOkK+E=;
        b=mXqIvxJFiP/qzn+AH3e+Jn1QRvP8eCOaCq4C5KhSiqHdywc6WmCUt7WrrZDxXV5tv1
         RcXir5zIDGzIENCOvphrnUjkfVy3b5KK08u2IL1V3vI/3VdOwH9nnfpoP3FEQqt5kgEt
         4UOWEQllypcxuvQRQDEVsrUK5OWvsonmadHXy8IbFM9pVPv1ei5D8bSkS/Cdy9sqLMGj
         37HP9fT4zy9oR8OhR6auHCpqmM3GpuGJYETZilD0C5MGEd8jD6zK6WS9b/rCl2LP0831
         hWl1EkC8HLP9uB68ynbyKx2btj+NjgvUlDBl+EQsRFlrCxRoEVCylm3lhFNteBxT60qq
         SHfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU731Y+0RPcqAIt07c39FovMQAp0wQaqpv9acZy7z6sWS+5r3O0qtTKXcR7WFOFIOEsyM5JBlaOcHxvrlcDdLyDkfY=@vger.kernel.org, AJvYcCVZHql5XCHshiWe6th42XPEi1QuvK1v0sOgsYNaSB8D0zoqcfKfQc4wDTHB4fV5o2fzl8nBBtEqLp1cLPZr@vger.kernel.org, AJvYcCVndgrqW8q9bi4R3S17qH6RD6k/cLsjOKSsBahjgeEGQju02HP9NG8nVSF0U6jonzw7wopkRh4Tl0pB9cw=@vger.kernel.org, AJvYcCXuvc/FXeaZGbG4MFy+2LVS2LvHhSZBRJm5kVx2+Z16rDwm/69CGTgsp8RPNbSkIYkPBz/vTh4JgFwB@vger.kernel.org
X-Gm-Message-State: AOJu0YyHDW7BLnfp3pZGFQW6NSPJr9+KjkdHiQ4YCFjBzw86CqW4u7Hi
	ryDFtc87+X8y2YSHPj1KnV5rCtHloS/cX11Gq9byl3iLZxzfGSUVlc7hWYmem697DF1v/O0+GWs
	Z2hMD0WdhJJ81YkNKHQ/CZF8Hvdw=
X-Gm-Gg: ASbGncvz3OtkKs33TIFr/HWsfo/L0zWutxFwJdZVHC7S0ElMFNdNnvSrqrsvtK8f1m+
	DI1VhDbZrc3eRBxjOHuQKThDbFXweaR/HWdmZoJ24QEWxElBC+qcRSru9B+Vw725BaqKz+MChMw
	1UJn8Nvj1sKT4kmKxGSNJvtCC3ug==
X-Google-Smtp-Source: AGHT+IGb5XHw8eSlJLNsywMYLjPLLzyuTfahEyI0Ou0+8doEEMlJXAaMbp6QL3lgNhdGgWWo8Qk1dC9Hm9l9qwxhtTY=
X-Received: by 2002:a05:6122:828d:b0:516:1ab2:9955 with SMTP id
 71dfb90a1353d-52765d2d52amr10142189e0c.6.1744044959573; Mon, 07 Apr 2025
 09:55:59 -0700 (PDT)
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
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
 <20250402092618.GH4845@pendragon.ideasonboard.com> <TY3PR01MB11346DF814762C667FF97074286AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346DF814762C667FF97074286AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Apr 2025 16:55:33 +0000
X-Gm-Features: ATxdqUGFjhLgeZ0v2jvFG_IArxKoa4IPhtvrnXbPOV5UKmC-C1o_c6Pol7qeZKA
Message-ID: <CA+V-a8tsCEhmhNSbMMiuN6b2rJCoSekf+-e6EHr5wE5C000ZxQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
To: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>
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

On Wed, Apr 2, 2025 at 10:39=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Laurent,
>
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 02 April 2025 10:26
> > Subject: Re: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping su=
pport
> >
> > On Wed, Apr 02, 2025 at 08:25:06AM +0000, Lad, Prabhakar wrote:
> > > On Wed, Apr 2, 2025 at 9:20=E2=80=AFAM Biju Das wrote:
> > > > On 02 April 2025 08:35, Lad, Prabhakar wrote:
> > > > > On Wed, Apr 2, 2025 at 7:31=E2=80=AFAM Biju Das wrote:
> > > > > > > On 28 March 2025 17:30, Tommaso Merciai wrote:
> > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > >
> > > > > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which
> > > > > > > have a CRU-IP that is mostly identical to RZ/G2L but with
> > > > > > > different register offsets and additional registers. Introduc=
e
> > > > > > > a flexible register mapping mechanism to handle these
> > > > > > > variations.
> > > > > > >
> > > > > > > Define the `rzg2l_cru_info` structure to store register
> > > > > > > mappings and pass it as part of the OF match data. Update the
> > > > > > > read/write functions to check out-of-bound accesses and use
> > > > > > > indexed register offsets from `rzg2l_cru_info`, ensuring
> > > > > > > compatibility across different SoC variants.
> > > > > > >
> > > > > > > Signed-off-by: Lad Prabhakar
> > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > Signed-off-by: Tommaso Merciai
> > > > > > > <tommaso.merciai.xr@bp.renesas.com>
> > > > > > > ---
> > > > > > > Changes since v2:
> > > > > > >  - Implemented new rzg2l_cru_write/read() that now are checki=
ng out-of-bound
> > > > > > >    accesses as suggested by LPinchart.
> > > > > > >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPin=
chart.
> > > > > > >  - Update commit body
> > > > > > >
> > > > > > > Changes since v4:
> > > > > > >  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
> > > > > > >    as __always_inline
> > > > > > >
> > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 +++++++++=
+++-
> > > > > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 +++++++++=
+---------
> > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58
> > > > > > > ++++++++++++++--
> > > > > > >  4 files changed, 139 insertions(+), 35 deletions(-)
> > > > > > >
> > > > > > > diff --git
> > > > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > index eed9d2bd08414..abc2a979833aa 100644
> > > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > @@ -22,6 +22,7 @@
> > > > > > >  #include <media/v4l2-mc.h>
> > > > > > >
> > > > > > >  #include "rzg2l-cru.h"
> > > > > > > +#include "rzg2l-cru-regs.h"
> > > > > > >
> > > > > > >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct
> > > > > > > v4l2_async_notifier *n)  { @@ -269,6 +270,9 @@ static int
> > > > > > > rzg2l_cru_probe(struct platform_device *pdev)
> > > > > > >
> > > > > > >       cru->dev =3D dev;
> > > > > > >       cru->info =3D of_device_get_match_data(dev);
> > > > > > > +     if (!cru->info)
> > > > > > > +             return dev_err_probe(dev, -EINVAL,
> > > > > > > +                                  "Failed to get OF match
> > > > > > > + data\n");
> > > > > > >
> > > > > > >       irq =3D platform_get_irq(pdev, 0);
> > > > > > >       if (irq < 0)
> > > > > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct plat=
form_device *pdev)
> > > > > > >       rzg2l_cru_dma_unregister(cru);  }
> > > > > > >
> > > > > > > +static const u16 rzg2l_cru_regs[] =3D {
> > > > > > > +     [CRUnCTRL] =3D 0x0,
> > > > > > > +     [CRUnIE] =3D 0x4,
> > > > > > > +     [CRUnINTS] =3D 0x8,
> > > > > > > +     [CRUnRST] =3D 0xc,
> > > > > > > +     [AMnMB1ADDRL] =3D 0x100,
> > > > > > > +     [AMnMB1ADDRH] =3D 0x104,
> > > > > > > +     [AMnMB2ADDRL] =3D 0x108,
> > > > > > > +     [AMnMB2ADDRH] =3D 0x10c,
> > > > > > > +     [AMnMB3ADDRL] =3D 0x110,
> > > > > > > +     [AMnMB3ADDRH] =3D 0x114,
> > > > > > > +     [AMnMB4ADDRL] =3D 0x118,
> > > > > > > +     [AMnMB4ADDRH] =3D 0x11c,
> > > > > > > +     [AMnMB5ADDRL] =3D 0x120,
> > > > > > > +     [AMnMB5ADDRH] =3D 0x124,
> > > > > > > +     [AMnMB6ADDRL] =3D 0x128,
> > > > > > > +     [AMnMB6ADDRH] =3D 0x12c,
> > > > > > > +     [AMnMB7ADDRL] =3D 0x130,
> > > > > > > +     [AMnMB7ADDRH] =3D 0x134,
> > > > > > > +     [AMnMB8ADDRL] =3D 0x138,
> > > > > > > +     [AMnMB8ADDRH] =3D 0x13c,
> > > > > > > +     [AMnMBVALID] =3D 0x148,
> > > > > > > +     [AMnMBS] =3D 0x14c,
> > > > > > > +     [AMnAXIATTR] =3D 0x158,
> > > > > > > +     [AMnFIFOPNTR] =3D 0x168,
> > > > > > > +     [AMnAXISTP] =3D 0x174,
> > > > > > > +     [AMnAXISTPACK] =3D 0x178,
> > > > > > > +     [ICnEN] =3D 0x200,
> > > > > > > +     [ICnMC] =3D 0x208,
> > > > > > > +     [ICnMS] =3D 0x254,
> > > > > > > +     [ICnDMR] =3D 0x26c,
> > > > > > > +};
> > > > > >
> > > > > > Do we need enum, can't we use struct instead with all these ent=
ries instead?
> > > > > >
> > > > > What benefit do you foresee when using struct? With the current
> > > > > approach being used a minimal diff is generated when switched to =
struct there will be lots of
> > changes.
> > > >
> > > > The mapping is convinient when you want to iterate throught it.
> > > > Here, if you just want to access the offset value from its name, a
> > > > structure looks more appropriate.
> > >
> > > Thanks, as this patch has been reviewed by Laurent a couple of times
> > > we will change this to struct If he insists.
> >
> > How would a struct look like ? I'm not sure what is being proposed.
>
>
> It will be
>
> struct rzg2l_cru_regs {
>         u16 cru_n_ctrl;
>         u16 cru_n_ie;
>         u16 cru_n_ints;
>         u16 cru_n_rst;
> };
>
> static const struct rzg2l_cru_regs rzg2l_cru_regs =3D {
>         .cru_n_ctrl =3D 0x0,
>         .cru_n_ie =3D 0x4,
>         .cru_n_ints =3D 0x8,
>         .cru_n_rst =3D 0xc,
> };
>
> You can access it using info->regs->cru_n_ctrl instead of info->regs[CRUn=
CTRL]
> This is proposal.
>
Are you OK with the above proposal?

Cheers,
Prabhakar

