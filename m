Return-Path: <linux-media+bounces-35533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 592FBAE2B25
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 20:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B5317545B
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 18:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469C826A0BF;
	Sat, 21 Jun 2025 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PZtJCUfI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165D14D283;
	Sat, 21 Jun 2025 18:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529900; cv=none; b=F4r6rHX5i2lOy1CV/pPBRHP/zl6vCo8+mgNfmCUlL5yuKMC1LfxKmlCuCCLQcCerfGT4hHMyXdTLG9mtviHUwGxUPFSwte2908P7VlQptl2k6UO3crkiDGgW5j0dhAH0ckRES25vFrYG957R9Vs6jDSy3nejNuWxn8utD2O/n50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529900; c=relaxed/simple;
	bh=DFHCFplGNW89kgzTndIkPnhHUlbMY+sDutqDZ6Z+JKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViIW6FsCUlKBTNYUPiQB1/uh+9bzdtTNm+gq7+bcXjJbEVI3RpD9qTHBT841fW+S0zTOnECD9U4qxfsM0/4IFWRUIxIdmHCTlHiUddBXmTVxXMlPoxqsQMlDr45eWJuyi9vFbj+Wp3zsPKxPE8KJENiRspRqPmjIAdYvWoQB4Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PZtJCUfI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A97E8379;
	Sat, 21 Jun 2025 20:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750529874;
	bh=DFHCFplGNW89kgzTndIkPnhHUlbMY+sDutqDZ6Z+JKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZtJCUfI21tHLeTzgJpQzoirlUzJ0Z8xIQJTAdyh1xq4fC7ybT4BVkFaFGsYToIOS
	 hhBRnQP9F3aiXrzUvI2OEODpBMpWddm6QO8s565WyqPJQ+9KyQEpU3aTzZajjjzBmZ
	 hdOBpRv1Vly42GfLOEw7EZt3CDGPioOxrcy2V2LA=
Date: Sat, 21 Jun 2025 21:17:51 +0300
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
Subject: Re: [PATCH RESEND v4 3/5] media: i2c: imx214: Make use of CCS PLL
 calculator
Message-ID: <20250621181751.GA9125@pendragon.ideasonboard.com>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
 <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250621-imx214_ccs_pll-v4-3-12178e5eb989@apitzsch.eu>

Hi André,

Thank you for the patch.

