Return-Path: <linux-media+bounces-33234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231CAC1E62
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 259E47B1852
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F59D2882A2;
	Fri, 23 May 2025 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EsYIrV6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B0428750F;
	Fri, 23 May 2025 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987831; cv=none; b=RIuVf8fIs1DGtHIdZDuCdtpSno94uw9CQGWXje7bagEiI3vhpQ5/ozF5WCfJAi0hcY3hzJxAn9qfJl/Ec8akz6FXVwQ2isQI4mtkbbZA2sK0oLc0/3ZBbapnygvzk1jEi+j1qEkGXmpeiaOAQUU+jWtMPkXLXSKqeevxvO2OxE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987831; c=relaxed/simple;
	bh=35VcFiRUCOVd+LfCiJqN/5D7lUMMFSNB8+Td4FcHvrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2mPl3drF95cUB2THadySwYR7rsntGjENq/fox86FSPv4FrWA2pzom1k0UjoF5McwSReMhHAChinLHIRJblyvBSJazrgsJ7E7POq7n54PxSVKnp7teHrulwvNa0x1pMLhDwpSB+8WkyBpHpR/dFIKzIMK1vyQxLguPIfx0l8P5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EsYIrV6Z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 272D8833;
	Fri, 23 May 2025 10:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747987805;
	bh=35VcFiRUCOVd+LfCiJqN/5D7lUMMFSNB8+Td4FcHvrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsYIrV6ZSXiTYMDqPVZEq3+E2kuKU5YHGqTIMi/IllQKN0J9HgfAcViIiaIP4F4ZZ
	 upi7lHiu+KfJWveHtIMPiTXNZGsx6KKsdNoM10KNMLoRzO/awqx3uieePT4Ks1nJml
	 tM+iEWusLgLiwCEFfwXYg7ZlYp3HrzdLVeMc/ito=
Date: Fri, 23 May 2025 10:10:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 2/5] media: i2c: imx214: Prepare for variable clock
 frequency
Message-ID: <20250523081020.GA12514@pendragon.ideasonboard.com>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
 <20250521-imx214_ccs_pll-v3-2-bfb4a2b53d14@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521-imx214_ccs_pll-v3-2-bfb4a2b53d14@apitzsch.eu>

Hi André,

Thank you for the patch.

On Wed, May 21, 2025 at 09:34:25PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Move clock frequency related parameters out of the constant register
> sequences, such that the hard coded external clock frequency can be
> replaced by a variable in the upcoming patches.
> 
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 54 ++++++++++++++++++++++++++--------------------
>  1 file changed, 31 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9..3aca6ebb02d649c1b7f0b6a6049c1e3aa3d08951 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -299,16 +299,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
>  	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
>  	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
>  
> -	{ IMX214_REG_VTPXCK_DIV, 5 },
> -	{ IMX214_REG_VTSYCK_DIV, 2 },
> -	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
> -	{ IMX214_REG_PLL_VT_MPY, 150 },
> -	{ IMX214_REG_OPPXCK_DIV, 10 },
> -	{ IMX214_REG_OPSYCK_DIV, 1 },
> -	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> -
> -	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
> -
>  	{ CCI_REG8(0x3A03), 0x09 },
>  	{ CCI_REG8(0x3A04), 0x50 },
>  	{ CCI_REG8(0x3A05), 0x01 },
> @@ -362,16 +352,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
>  	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
>  	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
>  
> -	{ IMX214_REG_VTPXCK_DIV, 5 },
> -	{ IMX214_REG_VTSYCK_DIV, 2 },
> -	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
> -	{ IMX214_REG_PLL_VT_MPY, 150 },
> -	{ IMX214_REG_OPPXCK_DIV, 10 },
> -	{ IMX214_REG_OPSYCK_DIV, 1 },
> -	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> -
> -	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
> -
>  	{ CCI_REG8(0x3A03), 0x04 },
>  	{ CCI_REG8(0x3A04), 0xF8 },
>  	{ CCI_REG8(0x3A05), 0x02 },
> @@ -405,9 +385,6 @@ static const struct cci_reg_sequence mode_table_common[] = {
>  	/* ATR setting */
>  	{ IMX214_REG_ATR_FAST_MOVE, 2 },
>  
> -	/* external clock setting */
> -	{ IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000) },
> -
>  	/* global setting */
>  	/* basic config */
>  	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
> @@ -777,6 +754,24 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> +static int imx214_configure_pll(struct imx214 *imx214)
> +{
> +	int ret = 0;
> +
> +	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
> +		  IMX214_PLL_SINGLE, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
> +		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &ret);
> +
> +	return ret;
> +}
> +
>  static int imx214_update_digital_gain(struct imx214 *imx214, u32 val)
>  {
>  	int ret = 0;
> @@ -1020,6 +1015,19 @@ static int imx214_start_streaming(struct imx214 *imx214)
>  		return ret;
>  	}
>  
> +	ret = imx214_configure_pll(imx214);
> +	if (ret) {
> +		dev_err(imx214->dev, "failed to configure PLL %d\n", ret);

		dev_err(imx214->dev, "failed to configure PLL: %d\n", ret);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		return ret;
> +	}
> +
> +	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
> +			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
> +	if (ret) {
> +		dev_err(imx214->dev, "failed to configure link bit rate\n");
> +		return ret;
> +	}
> +
>  	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
>  			IMX214_CSI_4_LANE_MODE, NULL);
>  	if (ret) {

-- 
Regards,

Laurent Pinchart

