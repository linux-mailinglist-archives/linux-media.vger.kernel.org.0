Return-Path: <linux-media+bounces-34020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB1ACC8B3
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 16:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 256553A7902
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 14:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C946238C1E;
	Tue,  3 Jun 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rUBI2GKq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09128223DD1
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959576; cv=none; b=DuwxK3AaATrQ6EMN5m3GQD85UTxqB1gWGGNOxfaAQDP7vmmwh9nykXqNeUwvGXA3pqL7uokt/ByBV8lL6K+k83BmkkQvxh+Yv4VFjXTSNJyWyTsPZfIt9YDG3rZDq3Abezr/WhwgSb5g49NFDrukM05A7bjlVzJfScD43la5HGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959576; c=relaxed/simple;
	bh=KloubqAcGsJ73XOJzcp5iUuWnfgIjnPTn6yPE9IAQpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=of+wMWUjmdlYWBT5uPTiD3zMlA3u/Mdf6XQ3r0yDQKgOclqDrQumjTdiKYN6eprvlyHIh4vmv+GMm4JjXWWrjYDWNMPwHUjHVTpsWZtg2m9PfRL7+S4m7cCtMWF807n750CWY/7he/E/aPMlL/rGus0QUJZBUCE82s1LDKbpL9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rUBI2GKq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7A5ED7;
	Tue,  3 Jun 2025 16:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748959565;
	bh=KloubqAcGsJ73XOJzcp5iUuWnfgIjnPTn6yPE9IAQpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUBI2GKqIaPwA+mWOyyWlKSwGXrooel4z/Gev52tp1ffJRMdq6sN67W9Ez7K8aYJ6
	 lggVKnVkqe+8SpyTuuIEj1q68ioLPdPWP1RMwDjIpqNUET0maorcXN5CwqLPzzofqq
	 JzibxDESpdorBQjFDYzgtal3uUcVhHyKg7vEwvD0=
Date: Tue, 3 Jun 2025 17:05:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 03/12] media: mt9m114: Use aptina-PLL helper to get
 PLL values
Message-ID: <20250603140557.GB12117@pendragon.ideasonboard.com>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-4-hansg@kernel.org>
 <20250603105712.GA27361@pendragon.ideasonboard.com>
 <f7d0ab89-f119-4ff9-a78d-00c51d45bb43@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7d0ab89-f119-4ff9-a78d-00c51d45bb43@kernel.org>