On Sat, Jun 21, 2025 at 11:37:27AM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Calculate PLL parameters based on clock frequency and link frequency.
> 
> Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx214.c | 213 ++++++++++++++++++++++++++++++++++++---------
>  2 files changed, 175 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e68202954a8fd4711d108cf295d5771246fbc406..08db8abeea218080b0bf5bfe6cf82f1c0b100c4a 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -141,6 +141,7 @@ config VIDEO_IMX214
>  	depends on GPIOLIB
>  	select REGMAP_I2C
>  	select V4L2_CCI_I2C
> +	select VIDEO_CCS_PLL
>  	help
>  	  This is a Video4Linux2 sensor driver for the Sony
>  	  IMX214 camera.
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index c564c9ca82488dddd6b8f549749042ae44363c0d..fd03650a5b2bbdbbc677d5797380285f1832baa5 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -20,6 +20,8 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> +#include "ccs-pll.h"
> +
>  /* Chip ID */
>  #define IMX214_REG_CHIP_ID		CCI_REG16(0x0016)
>  #define IMX214_CHIP_ID			0x0214
> @@ -34,7 +36,6 @@
>  #define IMX214_DEFAULT_LINK_FREQ	600000000
>  /* Keep wrong link frequency for backward compatibility */
>  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> -#define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
>  #define IMX214_FPS 30
>  
>  /* V-TIMING internal */
> @@ -84,6 +85,7 @@
>  #define IMX214_CSI_DATA_FORMAT_RAW10	0x0A0A
>  #define IMX214_CSI_DATA_FORMAT_COMP6	0x0A06
>  #define IMX214_CSI_DATA_FORMAT_COMP8	0x0A08
> +#define IMX214_BITS_PER_PIXEL_MASK	0xFF
>  
>  #define IMX214_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
>  #define IMX214_CSI_2_LANE_MODE		1
> @@ -249,6 +251,10 @@ struct imx214 {
>  	struct clk *xclk;
>  	struct regmap *regmap;
>  
> +	struct ccs_pll pll;
> +
> +	struct v4l2_fwnode_endpoint bus_cfg;
> +
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
>  
> @@ -758,16 +764,22 @@ static int imx214_configure_pll(struct imx214 *imx214)
>  {
>  	int ret = 0;
>  
> -	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
> -	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
> -	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3, &ret);
> -	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150, &ret);
> -	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10, &ret);
> -	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV,
> +		  imx214->pll.vt_bk.pix_clk_div, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV,
> +		  imx214->pll.vt_bk.sys_clk_div, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV,
> +		  imx214->pll.vt_fr.pre_pll_clk_div, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY,
> +		  imx214->pll.vt_fr.pll_multiplier, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
> +		  imx214->pll.op_bk.pix_clk_div, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV,
> +		  imx214->pll.op_bk.sys_clk_div, &ret);
>  	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
>  		  IMX214_PLL_SINGLE, &ret);
>  	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
> -		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &ret);
> +		  IMX214_EXCK_FREQ(imx214->pll.ext_clk_freq_hz / 1000000), &ret);
>  
>  	return ret;
>  }
> @@ -872,9 +884,6 @@ static const struct v4l2_ctrl_ops imx214_ctrl_ops = {
>  
>  static int imx214_ctrls_init(struct imx214 *imx214)
>  {
> -	static const s64 link_freq[] = {
> -		IMX214_DEFAULT_LINK_FREQ
> -	};
>  	static const struct v4l2_area unit_size = {
>  		.width = 1120,
>  		.height = 1120,
> @@ -895,15 +904,14 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>  	if (ret)
>  		return ret;
>  
> -	imx214->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> -					       V4L2_CID_PIXEL_RATE, 0,
> -					       IMX214_DEFAULT_PIXEL_RATE, 1,
> -					       IMX214_DEFAULT_PIXEL_RATE);
> +	imx214->pixel_rate =
> +		v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_PIXEL_RATE, 1,
> +				  INT_MAX, 1, 1);
>  
>  	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
>  						   V4L2_CID_LINK_FREQ,
> -						   ARRAY_SIZE(link_freq) - 1,
> -						   0, link_freq);
> +						   imx214->bus_cfg.nr_of_link_frequencies - 1,
> +						   0, imx214->bus_cfg.link_frequencies);
>  	if (imx214->link_freq)
>  		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> @@ -1006,6 +1014,7 @@ static int imx214_start_streaming(struct imx214 *imx214)
>  	const struct v4l2_mbus_framefmt *fmt;
>  	struct v4l2_subdev_state *state;
>  	const struct imx214_mode *mode;
> +	int bit_rate_mbps;
>  	int ret;
>  
>  	ret = cci_multi_reg_write(imx214->regmap, mode_table_common,
> @@ -1021,8 +1030,10 @@ static int imx214_start_streaming(struct imx214 *imx214)
>  		return ret;
>  	}
>  
> +	bit_rate_mbps = (imx214->pll.pixel_rate_csi / 1000000)
> +			* imx214->pll.bits_per_pixel;

	bit_rate_mbps = imx214->pll.pixel_rate_csi / 1000000
		      * imx214->pll.bits_per_pixel;

