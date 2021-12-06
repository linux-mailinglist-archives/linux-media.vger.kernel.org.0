Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFDE46AB60
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 23:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356525AbhLFW1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 17:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242901AbhLFW1a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 17:27:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC06C061746
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 14:24:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 432C0EE;
        Mon,  6 Dec 2021 23:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638829437;
        bh=KpeEE4T5PkSNvU8NYaBfa8MUJqBD0LovMNdSYgyx+KI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sMThb5ftfyfXMP7V1By7zwz/2ygtShnZBUhPj6Xqxvq4Qp8N+sSDLzK6gc1qf7XxY
         2iV17G9pXEeIEtffqMgpjDSdiJLXl60Uw11bDqOZIiDZrLfpI2csjY6nJoERqfjyWZ
         7fOlE3Pd4+s559AOnSFId85CJfDmLO95LMgAbij0=
Date:   Tue, 7 Dec 2021 00:23:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH 2/2] media: i2c: Add OV1063x sensor driver
Message-ID: <Ya6NYb/ZrQr+zjrI@pendragon.ideasonboard.com>
References: <20210104053945.12409-1-laurent.pinchart@ideasonboard.com>
 <20210104053945.12409-3-laurent.pinchart@ideasonboard.com>
 <20210104114115.GJ11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210104114115.GJ11878@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

I realize I've never replied to your e-mail.

On Mon, Jan 04, 2021 at 01:41:15PM +0200, Sakari Ailus wrote:
> On Mon, Jan 04, 2021 at 07:39:45AM +0200, Laurent Pinchart wrote:
> > Add a new V4L2 subdev driver for the OmniVision OV10633 and OV10635
> > camera sensors. The work is based on the driver from the TI BSP, itself
> > based on original work by Phil Edworthy posted to the linux-media
> > mailing list ([1]). This version of the code is a large rewrite of many
> > parts.
> 
> The driver seems generally quite nice. It doesn't check known-good link
> frequencies are not defined in bindings nor checked by the driver. Could
> you add them?

That won't work easily with the existing PLL configuration code, and I'm
afraid I don't have enough information about the hardware to fix it.
Please see below.

> Same or the assigned-clock-rates in bindings.
> 
> Please see more comments below.
>
> > [1] http://www.spinics.net/lists/linux-media/msg64347.html
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  MAINTAINERS                      |    2 +
> >  drivers/media/i2c/Kconfig        |   12 +
> >  drivers/media/i2c/Makefile       |    1 +
> >  drivers/media/i2c/ov1063x.c      | 1692 ++++++++++++++++++++++++++++++
> >  drivers/media/i2c/ov1063x_regs.h |  626 +++++++++++
> >  5 files changed, 2333 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov1063x.c
> >  create mode 100644 drivers/media/i2c/ov1063x_regs.h

[snip]

> > diff --git a/drivers/media/i2c/ov1063x.c b/drivers/media/i2c/ov1063x.c
> > new file mode 100644
> > index 000000000000..5b25ed5e766b
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov1063x.c
> > @@ -0,0 +1,1692 @@

[snip]

