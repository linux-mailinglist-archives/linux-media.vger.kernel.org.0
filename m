Return-Path: <linux-media+bounces-16981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A94961FF1
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 08:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90240B228D2
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 06:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1554A157495;
	Wed, 28 Aug 2024 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OByETeiq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57114C592;
	Wed, 28 Aug 2024 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724827467; cv=none; b=A5TVRXDwf+b1hWepwYuxenMYN5WHQqUKZrZOwVVPBq+gZCFYk13JIkJKpTVGsqgSlOxLQZx7DH62ckAbWVK39XpbRjmj5+YKnEoGXAwEfES6S0LLjxJJNRgXmVPZ1HmuER7rutAFDBn4mMuX4D2+ylunHU+1COfp9bqE++55J50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724827467; c=relaxed/simple;
	bh=ZtD8DehdY/yGq+FNYcKa60Z0xPXcr1rD3nIXAeKaBYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8zK3xzrfCzGUuXwVtbjWzB/mDRoJrC4KwSDODvctj0e73LcDtKcQoZdPozDEYwMZudG+r9s/nXmSkfvymH4ZBMJYzaYIajGDsAMNNNChYnWdfrh3JxgoZibAn6JlxliBFRCt7Fb0TtCB0Co9wsfBlELKY/YuxJzJlhbn8Xh9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OByETeiq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724827466; x=1756363466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZtD8DehdY/yGq+FNYcKa60Z0xPXcr1rD3nIXAeKaBYc=;
  b=OByETeiqMbuYzYcZ6M/zG88ZODZVDZiNJNBbtZl/5OSNu1Wz8r7zZNV7
   0/760rtc6eBsNgBUJd5pB13Ree6s/APU/wF8zX+eF0wsYXnD2fMEPmbmR
   eCKxTaIKA6vVnNu3ro3mgKqbSFJ1ioueWDzGkFP08vNGa0WrG/vi8fpSh
   pGa/+pAU/p11qZ4gMPxU/w80eiYubt7ft18WLOraz23cC7wOVCsEj81f9
   5ERDc0DIh8YEdzRNhUdUknWnMzYu2YiLFITIOFLGIx3M8k89BuVcUdiPs
   80/sZCkMl6mLYih9cH1mj72XcpA5HcEE9z88nQ/WVw1e79d+INOWcuHBT
   Q==;
X-CSE-ConnectionGUID: bk79ePq0SmiZjpyn1Ge6Ew==
X-CSE-MsgGUID: +HBqykNwTWGTY2qFBHIPGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23518129"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23518129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:44:25 -0700
X-CSE-ConnectionGUID: BaF0LFONR2aM2XPH/MUeAw==
X-CSE-MsgGUID: 78zVWC0mSRmEHC+dBqcEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="63826764"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:44:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F1BA111F8B3;
	Wed, 28 Aug 2024 09:44:19 +0300 (EEST)
Date: Wed, 28 Aug 2024 06:44:19 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linuxfancy@googlegroups.com, michael.roeder@avnet.eu,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: i2c: max96717: add test pattern ctrl
Message-ID: <Zs7HQxieYEVJ9-5X@kekkonen.localdomain>
References: <20240627151806.3999400-1-tomm.merciai@gmail.com>
 <20240627151806.3999400-2-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627151806.3999400-2-tomm.merciai@gmail.com>

Hi Tommaso,

Thanks for the patch.

