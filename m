Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325066A0EC5
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 18:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjBWRdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 12:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjBWRdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 12:33:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952E0126D7
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 09:33:10 -0800 (PST)
Received: from ideasonboard.com (host-87-16-53-160.retail.telecomitalia.it [87.16.53.160])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE900496;
        Thu, 23 Feb 2023 18:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677173588;
        bh=Ugs2pHTsG0QSgiE8IgtMkr1IS9SQMajDkvmYZ3xa0dc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k4LVYsIYGf7BVXdeuvhh0+f/si9UyFU6HWqjPfsb0ZVwnaXKMSfrfDHW1BG3QQwYs
         vjuqHM0XCb1/WoHD4H4Z8jqpqlWz9LWkGOBXcaDbCODHAQ7k3KkLIBk33TTUIoz6qo
         iJxNNDcWiRRp3WiZ+GbOsQLBst/C8W0iSgDNa13I=
Date:   Thu, 23 Feb 2023 18:32:54 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v1 2/3] media: ti: cal: Use subdev state
Message-ID: <20230223173254.tjuq5odusrhjzw5b@uno.localdomain>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230222125630.421020-3-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Wed, Feb 22, 2023 at 02:56:29PM +0200, Tomi Valkeinen wrote:
> Change TI CAL driver to use subdev state. No functional changes
> (intended).
>
> This allows us to get rid of the 'formats' field, as the formats are
> kept in the state, and also the 'mutex' as we already have state locking.

I'm not sure I fully get how the ctrl_handler is used here, but
shouldn't the state->lock be set to the ctrl_handler.lock so that
controls and state interaction are guaranteed to be protected ?

>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti/cal/cal-camerarx.c | 134 ++++++-------------
>  drivers/media/platform/ti/cal/cal-video.c    |  27 +++-
>  drivers/media/platform/ti/cal/cal.h          |   8 --
>  3 files changed, 60 insertions(+), 109 deletions(-)
>
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 16ae52879a79..faafbd0e9240 100644
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

By removing the lock here and in cal_camerarx_sd_set_fmt() don't we
risk that the format on the sink pad is updated while we fetch it
here? I know it's a very tiny window, but should we lock the state
just to be safe ?

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

Same question here

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
> @@ -882,7 +824,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	if (IS_ERR(phy->base)) {
>  		cal_err(cal, "failed to ioremap\n");
>  		ret = PTR_ERR(phy->base);
> -		goto error;
> +		goto err_entity_cleanup;
>  	}
>
>  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
> @@ -890,11 +832,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>
>  	ret = cal_camerarx_regmap_init(cal, phy);
>  	if (ret)
> -		goto error;
> +		goto err_entity_cleanup;
>
>  	ret = cal_camerarx_parse_dt(phy);
>  	if (ret)
> -		goto error;
> +		goto err_entity_cleanup;
>
>  	/* Initialize the V4L2 subdev and media entity. */
>  	sd = &phy->subdev;
> @@ -911,19 +853,21 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
>  				     phy->pads);
>  	if (ret)
> -		goto error;
> +		goto err_entity_cleanup;
>
> -	ret = cal_camerarx_sd_init_cfg(sd, NULL);
> +	ret = v4l2_subdev_init_finalize(sd);
>  	if (ret)
> -		goto error;
> +		goto err_entity_cleanup;
>
>  	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
>  	if (ret)
> -		goto error;
> +		goto err_free_state;
>
>  	return phy;
>
> -error:
> +err_free_state:
> +	v4l2_subdev_cleanup(sd);
> +err_entity_cleanup:
>  	media_entity_cleanup(&phy->subdev.entity);
>  	kfree(phy);
>  	return ERR_PTR(ret);
> @@ -935,9 +879,9 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
>  		return;
>
>  	v4l2_device_unregister_subdev(&phy->subdev);
> +	v4l2_subdev_cleanup(&phy->subdev);
>  	media_entity_cleanup(&phy->subdev.entity);
>  	of_node_put(phy->source_ep_node);
>  	of_node_put(phy->source_node);
> -	mutex_destroy(&phy->mutex);
>  	kfree(phy);
>  }
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index 87db8761d94d..d363e123d4bb 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -694,25 +694,40 @@ static int cal_video_check_format(struct cal_ctx *ctx)
>  {
>  	const struct cal_format_info *rx_fmtinfo;
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
>  	rx_fmtinfo = cal_format_by_code(format->code);
> -	if (!rx_fmtinfo)
> -		return -EINVAL;
> +	if (!rx_fmtinfo) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
>
>  	if (ctx->fmtinfo->fourcc != rx_fmtinfo->fourcc ||
>  	    ctx->v_fmt.fmt.pix.height != format->height ||
>  	    ctx->v_fmt.fmt.pix.width != format->width ||
> -	    ctx->v_fmt.fmt.pix.field != format->field)
> -		return -EPIPE;
> +	    ctx->v_fmt.fmt.pix.field != format->field) {
> +		ret = -EPIPE;
> +		goto out;

No need for the goto, but it doesn't hurt

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
> index 44ecae8a273a..79cd0171e701 100644
> --- a/drivers/media/platform/ti/cal/cal.h
> +++ b/drivers/media/platform/ti/cal/cal.h
> @@ -178,7 +178,6 @@ struct cal_camerarx {
>
>  	struct v4l2_subdev	subdev;
>  	struct media_pad	pads[CAL_CAMERARX_NUM_PADS];
> -	struct v4l2_mbus_framefmt	formats[CAL_CAMERARX_NUM_PADS];
>
>  	/* protects the vc_* fields below */
>  	spinlock_t		vc_lock;
> @@ -186,13 +185,6 @@ struct cal_camerarx {
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

Nice!

Thanks
  j

>  	unsigned int		enable_count;
>  };
>
> --
> 2.34.1
>
