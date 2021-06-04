Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CA039BA44
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhFDNx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:53:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35186 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhFDNx5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:53:57 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC6A32A3;
        Fri,  4 Jun 2021 15:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622814729;
        bh=BZZ2WfUh6xCGnp1Bc/mQywpTcbEQKOEq90L4wgai3sc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vsDPJNdaQzAROGgGS3b2ITfalqnco4py09ruyzBTaDXMwujWGa0PmFABVI7Yx8mq6
         sy9IHnsDZ9WkHTt9KP9ZwFgSysT1ipk2cg68VPVvkgg3h0/6ElvbTY2hDfp25bfL8Z
         HstBEE+UFicDMChd76e/ccmO5JYCtkqRYtBAz4ho=
Date:   Fri, 4 Jun 2021 16:51:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 26/38] media: ti-vpe: cal: init ctx->v_fmt correctly
 in MC mode
Message-ID: <YLov/StSuFckOeEn@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-27-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-27-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:08:57PM +0300, Tomi Valkeinen wrote:
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
>  drivers/media/platform/ti-vpe/cal-video.c | 43 ++++++++++++++++++++---
>  drivers/media/platform/ti-vpe/cal.h       |  2 +-
>  2 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 7e97a43c6611..d06488cb8c36 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -879,24 +879,59 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
>  	return 0;
>  }
>  
> +static int cal_ctx_v4l2_init_mc_format(struct cal_ctx *ctx)
> +{
> +	const struct cal_format_info *fmtinfo;
> +	struct v4l2_pix_format *pix_fmt = &ctx->v_fmt.fmt.pix;
> +
> +	fmtinfo = cal_format_by_code(MEDIA_BUS_FMT_UYVY8_2X8);
> +	if (!fmtinfo)
> +		return -EINVAL;

I still think a WARN_ON() would be enough, or even dropping the check
completely, as this really can't happen :-) The function could then
become void. Either way,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
>  int cal_ctx_v4l2_register(struct cal_ctx *ctx)
>  {
>  	struct video_device *vfd = &ctx->vdev;
>  	int ret;
>  
> -	ret = cal_ctx_v4l2_init_formats(ctx);
> -	if (ret)
> -		return ret;
> -
>  	if (!cal_mc_api) {
>  		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
>  
> +		ret = cal_ctx_v4l2_init_formats(ctx);
> +		if (ret) {
> +			ctx_err(ctx, "Failed to init formats: %d\n", ret);
> +			return ret;
> +		}
> +
>  		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->source->ctrl_handler,
>  					    NULL, true);
>  		if (ret < 0) {
>  			ctx_err(ctx, "Failed to add source ctrl handler\n");
>  			return ret;
>  		}
> +	} else {
> +		ret = cal_ctx_v4l2_init_mc_format(ctx);
> +		if (ret) {
> +			ctx_err(ctx, "Failed to init format: %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index def0c9a3657d..ee42c9c48fa1 100644
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
