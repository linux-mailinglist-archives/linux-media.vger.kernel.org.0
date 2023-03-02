Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4CE16A804E
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 11:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjCBKwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 05:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjCBKwT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 05:52:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4341638011
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 02:52:17 -0800 (PST)
Received: from ideasonboard.com (host-87-18-61-24.retail.telecomitalia.it [87.18.61.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C79456A;
        Thu,  2 Mar 2023 11:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677754335;
        bh=ze43y6MtTfFxfDtqqdQoJd6sNp1u/lmrpQvncO6Ff3I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ir4mYuRLUAElU0LU8mbk8HLbZvRX0StbUfHaEUuFk+A2mmOb1HwF37chGqRF5omPe
         AXgpIoG8two5jgw27yO+Lk09KZNiYZ4gypghw55zK/NHwQ9oeY9INefOky9MpdM2Ev
         Pr0uGinE7GfupuLpo2HqZAL+a2srXw945oLm5E0U=
Date:   Thu, 2 Mar 2023 11:52:12 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v3 3/5] media: ti: cal: Use subdev state
Message-ID: <20230302105212.gvxzffxzo676ofmx@uno.localdomain>
References: <20230302100755.191164-1-tomi.valkeinen@ideasonboard.com>
 <20230302100755.191164-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230302100755.191164-4-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Thu, Mar 02, 2023 at 12:07:53PM +0200, Tomi Valkeinen wrote:
> Change TI CAL driver to use subdev state. No functional changes
> (intended).
>
> This allows us to get rid of the 'formats' field, as the formats are
> kept in the state, and also the 'mutex' as we already have state locking.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Looking at the diff with v2, this looks good
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/platform/ti/cal/cal-camerarx.c | 131 +++++--------------
>  drivers/media/platform/ti/cal/cal-video.c    |  21 ++-
>  drivers/media/platform/ti/cal/cal.h          |   8 --
>  3 files changed, 53 insertions(+), 107 deletions(-)
>
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 97208d542f9e..bc09c3f1446d 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -50,10 +50,16 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
>  	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
>  	u32 num_lanes = mipi_csi2->num_data_lanes;
>  	const struct cal_format_info *fmtinfo;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
>  	u32 bpp;
>  	s64 freq;
>
> -	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
> +	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
> +
> +	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
> +
> +	fmtinfo = cal_format_by_code(fmt->code);
>  	if (!fmtinfo)
>  		return -EINVAL;
>
> @@ -620,34 +626,20 @@ static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
>  	return container_of(sd, struct cal_camerarx, subdev);
>  }
>
> -static struct v4l2_mbus_framefmt *
> -cal_camerarx_get_pad_format(struct cal_camerarx *phy,
> -			    struct v4l2_subdev_state *state,
> -			    unsigned int pad, u32 which)
> -{
> -	switch (which) {
> -	case V4L2_SUBDEV_FORMAT_TRY:
> -		return v4l2_subdev_get_try_format(&phy->subdev, state, pad);
> -	case V4L2_SUBDEV_FORMAT_ACTIVE:
> -		return &phy->formats[pad];
> -	default:
> -		return NULL;
> -	}
> -}
> -
>  static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct cal_camerarx *phy = to_cal_camerarx(sd);
> +	struct v4l2_subdev_state *state;
>  	int ret = 0;
>
> -	mutex_lock(&phy->mutex);
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>
>  	if (enable)
>  		ret = cal_camerarx_start(phy);
>  	else
>  		cal_camerarx_stop(phy);
>
> -	mutex_unlock(&phy->mutex);
> +	v4l2_subdev_unlock_state(state);
>
>  	return ret;
>  }
> @@ -657,62 +649,44 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
>  					  struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	struct cal_camerarx *phy = to_cal_camerarx(sd);
> -	int ret = 0;
> -
> -	mutex_lock(&phy->mutex);
>
>  	/* No transcoding, source and sink codes must match. */
>  	if (cal_rx_pad_is_source(code->pad)) {
>  		struct v4l2_mbus_framefmt *fmt;
>
> -		if (code->index > 0) {
> -			ret = -EINVAL;
> -			goto out;
> -		}
> +		if (code->index > 0)
> +			return -EINVAL;
>
> -		fmt = cal_camerarx_get_pad_format(phy, state,
> -						  CAL_CAMERARX_PAD_SINK,
> -						  code->which);
> +		fmt = v4l2_subdev_get_pad_format(&phy->subdev, state,
> +						 CAL_CAMERARX_PAD_SINK);
>  		code->code = fmt->code;
>  	} else {
> -		if (code->index >= cal_num_formats) {
> -			ret = -EINVAL;
> -			goto out;
> -		}
> +		if (code->index >= cal_num_formats)
> +			return -EINVAL;
>
>  		code->code = cal_formats[code->index].code;
>  	}
>
> -out:
> -	mutex_unlock(&phy->mutex);
> -
> -	return ret;
> +	return 0;
>  }
>
>  static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>  					   struct v4l2_subdev_state *state,
>  					   struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	struct cal_camerarx *phy = to_cal_camerarx(sd);
>  	const struct cal_format_info *fmtinfo;
> -	int ret = 0;
>
>  	if (fse->index > 0)
>  		return -EINVAL;
>
> -	mutex_lock(&phy->mutex);
> -
>  	/* No transcoding, source and sink formats must match. */
>  	if (cal_rx_pad_is_source(fse->pad)) {
>  		struct v4l2_mbus_framefmt *fmt;
>
> -		fmt = cal_camerarx_get_pad_format(phy, state,
> -						  CAL_CAMERARX_PAD_SINK,
> -						  fse->which);
> -		if (fse->code != fmt->code) {
> -			ret = -EINVAL;
> -			goto out;
> -		}
> +		fmt = v4l2_subdev_get_pad_format(sd, state,
> +						 CAL_CAMERARX_PAD_SINK);
> +		if (fse->code != fmt->code)
> +			return -EINVAL;
>
>  		fse->min_width = fmt->width;
>  		fse->max_width = fmt->width;
> @@ -720,10 +694,8 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>  		fse->max_height = fmt->height;
>  	} else {
>  		fmtinfo = cal_format_by_code(fse->code);
> -		if (!fmtinfo) {
> -			ret = -EINVAL;
> -			goto out;
> -		}
> +		if (!fmtinfo)
> +			return -EINVAL;
>
>  		fse->min_width = CAL_MIN_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
>  		fse->max_width = CAL_MAX_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
> @@ -731,27 +703,6 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>  		fse->max_height = CAL_MAX_HEIGHT_LINES;
>  	}
>
> -out:
> -	mutex_unlock(&phy->mutex);
> -
> -	return ret;
> -}
> -
> -static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
> -				   struct v4l2_subdev_state *state,
> -				   struct v4l2_subdev_format *format)
> -{
> -	struct cal_camerarx *phy = to_cal_camerarx(sd);
> -	struct v4l2_mbus_framefmt *fmt;
> -
> -	mutex_lock(&phy->mutex);
> -
> -	fmt = cal_camerarx_get_pad_format(phy, state, format->pad,
> -					  format->which);
> -	format->format = *fmt;
> -
> -	mutex_unlock(&phy->mutex);
> -
>  	return 0;
>  }
>
> @@ -759,14 +710,13 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *state,
>  				   struct v4l2_subdev_format *format)
>  {
> -	struct cal_camerarx *phy = to_cal_camerarx(sd);
>  	const struct cal_format_info *fmtinfo;
>  	struct v4l2_mbus_framefmt *fmt;
>  	unsigned int bpp;
>
>  	/* No transcoding, source and sink formats must match. */
>  	if (cal_rx_pad_is_source(format->pad))
> -		return cal_camerarx_sd_get_fmt(sd, state, format);
> +		return v4l2_subdev_get_fmt(sd, state, format);
>
>  	/*
>  	 * Default to the first format if the requested media bus code isn't
> @@ -790,20 +740,13 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>
>  	/* Store the format and propagate it to the source pad. */
>
> -	mutex_lock(&phy->mutex);
> -
> -	fmt = cal_camerarx_get_pad_format(phy, state,
> -					  CAL_CAMERARX_PAD_SINK,
> -					  format->which);
> +	fmt = v4l2_subdev_get_pad_format(sd, state, CAL_CAMERARX_PAD_SINK);
>  	*fmt = format->format;
>
> -	fmt = cal_camerarx_get_pad_format(phy, state,
> -					  CAL_CAMERARX_PAD_FIRST_SOURCE,
> -					  format->which);
> +	fmt = v4l2_subdev_get_pad_format(sd, state,
> +					 CAL_CAMERARX_PAD_FIRST_SOURCE);
>  	*fmt = format->format;
>
> -	mutex_unlock(&phy->mutex);
> -
>  	return 0;
>  }
>
> @@ -837,7 +780,7 @@ static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
>  	.init_cfg = cal_camerarx_sd_init_cfg,
>  	.enum_mbus_code = cal_camerarx_sd_enum_mbus_code,
>  	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
> -	.get_fmt = cal_camerarx_sd_get_fmt,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = cal_camerarx_sd_set_fmt,
>  };
>
> @@ -872,7 +815,6 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	phy->instance = instance;
>
>  	spin_lock_init(&phy->vc_lock);
> -	mutex_init(&phy->mutex);
>
>  	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>  						(instance == 0) ?
> @@ -881,8 +823,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	phy->base = devm_ioremap_resource(cal->dev, phy->res);
>  	if (IS_ERR(phy->base)) {
>  		cal_err(cal, "failed to ioremap\n");
> -		ret = PTR_ERR(phy->base);
> -		goto err_destroy_mutex;
> +		return ERR_CAST(phy->base);
>  	}
>
>  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
> @@ -890,11 +831,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>
>  	ret = cal_camerarx_regmap_init(cal, phy);
>  	if (ret)
> -		goto err_destroy_mutex;
> +		return ERR_PTR(ret);
>
>  	ret = cal_camerarx_parse_dt(phy);
>  	if (ret)
> -		goto err_destroy_mutex;
> +		return ERR_PTR(ret);
>
>  	/* Initialize the V4L2 subdev and media entity. */
>  	sd = &phy->subdev;
> @@ -913,23 +854,23 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	if (ret)
>  		goto err_node_put;
>
> -	ret = cal_camerarx_sd_init_cfg(sd, NULL);
> +	ret = v4l2_subdev_init_finalize(sd);
>  	if (ret)
>  		goto err_entity_cleanup;
>
>  	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
>  	if (ret)
> -		goto err_entity_cleanup;
> +		goto err_free_state;
>
>  	return phy;
>
> +err_free_state:
> +	v4l2_subdev_cleanup(sd);
>  err_entity_cleanup:
>  	media_entity_cleanup(&phy->subdev.entity);
>  err_node_put:
>  	of_node_put(phy->source_ep_node);
>  	of_node_put(phy->source_node);
> -err_destroy_mutex:
> -	mutex_destroy(&phy->mutex);
>  	return ERR_PTR(ret);
>  }
>
> @@ -939,8 +880,8 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
>  		return;
>
>  	v4l2_device_unregister_subdev(&phy->subdev);
> +	v4l2_subdev_cleanup(&phy->subdev);
>  	media_entity_cleanup(&phy->subdev.entity);
>  	of_node_put(phy->source_ep_node);
>  	of_node_put(phy->source_node);
> -	mutex_destroy(&phy->mutex);
>  }
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index ed92e23d4b16..a8abcd0fee17 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -687,21 +687,34 @@ static void cal_release_buffers(struct cal_ctx *ctx,
>  static int cal_video_check_format(struct cal_ctx *ctx)
>  {
>  	const struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
>  	struct media_pad *remote_pad;
> +	int ret = 0;
>
>  	remote_pad = media_pad_remote_pad_first(&ctx->pad);
>  	if (!remote_pad)
>  		return -ENODEV;
>
> -	format = &ctx->phy->formats[remote_pad->index];
> +	state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
> +
> +	format = v4l2_subdev_get_pad_format(&ctx->phy->subdev, state, remote_pad->index);
> +	if (!format) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
>
>  	if (ctx->fmtinfo->code != format->code ||
>  	    ctx->v_fmt.fmt.pix.height != format->height ||
>  	    ctx->v_fmt.fmt.pix.width != format->width ||
> -	    ctx->v_fmt.fmt.pix.field != format->field)
> -		return -EPIPE;
> +	    ctx->v_fmt.fmt.pix.field != format->field) {
> +		ret = -EPIPE;
> +		goto out;
> +	}
>
> -	return 0;
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
>  }
>
>  static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
> diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
> index de73d6d21b6f..55d4736fed18 100644
> --- a/drivers/media/platform/ti/cal/cal.h
> +++ b/drivers/media/platform/ti/cal/cal.h
> @@ -177,7 +177,6 @@ struct cal_camerarx {
>
>  	struct v4l2_subdev	subdev;
>  	struct media_pad	pads[CAL_CAMERARX_NUM_PADS];
> -	struct v4l2_mbus_framefmt	formats[CAL_CAMERARX_NUM_PADS];
>
>  	/* protects the vc_* fields below */
>  	spinlock_t		vc_lock;
> @@ -185,13 +184,6 @@ struct cal_camerarx {
>  	u16			vc_frame_number[4];
>  	u32			vc_sequence[4];
>
> -	/*
> -	 * Lock for camerarx ops. Protects:
> -	 * - formats
> -	 * - enable_count
> -	 */
> -	struct mutex		mutex;
> -
>  	unsigned int		enable_count;
>  };
>
> --
> 2.34.1
>
