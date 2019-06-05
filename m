Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1519E3661D
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfFEU5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:57:30 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43469 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFEU5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:57:30 -0400
X-Originating-IP: 93.29.109.196
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 85B3EFF809;
        Wed,  5 Jun 2019 20:57:21 +0000 (UTC)
Message-ID: <224115574fd3ebb3309c726b63e7a61ff66fd888.camel@bootlin.com>
Subject: Re: [PATCH RFC 4/6] media: cedrus: Prepare things to support
 !compound controls
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Wed, 05 Jun 2019 22:57:21 +0200
In-Reply-To: <20190603110946.4952-5-boris.brezillon@collabora.com>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
         <20190603110946.4952-5-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le lundi 03 juin 2019 à 13:09 +0200, Boris Brezillon a écrit :
> We are about to add a menu control, so let's make the code more generic
> to support other control types.

Did you have a chance to test this or should I better give it a spin
before adding my Reviewed-By?

Cheers,

Paul

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 47 ++++++++++++---------
>  drivers/staging/media/sunxi/cedrus/cedrus.h |  3 +-
>  2 files changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index 370937edfc14..378032fe71f9 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -29,44 +29,44 @@
>  
>  static const struct cedrus_control cedrus_controls[] = {
>  	{
> -		.id		= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
> -		.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_slice_params),
> +		.cfg.id		= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
> +		.cfg.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_slice_params),
>  		.codec		= CEDRUS_CODEC_MPEG2,
>  		.required	= true,
>  	},
>  	{
> -		.id		= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
> -		.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_quantization),
> +		.cfg.id		= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
> +		.cfg.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_quantization),
>  		.codec		= CEDRUS_CODEC_MPEG2,
>  		.required	= false,
>  	},
>  	{
> -		.id		= V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
> -		.elem_size	= sizeof(struct v4l2_ctrl_h264_decode_params),
> +		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
> +		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_decode_params),
>  		.codec		= CEDRUS_CODEC_H264,
>  		.required	= true,
>  	},
>  	{
> -		.id		= V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
> -		.elem_size	= sizeof(struct v4l2_ctrl_h264_slice_params),
> +		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
> +		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_slice_params),
>  		.codec		= CEDRUS_CODEC_H264,
>  		.required	= true,
>  	},
>  	{
> -		.id		= V4L2_CID_MPEG_VIDEO_H264_SPS,
> -		.elem_size	= sizeof(struct v4l2_ctrl_h264_sps),
> +		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_SPS,
> +		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_sps),
>  		.codec		= CEDRUS_CODEC_H264,
>  		.required	= true,
>  	},
>  	{
> -		.id		= V4L2_CID_MPEG_VIDEO_H264_PPS,
> -		.elem_size	= sizeof(struct v4l2_ctrl_h264_pps),
> +		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_PPS,
> +		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_pps),
>  		.codec		= CEDRUS_CODEC_H264,
>  		.required	= true,
>  	},
>  	{
> -		.id		= V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
> -		.elem_size	= sizeof(struct v4l2_ctrl_h264_scaling_matrix),
> +		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
> +		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_scaling_matrix),
>  		.codec		= CEDRUS_CODEC_H264,
>  		.required	= true,
>  	},
> @@ -106,12 +106,21 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < CEDRUS_CONTROLS_COUNT; i++) {
> -		struct v4l2_ctrl_config cfg = {};
> +		const struct v4l2_ctrl_config *cfg = &cedrus_controls[i].cfg;
>  
> -		cfg.elem_size = cedrus_controls[i].elem_size;
> -		cfg.id = cedrus_controls[i].id;
> +		if (cfg->elem_size)
> +			ctrl = v4l2_ctrl_new_custom(hdl, cfg, NULL);
> +		else if (cfg->type == V4L2_CTRL_TYPE_MENU ||
> +			   cfg->type == V4L2_CTRL_TYPE_INTEGER_MENU)
> +			ctrl = v4l2_ctrl_new_std_menu(hdl, NULL,
> +						      cfg->id, cfg->max,
> +						      cfg->menu_skip_mask,
> +						      cfg->def);
> +		else
> +			ctrl = v4l2_ctrl_new_std(hdl, NULL, cfg->id, cfg->min,
> +						 cfg->max, cfg->step,
> +						 cfg->def);
>  
> -		ctrl = v4l2_ctrl_new_custom(hdl, &cfg, NULL);
>  		if (hdl->error) {
>  			v4l2_err(&dev->v4l2_dev,
>  				 "Failed to create new custom control\n");
> @@ -178,7 +187,7 @@ static int cedrus_request_validate(struct media_request *req)
>  			continue;
>  
>  		ctrl_test = v4l2_ctrl_request_hdl_ctrl_find(hdl,
> -							    cedrus_controls[i].id);
> +							    cedrus_controls[i].cfg.id);
>  		if (!ctrl_test) {
>  			v4l2_info(&ctx->dev->v4l2_dev,
>  				  "Missing required codec control\n");
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 3f476d0fd981..69c037724d93 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -49,8 +49,7 @@ enum cedrus_h264_pic_type {
>  };
>  
>  struct cedrus_control {
> -	u32			id;
> -	u32			elem_size;
> +	struct v4l2_ctrl_config	cfg;
>  	enum cedrus_codec	codec;
>  	unsigned char		required:1;
>  };

