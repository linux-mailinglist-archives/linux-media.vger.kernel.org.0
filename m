Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D4A39BAD2
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 16:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhFDOU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 10:20:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35538 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhFDOU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 10:20:56 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90A15A52;
        Fri,  4 Jun 2021 16:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622816348;
        bh=Rb/7/3VyfIhWPjNhW4ZmARgsTnhhpdjrSU73nQuaDlM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IHipjEPH8aoFcYmEczpv9/L9nu5ChdZg+CGcjuwEROY4xSqjXmaJVhwwQBGHqspcj
         RaPCXeVZTS/Gdjcq7G1S1WXhLhvYzCsgS3HyZERbi78ekX/BzrDELLpp6s+fKlDGof
         KeCDYcvbkcc4ediaeJqTqrgltYTKt+wJG+IL+qWY=
Date:   Fri, 4 Jun 2021 17:18:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 35/38] media: ti-vpe: cal: allow more than 1 source
 pads
Message-ID: <YLo2UMdqrWLxgomX@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-36-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-36-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:09:06PM +0300, Tomi Valkeinen wrote:
> CAL RX has a single sink and a single source pad. To support multiple
> streams, we will have multiple source pads (up to 8, one for each
> CAL context).
> 
> Change the driver to allow creating more source pads and change the code
> accordingly to handle multiple source pads. We still keep
> CAL_CAMERARX_NUM_SOURCE_PADS as 1, and the behavior is unchanged.
> 
> Also rename CAL_CAMERARX_PAD_SOURCE to CAL_CAMERARX_PAD_FIRST_SOURCE to
> highlight that it's the first source.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 13 ++++++------
>  drivers/media/platform/ti-vpe/cal-video.c    |  9 +++++++--
>  drivers/media/platform/ti-vpe/cal.h          | 21 +++++++++++++++++---
>  3 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index 803d53753e87..e3a4c20be1e6 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -635,7 +635,7 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
>  	mutex_lock(&phy->mutex);
>  
>  	/* No transcoding, source and sink codes must match. */
> -	if (code->pad == CAL_CAMERARX_PAD_SOURCE) {
> +	if (cal_rx_pad_is_source(code->pad)) {
>  		struct v4l2_mbus_framefmt *fmt;
>  
>  		if (code->index > 0) {
> @@ -676,7 +676,7 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
>  	mutex_lock(&phy->mutex);
>  
>  	/* No transcoding, source and sink formats must match. */
> -	if (fse->pad == CAL_CAMERARX_PAD_SOURCE) {
> +	if (cal_rx_pad_is_source(fse->pad)) {
>  		struct v4l2_mbus_framefmt *fmt;
>  
>  		fmt = cal_camerarx_get_pad_format(phy, sd_state,
> @@ -740,7 +740,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  	unsigned int bpp;
>  
>  	/* No transcoding, source and sink formats must match. */
> -	if (format->pad == CAL_CAMERARX_PAD_SOURCE)
> +	if (cal_rx_pad_is_source(format->pad))
>  		return cal_camerarx_sd_get_fmt(sd, sd_state, format);
>  
>  	/*
> @@ -771,8 +771,7 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
>  					  format->which);
>  	*fmt = format->format;
>  
> -	fmt = cal_camerarx_get_pad_format(phy, sd_state,
> -					  CAL_CAMERARX_PAD_SOURCE,
> +	fmt = cal_camerarx_get_pad_format(phy, sd_state, CAL_CAMERARX_PAD_FIRST_SOURCE,

I would have kept the line wrap.

>  					  format->which);
>  	*fmt = format->format;
>  
> @@ -836,6 +835,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	struct cal_camerarx *phy;
>  	struct v4l2_subdev *sd;
>  	int ret;
> +	unsigned int i;

Before ret ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
>  	if (!phy)
> @@ -877,7 +877,8 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	sd->dev = cal->dev;
>  
>  	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> -	phy->pads[CAL_CAMERARX_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> +	for (i = CAL_CAMERARX_PAD_FIRST_SOURCE; i < CAL_CAMERARX_NUM_PADS; ++i)
> +		phy->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>  	sd->entity.ops = &cal_camerarx_media_ops;
>  	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
>  				     phy->pads);
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index efa08a9ccbd5..8ecae7dc2774 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -687,8 +687,13 @@ static void cal_release_buffers(struct cal_ctx *ctx,
>  static int cal_video_check_format(struct cal_ctx *ctx)
>  {
>  	const struct v4l2_mbus_framefmt *format;
> +	struct media_pad *remote_pad;
>  
> -	format = &ctx->phy->formats[CAL_CAMERARX_PAD_SOURCE];
> +	remote_pad = media_entity_remote_pad(&ctx->pad);
> +	if (!remote_pad)
> +		return -ENODEV;
> +
> +	format = &ctx->phy->formats[remote_pad->index];
>  
>  	if (ctx->fmtinfo->code != format->code ||
>  	    ctx->v_fmt.fmt.pix.height != format->height ||
> @@ -941,7 +946,7 @@ int cal_ctx_v4l2_register(struct cal_ctx *ctx)
>  	}
>  
>  	ret = media_create_pad_link(&ctx->phy->subdev.entity,
> -				    CAL_CAMERARX_PAD_SOURCE,
> +				    CAL_CAMERARX_PAD_FIRST_SOURCE,
>  				    &vfd->entity, 0,
>  				    MEDIA_LNK_FL_IMMUTABLE |
>  				    MEDIA_LNK_FL_ENABLED);
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 8608a2c6c01a..42a3f8004077 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -44,7 +44,22 @@
>  #define CAL_MAX_HEIGHT_LINES		16383
>  
>  #define CAL_CAMERARX_PAD_SINK		0
> -#define CAL_CAMERARX_PAD_SOURCE		1
> +#define CAL_CAMERARX_PAD_FIRST_SOURCE	1
> +#define CAL_CAMERARX_NUM_SOURCE_PADS	1
> +#define CAL_CAMERARX_NUM_PADS		(1 + CAL_CAMERARX_NUM_SOURCE_PADS)
> +
> +static inline bool cal_rx_pad_is_sink(u32 pad)
> +{
> +	/* Camera RX has 1 sink pad, and N source pads */
> +	return pad == 0;
> +}
> +
> +static inline bool cal_rx_pad_is_source(u32 pad)
> +{
> +	/* Camera RX has 1 sink pad, and N source pads */
> +	return pad >= CAL_CAMERARX_PAD_FIRST_SOURCE &&
> +	       pad <= CAL_CAMERARX_NUM_SOURCE_PADS;
> +}
>  
>  struct device;
>  struct device_node;
> @@ -161,8 +176,8 @@ struct cal_camerarx {
>  	struct media_pipeline	pipe;
>  
>  	struct v4l2_subdev	subdev;
> -	struct media_pad	pads[2];
> -	struct v4l2_mbus_framefmt	formats[2];
> +	struct media_pad	pads[CAL_CAMERARX_NUM_PADS];
> +	struct v4l2_mbus_framefmt	formats[CAL_CAMERARX_NUM_PADS];
>  
>  	/* mutex for camerarx ops */
>  	struct mutex		mutex;

-- 
Regards,

Laurent Pinchart
