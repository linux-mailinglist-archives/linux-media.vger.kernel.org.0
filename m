Return-Path: <linux-media+bounces-29062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751EA768DD
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098DB1883CBF
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94D1214A7A;
	Mon, 31 Mar 2025 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM6nqHs6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA2213E7E;
	Mon, 31 Mar 2025 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432279; cv=none; b=DGT5b17GXvS/GWEZan5mpIbJBH3CaaBbf3upUJOxGzy29CGsIlAcEN6WO5iXj6Q30w8uSQt4L4pdokEuDoDAGrvas3vUpsWe9KfYNGxOMUwY5zd8scMX3azcA4XZClx/R59mp8VGbSnsWT89Pq3SMLRiokEMTcHsbypivRnNRpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432279; c=relaxed/simple;
	bh=24FU/xXZnbe7mAGXh1SGvJ4MS+RF1EE2UGeGc2TEBeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFbxlJWD40yM6J4d45zms3fQDbqAMqOimPbloIv9moc6Qi8kIz9CIhU2L/2VCpDI9mLpLcrVmSftkGOQtb4iaDtZ+r5ENrm/vTqFqGSXwXi7+WJMqG7vy5KhLOHBN80XXvmVk12U4YQUabVpLAzig9waLOAdSXqbFAH7EVTB6fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LM6nqHs6; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52446b21cfdso1969950e0c.1;
        Mon, 31 Mar 2025 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743432274; x=1744037074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsWN69Oas2uHGFGCrFlrYA31acYuruS7UWixk72+7CA=;
        b=LM6nqHs6l80Z/8z64UlnQJilyZwvBgUzIBIXru2HmeRet7UKBuroM/LefJFY5vQwTu
         3o+6EtMrpu0u/5NXJdRLQmt9DrVsITaPHfebee+72lDykRaaA9Ffi6WrOxwptvS6dnmg
         nDMjdOAylSCF7nThcXOeL7zXMEvya3W8DsOI8fMFLuTKwmy0St7pNrvpZCFh8iCCVStP
         mlMFBGIHUYzZShAHuYTz+mc6U8NZJy7NRfV832Bj6nONaUUxMGusHw6GtA42ZyI3m5BM
         lx44YCT5HQUgClFTNOs27xT3kFS8PSYb79X/D0BV5qmADCnJpBldrcROctW/9pEbLXQH
         ulOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743432274; x=1744037074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsWN69Oas2uHGFGCrFlrYA31acYuruS7UWixk72+7CA=;
        b=bTtrKj6qnWSiA53j2eGDzjawRlTuUCLpAyz2L3KkgCalP0sToHJyTDzJhGZn5lZBOH
         /VEKjeh9HYj/tvX6vmHd+PxWJVQdjce19hDNh0i6p6bfGzliS+8l84lMSExfQNtqgk2W
         7T8lh8p02vMM7vHNeiSfDgg+mNljF4ErcfWjyU6pjotSJcMkP0EPnTCcd3XkoRmMEhLG
         H5cRy+LDpwcwBsb0ZfSa7P9lifa/ypDUgaMoN3bh78Yc+kwlefHa3ZZuX1xEQctGYkGb
         1f5OCCWp2rHq6Jmv5jjbwgGYAg8QnQ/PKvO0czYjzFQsA5PvHT/Q37pg1Ovz5PhME6cN
         ev7A==
X-Forwarded-Encrypted: i=1; AJvYcCVbP0xDhqgkhjCuDXEAaUS86iVIlSOw6jJyt/hF/qbK3WyyhdIwAUqEArI0rw3bA2kmmlQC7EMLjkg3Rpk=@vger.kernel.org, AJvYcCVuxccrXmzF37vQ3yOq4qHf+m3B6VQkS483Sjfy9XFFJAKbrW2tmqr2gmChw+5gU9Q5/9nrNyUlpuHT@vger.kernel.org, AJvYcCWaormJnKRsCn4CoDMDzExUfhvFqRbdgOuyk4QHAea7ZmefyqTUwJaT4PCwD2kqZADiA9BhPpvioImX6yPN@vger.kernel.org, AJvYcCWnRmuppU2kGwOvT2bIyvAOFrx6iwIEYi99XTRw2Rug8geD/1llp3qPPMkOmlTQfaqctoEZcSGzTDgF@vger.kernel.org, AJvYcCXqoqOVxQ6SBb7OGFE+CX7QFh05+ZvgwMN9jL5cDdkw82CvMtrjosIraKCoOFI5s5IeO8H1mESae9+WbKvDsoxn89s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhR7ovvWMGJxQHZWB3twQE+7RoAxHhGLJmR4YWVg4sVwebmcDN
	ZNdP0xfzIqaMmjbOXU/QhpaDcSqQnEC7/GK7EKIw9gJQpT2J6GOnC3pENJ+muy2lA7xDZn0VzoG
	BJj6FYj/4DQNQ2RZ1cHn7MblHDKQ=
