Return-Path: <linux-media+bounces-22336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81FE9DC32C
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89E10280EBF
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEED819ABA3;
	Fri, 29 Nov 2024 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="obWGb1ZY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3FE33C5;
	Fri, 29 Nov 2024 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732881502; cv=none; b=UIAvwxUwzwd3LUuM9BfJSvWzlOZU16b/hL8tPFrASqDaIeJIYs6jtg8WPyfw420Jv8OX2HIXFkIBGCZ1pM2mpphjJ1LwkS+DSt0k3Wb5N1oBPCvukh7CFDp/WSLGxbkcltnmV0vncCFDv5cZdt6b+m7vDjzNIzuKahx1xWsG7x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732881502; c=relaxed/simple;
	bh=nZ6buRBqUJVhg1tX9uZaN3XrOfetgf3QDmeQ/Wfd+0g=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=k6iOpa0RHfL9sV/Mm/A70JeYGTyZTbYO/Y7EmbYiixN3NGByMKRNSciyAvufKz8L2Q6s1oFAgORzVsi85dNItKuxcN46J1DTZS0La2ZwyeOvxXM82y0HPvhsSRI1K2gF00gIiRmpJB9Q0Mve4wGvg2UMEObG8zMnsu/qYFeXmbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=obWGb1ZY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EDF2A8F;
	Fri, 29 Nov 2024 12:57:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732881474;
	bh=nZ6buRBqUJVhg1tX9uZaN3XrOfetgf3QDmeQ/Wfd+0g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=obWGb1ZYB+fcP+T6qYfQLePOOVzBOSbnJugVVi384CO08jSQj0jbj+ieIVskLxVZn
	 jn0T2dOlzY3JhxHMGn08LPHa9EZi4noD0ECIDgi0Sf53xDhGB6cEKziFEYe1lDSzR9
	 g7ubzIPKCUEd64kMqbLQjYpSraVViF41nC3lA7Ps=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241129100036.193456-1-shravan.chippa@microchip.com>
References: <20241129100036.193456-1-shravan.chippa@microchip.com>
Subject: Re: [PATCH] media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com, praveen.kumar@microchip.com, shravan.chippa@microchip.com
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, shravan kumar <shravan.chippa@microchip.com>
Date: Fri, 29 Nov 2024 11:58:15 +0000
Message-ID: <173288149590.1143262.2853735316281702828@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Shravan,

Quoting shravan kumar (2024-11-29 10:00:36)
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> Add support for 1280x720@30 and 640x480@30 resolutions
>=20

Thanks for improving the driver, but I am weary there is a lot of work
required to clean up the imx334 driver.

Do you have the datasheet for this device?

> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  drivers/media/i2c/imx334.c | 352 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 352 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index a544fc3df39c..b7cdebc2382e 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -167,6 +167,332 @@ static const s64 link_freq[] =3D {
>         IMX334_LINK_FREQ_445M,
>  };
> =20
> +/* Sensor mode registers for 640x480@30fps */
> +static const struct imx334_reg mode_640x480_regs[] =3D {
> +       {0x3000, 0x01},
> +       {0x3018, 0x04},
> +       {0x3030, 0xca},
> +       {0x3031, 0x08},
> +       {0x3032, 0x00},
> +       {0x3034, 0x4c},
> +       {0x3035, 0x04},
> +       {0x302c, 0x70},
> +       {0x302d, 0x06},
> +       {0x302e, 0x80},
> +       {0x302f, 0x02},
> +       {0x3074, 0x48},
> +       {0x3075, 0x07},
> +       {0x308e, 0x49},
> +       {0x308f, 0x07},
> +       {0x3076, 0xe0},
> +       {0x3077, 0x01},
> +       {0x3090, 0xe0},
> +       {0x3091, 0x01},
> +       {0x3308, 0xe0},
> +       {0x3309, 0x01},
> +       {0x30d8, 0x30},
> +       {0x30d9, 0x0b},
> +       {0x30C6, 0x00},
> +       {0x30c7, 0x00},
> +       {0x30ce, 0x00},
> +       {0x30cf, 0x00},
> +       {0x304c, 0x00},
> +       {0x304e, 0x00},
> +       {0x304f, 0x00},
> +       {0x3050, 0x00},
> +       {0x30b6, 0x00},
> +       {0x30b7, 0x00},
> +       {0x3116, 0x08},
> +       {0x3117, 0x00},
> +       {0x31a0, 0x20},
> +       {0x31a1, 0x0f},
> +       {0x300c, 0x3b},
> +       {0x300d, 0x29},
> +       {0x314c, 0x29},
> +       {0x314d, 0x01},
> +       {0x315a, 0x0a},
> +       {0x3168, 0xa0},
> +       {0x316a, 0x7e},
> +       {0x319e, 0x02},
> +       {0x3199, 0x00},
> +       {0x319d, 0x00},
> +       {0x31dd, 0x03},
> +       {0x3300, 0x00},
> +       {0x341c, 0xff},
> +       {0x341d, 0x01},
> +       {0x3a01, 0x03},
> +       {0x3a18, 0x7f},
> +       {0x3a19, 0x00},
> +       {0x3a1a, 0x37},
> +       {0x3a1b, 0x00},
> +       {0x3a1c, 0x37},
> +       {0x3a1d, 0x00},
> +       {0x3a1e, 0xf7},
> +       {0x3a1f, 0x00},
> +       {0x3a20, 0x3f},
> +       {0x3a21, 0x00},
> +       {0x3a20, 0x6f},
> +       {0x3a21, 0x00},
> +       {0x3a20, 0x3f},
> +       {0x3a21, 0x00},
> +       {0x3a20, 0x5f},
> +       {0x3a21, 0x00},
> +       {0x3a20, 0x2f},
> +       {0x3a21, 0x00},
> +       {0x3078, 0x02},
> +       {0x3079, 0x00},
> +       {0x307a, 0x00},
> +       {0x307b, 0x00},
> +       {0x3080, 0x02},
> +       {0x3081, 0x00},
> +       {0x3082, 0x00},
> +       {0x3083, 0x00},
> +       {0x3088, 0x02},
> +       {0x3094, 0x00},
> +       {0x3095, 0x00},
> +       {0x3096, 0x00},
> +       {0x309b, 0x02},
> +       {0x309c, 0x00},
> +       {0x309d, 0x00},
> +       {0x309e, 0x00},
> +       {0x30a4, 0x00},
> +       {0x30a5, 0x00},
> +       {0x3288, 0x21},
> +       {0x328a, 0x02},
> +       {0x3414, 0x05},
> +       {0x3416, 0x18},
> +       {0x35Ac, 0x0e},
> +       {0x3648, 0x01},
> +       {0x364a, 0x04},
> +       {0x364c, 0x04},
> +       {0x3678, 0x01},
> +       {0x367c, 0x31},
> +       {0x367e, 0x31},
> +       {0x3708, 0x02},
> +       {0x3714, 0x01},
> +       {0x3715, 0x02},
> +       {0x3716, 0x02},
> +       {0x3717, 0x02},
> +       {0x371c, 0x3d},
> +       {0x371d, 0x3f},
> +       {0x372c, 0x00},
> +       {0x372d, 0x00},
> +       {0x372e, 0x46},
> +       {0x372f, 0x00},
> +       {0x3730, 0x89},
> +       {0x3731, 0x00},
> +       {0x3732, 0x08},
> +       {0x3733, 0x01},
> +       {0x3734, 0xfe},
> +       {0x3735, 0x05},
> +       {0x375d, 0x00},
> +       {0x375e, 0x00},
> +       {0x375f, 0x61},
> +       {0x3760, 0x06},
> +       {0x3768, 0x1b},
> +       {0x3769, 0x1b},
> +       {0x376a, 0x1a},
> +       {0x376b, 0x19},
> +       {0x376c, 0x18},
> +       {0x376d, 0x14},
> +       {0x376e, 0x0f},
> +       {0x3776, 0x00},
> +       {0x3777, 0x00},
> +       {0x3778, 0x46},
> +       {0x3779, 0x00},
> +       {0x377a, 0x08},
> +       {0x377b, 0x01},
> +       {0x377c, 0x45},
> +       {0x377d, 0x01},
> +       {0x377e, 0x23},
> +       {0x377f, 0x02},
> +       {0x3780, 0xd9},
> +       {0x3781, 0x03},
> +       {0x3782, 0xf5},
> +       {0x3783, 0x06},
> +       {0x3784, 0xa5},
> +       {0x3788, 0x0f},
> +       {0x378a, 0xd9},
> +       {0x378b, 0x03},
> +       {0x378c, 0xeb},
> +       {0x378d, 0x05},
> +       {0x378e, 0x87},
> +       {0x378f, 0x06},
> +       {0x3790, 0xf5},
> +       {0x3792, 0x43},
> +       {0x3794, 0x7a},
> +       {0x3796, 0xa1},
> +       {0x37b0, 0x37},
> +       {0x3e04, 0x0e},
> +       {0x30e8, 0x50},
> +       {0x30e9, 0x00},
> +       {0x3e04, 0x0e},
> +       {0x3002, 0x00},
> +};
> +
> +/* Sensor mode registers for 1280x720@30fps */
> +static const struct imx334_reg mode_1280x720_regs[] =3D {
> +       {0x3000, 0x01},
> +       {0x3018, 0x04},
> +       {0x3030, 0xca},
> +       {0x3031, 0x08},
> +       {0x3032, 0x00},
> +       {0x3034, 0x4c},
> +       {0x3035, 0x04},
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
> +       {0x30C6, 0x00},
> +       {0x30c7, 0x00},
> +       {0x30ce, 0x00},
> +       {0x30cf, 0x00},
> +       {0x304c, 0x00},
> +       {0x304e, 0x00},
> +       {0x304f, 0x00},
> +       {0x3050, 0x00},
> +       {0x30b6, 0x00},
> +       {0x30b7, 0x00},
> +       {0x3116, 0x08},
> +       {0x3117, 0x00},
> +       {0x31a0, 0x20},
> +       {0x31a1, 0x0f},
> +       {0x300c, 0x3b},
> +       {0x300d, 0x29},
> +       {0x314c, 0x29},
> +       {0x314d, 0x01},
> +       {0x315a, 0x0a},
> +       {0x3168, 0xa0},
> +       {0x316a, 0x7e},
> +       {0x319e, 0x02},
> +       {0x3199, 0x00},
> +       {0x319d, 0x00},
> +       {0x31dd, 0x03},
> +       {0x3300, 0x00},
> +       {0x341c, 0xff},
> +       {0x341d, 0x01},
> +       {0x3a01, 0x03},
> +       {0x3a18, 0x7f},
> +       {0x3a19, 0x00},
> +       {0x3a1a, 0x37},
> +       {0x3a1b, 0x00},
> +       {0x3a1c, 0x37},
> +       {0x3a1d, 0x00},
> +       {0x3a1e, 0xf7},
> +       {0x3a1f, 0x00},
> +       {0x3a20, 0x3f},
> +       {0x3a21, 0x00},
> +       {0x3a20, 0x6f},
> +       {0x3a21, 0x00},
> +       {0x3a20, 0x3f},
> +       {0x3a21, 0x00},
> +       {0x3a20, 0x5f},
> +       {0x3a21, 0x00},
> +       {0x3a20, 0x2f},
> +       {0x3a21, 0x00},
> +       {0x3078, 0x02},
> +       {0x3079, 0x00},
> +       {0x307a, 0x00},
> +       {0x307b, 0x00},
> +       {0x3080, 0x02},
> +       {0x3081, 0x00},
> +       {0x3082, 0x00},
> +       {0x3083, 0x00},
> +       {0x3088, 0x02},
> +       {0x3094, 0x00},
> +       {0x3095, 0x00},
> +       {0x3096, 0x00},
> +       {0x309b, 0x02},
> +       {0x309c, 0x00},
> +       {0x309d, 0x00},
> +       {0x309e, 0x00},
> +       {0x30a4, 0x00},
> +       {0x30a5, 0x00},
> +       {0x3288, 0x21},
> +       {0x328a, 0x02},
> +       {0x3414, 0x05},
> +       {0x3416, 0x18},
> +       {0x35Ac, 0x0e},
> +       {0x3648, 0x01},
> +       {0x364a, 0x04},
> +       {0x364c, 0x04},
> +       {0x3678, 0x01},
> +       {0x367c, 0x31},
> +       {0x367e, 0x31},
> +       {0x3708, 0x02},
> +       {0x3714, 0x01},
> +       {0x3715, 0x02},
> +       {0x3716, 0x02},
> +       {0x3717, 0x02},
> +       {0x371c, 0x3d},
> +       {0x371d, 0x3f},
> +       {0x372c, 0x00},
> +       {0x372d, 0x00},
> +       {0x372e, 0x46},
> +       {0x372f, 0x00},
> +       {0x3730, 0x89},
> +       {0x3731, 0x00},
> +       {0x3732, 0x08},
> +       {0x3733, 0x01},
> +       {0x3734, 0xfe},
> +       {0x3735, 0x05},
> +       {0x375d, 0x00},
> +       {0x375e, 0x00},
> +       {0x375f, 0x61},
> +       {0x3760, 0x06},
> +       {0x3768, 0x1b},
> +       {0x3769, 0x1b},
> +       {0x376a, 0x1a},
> +       {0x376b, 0x19},
> +       {0x376c, 0x18},
> +       {0x376d, 0x14},
> +       {0x376e, 0x0f},
> +       {0x3776, 0x00},
> +       {0x3777, 0x00},
> +       {0x3778, 0x46},
> +       {0x3779, 0x00},
> +       {0x377a, 0x08},
> +       {0x377b, 0x01},
> +       {0x377c, 0x45},
> +       {0x377d, 0x01},
> +       {0x377e, 0x23},
> +       {0x377f, 0x02},
> +       {0x3780, 0xd9},
> +       {0x3781, 0x03},
> +       {0x3782, 0xf5},
> +       {0x3783, 0x06},
> +       {0x3784, 0xa5},
> +       {0x3788, 0x0f},
> +       {0x378a, 0xd9},
> +       {0x378b, 0x03},
> +       {0x378c, 0xeb},
> +       {0x378d, 0x05},
> +       {0x378e, 0x87},
> +       {0x378f, 0x06},
> +       {0x3790, 0xf5},
> +       {0x3792, 0x43},
> +       {0x3794, 0x7a},
> +       {0x3796, 0xa1},
> +       {0x37b0, 0x37},
> +       {0x3e04, 0x0e},
> +       {0x30e8, 0x50},
> +       {0x30e9, 0x00},
> +       {0x3e04, 0x0e},
> +       {0x3002, 0x00},
> +};

