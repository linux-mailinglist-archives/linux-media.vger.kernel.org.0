Return-Path: <linux-media+bounces-49769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EB7CEAF73
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 01:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD8E630275FC
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 00:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290771A262A;
	Wed, 31 Dec 2025 00:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bzTL9zcj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5A46BB5B;
	Wed, 31 Dec 2025 00:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767141016; cv=none; b=FPvLoWMm50exgxbEs/7ARLGjy/TFliFPQ4OImqPwqsJASZxmB9KEod/LThIFcCp/7yLUI0+5XOb7Qis7JEsOw65xFNss4wCoiBOQkmwP2n1enLn8h0lY405LJHLeNYnhbbNxJIDDuVKx8JxkB7ddtRWulss5i3AJztlNWHoUzuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767141016; c=relaxed/simple;
	bh=UQqDgqM40xK96c9N6t79sCiJH8AFIYfLUzbkl5KNdMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCXJFV/Awi+m90xkGeedXO2D9P3ARpq7nteMapE5/1XvRBPLyN9cv04bGE3LD1EDndUY3KYrbLWlNmoaOxbyAPInZyZ7XqZKBu+SKMqwJ3pkzdQBxDGJRs5pq/7X26n2lq+qcrCFK7/ix25i4bCr08J7bvrSxuf4eHAG+LaK8o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bzTL9zcj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9F2564F1;
	Wed, 31 Dec 2025 01:29:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767140994;
	bh=UQqDgqM40xK96c9N6t79sCiJH8AFIYfLUzbkl5KNdMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzTL9zcjUhteTsrq0y8C3ajHWUl93C144hbrXimjyMVj2z13TvQrMkoeXjDE9+xR6
	 vjE2bwn2YlmByY9NzfC+IjPdbX+wH11IbgSRBoZa6jUbBSTeDH+G/k90tfvl7zcQ1H
	 1/IiYj6mNw9kr7186yxw1sLb9WDkXxjdLqL4pptg=
Date: Wed, 31 Dec 2025 02:29:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/14] media: mt9m114: Use aptina-PLL helper to get
 PLL values
Message-ID: <20251231002950.GB15048@pendragon.ideasonboard.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
 <20251230-mt9m114-atomisp-v5-2-763539e76094@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230-mt9m114-atomisp-v5-2-763539e76094@oss.qualcomm.com>

