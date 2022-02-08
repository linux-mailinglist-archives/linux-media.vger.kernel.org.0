Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550D84ACF07
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 03:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345335AbiBHCkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 21:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346021AbiBHCkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 21:40:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707E6C061355
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 18:40:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2BCD340;
        Tue,  8 Feb 2022 03:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644288020;
        bh=8RmqJ2yGa2TIZQg27mpQVZzP00ZDzABNweaH0ZRMsOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qz6Immg2QjFTLAdGfZzlvGnXl75E4uV+VDh3K9er0Cl7jTFy0YG1WUnB93YNobIRV
         EmMILDUI5BPAExJUYy7ukfe8eK89uCgCsOjE+1FWZmUukyIhYdE45dqBsPYSeKvWmP
         IwNF79aQ5a6jJnB13ZC4ehfHksYKlbQb0kgKx9A4=
Date:   Tue, 8 Feb 2022 04:40:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v3 7/7] media: subdev: rename
 v4l2_subdev_pad_config.try_* fields
Message-ID: <YgHYEZwjSuqVPWUk@pendragon.ideasonboard.com>
References: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
 <20220207161107.1166376-8-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207161107.1166376-8-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Feb 07, 2022 at 06:11:07PM +0200, Tomi Valkeinen wrote:
> struct v4l2_subdev_pad_config used to be relevant only for
> V4L2_SUBDEV_FORMAT_TRY configuration, and thus the fields of the struct
> were named, e.g. try_fmt.
> 
> This struct is now used in struct v4l2_subdev_state, and thus can be
> used in both try and active cases. Thus rename the fields and drop the
> "try_" prefix.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/i2c/adv7183.c                   |  2 +-
>  drivers/media/i2c/imx274.c                    | 12 ++++-----
>  drivers/media/i2c/mt9m001.c                   |  2 +-
>  drivers/media/i2c/mt9m111.c                   |  2 +-
>  drivers/media/i2c/mt9t112.c                   |  2 +-
>  drivers/media/i2c/mt9v011.c                   |  2 +-
>  drivers/media/i2c/mt9v111.c                   |  4 +--
>  drivers/media/i2c/ov2640.c                    |  2 +-
>  drivers/media/i2c/ov6650.c                    | 18 ++++++-------
>  drivers/media/i2c/ov772x.c                    |  2 +-
>  drivers/media/i2c/ov9640.c                    |  2 +-
>  drivers/media/i2c/rj54n1cb0c.c                |  2 +-
>  drivers/media/i2c/saa6752hs.c                 |  2 +-
>  drivers/media/i2c/sr030pc30.c                 |  2 +-
>  drivers/media/i2c/tw9910.c                    |  2 +-
>  drivers/media/i2c/vs6624.c                    |  2 +-
>  drivers/media/platform/atmel/atmel-isc-base.c |  8 +++---
>  drivers/media/platform/atmel/atmel-isi.c      |  8 +++---

Would it be possible to move those drivers to use the
v4l2_subdev_get_try_*() helpers instead of accessing the fields directly
? It doesn't necessarily need to be done as part of this series, but
after removing the try_ prefix from the fields it will be more difficult
to identify the offending drivers.

In a separate patch (not part of this series) we should also rename the
v4l2_subdev_get_try_*() functions to v4l2_subdev_state_get_*().