>  	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
> -			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
> +			IMX214_LINK_BIT_RATE_MBPS(bit_rate_mbps), NULL);
>  	if (ret) {
>  		dev_err(imx214->dev, "failed to configure link bit rate\n");
>  		return ret;
> @@ -1105,6 +1116,109 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
>  	return ret;
>  }
>  
> +static int imx214_pll_calculate(struct imx214 *imx214, struct ccs_pll *pll,
> +				unsigned int link_freq)
> +{
> +	struct ccs_pll_limits limits = {
> +		.min_ext_clk_freq_hz = 6000000,
> +		.max_ext_clk_freq_hz = 27000000,
> +
> +		.vt_fr = {
> +			.min_pre_pll_clk_div = 1,
> +			.max_pre_pll_clk_div = 15,
> +			/* Value is educated guess as we don't have a spec */
> +			.min_pll_ip_clk_freq_hz = 6000000,
> +			/* Value is educated guess as we don't have a spec */
> +			.max_pll_ip_clk_freq_hz = 12000000,
> +			.min_pll_multiplier = 12,
> +			.max_pll_multiplier = 1200,
> +			.min_pll_op_clk_freq_hz = 338000000,
> +			.max_pll_op_clk_freq_hz = 1200000000,
> +		},
> +		.vt_bk = {
> +			.min_sys_clk_div = 2,
> +			.max_sys_clk_div = 4,
> +			.min_pix_clk_div = 5,
> +			.max_pix_clk_div = 10,
> +			.min_pix_clk_freq_hz = 30000000,
> +			.max_pix_clk_freq_hz = 120000000,
> +		},
> +		.op_bk = {
> +			.min_sys_clk_div = 1,
> +			.max_sys_clk_div = 2,
> +			.min_pix_clk_div = 6,
> +			.max_pix_clk_div = 10,
> +			.min_pix_clk_freq_hz = 30000000,
> +			.max_pix_clk_freq_hz = 120000000,
> +		},
> +
> +		.min_line_length_pck_bin = IMX214_PPL_DEFAULT,
> +		.min_line_length_pck = IMX214_PPL_DEFAULT,
> +	};
> +	unsigned int num_lanes = imx214->bus_cfg.bus.mipi_csi2.num_data_lanes;
> +
> +	/*
> +	 * There are no documented constraints on the sys clock frequency, for
> +	 * either branch. Recover them based on the PLL output clock frequency
> +	 * and sys_clk_div limits on one hand, and the pix clock frequency and
> +	 * the pix_clk_div limits on the other hand.
> +	 */
> +	limits.vt_bk.min_sys_clk_freq_hz =
> +		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.vt_bk.max_sys_clk_div,
> +		    limits.vt_bk.min_pix_clk_freq_hz * limits.vt_bk.min_pix_clk_div);
> +	limits.vt_bk.max_sys_clk_freq_hz =
> +		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.vt_bk.min_sys_clk_div,
> +		    limits.vt_bk.max_pix_clk_freq_hz * limits.vt_bk.max_pix_clk_div);
> +
> +	limits.op_bk.min_sys_clk_freq_hz =
> +		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.op_bk.max_sys_clk_div,
> +		    limits.op_bk.min_pix_clk_freq_hz * limits.op_bk.min_pix_clk_div);
> +	limits.op_bk.max_sys_clk_freq_hz =
> +		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.op_bk.min_sys_clk_div,
> +		    limits.op_bk.max_pix_clk_freq_hz * limits.op_bk.max_pix_clk_div);
> +
> +	memset(pll, 0, sizeof(*pll));
> +
> +	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
> +	pll->op_lanes = num_lanes;
> +	pll->vt_lanes = num_lanes;
> +	pll->csi2.lanes = num_lanes;
> +
> +	pll->binning_horizontal = 1;
> +	pll->binning_vertical = 1;
> +	pll->scale_m = 1;
> +	pll->scale_n = 1;
> +	pll->bits_per_pixel =
> +		IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK;
> +	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL;
> +	pll->link_freq = link_freq;
> +	pll->ext_clk_freq_hz = clk_get_rate(imx214->xclk);
> +
> +	return ccs_pll_calculate(imx214->dev, &limits, pll);
> +}
> +
> +static int imx214_pll_update(struct imx214 *imx214)
> +{
> +	u64 link_freq;
> +	int ret;
> +
> +	link_freq = imx214->bus_cfg.link_frequencies[imx214->link_freq->val];
> +	ret = imx214_pll_calculate(imx214, &imx214->pll, link_freq);
> +	if (ret) {
> +		dev_err(imx214->dev, "PLL calculations failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = v4l2_ctrl_s_ctrl_int64(imx214->pixel_rate,
> +				     imx214->pll.pixel_rate_pixel_array);
> +	if (ret) {
> +		dev_err(imx214->dev, "failed to set pixel rate\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
>  				     struct v4l2_subdev_state *sd_state,
>  				     struct v4l2_subdev_frame_interval *fival)
> @@ -1211,12 +1325,10 @@ static int imx214_identify_module(struct imx214 *imx214)
>  	return 0;
>  }
>  
> -static int imx214_parse_fwnode(struct device *dev)
> +static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
>  {

Drop the dev argument to the function and use imx214->dev with

	struct device *dev = imx214->dev;

if desired.

> +	struct v4l2_fwnode_endpoint *bus_cfg = &imx214->bus_cfg;
>  	struct fwnode_handle *endpoint;

While at it (or in a separate patch) you could write

  	struct fwnode_handle __free(fwnode_handle_put) *endpoint = NULL;

and ...

> -	struct v4l2_fwnode_endpoint bus_cfg = {
> -		.bus_type = V4L2_MBUS_CSI2_DPHY,
> -	};
>  	unsigned int i;
>  	int ret;
>  
> @@ -1224,42 +1336,52 @@ static int imx214_parse_fwnode(struct device *dev)
>  	if (!endpoint)
>  		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
>  
> -	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> +	bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
> +	fwnode_handle_put(endpoint);

... drop this. Up to you.

>  	if (ret) {
>  		dev_err_probe(dev, ret, "parsing endpoint node failed\n");
> -		goto done;
> +		goto error;

You can return ret here.

>  	}
>  
>  	/* Check the number of MIPI CSI2 data lanes */
> -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +	if (bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {
>  		ret = dev_err_probe(dev, -EINVAL,
>  				    "only 4 data lanes are currently supported\n");
> -		goto done;
> +		goto error;
>  	}
>  
> -	if (bus_cfg.nr_of_link_frequencies != 1)
> +	if (bus_cfg->nr_of_link_frequencies != 1)
>  		dev_warn(dev, "Only one link-frequency supported, please review your DT. Continuing anyway\n");

Now that the driver can calculate PLL parameters dynamically, it would
be nice to lift this restriction and make the link frequency control
writable, in a separate patch on top of this series.

>  
> -	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> -		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
> +	for (i = 0; i < bus_cfg->nr_of_link_frequencies; i++) {
> +		u64 freq = bus_cfg->link_frequencies[i];
> +		struct ccs_pll pll;
> +
> +		if (!imx214_pll_calculate(imx214, &pll, freq))
>  			break;
> -		if (bus_cfg.link_frequencies[i] ==
> -		    IMX214_DEFAULT_LINK_FREQ_LEGACY) {
> +		if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
>  			dev_warn(dev,
>  				 "link-frequencies %d not supported, please review your DT. Continuing anyway\n",
>  				 IMX214_DEFAULT_LINK_FREQ);
> +			freq = IMX214_DEFAULT_LINK_FREQ;
> +			if (imx214_pll_calculate(imx214, &pll, freq))
> +				continue;
> +			bus_cfg->link_frequencies[i] = freq;
>  			break;
>  		}

How about separating the IMX214_DEFAULT_LINK_FREQ_LEGACY check from the
PLL calculation ? Something like

		u64 freq = bus_cfg->link_frequencies[i];
		struct ccs_pll pll;

		if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
			dev_warn(dev,
				 "link-frequencies %d not supported, please review your DT. Continuing anyway\n",
				 IMX214_DEFAULT_LINK_FREQ);
			freq = IMX214_DEFAULT_LINK_FREQ;
			bus_cfg->link_frequencies[i] = freq;
		}

		if (!imx214_pll_calculate(imx214, &pll, freq))
			break;

It will then become easier to drop this legacy support from the driver.
What platform(s) are know to specify an incorrect link frequency ?

>  	}
>  
> -	if (i == bus_cfg.nr_of_link_frequencies)
> +	if (i == bus_cfg->nr_of_link_frequencies)
>  		ret = dev_err_probe(dev, -EINVAL,
> -				    "link-frequencies %d not supported, please review your DT\n",
> -				    IMX214_DEFAULT_LINK_FREQ);
> +				    "link-frequencies %lld not supported, please review your DT\n",
> +				    bus_cfg->nr_of_link_frequencies ?
> +				    bus_cfg->link_frequencies[0] : 0);
>  
> -done:
> -	v4l2_fwnode_endpoint_free(&bus_cfg);
> -	fwnode_handle_put(endpoint);
> +	return 0;
> +
> +error:
> +	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
>  	return ret;
>  }
>  
> @@ -1299,7 +1421,7 @@ static int imx214_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
>  				     "failed to initialize CCI\n");
>  
> -	ret = imx214_parse_fwnode(dev);
> +	ret = imx214_parse_fwnode(dev, imx214);
>  	if (ret)
>  		return ret;
>  
> @@ -1310,7 +1432,9 @@ static int imx214_probe(struct i2c_client *client)
>  	 * Enable power initially, to avoid warnings
>  	 * from clk_disable on power_off
>  	 */
> -	imx214_power_on(imx214->dev);
> +	ret = imx214_power_on(imx214->dev);
> +	if (ret < 0)
> +		goto error_fwnode;

This change seems to belong to a separate patch.

>  
>  	ret = imx214_identify_module(imx214);
>  	if (ret)
> @@ -1341,6 +1465,12 @@ static int imx214_probe(struct i2c_client *client)
>  	pm_runtime_set_active(imx214->dev);
>  	pm_runtime_enable(imx214->dev);
>  
> +	ret = imx214_pll_update(imx214);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "failed to update PLL\n");
> +		goto error_subdev_cleanup;
> +	}

I would move this to imx214_ctrls_init().

> +
>  	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret,
> @@ -1366,6 +1496,9 @@ static int imx214_probe(struct i2c_client *client)
>  error_power_off:
>  	imx214_power_off(imx214->dev);
>  
> +error_fwnode:
> +	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> +
>  	return ret;
>  }
>  
> @@ -1378,6 +1511,8 @@ static void imx214_remove(struct i2c_client *client)
>  	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&imx214->sd.entity);
>  	v4l2_ctrl_handler_free(&imx214->ctrls);
> +	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
> +
>  	pm_runtime_disable(&client->dev);
>  	if (!pm_runtime_status_suspended(&client->dev)) {
>  		imx214_power_off(imx214->dev);

-- 
Regards,

Laurent Pinchart

