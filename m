Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AADA717BB90
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 12:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgCFLXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 06:23:49 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40244 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgCFLXs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 06:23:48 -0500
Received: by mail-pg1-f195.google.com with SMTP id t24so942871pgj.7
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2020 03:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eQt7Spt+56Zw5leX6poGtsz5rSuCfvoeTR4cTyC86Ws=;
        b=R8Wj2wtNT217E55N3SWYzkGXtnhPOMzLzfqkOaeuueNbRT6KlDuop6EVp4VuFailJT
         AH86S0u7mhWhWCWBcyayBaZmZa/pU54JNB2LkBieb5XiWS6/e0zFuWLUJOD2/mSgayLK
         k5GEfCiurGnCSj/hlYna6M9Oxkk3gTZjXtHmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eQt7Spt+56Zw5leX6poGtsz5rSuCfvoeTR4cTyC86Ws=;
        b=HzTQpmpfsYSH0ubiUy4LUiy4XDJFfZJwJYS71gFdDh5BQeyQq8Du1c4J+RP0R0qKnT
         9nqWQzbNtilx5Ll+luYWci8PgAxc2n2CqNhNjkh3mJXt44fyCTjUKsQRadJJzxIMs89A
         t8Odr/UZJ2PM0SpxoE7afAjeqa61nBtsKz4xsm7gHDPui/zVA+RrVsf92jOVvsql63y0
         88eSS9rMIq1HRWG+emaN73v6JYtTIOdkzVwUTM+X+MvBWuQK22fbVROkdDf9v/m9EJS7
         bTEs9AMdOkbb7j/ukkUH+Lfy5qO/xXUiprU6UsHdlwj+EAcsA66ZMQ0ZMTbUFEVWz8U+
         3lBA==
X-Gm-Message-State: ANhLgQ2now8Tohfl2fOnzvWVR2uJO7vf3Zwfal+eauO9oKC/4RHKsM8B
        ihrKHiO8td1DMirh7TwA36PURg==
X-Google-Smtp-Source: ADFU+vv2BeysPFqXGnk9JIiDUT10lVb2/Ebyj//Dn0n+/g5zByMVpfbp9JUIaVtYMyS+C2RsWp5q0w==
X-Received: by 2002:a63:ba05:: with SMTP id k5mr2818530pgf.174.1583493823111;
        Fri, 06 Mar 2020 03:23:43 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
        by smtp.gmail.com with ESMTPSA id jx10sm9253484pjb.33.2020.03.06.03.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 03:23:42 -0800 (PST)
Date:   Fri, 6 Mar 2020 20:23:37 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v7 11/11] media: platform: Add jpeg dec/enc feature
Message-ID: <20200306112337.GA163286@chromium.org>
References: <20200303123446.20095-1-xia.jiang@mediatek.com>
 <20200303123446.20095-12-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303123446.20095-12-xia.jiang@mediatek.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Tue, Mar 03, 2020 at 08:34:46PM +0800, Xia Jiang wrote:
> Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> decode and encode have great similarities with function operation.

Thank you for the patch. Please see my comments inline.

[snip]

> @@ -51,6 +54,42 @@ static struct mtk_jpeg_fmt mtk_jpeg_formats[] = {
>  		.v_align	= 3,
>  		.flags		= MTK_JPEG_FMT_FLAG_DEC_CAPTURE,
>  	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_NV12M,
> +		.h_sample	= {4, 2, 2},
> +		.v_sample	= {4, 2, 2},
> +		.colplanes	= 2,
> +		.h_align	= 4,
> +		.v_align	= 4,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_OUTPUT,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_NV21M,
> +		.h_sample	= {4, 2, 2},
> +		.v_sample	= {4, 2, 2},
> +		.colplanes	= 2,
> +		.h_align	= 4,
> +		.v_align	= 4,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_OUTPUT,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_YUYV,
> +		.h_sample	= {4, 2, 2},
> +		.v_sample	= {4, 4, 4},
> +		.colplanes	= 1,
> +		.h_align	= 4,
> +		.v_align	= 3,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_OUTPUT,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_YVYU,
> +		.h_sample	= {4, 2, 2},
> +		.v_sample	= {4, 4, 4},
> +		.colplanes	= 1,
> +		.h_align	= 4,
> +		.v_align	= 3,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_OUTPUT,
> +	},
>  };

Since the encoder and decoder don't seem to share almost any format,
perhaps it would make sense to just have separate format arrays for both?

>  
>  #define MTK_JPEG_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_formats)
> @@ -70,6 +109,11 @@ struct mtk_jpeg_src_buf {
>  static int debug;
>  module_param(debug, int, 0644);
>  
> +static inline struct mtk_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
> +{
> +	return container_of(ctrl->handler, struct mtk_jpeg_ctx, ctrl_hdl);
> +}
> +
>  static inline struct mtk_jpeg_ctx *mtk_jpeg_fh_to_ctx(struct v4l2_fh *fh)
>  {
>  	return container_of(fh, struct mtk_jpeg_ctx, fh);
> @@ -86,14 +130,69 @@ static int mtk_jpeg_querycap(struct file *file, void *priv,
>  {
>  	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
>  
> -	strscpy(cap->driver, MTK_JPEG_NAME " decoder", sizeof(cap->driver));
> -	strscpy(cap->card, MTK_JPEG_NAME " decoder", sizeof(cap->card));
> +	strscpy(cap->driver, MTK_JPEG_NAME, sizeof(cap->driver));
> +	if (jpeg->mode ==  MTK_JPEG_ENC)
> +		strscpy(cap->card, MTK_JPEG_NAME " encoder", sizeof(cap->card));
> +	else
> +		strscpy(cap->card, MTK_JPEG_NAME " decoder", sizeof(cap->card));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>  		 dev_name(jpeg->dev));
>  
>  	return 0;
>  }
>  
> +static int vidioc_jpeg_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_jpeg_ctx *ctx = ctrl_to_ctx(ctrl);
> +	int ret = 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_JPEG_RESTART_INTERVAL:
> +		ctx->restart_interval = ctrl->val;
> +		break;
> +	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
> +		ctx->enc_quality = ctrl->val;
> +		break;
> +	case V4L2_CID_JPEG_ACTIVE_MARKER:
> +		ctx->enable_exif = ctrl->val & V4L2_JPEG_ACTIVE_MARKER_APP1;
> +		break;
> +	}
> +
> +	return ret;

Wouldn't it be enough to just return 0 directly and remove ret?

> +}
> +
> +static const struct v4l2_ctrl_ops mtk_jpeg_ctrl_ops = {
> +	.s_ctrl = vidioc_jpeg_s_ctrl,
> +};
> +
> +static int mtk_jpeg_ctrls_setup(struct mtk_jpeg_ctx *ctx)
> +{
> +	const struct v4l2_ctrl_ops *ops = &mtk_jpeg_ctrl_ops;
> +	struct v4l2_ctrl_handler *handler = &ctx->ctrl_hdl;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +
> +	v4l2_ctrl_handler_init(handler, 3);
> +
> +	if (jpeg->mode == MTK_JPEG_ENC) {
> +		v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_RESTART_INTERVAL,
> +				  0, 100, 1, 0);
> +		v4l2_ctrl_new_std(handler, ops,
> +				  V4L2_CID_JPEG_COMPRESSION_QUALITY, 48, 100, 1,
> +				  90);
> +		v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_ACTIVE_MARKER, 0,
> +				  V4L2_JPEG_ACTIVE_MARKER_APP1, 0, 0);
> +
> +		if (handler->error) {
> +			v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +			return handler->error;
> +		}
> +	}
> +
> +	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> +
> +	return 0;
> +}
> +
>  static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
>  			     struct v4l2_fmtdesc *f, u32 type)
>  {
> @@ -118,19 +217,27 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
>  static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
> +	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +
>  	return mtk_jpeg_enum_fmt(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS, f,
> +				 ctx->jpeg->mode == MTK_JPEG_ENC ?
> +				 MTK_JPEG_FMT_FLAG_ENC_CAPTURE :
>  				 MTK_JPEG_FMT_FLAG_DEC_CAPTURE);

We wouldn't need this special casing if we separate the format arrays.

>  }
>  
>  static int mtk_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
> +	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +
>  	return mtk_jpeg_enum_fmt(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS, f,
> +				 ctx->jpeg->mode == MTK_JPEG_ENC ?
> +				 MTK_JPEG_FMT_FLAG_ENC_OUTPUT :
>  				 MTK_JPEG_FMT_FLAG_DEC_OUTPUT);

Ditto.

