Return-Path: <linux-media+bounces-32178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB8AB1EA8
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 23:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4006E1773A5
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 21:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A3B25EFA3;
	Fri,  9 May 2025 21:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fN5rMkku"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9045464E
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824617; cv=none; b=qYAEmKn5IdT7h9GTWIj2LCTmKJe+7SmaYvXUHEWTvE5XQq3igb7sd5x/60Oi9wmzhbJRPAhmT6ZGVDKji5lg0e0cPlgPrKi+yyY0pGi8BhF7Sp85bV5qrGwcs2EMaYIWTyPMmHWiyxRMg/RGBJuw3vm5X16dg4NwXzf0b8MiqGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824617; c=relaxed/simple;
	bh=bxoJiDs2teRruvanBfwhz60SxaIZJDIjVo+Eo9k4Xzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucAgk3Q3d6LpRD5GJOXQWTAKWIh2mTtNiTfcg8cYy0oxwWoT2GMbvlqDipaNR/EU3oq4T28EcvjRqWXiEwsGXO4IZxt5Xd3la01d29mFKig3S4sBxv8VGod6PnNtyYENXQMcL/vsMuQ2nbhQhPH0gnTr9DqbWtqDIl7/KiHUTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fN5rMkku; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38ACB8DB;
	Fri,  9 May 2025 23:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746824600;
	bh=bxoJiDs2teRruvanBfwhz60SxaIZJDIjVo+Eo9k4Xzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fN5rMkkuigVJyXdKZlx5E8NtA1EQH8TP4ji0qz/vL7iRvMB2exJwy+6g6fdknJxmM
	 9HIr0u7G8p7e3zgFurDX0XloszQz1LRC2k3MwU0nD3YsbOqms46LUbDHJhMnxJ18wq
	 XOhnrRiBIJIGmQCIB050cisn08hA4/mPBD/EBmjU=
Date: Fri, 9 May 2025 23:03:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 03/13] media: mt9m114: Use aptina-PLL helper to get PLL
 values
Message-ID: <20250509210324.GC19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-4-hdegoede@redhat.com>

Hi Hans,

Thank you for the patch.

On Sun, May 04, 2025 at 12:13:24PM +0200, Hans de Goede wrote:
> Before this change the driver used hardcoded PLL m, n and p values to
> achieve a 48MHz pixclock when used with an external clock with a frequency
> of 24 MHz.
> 
> Use aptina_pll_calculate() to allow the driver to work with different
> external clock frequencies. The m, n, and p values will be unchanged
> with a 24 MHz extclk and this has also been tested with a 19.2 MHz
> clock where m gets increased from 32 to 40.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/mt9m114.c | 53 +++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index be1d2ec64b89..9fdfd90afc22 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -31,6 +31,8 @@
>  #include <media/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>  
> +#include "aptina-pll.h"

You need to select CONFIG_VIDEO_APTINA_PLL.

> +
>  /* Sysctl registers */
>  #define MT9M114_CHIP_ID					CCI_REG16(0x0000)
>  #define MT9M114_COMMAND_REGISTER			CCI_REG16(0x0080)
> @@ -262,9 +264,9 @@
>  #define MT9M114_CAM_SYSCTL_PLL_ENABLE			CCI_REG8(0xc97e)
>  #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
> -#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
> +#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		((((n) - 1) << 8) | (m))
>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
> -#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		((p) << 8)
> +#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		(((p) - 1) << 8)
>  #define MT9M114_CAM_PORT_OUTPUT_CONTROL			CCI_REG16(0xc984)
>  #define MT9M114_CAM_PORT_PORT_SELECT_PARALLEL			(0 << 0)
>  #define MT9M114_CAM_PORT_PORT_SELECT_MIPI			(1 << 0)
> @@ -325,7 +327,7 @@
>   * minimum values that have been seen in register lists are 303 and 38, use
>   * them.
>   *
> - * Set the default to achieve 1280x960 at 30fps.
> + * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
>   */
>  #define MT9M114_MIN_HBLANK				303
>  #define MT9M114_MIN_VBLANK				38
> @@ -335,6 +337,8 @@
>  #define MT9M114_DEF_FRAME_RATE				30
>  #define MT9M114_MAX_FRAME_RATE				120
>  
> +#define MT9M114_DEF_PIXCLOCK				48000000
> +
>  #define MT9M114_PIXEL_ARRAY_WIDTH			1296U
>  #define MT9M114_PIXEL_ARRAY_HEIGHT			976U
>  
> @@ -379,11 +383,7 @@ struct mt9m114 {
>  	struct v4l2_fwnode_endpoint bus_cfg;
>  	u32 clk_freq;
>  
> -	struct {
> -		unsigned int m;
> -		unsigned int n;
> -		unsigned int p;
> -	} pll;
> +	struct aptina_pll pll;
>  
>  	unsigned int pixrate;
>  	bool streaming;
> @@ -751,7 +751,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  						       sensor->pll.n),
>  		  &ret);
>  	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
> -		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p), &ret);
> +		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p1), &ret);
>  	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_PIXCLK,
>  		  sensor->pixrate, &ret);
>  
> @@ -2238,11 +2238,36 @@ static const struct dev_pm_ops mt9m114_pm_ops = {
>  static int mt9m114_clk_init(struct mt9m114 *sensor)
>  {
>  	unsigned int link_freq;
> +	/*
> +	 * TODO these limits have been copied from mt9p031.c, with out_clock_max
> +	 * increased from 360000000 to 400000000 to get the same PLL settings as
> +	 * in the static register lists for 24 MHz and 19.2 MHz ext clock freq.
> +	 * These should be verified / adjusted by someone with access to
> +	 * the full MT9M114 datasheet.

Not all constraints are documented, unfortunately :-(

> +	 */
> +	static const struct aptina_pll_limits limits = {
> +		.ext_clock_min = 6000000,
> +		.ext_clock_max = 27000000,

The external clock range is 6 MHz to 54 MHz.

> +		.int_clock_min = 2000000,
> +		.int_clock_max = 13500000,

There's no documented values for the internal frequency.

> +		.out_clock_min = 180000000,
> +		.out_clock_max = 400000000,

The maximum is 768 MHz. There's no documented minimum value.

> +		.pix_clock_max = 96000000,

I think the maximum pixel clock frequency is 48 MPix/s.

> +		.n_min = 1,
> +		.n_max = 64,
> +		.m_min = 16,
> +		.m_max = 255,

I found a screenshot that specifies the N range as 0-63 (so 1-64 after
adding 1) and the M range as 16-192.

> +		.p1_min = 1,
> +		.p1_max = 128,

I don't know what the maximum value is, but the field is documented as 6
bits, so it can't be above 64.

> +	};
> +	int ret;
>  
> -	/* Hardcode the PLL multiplier and dividers to default settings. */
> -	sensor->pll.m = 32;
> -	sensor->pll.n = 1;
> -	sensor->pll.p = 7;
> +	sensor->pll.ext_clock = sensor->clk_freq;
> +	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
> +
> +	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
> @@ -2250,7 +2275,7 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
>  	 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
>  	 */
>  	sensor->pixrate = sensor->clk_freq * sensor->pll.m
> -			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
> +			/ (sensor->pll.n * sensor->pll.p1);
>  
>  	link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
>  		  ? sensor->pixrate * 8 : sensor->pixrate * 2;

-- 
Regards,

Laurent Pinchart