X-Gm-Gg: ASbGncsuUgynI4MD7tCHh8+J7QKbkcsSGEdqq7DVOtalsRZQpGImi5PDlb9of+tCwVp
	uHzy7AIr0RHZQlZFqD7TOtLMoi1pygtGE0qNYfCsn8yTTsSpwUneSniUROkNX4ZMfZx+9y4m9U8
	yrGbwa+9ERExdd1dCphzsI1DUTAw==
X-Google-Smtp-Source: AGHT+IGwzcTATzbSWO1JHZUfHWlcz6iufKFTXtwDV4cYQgVRAPm7Eci+hXIxgV/7/G05UnDRHAAek7P3SI/p8EKcgh4=
X-Received: by 2002:a05:6122:8b8a:b0:526:1dde:c5 with SMTP id
 71dfb90a1353d-5261dde014cmr4560583e0c.0.1743432273917; Mon, 31 Mar 2025
 07:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113463B37FE6B1AAE8CF0F51F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v0K_tWA=LnyHDptoBjtgPHSbgwpJp4L1rw4Uv6KC+-JA@mail.gmail.com> <TYCPR01MB11332F548F3770F0C70C9051A86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332F548F3770F0C70C9051A86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 14:44:08 +0000
X-Gm-Features: AQ5f1JqlkL2bTcSmgjhDRL8U7yExf7T5Y6DjBvt5tncmTVMGQonwHDocuYn9BM8
Message-ID: <CA+V-a8tVQaDBzLXVJUonmV6eW3i_KLTTjVm3L0Kf2A1xrMoUHQ@mail.gmail.com>
Subject: Re: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Mar 31, 2025 at 3:14=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
>
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 31 March 2025 14:59
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Andrzej Hajda <andrze=
j.hajda@intel.com>; Neil
> > Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; =
laurent.pinchart
> > <laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; J=
ernej Skrabec
> > <jernej.skrabec@gmail.com>; David Airlie <airlied@gmail.com>; Simona Ve=
tter <simona@ffwll.ch>; Maarten
> > Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@k=
ernel.org>; Thomas Zimmermann
> > <tzimmermann@suse.de>; Rob Herring <robh@kernel.org>; Krzysztof Kozlows=
ki <krzk+dt@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; Mauro Carvalho Chehab <mchehab@kernel.org=
>; Kieran Bingham
> > <kieran.bingham+renesas@ideasonboard.com>; Stephen Boyd <sboyd@kernel.o=
rg>; Philipp Zabel
> > <p.zabel@pengutronix.de>; devicetree@vger.kernel.org; linux-kernel@vger=
.kernel.org; linux-renesas-
> > soc@vger.kernel.org; linux-media@vger.kernel.org; linux-clk@vger.kernel=
.org; Fabrizio Castro
> > <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev Lad <prabhakar.maha=
dev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data s=
upport
> >
> > Hi Biju,
> >
> > Thank you for the review.
> >
> > On Mon, Mar 31, 2025 at 1:38=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 30 March 2025 22:07
> > > > Subject: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data
> > > > support
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > In preparation for adding support for the Renesas RZ/V2H(P) SoC,
> > > > this patch introduces a mechanism to pass SoC-specific information
> > > > via OF data in the DSI driver. This enables the driver to adapt dyn=
amically to various SoC-
> > specific requirements without hardcoding configurations.
> > > >
> > > > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to
> > > > the one on the RZ/G2L SoC. While the LINK registers are shared
> > > > between the two SoCs, the D-PHY registers differ. Also the VCLK
> > > > range differs on both these SoCs. To accommodate these differences =
`struct rzg2l_mipi_dsi_hw_info`
> > is introduced and as now passed as OF data.
> > > >
> > > > These changes lay the groundwork for the upcoming RZ/V2H(P) SoC
> > > > support by allowing SoC-specific data to be passed through OF.
> > > >
> > <snip>
> > > > +
> > > >       ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, =
0, 1, 4);
> > > >       if (ret < 0)
> > > >               return dev_err_probe(dsi->dev, ret, @@ -729,10 +750,1=
2
> > > > @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
> > > >       if (IS_ERR(dsi->vclk))
> > > >               return PTR_ERR(dsi->vclk);
> > > >
> > > > -     dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst=
");
> > > > -     if (IS_ERR(dsi->rstc))
> > > > -             return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> > > > -                                  "failed to get rst\n");
> > > > +     if (dsi->info->has_dphy_rstc) {
> > > > +             dsi->rstc =3D devm_reset_control_get_exclusive(dsi->d=
ev,
> > > > + "rst");
> > >
> > > Maybe use devm_reset_control_get_optional_exclusive by dropping has_d=
phy_rstc.
> > >
> > As the dtbs_check doesn't enforce this,  `has_dphy_rstc` flag was added=
. Recently the same was done
> > for the CRU [0] based on the recent comment received.
> >
>
> RZ/V2H has "arst" and "prst". So, If you add "rst" for RZ/V2H then you sh=
ould get dtbs warning, right?
>
No we dont [0], note DT binding is written based on the recent
feedback received.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2025033021=
0717.46080-7-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

