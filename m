Return-Path: <linux-media+bounces-49611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15ACE5369
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 18:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60A26300DC8F
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 17:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818A4223DDF;
	Sun, 28 Dec 2025 17:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eQO7l9LC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031AE1C8616;
	Sun, 28 Dec 2025 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766941957; cv=none; b=ARokBtVIxW1zLQF9VPmNNmi0f8GCl/s//lFe9HY80onz69JiYYIk8lc4UJBgUZOF53bRmf4iEnD1R0yqxc0QNqhCVmkE19Dt0Gu7uKTGkTW0jzrV214vh/xHbG4CQKsbh+7V/zEuD6p/033pfOBP5nBdSOQiSXURr5a7xtpl1zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766941957; c=relaxed/simple;
	bh=xCvUXb+5g+i1QmmM8lN4fKjEeLZ2o95g2KCCBgS27dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgstZoryG5oq8lTDE1QIVYSbDQakfHQQIhtrQwhFFng19bywQ2AlK4vkQmKxzr+43rJgoaip11QeWe7/eDrfBhjulgqwX5cWxVsWxEvSj4op33++LCMMW6u5+D2vCnR5ADfdP9zYFCj/YyIh5mc14vTCoX8wmiyR2FMmyVlVUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eQO7l9LC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D01FF4BB;
	Sun, 28 Dec 2025 18:12:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766941937;
	bh=xCvUXb+5g+i1QmmM8lN4fKjEeLZ2o95g2KCCBgS27dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQO7l9LCLzVeXjz0nz4nw/LYVwnSfWzfD05UlKrkJXomQSglb/891iNBFFkoU6Fxt
	 WDOJiZ68DH7/kH8YsARt5M6niRbGobHsEBYvqnv5IpVmrdEEmdwB16by7TgVfnjSFG
	 ZVZaGOyDM3a4jeRoUJ6zwXeySnkcQGQiDPZksC98=
Date: Sun, 28 Dec 2025 19:12:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/15] media: mt9m114: Use aptina-PLL helper to get
 PLL values
Message-ID: <20251228171212.GO4094@pendragon.ideasonboard.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
 <20251224-mt9m114-atomisp-v4-3-60b25da7a1bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224-mt9m114-atomisp-v4-3-60b25da7a1bc@oss.qualcomm.com>

Hi Hans,

Thank you for the patch.

On Wed, Dec 24, 2025 at 01:31:12PM +0100, Hans de Goede wrote:
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
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
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
>  drivers/media/i2c/mt9m114.c | 50 +++++++++++++++++++++++++++++++--------------
>  2 files changed, 36 insertions(+), 15 deletions(-)
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
> index 51ebbe7ae996950a58f8fee30029e0a060feaf3f..d1635f49ee047ca696f6053f6c17e30d736ab795 100644
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
> @@ -2283,12 +2283,25 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
>  
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
> @@ -2308,8 +2321,15 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
>  	}
>  
>  	/* Check if the PLL configuration fits the configured link frequency. */
> +	sensor->pll.ext_clock = clk_get_rate(sensor->clk);
> +	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
> +
> +	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
> +	if (ret)
> +		return ret;
> +
>  	pixrate = clk_get_rate(sensor->clk) * sensor->pll.m

You can replace this with

	pixrate = sensor->pll.ext_clock * sensor->pll.m

to avoid the double call to clk_get_rate(). With this and the comment
from 02/15 moved to this file (probably just above the limits in this
function),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
> +		/ (sensor->pll.n * sensor->pll.p1);
>  	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
>  		sensor->pixrate = pixrate;
>  		sensor->bypass_pll = false;

-- 
Regards,

Laurent Pinchart