>  include/media/v4l2-subdev.h                   | 26 +++++++++----------
>  19 files changed, 50 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
> index 92cafdea3f1f..9e590abf88e1 100644
> --- a/drivers/media/i2c/adv7183.c
> +++ b/drivers/media/i2c/adv7183.c
> @@ -443,7 +443,7 @@ static int adv7183_set_fmt(struct v4l2_subdev *sd,
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		decoder->fmt = *fmt;
>  	else
> -		sd_state->pads->try_fmt = *fmt;
> +		sd_state->pads->fmt = *fmt;
>  	return 0;
>  }
>  
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 2aa15b9c23cc..c94c24358931 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -1020,8 +1020,8 @@ static int __imx274_change_compose(struct stimx274 *imx274,
>  	int best_goodness = INT_MIN;
>  
>  	if (which == V4L2_SUBDEV_FORMAT_TRY) {
> -		cur_crop = &sd_state->pads->try_crop;
> -		tgt_fmt = &sd_state->pads->try_fmt;
> +		cur_crop = &sd_state->pads->crop;
> +		tgt_fmt = &sd_state->pads->fmt;
>  	} else {
>  		cur_crop = &imx274->crop;
>  		tgt_fmt = &imx274->format;
> @@ -1114,7 +1114,7 @@ static int imx274_set_fmt(struct v4l2_subdev *sd,
>  	 */
>  	fmt->field = V4L2_FIELD_NONE;
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> -		sd_state->pads->try_fmt = *fmt;
> +		sd_state->pads->fmt = *fmt;
>  	else
>  		imx274->format = *fmt;
>  
> @@ -1145,8 +1145,8 @@ static int imx274_get_selection(struct v4l2_subdev *sd,
>  	}
>  
>  	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		src_crop = &sd_state->pads->try_crop;
> -		src_fmt = &sd_state->pads->try_fmt;
> +		src_crop = &sd_state->pads->crop;
> +		src_fmt = &sd_state->pads->fmt;
>  	} else {
>  		src_crop = &imx274->crop;
>  		src_fmt = &imx274->format;
> @@ -1217,7 +1217,7 @@ static int imx274_set_selection_crop(struct stimx274 *imx274,
>  	sel->r = new_crop;
>  
>  	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> -		tgt_crop = &sd_state->pads->try_crop;
> +		tgt_crop = &sd_state->pads->crop;
>  	else
>  		tgt_crop = &imx274->crop;
>  
> diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> index c9f0bd997ea7..4cf1334efdfe 100644
> --- a/drivers/media/i2c/mt9m001.c
> +++ b/drivers/media/i2c/mt9m001.c
> @@ -411,7 +411,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return mt9m001_s_fmt(sd, fmt, mf);
> -	sd_state->pads->try_fmt = *mf;
> +	sd_state->pads->fmt = *mf;
>  	return 0;
>  }
>  
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index 91a44359bcd3..495731f11006 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -678,7 +678,7 @@ static int mt9m111_set_fmt(struct v4l2_subdev *sd,
>  	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		sd_state->pads->try_fmt = *mf;
> +		sd_state->pads->fmt = *mf;
>  		return 0;
>  	}
>  
> diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
> index 8d2e3caa9b28..4457b030d1a8 100644
> --- a/drivers/media/i2c/mt9t112.c
> +++ b/drivers/media/i2c/mt9t112.c
> @@ -982,7 +982,7 @@ static int mt9t112_set_fmt(struct v4l2_subdev *sd,
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return mt9t112_s_fmt(sd, mf);
> -	sd_state->pads->try_fmt = *mf;
> +	sd_state->pads->fmt = *mf;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
> index 7699e64e1127..c02a51f2a327 100644
> --- a/drivers/media/i2c/mt9v011.c
> +++ b/drivers/media/i2c/mt9v011.c
> @@ -358,7 +358,7 @@ static int mt9v011_set_fmt(struct v4l2_subdev *sd,
>  
>  		set_res(sd);
>  	} else {
> -		sd_state->pads->try_fmt = *fmt;
> +		sd_state->pads->fmt = *fmt;
>  	}
>  
>  	return 0;
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index 2dc4a0f24ce8..eed8e5a8dcdd 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -800,7 +800,7 @@ static struct v4l2_mbus_framefmt *__mt9v111_get_pad_format(
>  #if IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  		return v4l2_subdev_get_try_format(&mt9v111->sd, sd_state, pad);
>  #else
> -		return &sd_state->pads->try_fmt;
> +		return &sd_state->pads->fmt;
>  #endif
>  	case V4L2_SUBDEV_FORMAT_ACTIVE:
>  		return &mt9v111->fmt;
> @@ -957,7 +957,7 @@ static int mt9v111_set_format(struct v4l2_subdev *subdev,
>  static int mt9v111_init_cfg(struct v4l2_subdev *subdev,
>  			    struct v4l2_subdev_state *sd_state)
>  {
> -	sd_state->pads->try_fmt = mt9v111_def_fmt;
> +	sd_state->pads->fmt = mt9v111_def_fmt;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
> index 4b75da55b260..8c576fe1e203 100644
> --- a/drivers/media/i2c/ov2640.c
> +++ b/drivers/media/i2c/ov2640.c
> @@ -996,7 +996,7 @@ static int ov2640_set_fmt(struct v4l2_subdev *sd,
>  		/* select format */
>  		priv->cfmt_code = mf->code;
>  	} else {
> -		sd_state->pads->try_fmt = *mf;
> +		sd_state->pads->fmt = *mf;
>  	}
>  out:
>  	mutex_unlock(&priv->lock);
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index f67412150b16..2ba4402c5e96 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -550,9 +550,9 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
>  
>  	/* update media bus format code and frame size */
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		mf->width = sd_state->pads->try_fmt.width;
> -		mf->height = sd_state->pads->try_fmt.height;
> -		mf->code = sd_state->pads->try_fmt.code;
> +		mf->width = sd_state->pads->fmt.width;
> +		mf->height = sd_state->pads->fmt.height;
> +		mf->code = sd_state->pads->fmt.code;
>  
>  	} else {
>  		mf->width = priv->rect.width >> priv->half_scale;
> @@ -701,15 +701,15 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		/* store media bus format code and frame size in pad config */
> -		sd_state->pads->try_fmt.width = mf->width;
> -		sd_state->pads->try_fmt.height = mf->height;
> -		sd_state->pads->try_fmt.code = mf->code;
> +		sd_state->pads->fmt.width = mf->width;
> +		sd_state->pads->fmt.height = mf->height;
> +		sd_state->pads->fmt.code = mf->code;
>  
>  		/* return default mbus frame format updated with pad config */
>  		*mf = ov6650_def_fmt;
> -		mf->width = sd_state->pads->try_fmt.width;
> -		mf->height = sd_state->pads->try_fmt.height;
> -		mf->code = sd_state->pads->try_fmt.code;
> +		mf->width = sd_state->pads->fmt.width;
> +		mf->height = sd_state->pads->fmt.height;
> +		mf->code = sd_state->pads->fmt.code;
>  
>  	} else {
>  		/* apply new media bus format code and frame size */
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 78602a2f70b0..6ff5961b87b2 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -1222,7 +1222,7 @@ static int ov772x_set_fmt(struct v4l2_subdev *sd,
>  	mf->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		sd_state->pads->try_fmt = *mf;
> +		sd_state->pads->fmt = *mf;
>  		return 0;
>  	}
>  
> diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
> index 0bab8c2cf160..f4b23183b8b1 100644
> --- a/drivers/media/i2c/ov9640.c
> +++ b/drivers/media/i2c/ov9640.c
> @@ -547,7 +547,7 @@ static int ov9640_set_fmt(struct v4l2_subdev *sd,
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return ov9640_s_fmt(sd, mf);
>  
> -	sd_state->pads->try_fmt = *mf;
> +	sd_state->pads->fmt = *mf;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
> index 2e4018c26912..867e4d7339f2 100644
> --- a/drivers/media/i2c/rj54n1cb0c.c
> +++ b/drivers/media/i2c/rj54n1cb0c.c
> @@ -1009,7 +1009,7 @@ static int rj54n1_set_fmt(struct v4l2_subdev *sd,
>  			      &mf->height, 84, RJ54N1_MAX_HEIGHT, align, 0);
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		sd_state->pads->try_fmt = *mf;
> +		sd_state->pads->fmt = *mf;
>  		return 0;
>  	}
>  
> diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
> index a7f043cad149..74c10fba2af0 100644
> --- a/drivers/media/i2c/saa6752hs.c
> +++ b/drivers/media/i2c/saa6752hs.c
> @@ -595,7 +595,7 @@ static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
>  	f->colorspace = V4L2_COLORSPACE_SMPTE170M;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		sd_state->pads->try_fmt = *f;
> +		sd_state->pads->fmt = *f;
>  		return 0;
>  	}
>  
> diff --git a/drivers/media/i2c/sr030pc30.c b/drivers/media/i2c/sr030pc30.c
> index 19c0252df2f1..f0ccdf1f887d 100644
> --- a/drivers/media/i2c/sr030pc30.c
> +++ b/drivers/media/i2c/sr030pc30.c
> @@ -541,7 +541,7 @@ static int sr030pc30_set_fmt(struct v4l2_subdev *sd,
>  
>  	fmt = try_fmt(sd, mf);
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		sd_state->pads->try_fmt = *mf;
> +		sd_state->pads->fmt = *mf;
>  		return 0;
>  	}
>  
> diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
> index 09f5b3986928..96f6cbc663f0 100644
> --- a/drivers/media/i2c/tw9910.c
> +++ b/drivers/media/i2c/tw9910.c
> @@ -829,7 +829,7 @@ static int tw9910_set_fmt(struct v4l2_subdev *sd,
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return tw9910_s_fmt(sd, mf);
>  
> -	sd_state->pads->try_fmt = *mf;
> +	sd_state->pads->fmt = *mf;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/i2c/vs6624.c b/drivers/media/i2c/vs6624.c
> index 29003dec6f2d..72a422693bc0 100644
> --- a/drivers/media/i2c/vs6624.c
> +++ b/drivers/media/i2c/vs6624.c
> @@ -587,7 +587,7 @@ static int vs6624_set_fmt(struct v4l2_subdev *sd,
>  	fmt->colorspace = vs6624_formats[index].colorspace;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		sd_state->pads->try_fmt = *fmt;
> +		sd_state->pads->fmt = *fmt;
>  		return 0;
>  	}
>  
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index db15770d5b88..aa90aa55a128 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -835,11 +835,11 @@ static void isc_try_fse(struct isc_device *isc,
>  	 * just use the maximum ISC can receive.
>  	 */
>  	if (ret) {
> -		sd_state->pads->try_crop.width = isc->max_width;
> -		sd_state->pads->try_crop.height = isc->max_height;
> +		sd_state->pads->crop.width = isc->max_width;
> +		sd_state->pads->crop.height = isc->max_height;
>  	} else {
> -		sd_state->pads->try_crop.width = fse.max_width;
> -		sd_state->pads->try_crop.height = fse.max_height;
> +		sd_state->pads->crop.width = fse.max_width;
> +		sd_state->pads->crop.height = fse.max_height;
>  	}
>  }
>  
> diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> index 4d15814e4481..5806de277bdc 100644
> --- a/drivers/media/platform/atmel/atmel-isi.c
> +++ b/drivers/media/platform/atmel/atmel-isi.c
> @@ -572,11 +572,11 @@ static void isi_try_fse(struct atmel_isi *isi, const struct isi_format *isi_fmt,
>  	 * just use the maximum ISI can receive.
>  	 */
>  	if (ret) {
> -		sd_state->pads->try_crop.width = MAX_SUPPORT_WIDTH;
> -		sd_state->pads->try_crop.height = MAX_SUPPORT_HEIGHT;
> +		sd_state->pads->crop.width = MAX_SUPPORT_WIDTH;
> +		sd_state->pads->crop.height = MAX_SUPPORT_HEIGHT;
>  	} else {
> -		sd_state->pads->try_crop.width = fse.max_width;
> -		sd_state->pads->try_crop.height = fse.max_height;
> +		sd_state->pads->crop.width = fse.max_width;
> +		sd_state->pads->crop.height = fse.max_height;
>  	}
>  }
>  
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 16497b8fc875..e7c5617820ab 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -638,21 +638,19 @@ struct v4l2_subdev_ir_ops {
>  /**
>   * struct v4l2_subdev_pad_config - Used for storing subdev pad information.
>   *
> - * @try_fmt: &struct v4l2_mbus_framefmt
> - * @try_crop: &struct v4l2_rect to be used for crop
> - * @try_compose: &struct v4l2_rect to be used for compose
> + * @fmt: &struct v4l2_mbus_framefmt
> + * @crop: &struct v4l2_rect to be used for crop
> + * @compose: &struct v4l2_rect to be used for compose
>   *
>   * This structure only needs to be passed to the pad op if the 'which' field
>   * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
>   * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.

You could drop this paragraph while at it, v4l2_subdev_pad_config isn't
passed to subdev operations anymore.

>   *
> - * Note: This struct is also used in active state, and the try_ prefix is
> - * historical and to be removed.
>   */
>  struct v4l2_subdev_pad_config {
> -	struct v4l2_mbus_framefmt try_fmt;
> -	struct v4l2_rect try_crop;
> -	struct v4l2_rect try_compose;
> +	struct v4l2_mbus_framefmt fmt;
> +	struct v4l2_rect crop;
> +	struct v4l2_rect compose;
>  };
>  
>  /**
> @@ -1008,7 +1006,7 @@ struct v4l2_subdev_fh {
>  
>  /**
>   * v4l2_subdev_get_try_format - ancillary routine to call
> - *	&struct v4l2_subdev_pad_config->try_fmt
> + *	&struct v4l2_subdev_pad_config->fmt
>   *
>   * @sd: pointer to &struct v4l2_subdev
>   * @state: pointer to &struct v4l2_subdev_state
> @@ -1021,12 +1019,12 @@ v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &state->pads[pad].try_fmt;
> +	return &state->pads[pad].fmt;
>  }
>  
>  /**
>   * v4l2_subdev_get_try_crop - ancillary routine to call
> - *	&struct v4l2_subdev_pad_config->try_crop
> + *	&struct v4l2_subdev_pad_config->crop
>   *
>   * @sd: pointer to &struct v4l2_subdev
>   * @state: pointer to &struct v4l2_subdev_state.
> @@ -1039,12 +1037,12 @@ v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &state->pads[pad].try_crop;
> +	return &state->pads[pad].crop;
>  }
>  
>  /**
>   * v4l2_subdev_get_try_compose - ancillary routine to call
> - *	&struct v4l2_subdev_pad_config->try_compose
> + *	&struct v4l2_subdev_pad_config->compose
>   *
>   * @sd: pointer to &struct v4l2_subdev
>   * @state: pointer to &struct v4l2_subdev_state.
> @@ -1057,7 +1055,7 @@ v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &state->pads[pad].try_compose;
> +	return &state->pads[pad].compose;
>  }
>  
>  #endif

-- 
Regards,

Laurent Pinchart
