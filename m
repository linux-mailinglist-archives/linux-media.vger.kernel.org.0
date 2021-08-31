Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224763FCF51
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 23:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbhHaVxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 17:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhHaVxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 17:53:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AA8C061575;
        Tue, 31 Aug 2021 14:52:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CF0B8F;
        Tue, 31 Aug 2021 23:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630446761;
        bh=+mWsuKWBuln6ZARB7tIdFpRgKwC9Nwgs8ewI/lKcAI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CcQMyKmrkgsmUsL44OsXD8vSNsgnGx1WnaXMMVml2mNm3HgmEJYLWl4LI9QtuE0w0
         tvMRjfc5RFmv6PKXDpUd0ScM2R2q0VCCuY0/JjRZQ67sva0xy6j6DPqWm5wHY0ptsY
         yv+Iv/clSJp6PTViYKJG1Vqkb2B68rfQ/nsEWRI4=
Date:   Wed, 1 Sep 2021 00:52:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pedro Terra <pedro@terraco.de>
Cc:     hverkuil-cisco@xs4all.nl, dafna.hirschfeld@collabora.com,
        mchehab@kernel.org, skhan@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        gabrielabittencourt00@gmail.com, gfmandaji@gmail.com
Subject: Re: [PATCH v7] media: vimc: Enable set resolution at the scaler src
 pad
Message-ID: <YS6kmp9wxvIok5F3@pendragon.ideasonboard.com>
References: <20210831174822.83870-1-pedro@terraco.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210831174822.83870-1-pedro@terraco.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pedro,

Thank you for the patch.

On Tue, Aug 31, 2021 at 02:48:22PM -0300, Pedro Terra wrote:
> Modify the scaler subdevice to accept setting the resolution of the source
> pad (previously the source resolution would always be 3 times the sink for
> both dimensions). Now any resolution can be set at src (even smaller ones)
> and the sink video will be scaled to match it.
> 
> Test example: With the vimc module up (using the default vimc topology)
> media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
> media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
> media-ctl -d platform:vimc -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
> media-ctl -d platform:vimc -V '"Scaler":0[crop:(100,50)/400x150]'
> media-ctl -d platform:vimc -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
> v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=300,height=700
> v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
> v4l2-ctl --stream-mmap --stream-count=10 -z platform:vimc -d "RGB/YUV Capture" \
> 	-stream-to=test.raw

That should be --stream-to, not -stream-to.

