Return-Path: <linux-media+bounces-60819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH1BHDGf/GkMSAAAu9opvQ
	(envelope-from <linux-media+bounces-60819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:18:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F34E9FC6
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 16:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF326309AFB2
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 14:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC21F3FCB07;
	Thu,  7 May 2026 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="koMpCw5F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037613ED5BD;
	Thu,  7 May 2026 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163149; cv=none; b=Vq+FoNr1qD88IBHmEujccKMSE9YdCp6YCDmT80ro6N1U4oC+baGUvdApVAwCcAl2ZNpwhd7lhdn324nJ1FUmw3f8kqw+TO8p618nVxeuUDSjmdfv1vvS0xgeBqXalHcAOu4qtR40dI8o4OBIfiUc6k4+fknvQBIM/ZF1cjXFUJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163149; c=relaxed/simple;
	bh=GDLEnB7cU2HMS+Ar1L9XVz4QlMVsaRUUjM5nAHZlJy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkQijt3+ffWNuDx7wYyFpxFLgpTPg5DD3N50OJInK9osjhXmoVU+5f0qX3SBNzJ2QbHJrK0Su5xQ7renE7lkahT1T03Oq2j0urUxoM+CM7T6Zu7Se7GZdz2g3LDzNZut4dBqRnLxyx0zYfh492aMho81x6ducf6EejBZbzVLrr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=koMpCw5F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63154664;
	Thu,  7 May 2026 16:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778163142;
	bh=GDLEnB7cU2HMS+Ar1L9XVz4QlMVsaRUUjM5nAHZlJy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koMpCw5F9MAewPAyWXLsKTcay3+upCwkvnEEv0DRboJ93p09JAlDQneSCYIe0A1ZJ
	 LfwGqg/Iml0OqAFyXXPCCfn9+7Az+Dgc5tb0grOzHNE1twPmwiVc32b4VJZz0lXV6S
	 6rnEy99nGH/3cH4DJzoQztD/esvsbq79dz7189aA=
Date: Thu, 7 May 2026 16:12:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
Subject: Re: [PATCH 06/13] media: imx355: Set binning mode registers
 programmatically
Message-ID: <afydnNJzb0i6lu8D@zed>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-6-660685030455@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506-media-imx355-v1-6-660685030455@raspberrypi.com>
X-Rspamd-Queue-Id: 095F34E9FC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60819-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Dave

On Wed, May 06, 2026 at 07:23:44PM +0100, Dave Stevenson wrote:
> Store the binning mode in the mode structure and set the registers
> based on that, rather than having the bare register writes spelled
> out for each mode.

Isn't it trivial to calculate this from the (analog crop / visible
size) ratios ?

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx355.c | 73 ++++++++++++++++++++--------------------------
>  1 file changed, 31 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 56a82f37709e..422454e529a7 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -73,6 +73,10 @@
>  #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
>  #define IMX355_TEST_PATTERN_PN9			4
>
> +#define IMX355_REG_BINNING_MODE		0x0900
> +#define IMX355_REG_BINNING_TYPE		0x0901
> +#define IMX355_REG_BINNING_WEIGHTING	0x0902
> +
>  /* Flip Control */
>  #define IMX355_REG_ORIENTATION		0x0101
>
> @@ -117,6 +121,7 @@ struct imx355_mode {
>  	u16 y_add_start;
>  	u16 x_add_end;
>  	u16 y_add_end;
> +	u8 binning_mode;
>  };
>
>  struct imx355_clk_params {
> @@ -269,113 +274,71 @@ static const struct imx355_reg_list imx355_global_setting = {
>  };
>
>  static const struct imx355_reg mode_3268x2448_regs[] = {
> -	{ 0x0900, 0x00 },
> -	{ 0x0901, 0x11 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_3264x2448_regs[] = {
> -	{ 0x0900, 0x00 },
> -	{ 0x0901, 0x11 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_3280x2464_regs[] = {
> -	{ 0x0900, 0x00 },
> -	{ 0x0901, 0x11 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1940x1096_regs[] = {
> -	{ 0x0900, 0x00 },
> -	{ 0x0901, 0x11 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1936x1096_regs[] = {
> -	{ 0x0900, 0x00 },
> -	{ 0x0901, 0x11 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1924x1080_regs[] = {
> -	{ 0x0900, 0x00 },
> -	{ 0x0901, 0x11 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1920x1080_regs[] = {
> -	{ 0x0900, 0x00 },
> -	{ 0x0901, 0x11 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1640x1232_regs[] = {
> -	{ 0x0900, 0x01 },
> -	{ 0x0901, 0x22 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1640x922_regs[] = {
> -	{ 0x0900, 0x01 },
> -	{ 0x0901, 0x22 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1300x736_regs[] = {
> -	{ 0x0900, 0x01 },
> -	{ 0x0901, 0x22 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1296x736_regs[] = {
> -	{ 0x0900, 0x01 },
> -	{ 0x0901, 0x22 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1284x720_regs[] = {
> -	{ 0x0900, 0x01 },
> -	{ 0x0901, 0x22 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_1280x720_regs[] = {
> -	{ 0x0900, 0x01 },
> -	{ 0x0901, 0x22 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x00 },
>  	{ 0x0701, 0x10 },
>  };
>
>  static const struct imx355_reg mode_820x616_regs[] = {
> -	{ 0x0900, 0x01 },
> -	{ 0x0901, 0x44 },
> -	{ 0x0902, 0x00 },
>  	{ 0x0700, 0x02 },
>  	{ 0x0701, 0x78 },
>  };
> @@ -413,6 +376,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x0000,
>  		.x_add_end = 0x0ccf,
>  		.y_add_end = 0x099f,
> +		.binning_mode = 0x11,
>  	},
>  	{
>  		.width = 3268,
> @@ -429,6 +393,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x0008,
>  		.x_add_end = 0x0ccb,
>  		.y_add_end = 0x997,
> +		.binning_mode = 0x11,
>  	},
>  	{
>  		.width = 3264,
> @@ -445,6 +410,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x0008,
>  		.x_add_end = 0x0cc7,
>  		.y_add_end = 0x0997,
> +		.binning_mode = 0x11,
>  	},
>  	{
>  		.width = 1940,
> @@ -461,6 +427,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x02ac,
>  		.x_add_end = 0x0a33,
>  		.y_add_end = 0x06f3,
> +		.binning_mode = 0x11,
>  	},
>  	{
>  		.width = 1936,
> @@ -477,6 +444,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x02ac,
>  		.x_add_end = 0x0a2f,
>  		.y_add_end = 0x06f3,
> +		.binning_mode = 0x11,
>  	},
>  	{
>  		.width = 1924,
> @@ -493,6 +461,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x02b4,
>  		.x_add_end = 0x0a2b,
>  		.y_add_end = 0x06eb,
> +		.binning_mode = 0x11,
>  	},
>  	{
>  		.width = 1920,
> @@ -509,6 +478,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x02b4,
>  		.x_add_end = 0x0a27,
>  		.y_add_end = 0x06eb,
> +		.binning_mode = 0x11,
>  	},
>  	{
>  		.width = 1640,
> @@ -525,6 +495,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x0000,
>  		.x_add_end = 0x0ccf,
>  		.y_add_end = 0x099f,
> +		.binning_mode = 0x22,
>  	},
>  	{
>  		.width = 1640,
> @@ -541,6 +512,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x0130,
>  		.x_add_end = 0x0ccf,
>  		.y_add_end = 0x0863,
> +		.binning_mode = 0x22,
>  	},
>  	{
>  		.width = 1300,
> @@ -557,6 +529,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x01f0,
>  		.x_add_end = 0x0b7f,
>  		.y_add_end = 0x07af,
> +		.binning_mode = 0x22,
>  	},
>  	{
>  		.width = 1296,
> @@ -573,6 +546,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x01f0,
>  		.x_add_end = 0x0b77,
>  		.y_add_end = 0x07af,
> +		.binning_mode = 0x22,
>  	},
>  	{
>  		.width = 1284,
> @@ -589,6 +563,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x0200,
>  		.x_add_end = 0x0b6f,
>  		.y_add_end = 0x079f,
> +		.binning_mode = 0x22,
>  	},
>  	{
>  		.width = 1280,
> @@ -605,6 +580,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x0200,
>  		.x_add_end = 0x0b67,
>  		.y_add_end = 0x079f,
> +		.binning_mode = 0x22,
>  	},
>  	{
>  		.width = 820,
> @@ -621,6 +597,7 @@ static const struct imx355_mode supported_modes[] = {
>  		.y_add_start = 0x0000,
>  		.x_add_end = 0x0ccf,
>  		.y_add_end = 0x099f,
> +		.binning_mode = 0x44,
>  	},
>  };
>
> @@ -997,6 +974,18 @@ static int imx355_start_streaming(struct imx355 *imx355)
>  	if (ret)
>  		return ret;
>
> +	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_MODE, 1,
> +			       mode->binning_mode == 0x11 ? 0x00 : 0x01);
> +	if (ret)
> +		return ret;
> +	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_TYPE, 1,
> +			       mode->binning_mode);
> +	if (ret)
> +		return ret;
> +	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_WEIGHTING, 1, 0x00);
> +	if (ret)
> +		return ret;
> +
>  	/* Set PLL registers for the external clock frequency */
>  	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
>  			       imx355->clk_params->extclk_freq);
>
> --
> 2.34.1
>
>