>  }
>  
> -static struct mtk_jpeg_q_data *mtk_jpeg_get_q_data(struct mtk_jpeg_ctx *ctx,
> -						   enum v4l2_buf_type type)
> +static struct mtk_jpeg_q_data *
> +mtk_jpeg_get_q_data(struct mtk_jpeg_ctx *ctx, enum v4l2_buf_type type)
>  {
>  	if (V4L2_TYPE_IS_OUTPUT(type))
>  		return &ctx->out_q;
> @@ -143,9 +250,14 @@ static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
>  {
>  	unsigned int k, fmt_flag;
>  
> -	fmt_flag = (fmt_type == MTK_JPEG_FMT_TYPE_OUTPUT) ?
> -		   MTK_JPEG_FMT_FLAG_DEC_OUTPUT :
> -		   MTK_JPEG_FMT_FLAG_DEC_CAPTURE;
> +	if (ctx->jpeg->mode ==  MTK_JPEG_ENC)
> +		fmt_flag = (fmt_type == MTK_JPEG_FMT_TYPE_OUTPUT) ?
> +			   MTK_JPEG_FMT_FLAG_ENC_OUTPUT :
> +			   MTK_JPEG_FMT_FLAG_ENC_CAPTURE;
> +	else
> +		fmt_flag = (fmt_type == MTK_JPEG_FMT_TYPE_OUTPUT) ?
> +			   MTK_JPEG_FMT_FLAG_DEC_OUTPUT :
> +			   MTK_JPEG_FMT_FLAG_DEC_CAPTURE;

Ditto.

>  
>  	for (k = 0; k < MTK_JPEG_NUM_FORMATS; k++) {
>  		struct mtk_jpeg_fmt *fmt = &mtk_jpeg_formats[k];
> @@ -177,9 +289,73 @@ static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
>  	}
>  }
>  
> -static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
> -				   struct mtk_jpeg_fmt *fmt,
> -				   struct mtk_jpeg_ctx *ctx, int q_type)
> +static int mtk_jpeg_try_enc_fmt_mplane(struct v4l2_format *f,
> +				       struct mtk_jpeg_fmt *fmt,
> +				       struct mtk_jpeg_ctx *ctx, int q_type)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	int i;
> +
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));

Zeroing the reserved fields is handled by the core.

> +	pix_mp->field = V4L2_FIELD_NONE;
> +
> +	if (ctx->state != MTK_JPEG_INIT) {

Is this really the right condition? As per V4L2 semantics, the format can't
be changed when the queue has buffers allocated (vb2_is_busy()). Also,
CAPTURE queue of the encoder doesn't have anything that could be changed,
as the pixelformat is always JPEG and the rest determined by the OUTPUT
queue, so perhaps it should have all the G_/TRY_/S_FMT ioctls implemented
like G_FMT?

> +		mtk_jpeg_adjust_fmt_mplane(ctx, f);

The name of thi function sounds like it adjusts something, but it
effectively just gets the current format. Why not just call the
implementation of G_FMT directly?

> +		return 0;
> +	}
> +
> +	pix_mp->num_planes = fmt->colplanes;
> +	pix_mp->pixelformat = fmt->fourcc;
> +
> +	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {

Why the custom queue type macro? Could we use standard definitions instead?
I.e. V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE.

> +		if (pix_mp->num_planes == 1U) {

nit: It is unusual to add the U prefix in comparisions like this.

> +			pix_mp->height = clamp(round_up(pix_mp->height, 8),
> +					       MTK_JPEG_MIN_HEIGHT,
> +					       MTK_JPEG_MAX_HEIGHT);
> +			pix_mp->width = clamp(round_up(pix_mp->width, 32),
> +					      MTK_JPEG_MIN_WIDTH,
> +					      MTK_JPEG_MAX_WIDTH);
> +			pix_mp->plane_fmt[0].bytesperline = pix_mp->width * 2;
> +			pix_mp->plane_fmt[0].sizeimage =
> +				pix_mp->width * pix_mp->height * 2;
> +		}
> +		if (pix_mp->num_planes == 2U) {
> +			pix_mp->height = clamp(round_up(pix_mp->height, 16),
> +					       MTK_JPEG_MIN_HEIGHT,
> +					       MTK_JPEG_MAX_HEIGHT);
> +			pix_mp->width = clamp(round_up(pix_mp->width, 16),
> +					      MTK_JPEG_MIN_WIDTH,
> +					      MTK_JPEG_MAX_WIDTH);
> +			for (i = 0; i < pix_mp->num_planes; i++) {
> +				pix_mp->plane_fmt[i].bytesperline =
> +					pix_mp->width;
> +				pix_mp->plane_fmt[i].sizeimage =
> +					pix_mp->width * pix_mp->height /
> +					(i + 1);
> +			}
> +		}
> +	} else {
> +		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> +				       MTK_JPEG_MAX_HEIGHT);
> +		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
> +				      MTK_JPEG_MAX_WIDTH);
> +
> +		if (fmt->fourcc == V4L2_PIX_FMT_JPEG) {
> +			pix_mp->plane_fmt[0].bytesperline = 0;
> +			pix_mp->plane_fmt[0].sizeimage =
> +				round_up(pix_mp->plane_fmt[0].sizeimage, 128);
> +			if (pix_mp->plane_fmt[0].sizeimage == 0)
> +				pix_mp->plane_fmt[0].sizeimage =
> +					MTK_JPEG_DEFAULT_SIZEIMAGE;
> +		}
> +	}
> +
> +	return 0;
> +}

It doesn't look like the function above does anything specific to the
encoder. It just does generic format adjustment.

Could we just add various format parameters to the mtk_jpeg_fmt struct and
have a generic function that is shared by both encoder and decoder? That
would also let us remove the conditional code for queue type, because the
operations below actually depend on the format, not the queue.

> +
> +static int mtk_jpeg_try_dec_fmt_mplane(struct v4l2_format *f,
> +				       struct mtk_jpeg_fmt *fmt,
> +				       struct mtk_jpeg_ctx *ctx, int q_type)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	int i;
> @@ -286,6 +462,7 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
>  	struct mtk_jpeg_fmt *fmt;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  
>  	fmt = mtk_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat,
>  				   MTK_JPEG_FMT_TYPE_CAPTURE);
> @@ -299,7 +476,12 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  		 (fmt->fourcc >> 16 & 0xff),
>  		 (fmt->fourcc >> 24 & 0xff));
>  
> -	return mtk_jpeg_try_fmt_mplane(f, fmt, ctx, MTK_JPEG_FMT_TYPE_CAPTURE);
> +	if (jpeg->mode == MTK_JPEG_ENC)
> +		return mtk_jpeg_try_enc_fmt_mplane(f, fmt, ctx,
> +						   MTK_JPEG_FMT_TYPE_CAPTURE);
> +	else
> +		return mtk_jpeg_try_dec_fmt_mplane(f, fmt, ctx,
> +						   MTK_JPEG_FMT_TYPE_CAPTURE);

With a generic format adjustment function we wouldn't need this special
casing.

>  }
>  
>  static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
> @@ -307,6 +489,7 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
>  	struct mtk_jpeg_fmt *fmt;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  
>  	fmt = mtk_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat,
>  				   MTK_JPEG_FMT_TYPE_OUTPUT);
> @@ -320,7 +503,12 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  		 (fmt->fourcc >> 16 & 0xff),
>  		 (fmt->fourcc >> 24 & 0xff));
>  
> -	return mtk_jpeg_try_fmt_mplane(f, fmt, ctx, MTK_JPEG_FMT_TYPE_OUTPUT);
> +	if (jpeg->mode == MTK_JPEG_ENC)
> +		return mtk_jpeg_try_enc_fmt_mplane(f, fmt, ctx,
> +						   MTK_JPEG_FMT_TYPE_OUTPUT);
> +	else
> +		return mtk_jpeg_try_dec_fmt_mplane(f, fmt, ctx,
> +						   MTK_JPEG_FMT_TYPE_OUTPUT);

Ditto.