> 
> The result will be a cropped stream that can be checked with the command
> ffplay -loglevel warning -v info -f rawvideo -pixel_format rgb24 \
> 	-video_size "300x700" test.raw
> 
> Co-developed-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> Co-developed-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
> Signed-off-by: Gabriel Francisco Mandaji <gfmandaji@gmail.com>
> Signed-off-by: Pedro "pirate" Terra <pirate@terraco.de>
> 
> ---
> 
> Changes in V7:
> * Corrections proposed by Laurent:
> 	- Fix commit message
> 	- Fix .rst identation
> 	- Properly initialize both pads in a loop
> 	- Placed vimc_sca_get_fmt() before set_fmt to keep
> 		the order they're set in v4l2_subdev_pad_ops structure.
> 	- Renamed variables to avoid ambiguity.
> 
> Changes in V6:
> * Corrections proposed by Laurent:
> 	- Corrected commit example to become file independent.
> 	- Cleaned unnecessary code inserted at vimc_sca_init_cfg
> 	- s/__u32/u32/
> 	- Refactored vimc_sca_(set/get)_fmt and vimc_sca_(get/set)_selection
> 		as suggested to make it more readable.
> 	- Corrected code alignment.
> 	- Cleaned and optimized vimc_sca_fill_src_frame
> 
> Changes in V5:
> * Fixed code aliment mistake
> * Renamed some variables to make the code more readable
> * Propagate sink pad formatting to src resetting the 1:1 scaling ratio.
> 	(the crop is also reset when this is done).
> 
> Changes in V4:
> * Rebased with media/master
> * Scaling is now compatible with crop
> * Updated test example at the commit message
> * Add vimc prefix to the pad enumeration
> 
> Changes in V3:
> * Corrections suggested by Hans:
> 	- Default scaling factor is now 1 (we removed the define and
> 	  set the source format equals the sink).
> 	- Removed SCA_COUNT (enum that represents the number of pads)
> 	  as there always 2
> 	- Swapped the per byte pixel copy to memcpy.
> * Corrections suggested by Dafna:
> 	- Removed from the documentation the old scaler parameter which
> 	  isn't necessary anymore.
> * Added a thank you note at the end of the email
> 
> Changes in V2:
> * Patch was not sent to media list mail for some reason (even though it
> was on the Cc list), trying again.
> * Updating documentation.
> 
> Running
> /usr/local/bin/v4l2-compliance -m /dev/media0
> Gave the following result:
> v4l2-compliance SHA: c86aab9cc7f1 2021-07-28 11:52:45
> Grand Total for vimc device /dev/media0: 473, Succeeded: 473, Failed: 0, Warnings: 0
> ---
>  Documentation/admin-guide/media/vimc.rst      |  20 +-
>  drivers/media/test-drivers/vimc/vimc-scaler.c | 366 +++++++-----------
>  2 files changed, 148 insertions(+), 238 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
> index 211cc8972410..4e5793db6651 100644
> --- a/Documentation/admin-guide/media/vimc.rst
> +++ b/Documentation/admin-guide/media/vimc.rst
> @@ -61,9 +61,10 @@ vimc-debayer:
>  	* 1 Pad source
>  
>  vimc-scaler:
> -	Scale up the image by a factor of 3. E.g.: a 640x480 image becomes a
> -        1920x1440 image. (this value can be configured, see at
> -        `Module options`_).
> +	Re-size the image to meet the source pad resolution. E.g.: if the sync pad
> +	is configured to 360x480 and the source to 1280x720, the image will be stretched
> +	to fit the source resolution. Works for any resolution within the vimc
> +	limitations (even shrinking the image if necessary).

Lines should be wrapped at 80 columns in the documentation.

Apart from that, it all looks good.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If you're fine with it, I can fix the two issues above when applying the
patch to my tree, and I'll then send a pull request.

Would anyone else like to review this patch ?