> > +struct ov1063x_pll_config {
> > +	unsigned int pre_div;
> > +	unsigned int mult;
> > +	unsigned int div;
> > +	unsigned int clk_out;
> > +};
> > +
> > +static int ov1063x_pll_setup(unsigned int clk_rate,
> > +			     unsigned int *htsmin, unsigned int vts,
> > +			     unsigned int fps_numerator,
> > +			     unsigned int fps_denominator,
> > +			     struct ov1063x_pll_config *cfg)
> > +{
> > +	static const unsigned int pre_divs[] = { 2, 3, 4, 6, 8, 10, 12, 14 };
> > +
> > +	unsigned int best_pclk = UINT_MAX;
> > +	unsigned int best_pre_div;
> > +	unsigned int best_mult;
> > +	unsigned int best_div;
> > +	unsigned int best_hts;
> > +	unsigned int max_pre_div;
> > +	unsigned int pre_div;
> > +	unsigned int hts;
> > +
> > +	/*
> > +	 *  XVCLK --> pre-div -------> mult ----------> div --> output
> > +	 * 6-27 MHz           3-27 MHz      200-500 MHz       Max 96 MHz
> > +	 *
> > +	 * Valid pre-divider values are 1, 1.5, 2, 3, 4, 5, 6 and 7. The
> > +	 * pre_divs array stores the pre-dividers multiplied by two, indexed by
> > +	 * register values.
> > +	 *
> > +	 * Valid multiplier values are [1, 63], stored as-is in registers.
> > +	 *
> > +	 * Valid divider values are 2 to 16 with a step of 2, stored in
> > +	 * registers as (div / 2) - 1.
> > +	 */
> > +
> > +	if (clk_rate < 6 * 1000 * 1000 || clk_rate > 27 * 1000 * 1000)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * We try all valid combinations of settings for the 3 blocks to get
> > +	 * the pixel clock, and from that calculate the actual hts/vts to use.
> > +	 * The vts is extended so as to achieve the required frame rate.
> > +	 */
> > +
> > +	max_pre_div = max(clk_rate / (3 * 1000 * 1000),
> > +			  ARRAY_SIZE(pre_divs) - 1);
> > +
> > +	for (pre_div = 0; pre_div <= max_pre_div; pre_div++) {
> > +		unsigned int clk1 = clk_rate * 2 / pre_divs[pre_div];
> > +		unsigned int min_mult;
> > +		unsigned int max_mult;
> > +		unsigned int mult;
> > +
> > +		if (clk1 < 3 * 1000 * 1000 || clk1 > 27 * 1000 * 1000)
> > +			continue;
> > +
> > +		min_mult = DIV_ROUND_UP(200 * 1000 * 1000, clk1);
> > +		max_mult = min(500 * 1000 * 1000 / clk1, 63U);
> > +
> > +		for (mult = min_mult; mult <= max_mult; mult++) {
> > +			unsigned int clk2 = clk1 * mult;
> > +			unsigned int min_div;
> > +			unsigned int div;
> > +
> > +			min_div = DIV_ROUND_UP(clk2, 96 * 1000 * 1000);
> > +			min_div = round_up(min_div, 2);
> > +
> > +			for (div = min_div; div <= 16; div += 2) {
> > +				unsigned int pclk = clk2 / div;
> > +				unsigned int min_pclk;
> > +
> > +				/*
> > +				 * TODO: HTS calculation should ideally be split
> > +				 * from the PLL calculations. This requires
> > +				 * figuring out where the pclk / 300000 comes
> > +				 * from.
> > +				 */
> > +				hts = *htsmin + pclk / (300*1000);
> > +
> > +				/* 2 clock cycles for every YUV422 pixel. */
> > +				min_pclk = hts * vts / fps_denominator
> > +					 * fps_numerator * 2;
> > +				if (pclk < min_pclk)
> > +					continue;
> > +
> > +				if (pclk < best_pclk) {
> > +					best_pclk = pclk;
> > +					best_hts = hts;
> > +					best_pre_div = pre_div;
> > +					best_mult = mult;
> > +					best_div = div;
> 
> Can the requested frame rate exceed the highest possible rate here?
> 
> You already control the sensor's PLL and other capabilities such as
> analogue cropping directly. You could make these all configurable from the
> user space the same way the ccs driver does. What do you think?

HTS and VTS should be configurable by userspace, and so should the link
frequency (and possibly even the input clock frequency, indirectly at
least).

I however don't have enough documentation to implement this. I've
reworked this driver from a BSP kernel, with access to some
documentation, but the constraints on HTS and VTS are not documented.
The above TODO comment explains part of the issue. This is the best I
can do for new I believe.

> > +				}
> > +			}
> > +		}
> > +	}
> > +
> > +	if (best_pclk == UINT_MAX)
> > +		return -EINVAL;
> > +
> > +	cfg->mult = best_mult;
> > +	cfg->pre_div = best_pre_div;
> > +	cfg->div = (best_div / 2) - 1;
> > +	cfg->clk_out = best_pclk;
> > +
> > +	*htsmin = best_hts;
> > +
> > +	return 0;
> > +}