>  }
>  
>  static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
> @@ -425,28 +613,48 @@ static int mtk_jpeg_g_selection(struct file *file, void *priv,
>  				struct v4l2_selection *s)
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  
> -	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -		return -EINVAL;
> +	if (jpeg->mode == MTK_JPEG_ENC) {
> +		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +			return -EINVAL;

Instead of repeating the if/else in every callback, could we instead
provide separate ops structs for encoder and decoder so they can have
separate callbacks for those that need to differ significantly?

>  
> -	switch (s->target) {
> -	case V4L2_SEL_TGT_COMPOSE:
> -	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> -		s->r.width = ctx->out_q.w;
> -		s->r.height = ctx->out_q.h;
> -		s->r.left = 0;
> -		s->r.top = 0;
> -		break;
> -	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> -	case V4L2_SEL_TGT_COMPOSE_PADDED:
> -		s->r.width = ctx->cap_q.w;
> -		s->r.height = ctx->cap_q.h;
> -		s->r.left = 0;
> -		s->r.top = 0;
> -		break;
> -	default:
> -		return -EINVAL;
> +		switch (s->target) {
> +		case V4L2_SEL_TGT_CROP:
> +		case V4L2_SEL_TGT_CROP_BOUNDS:
> +		case V4L2_SEL_TGT_CROP_DEFAULT:
> +			s->r.width = ctx->out_q.w;
> +			s->r.height = ctx->out_q.h;
> +			s->r.left = 0;
> +			s->r.top = 0;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else {
> +		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +			return -EINVAL;
> +
> +		switch (s->target) {
> +		case V4L2_SEL_TGT_COMPOSE:
> +		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +			s->r.width = ctx->out_q.w;
> +			s->r.height = ctx->out_q.h;
> +			s->r.left = 0;
> +			s->r.top = 0;
> +			break;
> +		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +		case V4L2_SEL_TGT_COMPOSE_PADDED:
> +			s->r.width = ctx->cap_q.w;
> +			s->r.height = ctx->cap_q.h;
> +			s->r.left = 0;
> +			s->r.top = 0;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
>  	}
> +
>  	return 0;
>  }
>  
> @@ -454,20 +662,38 @@ static int mtk_jpeg_s_selection(struct file *file, void *priv,
>  				struct v4l2_selection *s)
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  
> -	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -		return -EINVAL;
> +	if (jpeg->mode == MTK_JPEG_ENC) {
> +		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +			return -EINVAL;

Ditto.

>  
> -	switch (s->target) {
> -	case V4L2_SEL_TGT_COMPOSE:
> -		s->r.left = 0;
> -		s->r.top = 0;
> -		ctx->out_q.w = s->r.width;
> -		ctx->out_q.h = s->r.height;
> -		break;
> -	default:
> -		return -EINVAL;
> +		switch (s->target) {
> +		case V4L2_SEL_TGT_CROP:
> +			s->r.left = 0;
> +			s->r.top = 0;
> +			ctx->out_q.w = s->r.width;
> +			ctx->out_q.h = s->r.height;

What happens if the userspace provides a value bigger than current format?

> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else {
> +		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +			return -EINVAL;
> +
> +		switch (s->target) {
> +		case V4L2_SEL_TGT_COMPOSE:
> +			s->r.left = 0;
> +			s->r.top = 0;
> +			ctx->out_q.w = s->r.width;
> +			ctx->out_q.h = s->r.height;

This is about existing code, but perhaps needs to be fixed. Shouldn't the
decoder compose rectangle be read-only, as it means the visible size of the
decoded JPEG as per the image metadata?

> +			break;
> +		default:
> +			return -EINVAL;
> +		}
>  	}
> +
>  	return 0;
>  }
>  
> @@ -643,29 +869,42 @@ static void mtk_jpeg_buf_queue(struct vb2_buffer *vb)
>  		goto end;
>  
>  	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(vb);
> -	param = &jpeg_src_buf->dec_param;
> -	memset(param, 0, sizeof(*param));
> -
> -	if (jpeg_src_buf->flags & MTK_JPEG_BUF_FLAGS_LAST_FRAME) {
> -		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "Got eos\n");
> -		goto end;
> -	}
> -	header_valid = mtk_jpeg_parse(param, (u8 *)vb2_plane_vaddr(vb, 0),
> -				      vb2_get_plane_payload(vb, 0));
> -	if (!header_valid) {
> -		v4l2_err(&jpeg->v4l2_dev, "Header invalid.\n");
> -		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> -		return;
> -	}
> -
> -	if (ctx->state == MTK_JPEG_INIT) {
> -		struct vb2_queue *dst_vq = v4l2_m2m_get_vq(
> -			ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (jpeg->mode == MTK_JPEG_ENC) {
> +		if (jpeg_src_buf->flags & MTK_JPEG_BUF_FLAGS_LAST_FRAME) {
> +			v4l2_dbg(1, debug, &jpeg->v4l2_dev, "Got eos");
> +			goto end;
> +		}
> +		if (ctx->state == MTK_JPEG_INIT)
> +			ctx->state = MTK_JPEG_RUNNING;

Why does the state change here? Queuing buffers is a repetitive operation.
What's special about the first buffer?

Perhaps the state should change when we start streaming on both queues?

(On a side note, I don't see a need for ctx->state in case of the encoder.
The information provided by vb2 by the means of vb2_is_busy() or
vb2_is_streaming() should be enough.)

> +	} else {
> +		param = &jpeg_src_buf->dec_param;
> +		memset(param, 0, sizeof(*param));
> +
> +		if (jpeg_src_buf->flags & MTK_JPEG_BUF_FLAGS_LAST_FRAME) {
> +			v4l2_dbg(1, debug, &jpeg->v4l2_dev, "Got eos\n");
> +			goto end;
> +		}
> +		header_valid = mtk_jpeg_parse(param,
> +					      (u8 *)vb2_plane_vaddr(vb, 0),
> +					      vb2_get_plane_payload(vb, 0));
> +		if (!header_valid) {
> +			v4l2_err(&jpeg->v4l2_dev, "Header invalid.\n");
> +			vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> +			return;
> +		}
>  
> -		mtk_jpeg_queue_src_chg_event(ctx);
> -		mtk_jpeg_set_queue_data(ctx, param);
> -		ctx->state = vb2_is_streaming(dst_vq) ?
> -				MTK_JPEG_SOURCE_CHANGE : MTK_JPEG_RUNNING;
> +		if (ctx->state == MTK_JPEG_INIT) {
> +			struct vb2_queue *dst_vq;
> +
> +			dst_vq = v4l2_m2m_get_vq
> +					(ctx->fh.m2m_ctx,
> +					 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +			mtk_jpeg_queue_src_chg_event(ctx);
> +			mtk_jpeg_set_queue_data(ctx, param);
> +			ctx->state = vb2_is_streaming(dst_vq) ?
> +					MTK_JPEG_SOURCE_CHANGE :
> +					MTK_JPEG_RUNNING;
> +		}
>  	}
>  end:
>  	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, to_vb2_v4l2_buffer(vb));

It sounds like we would also benefit from just having separate callbacks
for encoder an decoder here.

The code isn't included in this patch, but start_streaming implementation
has a problem that I want to point out:

	static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
	{
		struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
		struct vb2_v4l2_buffer *vb;
		int ret = 0;
	
		ret = pm_runtime_get_sync(ctx->jpeg->dev);
		if (ret < 0)
			goto err;

This is a memory to memory device, so it doesn't need to keep running all
the time when streaming is enabled. One would normally call
pm_runtime_get_sync() before starting a frame and then pm_runtime_put()
after completing it. This would save power for the time between processing
two frames.

		return 0;
	err:
		while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
			v4l2_m2m_buf_done(vb, VB2_BUF_STATE_QUEUED);
		return ret;
	}

> @@ -708,16 +947,16 @@ static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
>  	 * subsampling. Update capture queue when the stream is off.
>  	 */
>  	if (ctx->state == MTK_JPEG_SOURCE_CHANGE &&
> -	    !V4L2_TYPE_IS_OUTPUT(q->type)) {
> +	    !V4L2_TYPE_IS_OUTPUT(q->type) &&
> +	    ctx->jpeg->mode == MTK_JPEG_DEC) {
>  		struct mtk_jpeg_src_buf *src_buf;
>  
>  		vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  		src_buf = mtk_jpeg_vb2_to_srcbuf(&vb->vb2_buf);
>  		mtk_jpeg_set_queue_data(ctx, &src_buf->dec_param);
>  		ctx->state = MTK_JPEG_RUNNING;
> -	} else if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +	} else if (V4L2_TYPE_IS_OUTPUT(q->type))
>  		ctx->state = MTK_JPEG_INIT;
> -	}

Wouldn't it be possible that at this point the encoder is actually in
process of encoding a frame? Wouldn't this code race with the interrupt
handler?

>  
>  	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
>  		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> @@ -772,6 +1011,45 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
>  	return 0;
>  }
>  
> +static void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
> +				 struct vb2_buffer *dst_buf,
> +				 struct mtk_jpeg_enc_bs *bs)
> +{
> +	bs->dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +	bs->dma_addr_offset = ctx->enable_exif ? MTK_JPEG_DEFAULT_EXIF_SIZE : 0;

Could you explain what is the meaning of the dma_addr_offset and where the
default EXIF size comes from? Also, how is the encoder output affected by
the enable_exif flag?

> +	bs->dma_addr_offsetmask = bs->dma_addr & JPEG_ENC_DST_ADDR_OFFSET_MASK;
> +	bs->size = round_up(vb2_plane_size(dst_buf, 0), 128);

We can't round up the size that comes from vb2, because it could lead to a
buffer overflow. We need to ensure that the hardware doesn't write more
than the value returned by vb2_plane_size().

> +
> +	mtk_jpeg_enc_set_dst_addr(base, bs->dma_addr, bs->size,
> +				  bs->dma_addr_offset,
> +				  bs->dma_addr_offsetmask);
> +}
> +
> +static void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx, void __iomem *base,
> +				 struct vb2_buffer *src_buf,
> +				 struct mtk_jpeg_enc_fb *fb)
> +{
> +	int i;
> +
> +	mtk_jpeg_enc_set_img_size(base, ctx->out_q.w, ctx->out_q.h);
> +	mtk_jpeg_enc_set_enc_format(base, ctx->out_q.fmt->fourcc);
> +	mtk_jpeg_enc_set_blk_num(base, ctx->out_q.fmt->fourcc, ctx->out_q.w,
> +				 ctx->out_q.h);
> +	mtk_jpeg_enc_set_stride(base, ctx->out_q.fmt->fourcc, ctx->out_q.w,
> +				ctx->out_q.h, ctx->out_q.bytesperline[0]);
> +
> +	for (i = 0; i < src_buf->num_planes; i++) {
> +		fb->fb_addr[i].dma_addr =
> +			vb2_dma_contig_plane_dma_addr(src_buf, i) +
> +			src_buf->planes[i].data_offset;
> +		fb->fb_addr[i].size = vb2_plane_size(src_buf, i) -
> +				      src_buf->planes[i].data_offset;
> +	}
> +
> +	mtk_jpeg_enc_set_src_addr(base, fb->fb_addr[0].dma_addr,
> +				  fb->fb_addr[1].dma_addr);

What would be the second dma_addr in case of a format with 1 plane?

> +}
> +
>  static void mtk_jpeg_device_run(void *priv)
>  {
>  	struct mtk_jpeg_ctx *ctx = priv;
> @@ -782,6 +1060,8 @@ static void mtk_jpeg_device_run(void *priv)
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	struct mtk_jpeg_bs bs;
>  	struct mtk_jpeg_fb fb;
> +	struct mtk_jpeg_enc_bs enc_bs;
> +	struct mtk_jpeg_enc_fb enc_fb;
>  	int i;
>  
>  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> @@ -792,30 +1072,47 @@ static void mtk_jpeg_device_run(void *priv)
>  		for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
>  			vb2_set_plane_payload(&dst_buf->vb2_buf, i, 0);
>  		buf_state = VB2_BUF_STATE_DONE;

About existing code, but we may want to explain this.
What is this last frame handling above for?

> -		goto dec_end;
> +		goto device_run_end;
>  	}
>  
> -	if (mtk_jpeg_check_resolution_change(ctx, &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
> -		ctx->state = MTK_JPEG_SOURCE_CHANGE;
> -		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> -		return;
> -	}
> +	if (jpeg->mode == MTK_JPEG_ENC) {
> +		spin_lock_irqsave(&jpeg->hw_lock, flags);
> +		mtk_jpeg_enc_reset(jpeg->reg_base);

Why do we need to reset every frame?

> +
> +		mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf,
> +				     &enc_bs);
> +		mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf,
> +				     &enc_fb);
> +		mtk_jpeg_enc_set_ctrl_cfg(jpeg->reg_base, ctx->enable_exif,
> +					  ctx->enc_quality,
> +					  ctx->restart_interval);
> +
> +		mtk_jpeg_enc_start(jpeg->reg_base);
> +	} else {
> +		if (mtk_jpeg_check_resolution_change
> +			(ctx, &jpeg_src_buf->dec_param)) {
> +			mtk_jpeg_queue_src_chg_event(ctx);
> +			ctx->state = MTK_JPEG_SOURCE_CHANGE;
> +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);

This is a bit strange. Resolution change should be signaled when the
hardware attempted to decode a frame and detected a different resolution
than current. It shouldn't be necessary for the userspace to queue a pair
of buffers to signal it, as with the current code.

> +			return;
> +		}
>  
> -	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> -	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
> -		goto dec_end;
> +		mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> +		if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param,
> +					 &dst_buf->vb2_buf, &fb))
> +			goto device_run_end;
>  
> -	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> -	mtk_jpeg_dec_set_config(jpeg->dec_reg_base,
> -				&jpeg_src_buf->dec_param, &bs, &fb);
> +		spin_lock_irqsave(&jpeg->hw_lock, flags);
> +		mtk_jpeg_dec_reset(jpeg->reg_base);

