Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4EB36357C
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbhDRNWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRNWT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:22:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB69C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 06:21:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1F86499;
        Sun, 18 Apr 2021 15:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618752109;
        bh=xyOl9RRBx0076ZyYLzrNCjORXdNI5dbAtNeJkvqt27k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dnYuHEff1TRwUciI6Uk/jOBgwampmcXvFtFzislw/7Vs5tZgOp2J8VdBF3470YKid
         aLPCZ5jG2T3+O913aI7Utsa27Qloxii9apKDgZrlCyv3BEo9A/zHr7vQ+sG3K9a+bz
         weFoLzBUEKTwwxadSlNBdC9N3X7x39ReP1BwlmKc=
Date:   Sun, 18 Apr 2021 16:21:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 26/28] media: ti-vpe: cal: init ctx->v_fmt correctly in
 MC mode
Message-ID: <YHwyauEvgB8On72g@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-27-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-27-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:55PM +0300, Tomi Valkeinen wrote:
> CAL driver enumerates mbus codes in the connected subdev to create a
> list of supported formats reported to userspace, and initializes
> ctx->v_fmt and ctx->fmtinfo to one of those formats.
> 
> This works fine for legacy mode, but is not correct for MC mode, and the
> list is not even used in MC mode.
> 
> Fix this by adding a new function, cal_ctx_v4l2_init_mc_format, which
> only initializes ctx->v_fmt and ctx->fmtinfo to a default value.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-video.c | 45 ++++++++++++++++++++---
>  drivers/media/platform/ti-vpe/cal.h       |  2 +-
>  2 files changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 0494cd04b9a5..95066cca128a 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -879,26 +879,59 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
>  	return 0;
>  }
>  
> +static int cal_ctx_v4l2_init_mc_format(struct cal_ctx *ctx)
> +{
> +	const struct cal_format_info *fmtinfo;
> +	struct v4l2_pix_format *pix_fmt = &ctx->v_fmt.fmt.pix;
> +
> +	fmtinfo = cal_format_by_code(MEDIA_BUS_FMT_UYVY8_2X8);

	if (WARN_ON(!fmt_info))
		return;

As this really can't happen.

> +	if (!fmtinfo)
> +		return -EINVAL;
> +
> +	pix_fmt->width = 640;
> +	pix_fmt->height = 480;
> +	pix_fmt->field = V4L2_FIELD_NONE;
> +	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> +	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
> +	pix_fmt->pixelformat = fmtinfo->fourcc;
> +
> +	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +
> +	/* Save current format */
> +	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
> +	ctx->fmtinfo = fmtinfo;
> +
> +	return 0;
> +}
> +
>  void cal_ctx_v4l2_register(struct cal_ctx *ctx)
>  {
>  	struct video_device *vfd = &ctx->vdev;
>  	int ret;
>  
> -	ret = cal_ctx_v4l2_init_formats(ctx);
> -	if (ret) {
> -		ctx_err(ctx, "Failed to init formats: %d\n", ret);
> -		return;
> -	}
> -
>  	if (!cal_mc_api) {
>  		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
>  
> +		ret = cal_ctx_v4l2_init_formats(ctx);
> +		if (ret) {
> +			ctx_err(ctx, "Failed to init formats: %d\n", ret);
> +			return;
> +		}
> +
>  		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->source->ctrl_handler,
>  					    NULL, true);
>  		if (ret < 0) {
>  			ctx_err(ctx, "Failed to add source ctrl handler\n");
>  			return;
>  		}
> +	} else {
> +		ret = cal_ctx_v4l2_init_mc_format(ctx);
> +		if (ret) {
> +			ctx_err(ctx, "Failed to init format: %d\n", ret);
> +			return;
> +		}

And you can drop the error check here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	}
>  
>  	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index ad7d26c803eb..c941d2aec79f 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -213,7 +213,7 @@ struct cal_ctx {
>  	/* Used to store current pixel format */
>  	struct v4l2_format	v_fmt;
>  
> -	/* Current subdev enumerated format */
> +	/* Current subdev enumerated format (legacy) */
>  	const struct cal_format_info	**active_fmt;
>  	unsigned int		num_active_fmt;
>  

-- 
Regards,

Laurent Pinchart