[snip]

> > +static int ov1063x_set_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_pad_config *cfg,
> > +			   struct v4l2_subdev_format *fmt)
> > +{
> > +	struct ov1063x_priv *priv = to_ov1063x(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	const struct v4l2_area *fsize;
> > +	unsigned int i;
> > +	u32 code;
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * Validate the media bus code, defaulting to the first one if the
> > +	 * requested code isn't supported.
> > +	 */
> > +	for (i = 0; i < ARRAY_SIZE(ov1063x_mbus_formats); ++i) {
> > +		if (ov1063x_mbus_formats[i] == fmt->format.code) {
> > +			code = fmt->format.code;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (i == ARRAY_SIZE(ov1063x_mbus_formats))
> > +		code = ov1063x_mbus_formats[0];
> 
> You could do this assignment unconditionally in variable initialisation.

I could, but I think it would be more confusing than the current code
pattern, which expresses "try to find format, and if failed, default to
[0]".

> > +
> > +	/* Find the nearest supported frame size. */
> > +	fsize = v4l2_find_nearest_size(ov1063x_framesizes,
> > +				       ARRAY_SIZE(ov1063x_framesizes),
> > +				       width, height, fmt->format.width,
> > +				       fmt->format.height);
> > +
> > +	/* Update the stored format and return it. */
> > +	format = __ov1063x_get_pad_format(priv, cfg, fmt->pad, fmt->which);
> > +
> > +	mutex_lock(priv->hdl.lock);
> > +
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming) {
> > +		ret = -EBUSY;
> > +		goto done;
> > +	}
> > +
> > +	format->code = code;
> > +	format->width = fsize->width;
> > +	format->height = fsize->height;
> > +
> > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +		unsigned int hsub;
> > +		unsigned int vsub;
> > +
> > +		/*
> > +		 * Enable horizontal or vertical sub-sampling automatically when
> > +		 * the width or height are smaller than half the maximum
> > +		 * resolution.
> > +		 */
> > +		hsub = format->width <= 640 ? 2 : 1;
> > +		vsub = format->height <= 400 ? 2 : 1;
> > +
> > +		/*
> > +		 * The analog horizontal crop is restricted to the full sensor
> > +		 * width (1312 pixels), 768 or 656 pixels. Additional cropping
> > +		 * will be applied in the digital domain.
> > +		 */
> > +		priv->analog_crop.width = format->width * hsub;
> > +		priv->analog_crop.height = format->height * vsub;
> > +
> > +		if (priv->analog_crop.width > 768)
> > +			priv->analog_crop.width = OV1063X_SENSOR_WIDTH;
> > +		else if (priv->analog_crop.width > 656)
> > +			priv->analog_crop.width = 768;
> > +		else
> > +			priv->analog_crop.width = 656;
> > +
> > +		/*
> > +		 * The digital crop is applied at the ISP input, before
> > +		 * horizontal sub-sampling but after vertical sub-sampling as
> > +		 * the latter is applied in the pixel array.
> > +		 */
> > +		priv->digital_crop.width = format->width * hsub;
> > +		priv->digital_crop.height = format->height;
> > +
> > +		/*
> > +		 * Center the crop rectangles, rounding coordinates to a
> > +		 * multiple of 2 to avoid changing the Bayer pattern.
> > +		 */
> > +		priv->analog_crop.left = ((OV1063X_SENSOR_WIDTH -
> > +					   priv->analog_crop.width) / 2) & ~1;
> > +		priv->analog_crop.top = ((OV1063X_SENSOR_HEIGHT -
> > +					  priv->analog_crop.height) / 2) & ~1;
> > +		priv->digital_crop.left = ((priv->analog_crop.width -
> > +					    priv->digital_crop.width) / 2) & ~1;
> > +		priv->analog_crop.top = 0;
> > +	}
> > +
> > +	fmt->format = *format;
> > +
> > +done:
> > +	mutex_unlock(priv->hdl.lock);
> > +
> > +	return ret;
> > +}

[snip]

-- 
Regards,

Laurent Pinchart