This is an enormous amount of duplicated data that could be factored
out.

These are also /very/ common against the existing mode register tables
too.

I think several things need to happen in this driver:

 1. It should be converted to use the CCI helpers.
 2. Whereever identifiable, the register names should be used instead of
    just the addresses.
 3. The common factors of these tables should be de-duplicated.

In your additions you only have differences in the following registers
from those entire tables:

+	{0x302c, 0x70},
+	{0x302d, 0x06},
+	{0x302e, 0x80},
+	{0x302f, 0x02},
+	{0x3074, 0x48},
+	{0x3075, 0x07},
+	{0x308e, 0x49},
+	{0x308f, 0x07},
+	{0x3076, 0xe0},
+	{0x3077, 0x01},
+	{0x3090, 0xe0},
+	{0x3091, 0x01},
+	{0x3308, 0xe0},
+	{0x3309, 0x01},
+	{0x30d8, 0x30},
+	{0x30d9, 0x0b},

 4. And ideally - the differences which determine the modes should be
    factored out to calculations so that we are not writing out large
    tables just to write a parameterised frame size.


I would beleive that at least steps 1 and 3 would be achievable, 2 and 4
would depend upon access to the datasheet.

Is that anything you could work on ?

Regards
--
Kieran





> +
>  /* Sensor mode registers for 1920x1080@30fps */
>  static const struct imx334_reg mode_1920x1080_regs[] =3D {
>         {0x3000, 0x01},
> @@ -505,6 +831,32 @@ static const struct imx334_mode supported_modes[] =
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

