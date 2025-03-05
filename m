Return-Path: <linux-media+bounces-27567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC61CA4FA32
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165141890FC6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD81204F7C;
	Wed,  5 Mar 2025 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BG6rsdXK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C451C84D7;
	Wed,  5 Mar 2025 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167332; cv=none; b=K549D+CMEDla0Rjp+MiGlJtra8GCoHJ0WgOpZdKwTvRyemTG6jqf8LbHvsV3czg+hTDyhSNuPP0L65NyJiStN3cjqxSHlrYE+rYoBz8rv2xtmEKFMsMb0k9fCPzDo1A4sa3ZCAxMIWWUr7L2vzkhxjD1jTu9Jhhv8z5Lg6KQGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167332; c=relaxed/simple;
	bh=1ARl/21oSJVUWZJdDQ+pkxIzgUhJO8QxJvskwgilSyY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mQHl85zpAzgwtnDnVP9vqN6RCWOcNRxxJAT3OcC3U7eFOnEvC2XpmvxExxrma2Ro+XuV6GRKtjm3cgAE47ZLhAeXprtmsd6tJVyP2UMuKF36c2JWrEhKsiNkUVV4rN2bJJpxr77ECPz8JffyuvSd2tKE2Gro1sw6IpwzYdZ4xr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BG6rsdXK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80FC863F;
	Wed,  5 Mar 2025 10:33:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741167236;
	bh=1ARl/21oSJVUWZJdDQ+pkxIzgUhJO8QxJvskwgilSyY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BG6rsdXKHnhyplX7mX/9Sv24QSFawcGNJ4mPNsDGkZMYCU+N6UzCoWUGf0Z70FbRQ
	 p1ezCDDRAh6cOkia1ZpGcPIsj8dn6aenTK49eA5KBUmP0SeMollOADH4/vPEb+xXQe
	 XpxanIfovA+Gy6TkrVYWMd/auibeir2tZ8vSqhS4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250305051442.3716817-5-shravan.chippa@microchip.com>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com> <20250305051442.3716817-5-shravan.chippa@microchip.com>
Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p resolutions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com, praveen.kumar@microchip.com, shravan.chippa@microchip.com
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, shravan kumar <shravan.chippa@microchip.com>
Date: Wed, 05 Mar 2025 09:35:26 +0000
Message-ID: <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting shravan kumar (2025-03-05 05:14:42)
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> Added support for 1280x720@30 and 640x480@30 resolutions
>=20
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  drivers/media/i2c/imx334.c | 66 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index a7c0bd38c9b8..8cd1eecd0143 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -314,6 +314,46 @@ static const struct imx334_reg common_mode_regs[] =
=3D {
>         {0x3002, 0x00},
>  };
> =20
> +/* Sensor mode registers for 640x480@30fps */
> +static const struct imx334_reg mode_640x480_regs[] =3D {
> +       {0x302c, 0x70},
> +       {0x302d, 0x06},

These two are a single 16 bit register HTRIMMING_START =3D 1648

> +       {0x302e, 0x80},
> +       {0x302f, 0x02},

These two are a single 16 bit register HNUM =3D 640

> +       {0x3074, 0x48},
> +       {0x3075, 0x07},

These two are a single 16 bit (well, 12 bit value) AREA3_ST_ADR_1 =3D 1864

> +       {0x308e, 0x49},
> +       {0x308f, 0x07},

These two are a single 16 bit register AREA3_ST_ADR_2 =3D 1865

> +       {0x3076, 0xe0},
> +       {0x3077, 0x01},

These two are a single 16 bit register AREA3_WIDTH_1 =3D 480

> +       {0x3090, 0xe0},
> +       {0x3091, 0x01},

These two are a single 16 bit register AREA3_WIDTH_2 =3D 480

> +       {0x3308, 0xe0},
> +       {0x3309, 0x01},

These two are a single 16 bit register Y_OUT_SIZE

Don't you think=20
	{ Y_OUT_SIZE, 480 },

Is so much more readable and easier to comprehend and maintain?


> +       {0x30d8, 0x30},
> +       {0x30d9, 0x0b},

These two are a single 16 bit register UNREAD_ED_ADR =3D 2864

> +};

I'm still sad that we can all know the names of all these registers and
yet this is writing new tables of hex values.


--
Kieran


> +
> +/* Sensor mode registers for 1280x720@30fps */
> +static const struct imx334_reg mode_1280x720_regs[] =3D {
> +       {0x302c, 0x30},
> +       {0x302d, 0x05},
> +       {0x302e, 0x00},
> +       {0x302f, 0x05},
> +       {0x3074, 0x84},
> +       {0x3075, 0x03},
> +       {0x308e, 0x85},
> +       {0x308f, 0x03},
> +       {0x3076, 0xd0},
> +       {0x3077, 0x02},
> +       {0x3090, 0xd0},
> +       {0x3091, 0x02},
> +       {0x3308, 0xd0},
> +       {0x3309, 0x02},
> +       {0x30d8, 0x30},
> +       {0x30d9, 0x0b},
> +};
> +
>  /* Sensor mode registers for 1920x1080@30fps */
>  static const struct imx334_reg mode_1920x1080_regs[] =3D {
>         {0x302c, 0xf0},
> @@ -433,6 +473,32 @@ static const struct imx334_mode supported_modes[] =
=3D {
>                         .num_of_regs =3D ARRAY_SIZE(mode_1920x1080_regs),
>                         .regs =3D mode_1920x1080_regs,
>                 },
> +       }, {
> +               .width =3D 1280,
> +               .height =3D 720,
> +               .hblank =3D 2480,
> +               .vblank =3D 1170,
> +               .vblank_min =3D 45,
> +               .vblank_max =3D 132840,
> +               .pclk =3D 297000000,
> +               .link_freq_idx =3D 1,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_1280x720_regs),
> +                       .regs =3D mode_1280x720_regs,
> +               },
> +       }, {
> +               .width =3D 640,
> +               .height =3D 480,
> +               .hblank =3D 2480,
> +               .vblank =3D 1170,
> +               .vblank_min =3D 45,
> +               .vblank_max =3D 132840,
> +               .pclk =3D 297000000,
> +               .link_freq_idx =3D 1,
> +               .reg_list =3D {
> +                       .num_of_regs =3D ARRAY_SIZE(mode_640x480_regs),
> +                       .regs =3D mode_640x480_regs,
> +               },
>         },
>  };
> =20
> --=20
> 2.34.1
>