Same here, why do we need to reset the decoder every frame? Shouldn't it be
enough to reset it in runtime resume callback?

> +		mtk_jpeg_dec_set_config(jpeg->reg_base,
> +					&jpeg_src_buf->dec_param, &bs, &fb);
>  
> -	mtk_jpeg_dec_start(jpeg->dec_reg_base);
> +		mtk_jpeg_dec_start(jpeg->reg_base);
> +	}
>  	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
>  	return;
>  
> -dec_end:
> +device_run_end:
>  	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>  	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  	v4l2_m2m_buf_done(src_buf, buf_state);
> @@ -875,30 +1172,30 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  	ret = mtk_smi_larb_get(jpeg->larb);
>  	if (ret)
>  		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> -	clk_prepare_enable(jpeg->clk_jdec_smi);
> -	clk_prepare_enable(jpeg->clk_jdec);
> +	if (jpeg->mode == MTK_JPEG_DEC)
> +		clk_prepare_enable(jpeg->clk_jpeg_smi);

Could the clk_bulk_* API be used instead? It would eliminate the need for
this special casing.

> +	clk_prepare_enable(jpeg->clk_jpeg);
>  }
>  
>  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>  {
> -	clk_disable_unprepare(jpeg->clk_jdec);
> -	clk_disable_unprepare(jpeg->clk_jdec_smi);
> +	clk_disable_unprepare(jpeg->clk_jpeg);
> +	if (jpeg->mode == MTK_JPEG_DEC)
> +		clk_disable_unprepare(jpeg->clk_jpeg_smi);

Ditto.

>  	mtk_smi_larb_put(jpeg->larb);
>  }
>  
> -static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
> +static irqreturn_t mtk_jpeg_irq(int irq, void *priv)
>  {
>  	struct mtk_jpeg_dev *jpeg = priv;
>  	struct mtk_jpeg_ctx *ctx;
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> -	u32	dec_irq_ret;
> -	u32 dec_ret;
> +	u32 irq_ret;
> +	u32 ret, result_size;
>  	int i;
>  
> -	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
> -	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
>  	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
>  	if (!ctx) {
>  		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
> @@ -909,32 +1206,89 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
>  
> -	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
> -		mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> +	if (jpeg->mode == MTK_JPEG_ENC) {

As the hardware blocks are completely different, we definitely want to have
separate interrupt handlers for them, rather than this special casing.

> +		ret = mtk_jpeg_enc_get_int_status(jpeg->reg_base);
> +		irq_ret = mtk_jpeg_enc_enum_result(jpeg->reg_base, ret);
>  
> -	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE) {
> -		dev_err(jpeg->dev, "decode failed\n");
> -		goto dec_end;
> -	}
> +		if (irq_ret >= MTK_JPEG_ENC_RESULT_STALL)
> +			mtk_jpeg_enc_reset(jpeg->reg_base);
> +
> +		if (irq_ret != MTK_JPEG_ENC_RESULT_DONE) {
> +			dev_err(jpeg->dev, "encode failed\n");
> +			goto irq_end;
> +		}
> +
> +		result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
> +				      result_size);
> +	} else {
> +		ret = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
> +		irq_ret = mtk_jpeg_dec_enum_result(ret);
> +
> +		if (irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
> +			mtk_jpeg_dec_reset(jpeg->reg_base);
>  
> -	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
> -		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
> -				      jpeg_src_buf->dec_param.comp_size[i]);
> +		if (irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE) {
> +			dev_err(jpeg->dev, "decode failed\n");
> +			goto irq_end;
> +		}
> +
> +		for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
> +			vb2_set_plane_payload
> +				(&dst_buf->vb2_buf, i,
> +				 jpeg_src_buf->dec_param.comp_size[i]);
> +	}
>  
>  	buf_state = VB2_BUF_STATE_DONE;
>  
> -dec_end:
> +irq_end:
>  	v4l2_m2m_buf_done(src_buf, buf_state);
>  	v4l2_m2m_buf_done(dst_buf, buf_state);
>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  	return IRQ_HANDLED;
>  }
>  
> -static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
> +static void mtk_jpeg_set_enc_default_params(struct mtk_jpeg_ctx *ctx)
> +{
> +	struct mtk_jpeg_q_data *q = &ctx->out_q;
> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;

Perhaps this could be just moved to the caller, rather than duplicating for
encoder and decoder?

> +
> +	ctx->colorspace = V4L2_COLORSPACE_JPEG,
> +	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +
> +	q->w = MTK_JPEG_MIN_WIDTH;
> +	q->h = MTK_JPEG_MIN_HEIGHT;
> +
> +	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUYV,
> +				      MTK_JPEG_FMT_TYPE_OUTPUT);
> +
> +	q->w = clamp(round_up(q->w, 32), MTK_JPEG_MIN_WIDTH,
> +		     MTK_JPEG_MAX_WIDTH);
> +	q->h = clamp(round_up(q->h, 8), MTK_JPEG_MIN_HEIGHT,
> +		     MTK_JPEG_MAX_HEIGHT);

Is this clamp() really needed? The code explicitly sets correct values
few lines above.

> +
> +	q->sizeimage[0] = q->w * q->h * 2;
> +	q->bytesperline[0] = q->w * 2;

In general this kind of hardcoded computation is really error prone, e.g.
if the default pixelformat changes for some reason. Could the same logic as
for TRY_/S_FMT be called from here to compute these values?

> +
> +	q = &ctx->cap_q;
> +	q->w = MTK_JPEG_MIN_WIDTH;
> +	q->h = MTK_JPEG_MIN_HEIGHT;
> +	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> +				      MTK_JPEG_FMT_TYPE_CAPTURE);
> +	q->bytesperline[0] = 0;
> +	q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
> +}
> +
> +static void mtk_jpeg_set_dec_default_params(struct mtk_jpeg_ctx *ctx)
>  {
>  	struct mtk_jpeg_q_data *q = &ctx->out_q;
>  	int i;
>  
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> +
>  	ctx->colorspace = V4L2_COLORSPACE_JPEG,
>  	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>  	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> @@ -990,7 +1344,18 @@ static int mtk_jpeg_open(struct file *file)
>  		goto error;
>  	}
>  
> -	mtk_jpeg_set_default_params(ctx);
> +	ret = mtk_jpeg_ctrls_setup(ctx);
> +	if (ret) {
> +		v4l2_err(&jpeg->v4l2_dev, "Failed to setup controls() (%d)\n",

nit: Is the "()" after "controls" necessary?

> +			 ret);
> +		goto error;
> +	}
> +
> +	if (jpeg->mode == MTK_JPEG_ENC)
> +		mtk_jpeg_set_enc_default_params(ctx);
> +	else
> +		mtk_jpeg_set_dec_default_params(ctx);
> +
>  	mutex_unlock(&jpeg->lock);
>  	return 0;
>  
> @@ -1010,6 +1375,7 @@ static int mtk_jpeg_release(struct file *file)
>  
>  	mutex_lock(&jpeg->lock);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>  	v4l2_fh_del(&ctx->fh);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
> @@ -1043,19 +1409,24 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  
>  	jpeg->larb = &pdev->dev;
>  
> -	jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
> -	if (IS_ERR(jpeg->clk_jdec))
> -		return PTR_ERR(jpeg->clk_jdec);
> +	if (jpeg->mode == MTK_JPEG_ENC) {
> +		jpeg->clk_jpeg = devm_clk_get(jpeg->dev, "jpgenc");
> +		return PTR_ERR_OR_ZERO(jpeg->clk_jpeg);
> +	}
> +
> +	jpeg->clk_jpeg = devm_clk_get(jpeg->dev, "jpgdec");
> +	if (IS_ERR(jpeg->clk_jpeg))
> +		return PTR_ERR(jpeg->clk_jpeg);
>  
> -	jpeg->clk_jdec_smi = devm_clk_get(jpeg->dev, "jpgdec-smi");
> -	return PTR_ERR_OR_ZERO(jpeg->clk_jdec_smi);
> +	jpeg->clk_jpeg_smi = devm_clk_get(jpeg->dev, "jpgdec-smi");
> +	return PTR_ERR_OR_ZERO(jpeg->clk_jpeg_smi);

