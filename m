Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6804A61A1
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 17:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241251AbiBAQwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 11:52:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37620 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241244AbiBAQwd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 11:52:33 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43303332;
        Tue,  1 Feb 2022 17:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643734351;
        bh=9Y1wC3Ca8CQak3AuAVPM/pxuBTPn1WBx0eKv4RbJ+ps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jB9NiMRKSDJ42U1ODfPN38syxumv9XArfoou7QlTsK2NTd5T/W2WBwkiwHwUzsV9M
         xH5ch5FBEDdTkhY3IIK0kRigLOkB//IoDWPW0qqnJMDCSQwAYiNf/+Hu5lVYaEDFLj
         1k4019YW9xwyXwNlgt9xXHx9KL/PVwStVuJ1U0rI=
Date:   Tue, 1 Feb 2022 18:52:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 05/21] media: ov5640: Update pixel_rate and link_freq
Message-ID: <YfllONKz/aWNMv/0@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-6-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-6-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:32:29PM +0100, Jacopo Mondi wrote:
> After having set a new format re-calculate the pixel_rate and link_freq
> control values and update them when in MIPI mode.
> 
> Take into account the limitation of the link frequency having to be
> strictly smaller than 1GHz when computing the desired link_freq, and
> adjust the resulting pixel_rate acounting for the clock tree
> configuration.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 63 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8322b99eb2b7..457f76030163 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2375,6 +2375,65 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> +{
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> +	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
> +	u32 num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;

As this is only valid for CSI-2, I'd move the initialization of the
variable after the !ov5640_is_mipi() check.

> +	unsigned int i = 0;
> +	u32 pixel_rate;
> +	s64 link_freq;
> +	u32 bpp;
> +
> +	/*
> +	 * Update the pixel rate control value.
> +	 *
> +	 * For DVP mode, maintain the pixel rate calculation using fixed FPS.
> +	 */
> +	if (!ov5640_is_mipi(sensor)) {
> +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> +					 ov5640_calc_pixel_rate(sensor));
> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * The MIPI CSI-2 link frequency should comply with the CSI-2
> +	 * specifications and be lower than 1GHz.

s/specifications/specification/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 *
> +	 * Start from the suggested pixel_rate for the current mode and
> +	 * progressively slow it down if it exceeds 1GHz.
> +	 */
> +	bpp = ov5640_code_to_bpp(fmt->code);
> +	do {
> +		pixel_rate = ov5640_pixel_rates[pixel_rate_id];
> +		link_freq = pixel_rate * bpp / (2 * num_lanes);
> +	} while (link_freq >= 1000000000U &&
> +		 ++pixel_rate_id < OV5640_NUM_PIXEL_RATES);
> +
> +	/*
> +	 * Higher link rates require the clock tree to be programmed with
> +	 * 'mipi_div' = 1; this has the effect of halving the actual output
> +	 * pixel rate in the MIPI domain.
> +	 *
> +	 * Adjust the pixel rate control value to report it correctly to
> +	 * userspace.
> +	 */
> +	if (link_freq > OV5640_LINK_RATE_MAX)
> +		pixel_rate /= 2;
> +
> +	for (i = 0; i < ARRAY_SIZE(ov5640_csi2_link_freqs); ++i) {
> +		if (ov5640_csi2_link_freqs[i] == link_freq)
> +			break;
> +	}
> +
> +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
> +
> +	return 0;
> +}
> +
>  static int ov5640_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *format)
> @@ -2414,8 +2473,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>  	/* update format even if code is unchanged, resolution might change */
>  	sensor->fmt = *mbus_fmt;
>  
> -	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> -				 ov5640_calc_pixel_rate(sensor));
> +	ov5640_update_pixel_rate(sensor);
> +
>  out:
>  	mutex_unlock(&sensor->lock);
>  	return ret;

-- 
Regards,

Laurent Pinchart
