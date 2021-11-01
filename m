Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D44B441D21
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 16:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhKAPIt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 11:08:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:59427 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231304AbhKAPIs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 11:08:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="231294797"
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="231294797"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 08:04:25 -0700
X-IronPort-AV: E=Sophos;i="5.87,199,1631602800"; 
   d="scan'208";a="531209008"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 08:04:21 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B7C5C2015E;
        Mon,  1 Nov 2021 17:04:19 +0200 (EET)
Date:   Mon, 1 Nov 2021 17:04:19 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 09/16] media: i2c: Update HTS values in ov8865
Message-ID: <YYAB81QH3giCg7Wd@paasikivi.fi.intel.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
 <20211101001119.46056-10-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101001119.46056-10-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Nov 01, 2021 at 12:11:12AM +0000, Daniel Scally wrote:
> The HTS values for some of the modes in the ov8865 driver are a bit
> unusual, coming in lower than the output_size_x is set to. It seems
> like they might be calculated to fit the desired framerate into a
> configuration with just two data lanes. To bring this more in line
> with expected behaviour, raise the HTS values above the output_size_x.

This isn't necessarily a problem as binning may be done in analogue domain.
I don't know about this sensor though.

Is the frame interval still as expected in binned modes after this patch?

> 
> The corollary of that change is that the hardcoded frame intervals
> against the modes no longer make sense, so remove those entirely.
> Update the .g/s_frame_interval() callbacks to calculate the frame
> interval based on the current mode and the vblank and hblank settings.
> 
> The implementation of the .enum_frame_interval() callback is no longer
> suitable since the possible frame rate is now a continuous range depending
> on the vblank control setting, so remove that callback entirely.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov8865.c | 65 +++++++-------------------------------
>  1 file changed, 11 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index 4b18cc80f985..1b8674152750 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -659,8 +659,6 @@ struct ov8865_mode {
>  	unsigned int blc_anchor_right_start;
>  	unsigned int blc_anchor_right_end;
>  
> -	struct v4l2_fract frame_interval;
> -
>  	bool pll2_binning;
>  
>  	const struct ov8865_register_value *register_values;
> @@ -964,7 +962,7 @@ static const struct ov8865_mode ov8865_modes[] = {
>  	{
>  		/* Horizontal */
>  		.output_size_x			= 3264,
> -		.hts				= 1944,
> +		.hts				= 3888,
>  
>  		/* Vertical */
>  		.output_size_y			= 2448,
> @@ -1003,9 +1001,6 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.blc_anchor_right_start		= 1984,
>  		.blc_anchor_right_end		= 2239,
>  
> -		/* Frame Interval */
> -		.frame_interval			= { 1, 30 },
> -
>  		/* PLL */
>  		.pll2_binning			= false,
>  
> @@ -1018,11 +1013,11 @@ static const struct ov8865_mode ov8865_modes[] = {
>  	{
>  		/* Horizontal */
>  		.output_size_x			= 3264,
> -		.hts				= 2582,
> +		.hts				= 3888,
>  
>  		/* Vertical */
>  		.output_size_y			= 1836,
> -		.vts				= 2002,
> +		.vts				= 2470,
>  
>  		.size_auto			= true,
>  		.size_auto_boundary_x		= 8,
> @@ -1057,9 +1052,6 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.blc_anchor_right_start		= 1984,
>  		.blc_anchor_right_end		= 2239,
>  
> -		/* Frame Interval */
> -		.frame_interval			= { 1, 30 },
> -
>  		/* PLL */
>  		.pll2_binning			= false,
>  
> @@ -1115,9 +1107,6 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.blc_anchor_right_start		= 992,
>  		.blc_anchor_right_end		= 1119,
>  
> -		/* Frame Interval */
> -		.frame_interval			= { 1, 30 },
> -
>  		/* PLL */
>  		.pll2_binning			= true,
>  
> @@ -1179,9 +1168,6 @@ static const struct ov8865_mode ov8865_modes[] = {
>  		.blc_anchor_right_start		= 992,
>  		.blc_anchor_right_end		= 1119,
>  
> -		/* Frame Interval */
> -		.frame_interval			= { 1, 90 },
> -
>  		/* PLL */
>  		.pll2_binning			= true,
>  
> @@ -2628,11 +2614,18 @@ static int ov8865_g_frame_interval(struct v4l2_subdev *subdev,
>  {
>  	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
>  	const struct ov8865_mode *mode;
> +	unsigned int framesize;
> +	unsigned int fps;
>  
>  	mutex_lock(&sensor->mutex);
>  
>  	mode = sensor->state.mode;
> -	interval->interval = mode->frame_interval;
> +	framesize = mode->hts * (mode->output_size_y +
> +				 sensor->ctrls.vblank->val);
> +	fps = DIV_ROUND_CLOSEST(sensor->ctrls.pixel_rate->val, framesize);
> +
> +	interval->interval.numerator = 1;
> +	interval->interval.denominator = fps;
>  
>  	mutex_unlock(&sensor->mutex);
>  
> @@ -2777,41 +2770,6 @@ static int ov8865_enum_frame_size(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> -static int ov8865_enum_frame_interval(struct v4l2_subdev *subdev,
> -				      struct v4l2_subdev_state *sd_state,
> -				      struct v4l2_subdev_frame_interval_enum *interval_enum)
> -{
> -	const struct ov8865_mode *mode = NULL;
> -	unsigned int mode_index;
> -	unsigned int interval_index;
> -
> -	if (interval_enum->index > 0)
> -		return -EINVAL;
> -	/*
> -	 * Multiple modes with the same dimensions may have different frame
> -	 * intervals, so look up each relevant mode.
> -	 */
> -	for (mode_index = 0, interval_index = 0;
> -	     mode_index < ARRAY_SIZE(ov8865_modes); mode_index++) {
> -		mode = &ov8865_modes[mode_index];
> -
> -		if (mode->output_size_x == interval_enum->width &&
> -		    mode->output_size_y == interval_enum->height) {
> -			if (interval_index == interval_enum->index)
> -				break;
> -
> -			interval_index++;
> -		}
> -	}
> -
> -	if (mode_index == ARRAY_SIZE(ov8865_modes))
> -		return -EINVAL;
> -
> -	interval_enum->interval = mode->frame_interval;
> -
> -	return 0;
> -}
> -
>  static void
>  __ov8865_get_pad_crop(struct ov8865_sensor *sensor,
>  		      struct v4l2_subdev_state *state, unsigned int pad,
> @@ -2870,7 +2828,6 @@ static const struct v4l2_subdev_pad_ops ov8865_subdev_pad_ops = {
>  	.get_fmt		= ov8865_get_fmt,
>  	.set_fmt		= ov8865_set_fmt,
>  	.enum_frame_size	= ov8865_enum_frame_size,
> -	.enum_frame_interval	= ov8865_enum_frame_interval,
>  	.get_selection		= ov8865_get_selection,
>  	.set_selection		= ov8865_get_selection,
>  };

-- 
Kind regards,

Sakari Ailus
