Return-Path: <linux-media+bounces-12064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05DB8D15C7
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C133B229E3
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A490F13A3F3;
	Tue, 28 May 2024 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="tDnjsbrU"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D078676;
	Tue, 28 May 2024 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716883488; cv=none; b=nZaXn03aaeIdxmlpRgMowPKI2jN5TMrA74k4amI1Ddp2c1oWOI4S+lh0jnjJJxX/G0ygk4A40k3d6P5mmUk16zRiSGii6gwEZC2SNlrO/nYOnAvxxoA0Fqz/1Fc+PUqWCvIqk8OC7zg1pIdVTsjzTGPhWGlmPhPMEsVUpPQJSak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716883488; c=relaxed/simple;
	bh=jGnnV0FLE1BrjAgUOW5YIKAOxWaHCUeGAngP7Y+0Q54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZ8beEexvk40s36Sbamd3zoLnw2TcWki8HyLW4eXFqxe4J2JM4hg/XH42l9Dsf1a2Mn83y+7ytzNfnVJIY0ZzmIozNZVmtvrTmvQkmhDcuKfgvj14JzvxDfDX2BU+bpkn0HLYUIHbhAoia7ky8hgNEaTVV77rWQ/Xe8bSmdMlDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=tDnjsbrU; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716883479;
	bh=jGnnV0FLE1BrjAgUOW5YIKAOxWaHCUeGAngP7Y+0Q54=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tDnjsbrU5Y8ZDuPJ42S9f+ovjR//4qEGGgvP8OYGnvGuyc9qg4bZ11qKnJEvg9vHl
	 lN37Kmnarw46UfH+owPamclo0BnAz5lIJeeVoshfFHUdAWsO4wppp/35wdqA9/fWCJ
	 a9d4td4Eq4ugeXsazURqhu3c6l0B5bZq169nuK98Sm6Oi+Ks7UPta8an1eXCA/05ND
	 rCzZNmyMuJTbkufTufgHKyk2o7MP42/G0gGhPLckogDhl8ltq6DJ9t3mW/jc6dwceb
	 bYtlqBcE1prtb2GM3QAvgx7zRyQEpyCmTjfaTVpTUnRlForxoREqFbdUQnpe6thDNI
	 Cs+xlNsFtST0g==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EB5BC378020A;
	Tue, 28 May 2024 08:04:38 +0000 (UTC)
Message-ID: <4f3ea360-f17f-4a91-bbdc-08caebb977a7@collabora.com>
Date: Tue, 28 May 2024 10:04:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: staging: max96712: Add support for MAX96724
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org
References: <20240527133410.1690169-1-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240527133410.1690169-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Niklas,

On 5/27/24 3:34 PM, Niklas Söderlund wrote:
> The MAX96724 is almost identical to the MAX96712 and can be supported by
> the same driver, add support for it.
> 
> For the staging driver which only supports patter generation the big
> difference is that the datasheet (rev 4) for MAX96724 do not describe
> the DEBUG_EXTRA register, which is at offset 0x0009 on MAX96712. It's
> not clear if this register is removed or moved to a different offset.
> What is known is writing to register 0x0009 have no effect on MAX96724.
> 
> This makes it impossible to increase the test pattern clock frequency
> from 25 MHz to 75Mhz on MAX96724. To be able to get a stable test
> pattern the DPLL frequency have to be increase instead to compensate for
> this. The frequency selected is found by experimentation as the MAX96724
> datasheet is much sparser then what's available for MAX96712.

There is a specific User Guide for this chip[1] (under NDA) which 
describes the test pattern
clock frequency.

| Debug Extra 0x9 [1:0] | PATGEN_CLK_SRC (0x1dc [7]) | PCLK Frequency |
|                       |       Pipe 0               |                |
|-----------------------|----------------------------|----------------|
| 00                    | x                          | 25  MHz        |
| 01                    | x                          | 75  MHz        |
| 1x                    | 0                          | 150 MHz        |
| 1x                    | 1 (default)                | 375 MHz        |