On Tue, Dec 30, 2025 at 06:02:59PM +0100, Hans de Goede wrote:
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
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v5:
> - Add a code-comment documenting the PLL chain, this is a verbatim
>   copy of Laurent's ASCII-art PLL chain from the mailinglist.
> - Use sensor->pll.ext_clock instead of calling clk_get_rate()
> 
> Changes in v4:
> - After re-reading the docs out_clock_max should be 384MHz and P1 should
>   always be 8, adjust the pll-limits accordingly and drop the comment
>   about the out_clock_max from the documentation not working
> 
> Changes in v3:
> - Document that using 768Mhz for out_clock_max does not work
> 
> Changes in v2:
> - Add select VIDEO_APTINA_PLL to Kconfig
> - Use correct aptina_pll_limits
> ---
>  drivers/media/i2c/Kconfig   |  1 +
>  drivers/media/i2c/mt9m114.c | 64 +++++++++++++++++++++++++++++++++------------
>  2 files changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4db8c4f49657e19018535927eb41f7ad2a4f80..befea5952191184536ad7d7e5c81f567826d8aa7 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -305,6 +305,7 @@ config VIDEO_MT9M111
>  config VIDEO_MT9M114
>  	tristate "onsemi MT9M114 sensor support"
>  	select V4L2_CCI_I2C
> +	select VIDEO_APTINA_PLL
>  	help
>  	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114
>  	  camera.
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 51ebbe7ae996950a58f8fee30029e0a060feaf3f..bbac5fd9b2ad85a1ab56a7e36de16659bc38a369 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -32,6 +32,8 @@
>  #include <media/v4l2-mediabus.h>
>  #include <media/v4l2-subdev.h>
>  
> +#include "aptina-pll.h"
> +
>  /* Sysctl registers */
>  #define MT9M114_CHIP_ID					CCI_REG16(0x0000)
>  #define MT9M114_COMMAND_REGISTER			CCI_REG16(0x0080)
> @@ -267,9 +269,9 @@
>  #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
>  #define MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE			0x00
>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
> -#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
> +#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		((((n) - 1) << 8) | (m))
>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
> -#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		((p) << 8)
> +#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		(((p) - 1) << 8)
>  #define MT9M114_CAM_PORT_OUTPUT_CONTROL			CCI_REG16(0xc984)
>  #define MT9M114_CAM_PORT_PORT_SELECT_PARALLEL			(0 << 0)
>  #define MT9M114_CAM_PORT_PORT_SELECT_MIPI			(1 << 0)
> @@ -330,7 +332,7 @@
>   * minimum values that have been seen in register lists are 303 and 38, use
>   * them.
>   *
> - * Set the default to achieve 1280x960 at 30fps.
> + * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
>   */
>  #define MT9M114_MIN_HBLANK				303
>  #define MT9M114_MIN_VBLANK				38
> @@ -340,6 +342,8 @@
>  #define MT9M114_DEF_FRAME_RATE				30
>  #define MT9M114_MAX_FRAME_RATE				120
>  
> +#define MT9M114_DEF_PIXCLOCK				48000000
> +
>  #define MT9M114_PIXEL_ARRAY_WIDTH			1296U
>  #define MT9M114_PIXEL_ARRAY_HEIGHT			976U
>  
> @@ -384,11 +388,7 @@ struct mt9m114 {
>  	struct v4l2_fwnode_endpoint bus_cfg;
>  	bool bypass_pll;
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
> @@ -758,7 +758,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
>  							       sensor->pll.n),
>  			  &ret);
>  		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
> -			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p),
> +			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p1),
>  			  &ret);
>  	}
>  
> @@ -2281,14 +2281,39 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
>  	return 0;
>  }
>  
> +/*
> + * Based on the docs the PLL is believed to have the following setup:
> + *
> + *         +-----+     +-----+     +-----+     +-----+     +-----+
> + * Fin --> | / N | --> | x M | --> | x 2 | --> | / P | --> | / 2 | -->
> + *         +-----+     +-----+     +-----+     +-----+     +-----+
> + *                                         fBit       fWord       fSensor
> + * ext_clock    int_clock   out_clock                             pix_clock
> + *
> + * The MT9M114 docs give a max fBit rate of 768 Mhz which translates to
> + * an out_clock_max of 384 Mhz.

s/Mhz/MHz/ (twice)

No need to resend for this.

> + */
>  static int mt9m114_clk_init(struct mt9m114 *sensor)
>  {
> +	static const struct aptina_pll_limits limits = {
> +		.ext_clock_min = 6000000,
> +		.ext_clock_max = 54000000,
> +		/* int_clock_* limits are not documented taken from mt9p031.c */
> +		.int_clock_min = 2000000,
> +		.int_clock_max = 13500000,
> +		/* out_clock_min is not documented, taken from mt9p031.c */
> +		.out_clock_min = 180000000,
> +		.out_clock_max = 384000000,
> +		.pix_clock_max = 48000000,
> +		.n_min = 1,
> +		.n_max = 64,
> +		.m_min = 16,
> +		.m_max = 192,
> +		.p1_min = 8,
> +		.p1_max = 8,
> +	};
>  	unsigned int pixrate;
> -
> -	/* Hardcode the PLL multiplier and dividers to default settings. */
> -	sensor->pll.m = 32;
> -	sensor->pll.n = 1;
> -	sensor->pll.p = 7;
> +	int ret;
>  
>  	/*
>  	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
> @@ -2308,8 +2333,15 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
>  	}
>  
>  	/* Check if the PLL configuration fits the configured link frequency. */
> -	pixrate = clk_get_rate(sensor->clk) * sensor->pll.m
> -		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
> +	sensor->pll.ext_clock = clk_get_rate(sensor->clk);
> +	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
> +
> +	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
> +	if (ret)
> +		return ret;
> +
> +	pixrate = sensor->pll.ext_clock * sensor->pll.m
> +		/ (sensor->pll.n * sensor->pll.p1);
>  	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
>  		sensor->pixrate = pixrate;
>  		sensor->bypass_pll = false;

-- 
Regards,

Laurent Pinchart