On Tue, Jun 03, 2025 at 03:29:42PM +0200, Hans de Goede wrote:
> On 3-Jun-25 12:57 PM, Laurent Pinchart wrote:
> > On Sat, May 31, 2025 at 06:31:38PM +0200, Hans de Goede wrote:
> >> Before this change the driver used hardcoded PLL m, n and p values to
> >> achieve a 48MHz pixclock when used with an external clock with a frequency
> >> of 24 MHz.
> >>
> >> Use aptina_pll_calculate() to allow the driver to work with different
> >> external clock frequencies. The m, n, and p values will be unchanged
> >> with a 24 MHz extclk and this has also been tested with a 19.2 MHz
> >> clock where m gets increased from 32 to 40.
> >>
> >> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >> ---
> >> Changes in v2:
> >> - Add select VIDEO_APTINA_PLL to Kconfig
> >> - Use correct aptina_pll_limits
> >> ---
> >>  drivers/media/i2c/Kconfig   |  1 +
> >>  drivers/media/i2c/mt9m114.c | 54 ++++++++++++++++++++++++++-----------
> >>  2 files changed, 40 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> >> index dc2c429734fc..1820ec37404a 100644
> >> --- a/drivers/media/i2c/Kconfig
> >> +++ b/drivers/media/i2c/Kconfig
> >> @@ -285,6 +285,7 @@ config VIDEO_MT9M111
> >>  config VIDEO_MT9M114
> >>  	tristate "onsemi MT9M114 sensor support"
> >>  	select V4L2_CCI_I2C
> >> +	select VIDEO_APTINA_PLL
> >>  	help
> >>  	  This is a Video4Linux2 sensor-level driver for the onsemi MT9M114
> >>  	  camera.
> >> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> >> index 5a7c45ce2169..e12c69dc9df0 100644
> >> --- a/drivers/media/i2c/mt9m114.c
> >> +++ b/drivers/media/i2c/mt9m114.c
> >> @@ -31,6 +31,8 @@
> >>  #include <media/v4l2-mediabus.h>
> >>  #include <media/v4l2-subdev.h>
> >>  
> >> +#include "aptina-pll.h"
> >> +
> >>  /* Sysctl registers */
> >>  #define MT9M114_CHIP_ID					CCI_REG16(0x0000)
> >>  #define MT9M114_COMMAND_REGISTER			CCI_REG16(0x0080)
> >> @@ -263,9 +265,9 @@
> >>  #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
> >>  #define MT9M114_CAM_SYSCTL_PLL_DISABLE_VALUE			0x00
> >>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
> >> -#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
> >> +#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		((((n) - 1) << 8) | (m))
> >>  #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
> >> -#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		((p) << 8)
> >> +#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		(((p) - 1) << 8)
> >>  #define MT9M114_CAM_PORT_OUTPUT_CONTROL			CCI_REG16(0xc984)
> >>  #define MT9M114_CAM_PORT_PORT_SELECT_PARALLEL			(0 << 0)
> >>  #define MT9M114_CAM_PORT_PORT_SELECT_MIPI			(1 << 0)
> >> @@ -326,7 +328,7 @@
> >>   * minimum values that have been seen in register lists are 303 and 38, use
> >>   * them.
> >>   *
> >> - * Set the default to achieve 1280x960 at 30fps.
> >> + * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
> >>   */
> >>  #define MT9M114_MIN_HBLANK				303
> >>  #define MT9M114_MIN_VBLANK				38
> >> @@ -336,6 +338,8 @@
> >>  #define MT9M114_DEF_FRAME_RATE				30
> >>  #define MT9M114_MAX_FRAME_RATE				120
> >>  
> >> +#define MT9M114_DEF_PIXCLOCK				48000000
> >> +
> >>  #define MT9M114_PIXEL_ARRAY_WIDTH			1296U
> >>  #define MT9M114_PIXEL_ARRAY_HEIGHT			976U
> >>  
> >> @@ -380,11 +384,7 @@ struct mt9m114 {
> >>  	struct v4l2_fwnode_endpoint bus_cfg;
> >>  	bool bypass_pll;
> >>  
> >> -	struct {
> >> -		unsigned int m;
> >> -		unsigned int n;
> >> -		unsigned int p;
> >> -	} pll;
> >> +	struct aptina_pll pll;
> >>  
> >>  	unsigned int pixrate;
> >>  	bool streaming;
> >> @@ -757,7 +757,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
> >>  							       sensor->pll.n),
> >>  			  &ret);
> >>  		cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
> >> -			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p),
> >> +			  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p1),
> >>  			  &ret);
> >>  	}
> >>  
> >> @@ -2262,12 +2262,29 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
> >>  
> >>  static int mt9m114_clk_init(struct mt9m114 *sensor)
> >>  {
> >> +	static const struct aptina_pll_limits limits = {
> >> +		.ext_clock_min = 6000000,
> >> +		.ext_clock_max = 54000000,
> >> +		/* int_clock_* limits are not documented taken from mt9p031.c */
> >> +		.int_clock_min = 2000000,
> >> +		.int_clock_max = 13500000,
> >> +		/*
> >> +		 * out_clock_min is not documented, taken from mt9p031.c.
> >> +		 * out_clock_max is documented as 768MHz, but this leads to
> >> +		 * different PLL settings then used by the vendor's drivers.
> > 
> > s/then/than/
> > 
> > Is that an issue though ? Does it prevent the sensor from working ?
> 
> I did not try. It seems safer to just stick with the tested / proven
> values from the older register-list based drivers?

Sometimes there are multiple options without any practical differences.
I wouldn't necessarily assume we have to follow the hardcoded register
values. Can you share the two PLL configurations ?

> Even if it does work on my single mt9m114 sensor, that hardly
> constitutes testing on a representative sample.

This sensor is rather old and not widely used. If using the correct
limits doesn't cause issues on platforms we can test, that's good enough
for me. We can always address problems later if any arise.

> >> +		 */
> >> +		.out_clock_min = 180000000,
> >> +		.out_clock_max = 400000000,
> >> +		.pix_clock_max = 48000000,
> >> +		.n_min = 1,
> >> +		.n_max = 64,
> >> +		.m_min = 16,
> >> +		.m_max = 192,
> >> +		.p1_min = 1,
> >> +		.p1_max = 64,
> >> +	};
> >>  	unsigned int pixrate;
> >> -
> >> -	/* Hardcode the PLL multiplier and dividers to default settings. */
> >> -	sensor->pll.m = 32;
> >> -	sensor->pll.n = 1;
> >> -	sensor->pll.p = 7;
> >> +	int ret;
> >>  
> >>  	/*
> >>  	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
> >> @@ -2287,8 +2304,15 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
> >>  	}
> >>  
> >>  	/* Check if the PLL configuration fits the configured link frequency. */
> >> +	sensor->pll.ext_clock = sensor->clk_freq;
> >> +	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
> >> +
> >> +	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	pixrate = sensor->clk_freq * sensor->pll.m
> >> -		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
> >> +		/ (sensor->pll.n * sensor->pll.p1);
> >>  	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
> >>  		sensor->pixrate = pixrate;
> >>  		sensor->bypass_pll = false;

-- 
Regards,

Laurent Pinchart