PATGEN_CLK_SRC
Pipe 0 0x1dc
Pipe 1 0x1fc
Pipe 2 0x21c
Pipe 3 0x23c


The document also mention that "This internal Pclk is NOT related to the 
MIPI CSI
port clock rate" so increasing the dpll should not increase the pattern 
generation
clock.

Perhaps increasing the DPLL allows to transmit more data on the CSI port 
because the pattern
generator is running at a higher clock rate than what we expect.

Best regards,
Julien

[1]: GMSL2_Customers_MAX96724 User Guide (rev2)
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/staging/media/max96712/max96712.c | 26 ++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index ea67bcf69c9d..69a0a6a16cf9 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -17,8 +17,10 @@
>   #include <media/v4l2-subdev.h>
>   
>   #define MAX96712_ID 0x20
> +#define MAX96724_ID 0xA7
>   
>   #define MAX96712_DPLL_FREQ 1000
> +#define MAX96724_DPLL_FREQ 1200
>   
>   enum max96712_pattern {
>   	MAX96712_PATTERN_CHECKERBOARD = 0,
> @@ -31,6 +33,7 @@ struct max96712_priv {
>   	struct gpio_desc *gpiod_pwdn;
>   
>   	bool cphy;
> +	bool max96724;
>   	struct v4l2_mbus_config_mipi_csi2 mipi;
>   
>   	struct v4l2_subdev sd;
> @@ -120,6 +123,7 @@ static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
>   
>   static void max96712_mipi_configure(struct max96712_priv *priv)
>   {
> +	unsigned int dpll_freq;
>   	unsigned int i;
>   	u8 phy5 = 0;
>   
> @@ -152,10 +156,11 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
>   	max96712_write(priv, 0x8a5, phy5);
>   
>   	/* Set link frequency for PHY0 and PHY1. */
> +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
>   	max96712_update_bits(priv, 0x415, 0x3f,
> -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
>   	max96712_update_bits(priv, 0x418, 0x3f,
> -			     ((MAX96712_DPLL_FREQ / 100) & 0x1f) | BIT(5));
> +			     ((dpll_freq / 100) & 0x1f) | BIT(5));
>   
>   	/* Enable PHY0 and PHY1 */
>   	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
> @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
>   	}
>   
>   	/* PCLK 75MHz. */
> -	max96712_write(priv, 0x0009, 0x01);
> +	if (!priv->max96724)
> +		max96712_write(priv, 0x0009, 0x01);
>   
>   	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
>   	max96712_write_bulk_value(priv, 0x1052, 0, 3);
> @@ -290,6 +296,7 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
>   
>   static int max96712_v4l2_register(struct max96712_priv *priv)
>   {
> +	unsigned int dpll_freq;
>   	long pixel_rate;
>   	int ret;
>   
> @@ -303,7 +310,8 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
>   	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
>   	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
>   	 */
> -	pixel_rate = MAX96712_DPLL_FREQ / priv->mipi.num_data_lanes * 1000000;
> +	dpll_freq = priv->max96724 ? MAX96724_DPLL_FREQ : MAX96712_DPLL_FREQ;
> +	pixel_rate = dpll_freq / priv->mipi.num_data_lanes * 1000000;
>   	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
>   			  pixel_rate, pixel_rate, 1, pixel_rate);
>   
> @@ -419,8 +427,15 @@ static int max96712_probe(struct i2c_client *client)
>   	if (priv->gpiod_pwdn)
>   		usleep_range(4000, 5000);
>   
> -	if (max96712_read(priv, 0x4a) != MAX96712_ID)
> +	switch (max96712_read(priv, 0x4a)) {
> +	case MAX96712_ID:
> +		break;
> +	case MAX96724_ID:
> +		priv->max96724 = true;
> +		break;
> +	default:
>   		return -ENODEV;
> +	}
>   
>   	max96712_reset(priv);
>   
> @@ -444,6 +459,7 @@ static void max96712_remove(struct i2c_client *client)
>   
>   static const struct of_device_id max96712_of_table[] = {
>   	{ .compatible = "maxim,max96712" },
> +	{ .compatible = "maxim,max96724" },
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, max96712_of_table);

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