On Thu, Jun 27, 2024 at 05:18:06PM +0200, Tommaso Merciai wrote:
> Add v4l2 test pattern control.
> 
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
> Changes since v1:
>  - Rename and move pattern regs under VTX section as suggested by JMassot
>  - Fix VTX regs order
>  - Add comment saying that the deserializer should manage the link in
>    pixel mode as suggested by JMassot
> 
>  drivers/media/i2c/max96717.c | 213 ++++++++++++++++++++++++++++++++---
>  1 file changed, 197 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> index 949306485873..859a439b64d9 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c
> @@ -16,6 +16,7 @@
>  #include <linux/regmap.h>
>  
>  #include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> @@ -38,9 +39,35 @@
>  #define MAX96717_DEV_REV_MASK GENMASK(3, 0)
>  
>  /* VID_TX Z */
> +#define MAX96717_VIDEO_TX0 CCI_REG8(0x110)
> +#define MAX96717_VIDEO_AUTO_BPP BIT(3)
>  #define MAX96717_VIDEO_TX2 CCI_REG8(0x112)
>  #define MAX96717_VIDEO_PCLKDET BIT(7)
>  
> +/* VTX_Z */
> +#define MAX96717_VTX0                  CCI_REG8(0x24e)
> +#define MAX96717_VTX1                  CCI_REG8(0x24f)
> +#define MAX96717_PATTERN_CLK_FREQ      GENMASK(3, 1)
> +#define MAX96717_VTX_VS_DLY            CCI_REG24(0x250)
> +#define MAX96717_VTX_VS_HIGH           CCI_REG24(0x253)
> +#define MAX96717_VTX_VS_LOW            CCI_REG24(0x256)
> +#define MAX96717_VTX_V2H               CCI_REG24(0x259)
> +#define MAX96717_VTX_HS_HIGH           CCI_REG16(0x25c)
> +#define MAX96717_VTX_HS_LOW            CCI_REG16(0x25e)
> +#define MAX96717_VTX_HS_CNT            CCI_REG16(0x260)
> +#define MAX96717_VTX_V2D               CCI_REG24(0x262)
> +#define MAX96717_VTX_DE_HIGH           CCI_REG16(0x265)
> +#define MAX96717_VTX_DE_LOW            CCI_REG16(0x267)
> +#define MAX96717_VTX_DE_CNT            CCI_REG16(0x269)
> +#define MAX96717_VTX29                 CCI_REG8(0x26b)
> +#define MAX96717_VTX_MODE              GENMASK(1, 0)
> +#define MAX96717_VTX_GRAD_INC          CCI_REG8(0x26c)
> +#define MAX96717_VTX_CHKB_COLOR_A      CCI_REG24(0x26d)
> +#define MAX96717_VTX_CHKB_COLOR_B      CCI_REG24(0x270)
> +#define MAX96717_VTX_CHKB_RPT_CNT_A    CCI_REG8(0x273)
> +#define MAX96717_VTX_CHKB_RPT_CNT_B    CCI_REG8(0x274)
> +#define MAX96717_VTX_CHKB_ALT          CCI_REG8(0x275)
> +
>  /* GPIO */
>  #define MAX96717_NUM_GPIO         11
>  #define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
> @@ -82,6 +109,12 @@
>  /* MISC */
>  #define PIO_SLEW_1 CCI_REG8(0x570)
>  
> +enum max96717_vpg_mode {
> +	MAX96717_VPG_DISABLED = 0,
> +	MAX96717_VPG_CHECKERBOARD = 1,
> +	MAX96717_VPG_GRADIENT = 2,
> +};
> +
>  struct max96717_priv {
>  	struct i2c_client		  *client;
>  	struct regmap			  *regmap;
> @@ -89,6 +122,7 @@ struct max96717_priv {
>  	struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
>  	struct v4l2_subdev                sd;
>  	struct media_pad                  pads[MAX96717_PORTS];
> +	struct v4l2_ctrl_handler          ctrl_handler;
>  	struct v4l2_async_notifier        notifier;
>  	struct v4l2_subdev                *source_sd;
>  	u16                               source_sd_pad;
> @@ -96,6 +130,7 @@ struct max96717_priv {
>  	u8                                pll_predef_index;
>  	struct clk_hw                     clk_hw;
>  	struct gpio_chip                  gpio_chip;
> +	enum max96717_vpg_mode            pattern;
>  };
>  
>  static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev *sd)
> @@ -131,6 +166,118 @@ static inline int max96717_start_csi(struct max96717_priv *priv, bool start)
>  			       start ? MAX96717_START_PORT_B : 0, NULL);
>  }
>  
> +static int max96717_apply_patgen_timing(struct max96717_priv *priv,
> +					struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *fmt =
> +		v4l2_subdev_state_get_format(state, MAX96717_PAD_SOURCE);
> +	const u32 h_active = fmt->width;
> +	const u32 h_fp = 88;
> +	const u32 h_sw = 44;
> +	const u32 h_bp = 148;
> +	u32 h_tot;
> +	const u32 v_active = fmt->height;
> +	const u32 v_fp = 4;
> +	const u32 v_sw = 5;
> +	const u32 v_bp = 36;

Some comments here would be nice, what do these values signify for
instance?

> +	u32 v_tot;
> +	int ret = 0;
> +
> +	h_tot = h_active + h_fp + h_sw + h_bp;
> +	v_tot = v_active + v_fp + v_sw + v_bp;
> +
> +	/* 75 Mhz pixel clock */
> +	cci_update_bits(priv->regmap, MAX96717_VTX1,
> +			MAX96717_PATTERN_CLK_FREQ, 0xa, &ret);
> +
> +	dev_info(&priv->client->dev, "height: %d width: %d\n", fmt->height,
> +		 fmt->width);
> +
> +	cci_write(priv->regmap, MAX96717_VTX_VS_DLY, 0, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_VS_HIGH, v_sw * h_tot, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_VS_LOW,
> +		  (v_active + v_fp + v_bp) * h_tot, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_HS_HIGH, h_sw, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_HS_LOW, h_active + h_fp + h_bp,
> +		  &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_V2D,
> +		  h_tot * (v_sw + v_bp) + (h_sw + h_bp), &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_HS_CNT, v_tot, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_DE_HIGH, h_active, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_DE_LOW, h_fp + h_sw + h_bp,
> +		  &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_DE_CNT, v_active, &ret);
> +	/* B G R */
> +	cci_write(priv->regmap, MAX96717_VTX_CHKB_COLOR_A, 0xfecc00, &ret);
> +	/* B G R */
> +	cci_write(priv->regmap, MAX96717_VTX_CHKB_COLOR_B, 0x006aa7, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_CHKB_RPT_CNT_A, 0x3c, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_CHKB_RPT_CNT_B, 0x3c, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_CHKB_ALT, 0x3c, &ret);
> +	cci_write(priv->regmap, MAX96717_VTX_GRAD_INC, 0x10, &ret);
> +
> +	return ret;
> +}
> +
> +static int max96717_apply_patgen(struct max96717_priv *priv,
> +				 struct v4l2_subdev_state *state)
> +{
> +	unsigned int val;
> +	int ret = 0;
> +
> +	if (priv->pattern)
> +		ret = max96717_apply_patgen_timing(priv, state);
> +
> +	cci_write(priv->regmap, MAX96717_VTX0, priv->pattern ? 0xfb : 0,
> +		  &ret);
> +
> +	val = FIELD_PREP(MAX96717_VTX_MODE, priv->pattern);
> +	cci_update_bits(priv->regmap, MAX96717_VTX29, MAX96717_VTX_MODE,
> +			val, &ret);
> +	return ret;
> +}
> +
> +static int max96717_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct max96717_priv *priv =
> +		container_of(ctrl->handler, struct max96717_priv, ctrl_handler);
> +	int ret;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_TEST_PATTERN:
> +		if (priv->enabled_source_streams)
> +			return -EBUSY;
> +		priv->pattern = ctrl->val;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* Use bpp from bpp register */
> +	ret = cci_update_bits(priv->regmap, MAX96717_VIDEO_TX0,
> +			      MAX96717_VIDEO_AUTO_BPP,
> +			      priv->pattern ? 0 : MAX96717_VIDEO_AUTO_BPP,
> +			      NULL);
> +
> +	/*
> +	 * Pattern generator doesn't work with tunnel mode.
> +	 * Needs RGB color format and deserializer tunnel mode must be disabled.
> +	 */
> +	return cci_update_bits(priv->regmap, MAX96717_MIPI_RX_EXT11,
> +			       MAX96717_TUN_MODE,
> +			       priv->pattern ? 0 : MAX96717_TUN_MODE, &ret);
> +}
> +
> +static const char * const max96717_test_pattern[] = {
> +	"Disabled",
> +	"Checkerboard",
> +	"Gradient"
> +};
> +
> +static const struct v4l2_ctrl_ops max96717_ctrl_ops = {
> +	.s_ctrl = max96717_s_ctrl,
> +};
> +
>  static int max96717_gpiochip_get(struct gpio_chip *gpiochip,
>  				 unsigned int offset)
>  {
> @@ -352,20 +499,28 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
>  	u64 sink_streams;
>  	int ret;
>  
> -	sink_streams = v4l2_subdev_state_xlate_streams(state,
> -						       MAX96717_PAD_SOURCE,
> -						       MAX96717_PAD_SINK,
> -						       &streams_mask);
> -
>  	if (!priv->enabled_source_streams)
>  		max96717_start_csi(priv, true);
>  
> -	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
> -					 sink_streams);
> -	if (ret) {
> -		dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
> -			sink_streams);
> +	ret = max96717_apply_patgen(priv, state);
> +	if (ret)
>  		goto stop_csi;
> +
> +	if (!priv->pattern) {
> +		sink_streams =
> +			v4l2_subdev_state_xlate_streams(state,
> +							MAX96717_PAD_SOURCE,
> +							MAX96717_PAD_SINK,
> +							&streams_mask);
> +
> +		ret = v4l2_subdev_enable_streams(priv->source_sd,
> +						 priv->source_sd_pad,
> +						 sink_streams);
> +		if (ret) {
> +			dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
> +				sink_streams);
> +			goto stop_csi;
> +		}
>  	}
>  
>  	priv->enabled_source_streams |= streams_mask;
> @@ -394,13 +549,23 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
>  	if (!priv->enabled_source_streams)
>  		max96717_start_csi(priv, false);
>  
> -	sink_streams = v4l2_subdev_state_xlate_streams(state,
> -						       MAX96717_PAD_SOURCE,
> -						       MAX96717_PAD_SINK,
> -						       &streams_mask);
> +	if (!priv->pattern) {
> +		int ret;
> +
> +		sink_streams =
> +			v4l2_subdev_state_xlate_streams(state,
> +							MAX96717_PAD_SOURCE,
> +							MAX96717_PAD_SINK,
> +							&streams_mask);
>  
> -	return v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
> -					   sink_streams);
> +		ret = v4l2_subdev_disable_streams(priv->source_sd,
> +						  priv->source_sd_pad,
> +						  sink_streams);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
> @@ -513,6 +678,19 @@ static int max96717_subdev_init(struct max96717_priv *priv)
>  	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96717_subdev_ops);
>  	priv->sd.internal_ops = &max96717_internal_ops;
>  
> +	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
> +	priv->sd.ctrl_handler = &priv->ctrl_handler;
> +
> +	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler,
> +				     &max96717_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(max96717_test_pattern) - 1,
> +				     0, 0, max96717_test_pattern);
> +	if (priv->ctrl_handler.error) {
> +		ret = priv->ctrl_handler.error;
> +		goto err_free_ctrl;
> +	}
> +
>  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;

With controls, you should add the HAS_EVENTS flag.

I'll take this one as we're in rc5 already, please address these in a
separate patch.

>  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>  	priv->sd.entity.ops = &max96717_entity_ops;
> @@ -552,6 +730,8 @@ static int max96717_subdev_init(struct max96717_priv *priv)
>  	v4l2_subdev_cleanup(&priv->sd);
>  err_entity_cleanup:
>  	media_entity_cleanup(&priv->sd.entity);
> +err_free_ctrl:
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>  
>  	return ret;
>  }
> @@ -563,6 +743,7 @@ static void max96717_subdev_uninit(struct max96717_priv *priv)
>  	v4l2_async_nf_cleanup(&priv->notifier);
>  	v4l2_subdev_cleanup(&priv->sd);
>  	media_entity_cleanup(&priv->sd.entity);
> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>  }
>  
>  struct max96717_pll_predef_freq {

-- 
Kind regards,

Sakari Ailus