I'd suggest putting the clock names in a match_data struct, which could be
pointed to by the .data field of of_device_id. Then devm_clk_bulk_get()
could be used generically, without the need to special case between encoder
and decoder.

>  }
>  
>  static int mtk_jpeg_probe(struct platform_device *pdev)
>  {
>  	struct mtk_jpeg_dev *jpeg;
>  	struct resource *res;
> -	int dec_irq;
> +	int jpeg_irq;
>  	int ret;
>  
>  	jpeg = devm_kzalloc(&pdev->dev, sizeof(*jpeg), GFP_KERNEL);
> @@ -1065,28 +1436,26 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	mutex_init(&jpeg->lock);
>  	spin_lock_init(&jpeg->hw_lock);
>  	jpeg->dev = &pdev->dev;
> +	jpeg->mode = (enum mtk_jpeg_mode)of_device_get_match_data(jpeg->dev);

As the match data is expected to be a pointer, it shouldn't be casted to a
non-pointer value. Please define a struct with necessary hardware-specific
data and have the .data field of of_device_id point to it.

>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	jpeg->dec_reg_base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(jpeg->dec_reg_base)) {
> -		ret = PTR_ERR(jpeg->dec_reg_base);
> +	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(jpeg->reg_base)) {
> +		ret = PTR_ERR(jpeg->reg_base);
>  		return ret;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	dec_irq = platform_get_irq(pdev, 0);
> -	if (!res || dec_irq < 0) {
> -		dev_err(&pdev->dev, "Failed to get dec_irq %d.\n", dec_irq);
> -		ret = -EINVAL;

This is a bug fix, so plese do it in a separate patch, earlier in the
series.

> -		return ret;
> +	jpeg_irq = platform_get_irq(pdev, 0);
> +	if (jpeg_irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
> +		return jpeg_irq;
>  	}
>  
> -	ret = devm_request_irq(&pdev->dev, dec_irq, mtk_jpeg_dec_irq, 0,
> +	ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_irq, 0,
>  			       pdev->name, jpeg);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Failed to request dec_irq %d (%d)\n",
> -			dec_irq, ret);
> -		ret = -EINVAL;

Ditto. (Could be in one patch as the similar fix above.)

> +		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
> +			jpeg_irq, ret);
>  		goto err_req_irq;
>  	}
>  
> @@ -1110,33 +1479,35 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  		goto err_m2m_init;
>  	}
>  
> -	jpeg->dec_vdev = video_device_alloc();
> -	if (!jpeg->dec_vdev) {
> +	jpeg->vfd_jpeg = video_device_alloc();

Why "vfd"? "vdev" sounds more like video_device.

Also, the "jpeg" suffix doesn't seem to be needed, as the parent struct is
typically called "jpeg".

> +	if (!jpeg->vfd_jpeg) {
>  		ret = -ENOMEM;
> -		goto err_dec_vdev_alloc;
> +		goto err_vfd_jpeg_alloc;
>  	}
> -	snprintf(jpeg->dec_vdev->name, sizeof(jpeg->dec_vdev->name),
> -		 "%s-dec", MTK_JPEG_NAME);
> -	jpeg->dec_vdev->fops = &mtk_jpeg_fops;
> -	jpeg->dec_vdev->ioctl_ops = &mtk_jpeg_ioctl_ops;
> -	jpeg->dec_vdev->minor = -1;
> -	jpeg->dec_vdev->release = video_device_release;
> -	jpeg->dec_vdev->lock = &jpeg->lock;
> -	jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
> -	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
> -	jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
> +	snprintf(jpeg->vfd_jpeg->name, sizeof(jpeg->vfd_jpeg->name),
> +		 "%s-%s", MTK_JPEG_NAME,
> +		 jpeg->mode == MTK_JPEG_ENC ? "enc" : "dec");
> +	jpeg->vfd_jpeg->fops = &mtk_jpeg_fops;
> +	jpeg->vfd_jpeg->ioctl_ops = &mtk_jpeg_ioctl_ops;
> +	jpeg->vfd_jpeg->minor = -1;
> +	jpeg->vfd_jpeg->release = video_device_release;
> +	jpeg->vfd_jpeg->lock = &jpeg->lock;
> +	jpeg->vfd_jpeg->v4l2_dev = &jpeg->v4l2_dev;
> +	jpeg->vfd_jpeg->vfl_dir = VFL_DIR_M2M;
> +	jpeg->vfd_jpeg->device_caps = V4L2_CAP_STREAMING |
>  				      V4L2_CAP_VIDEO_M2M_MPLANE;
>  
> -	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_GRABBER, 3);
> +	ret = video_register_device(jpeg->vfd_jpeg, VFL_TYPE_GRABBER, -1);

FYI the type changed to VFL_TYPE_VIDEO recently.

>  	if (ret) {
>  		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
> -		goto err_dec_vdev_register;
> +		goto err_vfd_jpeg_register;
>  	}
>  
> -	video_set_drvdata(jpeg->dec_vdev, jpeg);
> +	video_set_drvdata(jpeg->vfd_jpeg, jpeg);
>  	v4l2_info(&jpeg->v4l2_dev,
> -		  "decoder device registered as /dev/video%d (%d,%d)\n",
> -		  jpeg->dec_vdev->num, VIDEO_MAJOR, jpeg->dec_vdev->minor);
> +		  "jpeg device %d registered as /dev/video%d (%d,%d)\n",

Here it would be actually useful to special case the encoder and decoder,
because it would be easier for the user to know which device is which.

> +		  jpeg->mode, jpeg->vfd_jpeg->num, VIDEO_MAJOR,
> +		  jpeg->vfd_jpeg->minor);
>  
>  	platform_set_drvdata(pdev, jpeg);
>  
> @@ -1144,10 +1515,10 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -err_dec_vdev_register:
> -	video_device_release(jpeg->dec_vdev);
> +err_vfd_jpeg_register:
> +	video_device_release(jpeg->vfd_jpeg);
>  
> -err_dec_vdev_alloc:
> +err_vfd_jpeg_alloc:
>  	v4l2_m2m_release(jpeg->m2m_dev);
>  
>  err_m2m_init:
> @@ -1167,8 +1538,8 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
>  	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> -	video_unregister_device(jpeg->dec_vdev);
> -	video_device_release(jpeg->dec_vdev);
> +	video_unregister_device(jpeg->vfd_jpeg);
> +	video_device_release(jpeg->vfd_jpeg);
>  	v4l2_m2m_release(jpeg->m2m_dev);
>  	v4l2_device_unregister(&jpeg->v4l2_dev);
>  
> @@ -1179,7 +1550,11 @@ static __maybe_unused int mtk_jpeg_pm_suspend(struct device *dev)
>  {
>  	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
>  
> -	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> +	if (jpeg->mode == MTK_JPEG_ENC)
> +		mtk_jpeg_enc_reset(jpeg->reg_base);
> +	else
> +		mtk_jpeg_dec_reset(jpeg->reg_base);

Is the reset here really necessary? We're going to cut down the power to
the IP block some time after the function returns.

> +
>  	mtk_jpeg_clk_off(jpeg);
>  
>  	return 0;
> @@ -1190,7 +1565,10 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
>  	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
>  
>  	mtk_jpeg_clk_on(jpeg);
> -	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> +	if (jpeg->mode == MTK_JPEG_ENC)
> +		mtk_jpeg_enc_reset(jpeg->reg_base);
> +	else
> +		mtk_jpeg_dec_reset(jpeg->reg_base);
>  
>  	return 0;
>  }

The code is not visible in this patch, but the implementation of the system
PM ops doesn't look correct.

	static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
	{
		int ret;
	
		if (pm_runtime_suspended(dev))
			return 0;
	
		ret = mtk_jpeg_pm_suspend(dev);

The hardware may be currently processing a frame. Wouldn't this cause
issues? Also, wouldn't this race with the interrupt handler?

Normally one would prevent the driver from scheduling next frames here,
wait for the driver to finish processing the current frame and only then
suspend.

		return ret;
	}
	
	static __maybe_unused int mtk_jpeg_resume(struct device *dev)
	{
		int ret;
	
		if (pm_runtime_suspended(dev))
			return 0;
	
		ret = mtk_jpeg_pm_resume(dev);

Here one normally needs to unblock the driver from scheduling next frames.
	
		return ret;
	}