>  	Exposes:
>  
>  	* 1 Pad sink
> @@ -75,16 +76,3 @@ vimc-capture:
>  
>  	* 1 Pad sink
>  	* 1 Pad source
> -
> -
> -Module options
> ---------------
> -
> -Vimc has a module parameter to configure the driver.
> -
> -* ``sca_mult=<unsigned int>``
> -
> -        Image size multiplier factor to be used to multiply both width and
> -        height, so the image size will be ``sca_mult^2`` bigger than the
> -        original one. Currently, only supports scaling up (the default value
> -        is 3).
> diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
> index 06880dd0b6ac..820b8f5b502f 100644
> --- a/drivers/media/test-drivers/vimc/vimc-scaler.c
> +++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/moduleparam.h>
> +#include <linux/string.h>
>  #include <linux/vmalloc.h>
>  #include <linux/v4l2-mediabus.h>
>  #include <media/v4l2-rect.h>
> @@ -13,11 +14,11 @@
>  
>  #include "vimc-common.h"
>  
> -static unsigned int sca_mult = 3;
> -module_param(sca_mult, uint, 0000);
> -MODULE_PARM_DESC(sca_mult, " the image size multiplier");
> -
> -#define MAX_ZOOM	8
> +/* Pad identifier */
> +enum vic_sca_pad {
> +	VIMC_SCA_SINK = 0,
> +	VIMC_SCA_SRC = 1,
> +};
>  
>  #define VIMC_SCA_FMT_WIDTH_DEFAULT  640
>  #define VIMC_SCA_FMT_HEIGHT_DEFAULT 480
> @@ -25,19 +26,16 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
>  struct vimc_sca_device {
>  	struct vimc_ent_device ved;
>  	struct v4l2_subdev sd;
> -	/* NOTE: the source fmt is the same as the sink
> -	 * with the width and hight multiplied by mult
> -	 */
> -	struct v4l2_mbus_framefmt sink_fmt;
>  	struct v4l2_rect crop_rect;
> +	/* Frame format for both sink and src pad */
> +	struct v4l2_mbus_framefmt fmt[2];
>  	/* Values calculated when the stream starts */
>  	u8 *src_frame;
> -	unsigned int src_line_size;
>  	unsigned int bpp;
>  	struct media_pad pads[2];
>  };
>  
> -static const struct v4l2_mbus_framefmt sink_fmt_default = {
> +static const struct v4l2_mbus_framefmt fmt_default = {
>  	.width = VIMC_SCA_FMT_WIDTH_DEFAULT,
>  	.height = VIMC_SCA_FMT_HEIGHT_DEFAULT,
>  	.code = MEDIA_BUS_FMT_RGB888_1X24,
> @@ -72,17 +70,6 @@ vimc_sca_get_crop_bound_sink(const struct v4l2_mbus_framefmt *sink_fmt)
>  	return r;
>  }
>  
> -static void vimc_sca_adjust_sink_crop(struct v4l2_rect *r,
> -				      const struct v4l2_mbus_framefmt *sink_fmt)
> -{
> -	const struct v4l2_rect sink_rect =
> -		vimc_sca_get_crop_bound_sink(sink_fmt);
> -
> -	/* Disallow rectangles smaller than the minimal one. */
> -	v4l2_rect_set_min_size(r, &crop_rect_min);
> -	v4l2_rect_map_inside(r, &sink_rect);
> -}
> -
>  static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state)
>  {
> @@ -90,19 +77,14 @@ static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
>  	struct v4l2_rect *r;
>  	unsigned int i;
>  
> -	mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
> -	*mf = sink_fmt_default;
> -
> -	r = v4l2_subdev_get_try_crop(sd, sd_state, 0);
> -	*r = crop_rect_default;
> -
> -	for (i = 1; i < sd->entity.num_pads; i++) {
> +	for (i = 0; i < sd->entity.num_pads; i++) {
>  		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
> -		*mf = sink_fmt_default;
> -		mf->width = mf->width * sca_mult;
> -		mf->height = mf->height * sca_mult;
> +		*mf = fmt_default;
>  	}
>  
> +	r = v4l2_subdev_get_try_crop(sd, sd_state, VIMC_SCA_SINK);
> +	*r = crop_rect_default;
> +
>  	return 0;
>  }
>  
> @@ -144,112 +126,108 @@ static int vimc_sca_enum_frame_size(struct v4l2_subdev *sd,
>  	fse->min_width = VIMC_FRAME_MIN_WIDTH;
>  	fse->min_height = VIMC_FRAME_MIN_HEIGHT;
>  
> -	if (VIMC_IS_SINK(fse->pad)) {
> -		fse->max_width = VIMC_FRAME_MAX_WIDTH;
> -		fse->max_height = VIMC_FRAME_MAX_HEIGHT;
> -	} else {
> -		fse->max_width = VIMC_FRAME_MAX_WIDTH * MAX_ZOOM;
> -		fse->max_height = VIMC_FRAME_MAX_HEIGHT * MAX_ZOOM;
> -	}
> +	fse->max_width = VIMC_FRAME_MAX_WIDTH;
> +	fse->max_height = VIMC_FRAME_MAX_HEIGHT;
>  
>  	return 0;
>  }
>  
> +static struct v4l2_mbus_framefmt *
> +vimc_sca_pad_format(struct vimc_sca_device *vsca,
> +		    struct v4l2_subdev_state *sd_state, u32 pad,
> +		    enum v4l2_subdev_format_whence which)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_get_try_format(&vsca->sd, sd_state, pad);
> +	else
> +		return &vsca->fmt[pad];
> +}
> +
> +static struct v4l2_rect *
> +vimc_sca_pad_crop(struct vimc_sca_device *vsca,
> +		  struct v4l2_subdev_state *sd_state,
> +		  enum v4l2_subdev_format_whence which)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_get_try_crop(&vsca->sd, sd_state,
> +						VIMC_SCA_SINK);
> +	else
> +		return &vsca->crop_rect;
> +}
> +
>  static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *sd_state,
>  			    struct v4l2_subdev_format *format)
>  {
>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
> -	struct v4l2_rect *crop_rect;
> -
> -	/* Get the current sink format */
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
> -		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
> -	} else {
> -		format->format = vsca->sink_fmt;
> -		crop_rect = &vsca->crop_rect;
> -	}
> -
> -	/* Scale the frame size for the source pad */
> -	if (VIMC_IS_SRC(format->pad)) {
> -		format->format.width = crop_rect->width * sca_mult;
> -		format->format.height = crop_rect->height * sca_mult;
> -	}
>  
> +	format->format = *vimc_sca_pad_format(vsca, sd_state, format->pad,
> +					      format->which);
>  	return 0;
>  }
>  
> -static void vimc_sca_adjust_sink_fmt(struct v4l2_mbus_framefmt *fmt)
> -{
> -	const struct vimc_pix_map *vpix;
> -
> -	/* Only accept code in the pix map table in non bayer format */
> -	vpix = vimc_pix_map_by_code(fmt->code);
> -	if (!vpix || vpix->bayer)
> -		fmt->code = sink_fmt_default.code;
> -
> -	fmt->width = clamp_t(u32, fmt->width, VIMC_FRAME_MIN_WIDTH,
> -			     VIMC_FRAME_MAX_WIDTH) & ~1;
> -	fmt->height = clamp_t(u32, fmt->height, VIMC_FRAME_MIN_HEIGHT,
> -			      VIMC_FRAME_MAX_HEIGHT) & ~1;
> -
> -	if (fmt->field == V4L2_FIELD_ANY)
> -		fmt->field = sink_fmt_default.field;
> -
> -	vimc_colorimetry_clamp(fmt);
> -}
> -
>  static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *sd_state,
> -			    struct v4l2_subdev_format *fmt)
> +			    struct v4l2_subdev_format *format)
>  {
>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
> -	struct v4l2_mbus_framefmt *sink_fmt;
> -	struct v4l2_rect *crop_rect;
> +	struct v4l2_mbus_framefmt *fmt;
>  
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		/* Do not change the format while stream is on */
> -		if (vsca->src_frame)
> -			return -EBUSY;
> +	/* Do not change the active format while stream is on */
> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && vsca->src_frame)
> +		return -EBUSY;
>  
> -		sink_fmt = &vsca->sink_fmt;
> -		crop_rect = &vsca->crop_rect;
> -	} else {
> -		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> -		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
> +	fmt = vimc_sca_pad_format(vsca, sd_state, format->pad, format->which);
> +
> +	/*
> +	 * The media bus code and colorspace can only be changed on the sink
> +	 * pad, the source pad only follows.
> +	 */
> +	if (format->pad == VIMC_SCA_SINK) {
> +		const struct vimc_pix_map *vpix;
> +
> +		/* Only accept code in the pix map table in non bayer format. */
> +		vpix = vimc_pix_map_by_code(format->format.code);
> +		if (vpix && !vpix->bayer)
> +			fmt->code = format->format.code;
> +		else
> +			fmt->code = fmt_default.code;
> +
> +		/* Clamp the colorspace to valid values. */
> +		fmt->colorspace = format->format.colorspace;
> +		fmt->ycbcr_enc = format->format.ycbcr_enc;
> +		fmt->quantization = format->format.quantization;
> +		fmt->xfer_func = format->format.xfer_func;
> +		vimc_colorimetry_clamp(fmt);
>  	}
>  
> +	/* Clamp and align the width and height */
> +	fmt->width = clamp_t(u32, format->format.width, VIMC_FRAME_MIN_WIDTH,
> +			     VIMC_FRAME_MAX_WIDTH) & ~1;
> +	fmt->height = clamp_t(u32, format->format.height, VIMC_FRAME_MIN_HEIGHT,
> +			      VIMC_FRAME_MAX_HEIGHT) & ~1;
> +
>  	/*
> -	 * Do not change the format of the source pad,
> -	 * it is propagated from the sink
> +	 * Propagate the sink pad format to the crop rectangle and the source
> +	 * pad.
>  	 */
> -	if (VIMC_IS_SRC(fmt->pad)) {
> -		fmt->format = *sink_fmt;
> -		fmt->format.width = crop_rect->width * sca_mult;
> -		fmt->format.height = crop_rect->height * sca_mult;
> -	} else {
> -		/* Set the new format in the sink pad */
> -		vimc_sca_adjust_sink_fmt(&fmt->format);
> -
> -		dev_dbg(vsca->ved.dev, "%s: sink format update: "
> -			"old:%dx%d (0x%x, %d, %d, %d, %d) "
> -			"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vsca->sd.name,
> -			/* old */
> -			sink_fmt->width, sink_fmt->height, sink_fmt->code,
> -			sink_fmt->colorspace, sink_fmt->quantization,
> -			sink_fmt->xfer_func, sink_fmt->ycbcr_enc,
> -			/* new */
> -			fmt->format.width, fmt->format.height, fmt->format.code,
> -			fmt->format.colorspace,	fmt->format.quantization,
> -			fmt->format.xfer_func, fmt->format.ycbcr_enc);
> -
> -		*sink_fmt = fmt->format;
> -
> -		/* Do the crop, but respect the current bounds */
> -		vimc_sca_adjust_sink_crop(crop_rect, sink_fmt);
> +	if (format->pad == VIMC_SCA_SINK) {
> +		struct v4l2_mbus_framefmt *src_fmt;
> +		struct v4l2_rect *crop;
> +
> +		crop = vimc_sca_pad_crop(vsca, sd_state, format->which);
> +		crop->width = fmt->width;
> +		crop->height = fmt->height;
> +		crop->top = 0;
> +		crop->left = 0;
> +
> +		src_fmt = vimc_sca_pad_format(vsca, sd_state, VIMC_SCA_SRC,
> +					      format->which);
> +		*src_fmt = *fmt;
>  	}
>  
> +	format->format = *fmt;
> +
>  	return 0;
>  }
>  
> @@ -259,24 +237,17 @@ static int vimc_sca_get_selection(struct v4l2_subdev *sd,
>  {
>  	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *sink_fmt;
> -	struct v4l2_rect *crop_rect;
>  
>  	if (VIMC_IS_SRC(sel->pad))
>  		return -EINVAL;
>  
> -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		sink_fmt = &vsca->sink_fmt;
> -		crop_rect = &vsca->crop_rect;
> -	} else {
> -		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> -		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
> -	}
> -
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP:
> -		sel->r = *crop_rect;
> +		sel->r = *vimc_sca_pad_crop(vsca, sd_state, sel->which);
>  		break;
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sink_fmt = vimc_sca_pad_format(vsca, sd_state, VIMC_SCA_SINK,
> +					       sel->which);
>  		sel->r = vimc_sca_get_crop_bound_sink(sink_fmt);
>  		break;
>  	default:
> @@ -286,6 +257,17 @@ static int vimc_sca_get_selection(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static void vimc_sca_adjust_sink_crop(struct v4l2_rect *r,
> +				      const struct v4l2_mbus_framefmt *sink_fmt)
> +{
> +	const struct v4l2_rect sink_rect =
> +		vimc_sca_get_crop_bound_sink(sink_fmt);
> +
> +	/* Disallow rectangles smaller than the minimal one. */
> +	v4l2_rect_set_min_size(r, &crop_rect_min);
> +	v4l2_rect_map_inside(r, &sink_rect);
> +}
> +
>  static int vimc_sca_set_selection(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_selection *sel)
> @@ -294,30 +276,18 @@ static int vimc_sca_set_selection(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *sink_fmt;
>  	struct v4l2_rect *crop_rect;
>  
> -	if (VIMC_IS_SRC(sel->pad))
> +	/* Only support setting the crop of the sink pad */
> +	if (VIMC_IS_SRC(sel->pad) || sel->target != V4L2_SEL_TGT_CROP)
>  		return -EINVAL;
>  
> -	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		/* Do not change the format while stream is on */
> -		if (vsca->src_frame)
> -			return -EBUSY;
> +	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE && vsca->src_frame)
> +		return -EBUSY;
>  
> -		crop_rect = &vsca->crop_rect;
> -		sink_fmt = &vsca->sink_fmt;
> -	} else {
> -		crop_rect = v4l2_subdev_get_try_crop(sd, sd_state, 0);
> -		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> -	}
> -
> -	switch (sel->target) {
> -	case V4L2_SEL_TGT_CROP:
> -		/* Do the crop, but respect the current bounds */
> -		vimc_sca_adjust_sink_crop(&sel->r, sink_fmt);
> -		*crop_rect = sel->r;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> +	crop_rect = vimc_sca_pad_crop(vsca, sd_state, sel->which);
> +	sink_fmt = vimc_sca_pad_format(vsca, sd_state, VIMC_SCA_SINK,
> +				       sel->which);
> +	vimc_sca_adjust_sink_crop(&sel->r, sink_fmt);
> +	*crop_rect = sel->r;
>  
>  	return 0;
>  }
> @@ -344,16 +314,12 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
>  			return 0;
>  
>  		/* Save the bytes per pixel of the sink */
> -		vpix = vimc_pix_map_by_code(vsca->sink_fmt.code);
> +		vpix = vimc_pix_map_by_code(vsca->fmt[VIMC_SCA_SINK].code);
>  		vsca->bpp = vpix->bpp;
>  
> -		/* Calculate the width in bytes of the src frame */
> -		vsca->src_line_size = vsca->crop_rect.width *
> -				      sca_mult * vsca->bpp;
> -
>  		/* Calculate the frame size of the source pad */
> -		frame_size = vsca->src_line_size * vsca->crop_rect.height *
> -			     sca_mult;
> +		frame_size = vsca->fmt[VIMC_SCA_SRC].width
> +			   * vsca->fmt[VIMC_SCA_SRC].height * vsca->bpp;
>  
>  		/* Allocate the frame buffer. Use vmalloc to be able to
>  		 * allocate a large amount of memory
> @@ -382,77 +348,32 @@ static const struct v4l2_subdev_ops vimc_sca_ops = {
>  	.video = &vimc_sca_video_ops,
>  };
>  
> -static void vimc_sca_fill_pix(u8 *const ptr,
> -			      const u8 *const pixel,
> -			      const unsigned int bpp)
> -{
> -	unsigned int i;
> -
> -	/* copy the pixel to the pointer */
> -	for (i = 0; i < bpp; i++)
> -		ptr[i] = pixel[i];
> -}
> -
> -static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
> -			       unsigned int lin, unsigned int col,
> -			       const u8 *const sink_frame)
> -{
> -	const struct v4l2_rect crop_rect = vsca->crop_rect;
> -	unsigned int i, j, index;
> -	const u8 *pixel;
> -
> -	/* Point to the pixel value in position (lin, col) in the sink frame */
> -	index = VIMC_FRAME_INDEX(lin, col,
> -				 vsca->sink_fmt.width,
> -				 vsca->bpp);
> -	pixel = &sink_frame[index];
> -
> -	dev_dbg(vsca->ved.dev,
> -		"sca: %s: --- scale_pix sink pos %dx%d, index %d ---\n",
> -		vsca->sd.name, lin, col, index);
> -
> -	/* point to the place we are going to put the first pixel
> -	 * in the scaled src frame
> -	 */
> -	lin -= crop_rect.top;
> -	col -= crop_rect.left;
> -	index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
> -				 crop_rect.width * sca_mult, vsca->bpp);
> -
> -	dev_dbg(vsca->ved.dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
> -		vsca->sd.name, lin * sca_mult, col * sca_mult, index);
> -
> -	/* Repeat this pixel mult times */
> -	for (i = 0; i < sca_mult; i++) {
> -		/* Iterate through each beginning of a
> -		 * pixel repetition in a line
> -		 */
> -		for (j = 0; j < sca_mult * vsca->bpp; j += vsca->bpp) {
> -			dev_dbg(vsca->ved.dev,
> -				"sca: %s: sca: scale_pix src pos %d\n",
> -				vsca->sd.name, index + j);
> -
> -			/* copy the pixel to the position index + j */
> -			vimc_sca_fill_pix(&vsca->src_frame[index + j],
> -					  pixel, vsca->bpp);
> -		}
> -
> -		/* move the index to the next line */
> -		index += vsca->src_line_size;
> -	}
> -}
> -
>  static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
>  				    const u8 *const sink_frame)
>  {
> -	const struct v4l2_rect r = vsca->crop_rect;
> -	unsigned int i, j;
> -
> -	/* Scale each pixel from the original sink frame */
> -	/* TODO: implement scale down, only scale up is supported for now */
> -	for (i = r.top; i < r.top + r.height; i++)
> -		for (j = r.left; j < r.left + r.width; j++)
> -			vimc_sca_scale_pix(vsca, i, j, sink_frame);
> +	const struct v4l2_mbus_framefmt *src_fmt = &vsca->fmt[VIMC_SCA_SRC];
> +	const struct v4l2_rect *r = &vsca->crop_rect;
> +	unsigned int snk_width = vsca->fmt[VIMC_SCA_SINK].width;
> +	unsigned int src_x, src_y;
> +	u8 *walker = vsca->src_frame;
> +
> +	/* Set each pixel at the src_frame to its sink_frame equivalent */
> +	for (src_y = 0; src_y < src_fmt->height; src_y++) {
> +		unsigned int snk_y, y_offset;
> +
> +		snk_y = (src_y * r->height) / src_fmt->height + r->top;
> +		y_offset = snk_y * snk_width * vsca->bpp;
> +
> +		for (src_x = 0; src_x < src_fmt->width; src_x++) {
> +			unsigned int snk_x, x_offset, index;
> +
> +			snk_x = (src_x * r->width) / src_fmt->width + r->left;
> +			x_offset = snk_x * vsca->bpp;
> +			index = y_offset + x_offset;
> +			memcpy(walker, &sink_frame[index], vsca->bpp);
> +			walker += vsca->bpp;
> +		}
> +	}
>  }
>  
>  static void *vimc_sca_process_frame(struct vimc_ent_device *ved,
> @@ -492,8 +413,8 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>  		return ERR_PTR(-ENOMEM);
>  
>  	/* Initialize ved and sd */
> -	vsca->pads[0].flags = MEDIA_PAD_FL_SINK;
> -	vsca->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> +	vsca->pads[VIMC_SCA_SINK].flags = MEDIA_PAD_FL_SINK;
> +	vsca->pads[VIMC_SCA_SRC].flags = MEDIA_PAD_FL_SOURCE;
>  
>  	ret = vimc_ent_sd_register(&vsca->ved, &vsca->sd, v4l2_dev,
>  				   vcfg_name,
> @@ -508,7 +429,8 @@ static struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
>  	vsca->ved.dev = vimc->mdev.dev;
>  
>  	/* Initialize the frame format */
> -	vsca->sink_fmt = sink_fmt_default;
> +	vsca->fmt[VIMC_SCA_SINK] = fmt_default;
> +	vsca->fmt[VIMC_SCA_SRC] = fmt_default;
>  
>  	/* Initialize the crop selection */
>  	vsca->crop_rect = crop_rect_default;

-- 
Regards,

Laurent Pinchart