> @@ -1226,11 +1604,15 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops = {
>  static const struct of_device_id mtk_jpeg_match[] = {
>  	{
>  		.compatible = "mediatek,mt8173-jpgdec",
> -		.data       = NULL,
> +		.data       = (void *)MTK_JPEG_DEC,
>  	},
>  	{
>  		.compatible = "mediatek,mt2701-jpgdec",
> -		.data       = NULL,
> +		.data       = (void *)MTK_JPEG_DEC,
> +	},
> +	{
> +		.compatible = "mediatek,mtk-jpgenc",
> +		.data       = (void *)MTK_JPEG_ENC,
>  	},
>  	{},
>  };
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 9bbd615b1067..02a387d8be5d 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2016 MediaTek Inc.
>   * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
>   *         Rick Chang <rick.chang@mediatek.com>
> + *         Xia Jiang <xia.jiang@mediatek.com>
>   */
>  
>  #ifndef _MTK_JPEG_CORE_H
> @@ -19,16 +20,19 @@
>  
>  #define MTK_JPEG_FMT_FLAG_DEC_OUTPUT	BIT(0)
>  #define MTK_JPEG_FMT_FLAG_DEC_CAPTURE	BIT(1)
> +#define MTK_JPEG_FMT_FLAG_ENC_OUTPUT	BIT(2)
> +#define MTK_JPEG_FMT_FLAG_ENC_CAPTURE	BIT(3)
>  
>  #define MTK_JPEG_FMT_TYPE_OUTPUT	1
>  #define MTK_JPEG_FMT_TYPE_CAPTURE	2
>  
>  #define MTK_JPEG_MIN_WIDTH	32U
>  #define MTK_JPEG_MIN_HEIGHT	32U
> -#define MTK_JPEG_MAX_WIDTH	8192U
> -#define MTK_JPEG_MAX_HEIGHT	8192U
> +#define MTK_JPEG_MAX_WIDTH	65535U
> +#define MTK_JPEG_MAX_HEIGHT	65535U

Is this correct even for the decoder?

>  
>  #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
> +#define MTK_JPEG_DEFAULT_EXIF_SIZE	(64 * 1024)
>  
>  /**
>   * enum mtk_jpeg_ctx_state - contex state of jpeg
> @@ -39,6 +43,14 @@ enum mtk_jpeg_ctx_state {
>  	MTK_JPEG_SOURCE_CHANGE,
>  };
>  
> +/**
> + * enum mtk_jpeg_mode - mode of jpeg
> + */
> +enum mtk_jpeg_mode {
> +	MTK_JPEG_ENC,
> +	MTK_JPEG_DEC,
> +};
> +

Perhaps bool is_encoder insted of an enum could simplify the code a bit?

>  /**
>   * struct mt_jpeg - JPEG IP abstraction
>   * @lock:		the mutex protecting this structure
> @@ -48,11 +60,12 @@ enum mtk_jpeg_ctx_state {
>   * @v4l2_dev:		v4l2 device for mem2mem mode
>   * @m2m_dev:		v4l2 mem2mem device data
>   * @alloc_ctx:		videobuf2 memory allocator's context
> - * @dec_vdev:		video device node for decoder mem2mem mode
> - * @dec_reg_base:	JPEG registers mapping
> - * @clk_jdec:		JPEG hw working clock
> - * @clk_jdec_smi:	JPEG SMI bus clock
> + * @vfd_jpeg:		video device node for jpeg mem2mem mode
> + * @reg_base:		JPEG registers mapping
> + * @clk_jpeg:		JPEG hw working clock
> + * @clk_jpeg_smi:	JPEG SMI bus clock
>   * @larb:		SMI device
> + * @mode:		compression (encode) operation or decompression (decode)
>   */
>  struct mtk_jpeg_dev {
>  	struct mutex		lock;
> @@ -62,11 +75,12 @@ struct mtk_jpeg_dev {
>  	struct v4l2_device	v4l2_dev;
>  	struct v4l2_m2m_dev	*m2m_dev;
>  	void			*alloc_ctx;
> -	struct video_device	*dec_vdev;
> -	void __iomem		*dec_reg_base;
> -	struct clk		*clk_jdec;
> -	struct clk		*clk_jdec_smi;
> +	struct video_device	*vfd_jpeg;
> +	void __iomem		*reg_base;
> +	struct clk		*clk_jpeg;
> +	struct clk		*clk_jpeg_smi;
>  	struct device		*larb;
> +	enum mtk_jpeg_mode	mode;
>  };
>  
>  /**
> @@ -113,6 +127,7 @@ struct mtk_jpeg_q_data {
>   * @cap_q:		destination (capture) queue queue information
>   * @fh:			V4L2 file handle
>   * @state:		state of the context
> + * @ctrl_hdl:		controls handler
>   * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
>   * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
>   * @quantization: enum v4l2_quantization, colorspace quantization
> @@ -124,6 +139,10 @@ struct mtk_jpeg_ctx {
>  	struct mtk_jpeg_q_data		cap_q;
>  	struct v4l2_fh			fh;
>  	enum mtk_jpeg_ctx_state		state;
> +	u8				enable_exif;

bool?

> +	u8				enc_quality;
> +	u8				restart_interval;
> +	struct v4l2_ctrl_handler	ctrl_hdl;
>  
>  	enum v4l2_colorspace colorspace;
>  	enum v4l2_ycbcr_encoding ycbcr_enc;
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> index 1cc37dbfc8e7..ce263db5f30a 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> @@ -3,10 +3,11 @@
>   * Copyright (c) 2016 MediaTek Inc.
>   * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
>   *         Rick Chang <rick.chang@mediatek.com>
> + *         Xia Jiang <xia.jiang@mediatek.com>
>   */
>  
> -#ifndef _MTK_JPEG_HW_H
> -#define _MTK_JPEG_HW_H
> +#ifndef _MTK_JPEG_DEC_HW_H
> +#define _MTK_JPEG_DEC_HW_H
>  
>  #include <media/videobuf2-core.h>
>  
> @@ -75,4 +76,4 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>  void mtk_jpeg_dec_reset(void __iomem *dec_reg_base);
>  void mtk_jpeg_dec_start(void __iomem *dec_reg_base);
>  
> -#endif /* _MTK_JPEG_HW_H */
> +#endif /* _MTK_JPEG_DEC_HW_H */
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> new file mode 100644
> index 000000000000..da3e7a83a80a
> --- /dev/null
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Xia Jiang <xia.jiang@mediatek.com>
> + *
> + */
> +
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <media/videobuf2-core.h>
> +
> +#include "mtk_jpeg_enc_hw.h"
> +
> +static struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {

static const?

> +	{
> +		.quality_param		= 97,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q97,
> +	},
> +	{
> +		.quality_param		= 95,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q95,
> +	},
> +	{
> +		.quality_param		= 92,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q92,
> +	},
> +	{
> +		.quality_param		= 90,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q90,
> +	},
> +	{
> +		.quality_param		= 87,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q87,
> +	},
> +	{
> +		.quality_param		= 84,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q84,
> +	},
> +	{
> +		.quality_param		= 82,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q82,
> +	},
> +	{
> +		.quality_param		= 80,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q80,
> +	},
> +	{
> +		.quality_param		= 74,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q74,
> +	},
> +	{
> +		.quality_param		= 68,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q68,
> +	},
> +	{
> +		.quality_param		= 64,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q64,
> +	},
> +	{
> +		.quality_param		= 60,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q60,
> +	},
> +	{
> +		.quality_param		= 48,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q48,
> +	},
> +	{
> +		.quality_param		= 39,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q39,
> +	},
> +	{
> +		.quality_param		= 34,
> +		.hardware_value	= JPEG_ENC_QUALITY_Q34,
> +	},
> +};

nit: Perhaps we could condense this a bit? E.g.

[...] = {
	{ .quality = XX, .hw = YY }.
	// ...
};

> +
> +#define MTK_JPEG_ENC_NUM_QUALITY ARRAY_SIZE(mtk_jpeg_enc_quality)

I think just using ARRAY_SIZE() directly would make the code clearer (and
it's similar length to the macro).

> +
> +void mtk_jpeg_enc_reset(void __iomem *base)
> +{
> +	writel(0x00, base + JPEG_ENC_RSTB);
> +	writel(JPEG_ENC_RESET_BIT, base + JPEG_ENC_RSTB);
> +	writel(0x00, base + JPEG_ENC_CODEC_SEL);
> +}
> +
> +u32 mtk_jpeg_enc_get_int_status(void __iomem *base)
> +{
> +	u32 ret;
> +
> +	ret = readl(base + JPEG_ENC_INT_STS) &
> +		    JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> +	if (ret)
> +		writel(0, base + JPEG_ENC_INT_STS);
> +
> +	return ret;
> +}

Does it make sense to have a function for what is essentially just 2 lines?
Also, the name is misleading, as the function not only gets but also
clears.

> +
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
> +{
> +	return readl(base + JPEG_ENC_DMA_ADDR0) -
> +	       readl(base + JPEG_ENC_DST_ADDR0);
> +}

This is called once from the interrupt handler, which is hardware-specific
anyway, so one would normally just read the registers directly from there.

> +
> +u32 mtk_jpeg_enc_enum_result(void __iomem *base, u32 irq_status)
> +{
> +	if (irq_status & JPEG_ENC_INT_STATUS_DONE)
> +		return MTK_JPEG_ENC_RESULT_DONE;
> +	else if (irq_status & JPEG_ENC_INT_STATUS_STALL)
> +		return MTK_JPEG_ENC_RESULT_STALL;
> +	else if (irq_status & JPEG_ENC_INT_STATUS_VCODEC_IRQ)
> +		return MTK_JPEG_ENC_RESULT_VCODEC_IRQ;
> +	return MTK_JPEG_ENC_RESULT_ERROR_UNKNOWN;
> +}

I see this function being called only once in the interrupt handler.
Wouldn't it be more readable if the interrupt masks were just checked
directly there?

> +
> +void mtk_jpeg_enc_set_img_size(void __iomem *base, u32 width, u32 height)
> +{
> +	u32 value;
> +
> +	value = JPEG_ENC_WIDTH_HEIGHT(width, height);
> +	writel(value, base + JPEG_ENC_IMG_SIZE);
> +}
> +
> +void mtk_jpeg_enc_set_enc_format(void __iomem *base, u32 enc_format)
> +{
> +	u32 yuv_format, value;
> +
> +	yuv_format = JPEG_ENC_YUV_FORMAT_YUYV;
> +	switch (enc_format) {
> +	case V4L2_PIX_FMT_YUYV:
> +		yuv_format = JPEG_ENC_YUV_FORMAT_YUYV;
> +		break;
> +	case V4L2_PIX_FMT_YVYU:
> +		yuv_format = JPEG_ENC_YUV_FORMAT_YVYU;
> +		break;
> +	case V4L2_PIX_FMT_NV12M:
> +		yuv_format = JPEG_ENC_YUV_FORMAT_NV12;
> +		break;
> +	case V4L2_PIX_FMT_NV21M:
> +		yuv_format = JPEG_ENC_YUV_FORMAT_NV12;

Instead of the explicit switch here, we could just have the hardware format
contained in the mtk_jpeg_fmt struct.

> +		break;
> +	default:
> +		break;
> +	}
> +
> +	value = readl(base + JPEG_ENC_CTRL);
> +	value &= ~JPEG_ENC_CTRL_YUV_FORMAT_MASK;
> +	value |= JPEG_ENC_FORMAT(yuv_format);
> +	writel(value, base + JPEG_ENC_CTRL);
> +}
> +
> +void mtk_jpeg_enc_set_blk_num(void __iomem *base, u32 enc_format, u32 width,
> +			      u32 height)
> +{
> +	u32 blk_num;
> +	u32 is_420;
> +	u32 padding_width;
> +	u32 padding_height;
> +
> +	is_420 = (enc_format == V4L2_PIX_FMT_NV12M ||
> +		  enc_format == V4L2_PIX_FMT_NV21M) ? 1 : 0;
> +	padding_width = round_up(width, 16);
> +	padding_height = round_up(height, is_420 ? 16 : 8);
> +
> +	blk_num = (padding_width >> 4) * (padding_height >> (is_420 ? 4 : 3)) *
> +		  (is_420 ? 6 : 4) - 1;

The whole code above could be rewritten as below:

if (enc_format == V4L2_PIX_FMT_NV12M
    || enc_format == V4L2_PIX_FMT_NV21M)
	blk_num = DIV_ROUND_UP(width, 16) * DIV_ROUND_UP(height, 16) * 6 - 1;
else
	blk_num = DIV_ROUND_UP(width, 16) * DIV_ROUND_UP(height, 8) * 4 - 1;

However the magic numbers deserve some explanation, especially
multiplication by 6 or 4 and subtraction of 1.

> +
> +	writel(blk_num, base + JPEG_ENC_BLK_NUM);
> +}
> +
> +void mtk_jpeg_enc_set_stride(void __iomem *base, u32 enc_format, u32 width,
> +			     u32 height, u32 bytesperline)
> +{
> +	u32 width_even;
> +	u32 is_420;

Perhaps should be bool?

> +	u32 img_stride;
> +	u32 mem_stride;
> +
> +	width_even = round_up(width, 2);
> +	is_420 = (enc_format == V4L2_PIX_FMT_NV12M ||
> +		  enc_format == V4L2_PIX_FMT_NV21M) ? 1 : 0;

No need for the explicit 1 : 0.

> +	if (!is_420)
> +		width_even = width_even << 1;
> +	img_stride = round_up(width_even, (is_420 ? 16 : 32));
> +	mem_stride = is_420 ? bytesperline : round_up(width_even, 32);

Wouldn't it make the code more readable if it was rewritten like below?

if (enc_format == V4L2_PIX_FMT_NV12M
    || enc_format == V4L2_PIX_FMT_NV21M) {
        /* 4:2:0 */
	img_stride = round_up(width, 16);
	mem_stride = bytesperline;
} else {
	/* 4:2:2 */
	img_stride = round_up(width * 2, 32);
	mem_stride = img_stride;
}

> +
> +	writel(img_stride, base + JPEG_ENC_IMG_STRIDE);
> +	writel(mem_stride, base + JPEG_ENC_STRIDE);

Does the hardware assume that Y and CbCr planes have the same strides?

What is the difference between img_stride and mem_stride?

> +}
> +
> +void mtk_jpeg_enc_set_src_addr(void __iomem *base, u32 src_addr,
> +			       u32 src_addr_c)
> +{
> +	writel(src_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
> +	writel(src_addr_c, base + JPEG_ENC_SRC_CHROMA_ADDR);
> +}
> +
> +void mtk_jpeg_enc_set_dst_addr(void __iomem *base, u32 dst_addr,
> +			       u32 stall_size, u32 init_offset,
> +			       u32 offset_mask)
> +{
> +	writel(JPEG_ENC_INIT_OFFSET(init_offset), base + JPEG_ENC_OFFSET_ADDR);
> +	writel(JPEG_ENC_OFFSET_MASK(offset_mask),
> +	       base + JPEG_ENC_BYTE_OFFSET_MASK);
> +	writel(JPEG_ENC_DST_ADDR(dst_addr), base + JPEG_ENC_DST_ADDR0);
> +	writel(JPEG_ENC_STALL_ADDR(dst_addr, stall_size),
> +	       base + JPEG_ENC_STALL_ADDR0);
> +}
> +
> +static void mtk_jpeg_enc_set_quality(void __iomem *base, u32 quality)
> +{
> +	u32 value;
> +	u32 i, enc_quality;
> +
> +	enc_quality = mtk_jpeg_enc_quality[0].hardware_value;

For values less than 34, shouldn't we use the lowest quality, not the
highest?

> +	for (i = 0; i < MTK_JPEG_ENC_NUM_QUALITY; i++) {

Please use ARRAY_SIZE() instead of the macro to make sure there is no
accidental out of bounds access.

> +		if (quality >= mtk_jpeg_enc_quality[i].quality_param) {
> +			enc_quality = mtk_jpeg_enc_quality[i].hardware_value;
> +			break;
> +		}
> +	}
> +
> +	value = readl(base + JPEG_ENC_QUALITY);

Do we need to read the register?

> +	value = JPEG_ENC_SET_QUALITY(value, enc_quality);
> +	writel(value, base + JPEG_ENC_QUALITY);
> +}
> +
> +static void mtk_jpeg_enc_set_restart_interval(void __iomem *base,
> +					      u32 restart_interval)
> +{
> +	u32 value;
> +
> +	value = readl(base + JPEG_ENC_CTRL);
> +	if (restart_interval)
> +		value |= JPEG_ENC_CTRL_RESTART_EN_BIT;
> +	else
> +		value &= ~JPEG_ENC_CTRL_RESTART_EN_BIT;
> +	writel(value, base + JPEG_ENC_CTRL);
> +	writel(restart_interval, base + JPEG_ENC_RST_MCU_NUM);
> +}

Wouldn't it make more sense to just do all the register settings in one
function, with comments? Splitting it like here introduces superfluous
register reads and writes - we could just read JPEG_ENC_CTRL once, update
all the fields in the local variable and write it once if done in one
function.

A typical approach is to have one function that receives the necessary V4L2
context and then extracts necessary parameters directly from there and
programs the registers. That reduces the level of abstraction and makes the
code easier to follow for anyone familiar with V4L2.

> +
> +static void mtk_jpeg_enc_set_encode_mode(void __iomem *base, u32 exif_en)
> +{
> +	u32 value;
> +
> +	value = readl(base + JPEG_ENC_CTRL);
> +	value &= ~JPEG_ENC_CTRL_FILE_FORMAT_BIT;
> +	writel(value, base + JPEG_ENC_CTRL);
> +
> +	if (exif_en) {
> +		value = readl(base + JPEG_ENC_CTRL);

Do we need to read the register second time? Could we just read it once,
take care of both fields and write once?

> +		value |= JPEG_ENC_EN_JFIF_EXIF;
> +		writel(value, base + JPEG_ENC_CTRL);
> +	}
> +}
> +
> +void mtk_jpeg_enc_set_ctrl_cfg(void __iomem *base, u32 exif_en, u32 quality,
> +			       u32 restart_interval)
> +{
> +	mtk_jpeg_enc_set_quality(base, quality);
> +
> +	mtk_jpeg_enc_set_restart_interval(base, restart_interval);
> +
> +	mtk_jpeg_enc_set_encode_mode(base, exif_en);
> +}
> +
> +void mtk_jpeg_enc_start(void __iomem *base)
> +{
> +	u32 value;
> +
> +	value = readl(base + JPEG_ENC_CTRL);
> +	value |= JPEG_ENC_CTRL_INT_EN_BIT | JPEG_ENC_CTRL_ENABLE_BIT;
> +	writel(value, base + JPEG_ENC_CTRL);
> +}
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> new file mode 100644
> index 000000000000..d0d7d218a0c2
> --- /dev/null
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Xia Jiang <xia.jiang@mediatek.com>
> + *
> + */
> +
> +#ifndef _MTK_JPEG_ENC_HW_H
> +#define _MTK_JPEG_ENC_HW_H
> +
> +#include <media/videobuf2-core.h>
> +
> +#include "mtk_jpeg_core.h"
> +#include "mtk_jpeg_enc_reg.h"
> +
> +enum {
> +	MTK_JPEG_ENC_RESULT_DONE		= 0,

nit: No need for explicit value assignment.

> +	MTK_JPEG_ENC_RESULT_STALL,
> +	MTK_JPEG_ENC_RESULT_VCODEC_IRQ,
> +	MTK_JPEG_ENC_RESULT_ERROR_UNKNOWN
> +};
> +
> +/**
> + * struct mtk_jpeg_enc_qlt - JPEG encoder quality data
> + * @quality_param:	quality value
> + * @hardware_value:hardware value of quality
> + */
> +struct mtk_jpeg_enc_qlt {
> +	u8	quality_param;
> +	u8	hardware_value;
> +};
> +
> +/**
> + * struct mt_jpeg_enc_bs - JPEG encoder bitstream  buffer
> + * @dma_addr:			JPEG encoder destination address
> + * @size:			JPEG encoder bistream size
> + * @dma_addr_offset:		JPEG encoder offset address
> + * @dma_addr_offsetmask:	JPEG encoder destination address offset mask
> + */
> +struct mtk_jpeg_enc_bs {
> +	dma_addr_t	dma_addr;
> +	size_t		size;
> +	u32			dma_addr_offset;
> +	u32			dma_addr_offsetmask;

Something seems to be wrong with the indentation here. In general it's
advisable to avoid using tabs between types and field names and just have a
single space, because changing some types or adding new fields could break
the indentation if tabs are used.

> +};
> +
> +/**
> + * struct mtk_jpeg_mem - JPEG memory
> + * @dma_addr:		memory address
> + * @size:		memory size
> + */
> +struct mtk_jpeg_mem {
> +	dma_addr_t	dma_addr;
> +	size_t		size;
> +};

Do we need this intermediate struct? Perhaps we could just get these
directly from vb2?

> +
> +/**
> + * struct mtk_jpeg_enc_fb - JPEG encoder frame buffer
> + * @fb_addr:		frmae buffer memory information
> + * @num_planes:		number of planes
> + */
> +struct mtk_jpeg_enc_fb {
> +	struct mtk_jpeg_mem	fb_addr[MTK_JPEG_COMP_MAX];

Since it's just a small struct, I'd just suggest using VIDEO_MAX_PLANES.

> +	u32			num_planes;
> +};

Or actually just dropping this struct at all. We should be able to just
directly get these parameters from vb2 whenever needed.

> +
> +void mtk_jpeg_enc_reset(void __iomem *base);
> +u32 mtk_jpeg_enc_get_int_status(void __iomem *base);
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base);
> +u32 mtk_jpeg_enc_enum_result(void __iomem *base, u32 irq_status);
> +void mtk_jpeg_enc_set_img_size(void __iomem *base, u32 width, u32 height);
> +void mtk_jpeg_enc_set_enc_format(void __iomem *base, u32 enc_format);
> +void mtk_jpeg_enc_set_blk_num(void __iomem *base, u32 enc_format, u32 width,
> +			      u32 height);
> +void mtk_jpeg_enc_set_stride(void __iomem *base, u32 enc_format, u32 width,
> +			     u32 height, u32 bytesperline);
> +void mtk_jpeg_enc_set_src_addr(void __iomem *base, u32 src_addr,
> +			       u32 src_addr_c);
> +void mtk_jpeg_enc_set_dst_addr(void __iomem *base, u32 dst_addr,
> +			       u32 stall_size, u32 init_offset,
> +			       u32 offset_mask);
> +void mtk_jpeg_enc_set_ctrl_cfg(void __iomem *base, u32 exif_en, u32 quality,
> +			       u32 restart_interval);
> +void mtk_jpeg_enc_start(void __iomem *enc_reg_base);
> +
> +#endif /* _MTK_JPEG_ENC_HW_H */
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> new file mode 100644
> index 000000000000..cec3631addc5
> --- /dev/null
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Xia Jiang <xia.jiang@mediatek.com>
> + *
> + */
> +#ifndef _MTK_JPEG_ENC_REG_H
> +#define _MTK_JPEG_ENC_REG_H
> +
> +#define JPEG_ENC_INT_STATUS_DONE			BIT(0)
> +#define JPEG_ENC_INT_STATUS_STALL			BIT(1)
> +#define JPEG_ENC_INT_STATUS_VCODEC_IRQ		BIT(4)
> +#define JPEG_ENC_INT_STATUS_MASK_ALLIRQ		0x13
> +
> +#define JPEG_ENC_DST_ADDR_OFFSET_MASK GENMASK(3, 0)
> +
> +#define JPEG_ENC_CTRL_YUV_FORMAT_MASK 0x18
> +#define JPEG_ENC_CTRL_RESTART_EN_BIT            BIT(10)
> +#define JPEG_ENC_CTRL_FILE_FORMAT_BIT           BIT(5)
> +#define JPEG_ENC_EN_JFIF_EXIF                   BIT(5)
> +#define JPEG_ENC_CTRL_INT_EN_BIT                BIT(2)
> +#define JPEG_ENC_CTRL_ENABLE_BIT                BIT(0)
> +#define JPEG_ENC_RESET_BIT                      BIT(0)
> +
> +#define JPEG_ENC_YUV_FORMAT_YUYV 0
> +#define JPEG_ENC_YUV_FORMAT_YVYU 1
> +#define JPEG_ENC_YUV_FORMAT_NV12 2
> +#define JEPG_ENC_YUV_FORMAT_NV21 3
> +
> +#define JPEG_ENC_QUALITY_Q60 0x0
> +#define JPEG_ENC_QUALITY_Q80 0x1
> +#define JPEG_ENC_QUALITY_Q90 0x2
> +#define JPEG_ENC_QUALITY_Q95 0x3
> +#define JPEG_ENC_QUALITY_Q39 0x4
> +#define JPEG_ENC_QUALITY_Q68 0x5
> +#define JPEG_ENC_QUALITY_Q84 0x6
> +#define JPEG_ENC_QUALITY_Q92 0x7
> +#define JPEG_ENC_QUALITY_Q48 0x8
> +#define JPEG_ENC_QUALITY_Q74 0xa
> +#define JPEG_ENC_QUALITY_Q87 0xb
> +#define JPEG_ENC_QUALITY_Q34 0xc
> +#define JPEG_ENC_QUALITY_Q64 0xe
> +#define JPEG_ENC_QUALITY_Q82 0xf
> +#define JPEG_ENC_QUALITY_Q97 0x10
> +
> +#define JPEG_ENC_RSTB				0x100
> +#define JPEG_ENC_CTRL				0x104
> +#define JPEG_ENC_QUALITY			0x108
> +#define JPEG_ENC_BLK_NUM			0x10C
> +#define JPEG_ENC_BLK_CNT			0x110
> +#define JPEG_ENC_INT_STS			0x11c
> +#define JPEG_ENC_DST_ADDR0			0x120
> +#define JPEG_ENC_DMA_ADDR0			0x124
> +#define JPEG_ENC_STALL_ADDR0		0x128
> +#define JPEG_ENC_OFFSET_ADDR		0x138
> +#define JPEG_ENC_RST_MCU_NUM		0x150
> +#define JPEG_ENC_IMG_SIZE			0x154
> +#define JPEG_ENC_DEBUG_INFO0		0x160
> +#define JPEG_ENC_DEBUG_INFO1		0x164
> +#define JPEG_ENC_TOTAL_CYCLE		0x168
> +#define JPEG_ENC_BYTE_OFFSET_MASK	0x16c
> +#define JPEG_ENC_SRC_LUMA_ADDR		0x170
> +#define JPEG_ENC_SRC_CHROMA_ADDR	0x174
> +#define JPEG_ENC_STRIDE				0x178
> +#define JPEG_ENC_IMG_STRIDE			0x17c
> +#define JPEG_ENC_DCM_CTRL			0x300
> +#define JPEG_ENC_CODEC_SEL			0x314
> +#define JPEG_ENC_ULTRA_THRES		0x318

nit: Please make sure all the macro values are aligned nicely, using tabs. 

> +
> +#define JPEG_ENC_FORMAT(x)		(((x) & 3) << 3)
> +#define JPEG_ENC_WIDTH_HEIGHT(w, h)	(((w) << 16) | (h))
> +#define JPEG_ENC_INIT_OFFSET(x)		((x) & (~0xf))
> +#define JPEG_ENC_OFFSET_MASK(x)		((x) & 0xf)
> +#define JPEG_ENC_DST_ADDR(x)		((x) & (~0xf))
> +#define JPEG_ENC_STALL_ADDR(x, y)		(((x) + (y)) & (~0xf))

For the offset and address calculation, please just open code in the
function that writes the registers, as they're not specific hardware
register layouts, but just simple calculations.

> +#define JPEG_ENC_SET_QUALITY(x, y)	(((x) & 0xffff0000) | (y))

That's an unusual pattern. Normally macros just generate the values for the
target bitfield. It's responsibility of the caller to OR it with the
rest of the register. That way it's clear what the code does from reading
it.

Best regards,
Tomasz

