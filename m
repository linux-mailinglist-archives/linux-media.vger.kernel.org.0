Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FAC1F6D93
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 20:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgFKSqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 14:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgFKSqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 14:46:45 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DFFC08C5C3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 11:46:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j10so7222208wrw.8
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kId5WHOOyajpKS2gdMHVkK4eDVViFzUKEwCw7ZXXrgs=;
        b=I8HSzHpppGnzQEEgV4WDS3/Y/3/BqXpNJC0p6po8PlDS8598pqi3sIX5fYFmPunx3f
         AxHZ4TdWdsixFflnMg9n6bomyDFpOp+weQqbNUfmosqA72JWSRJBEpRknWJytNHg2YzI
         wkGtrD9CJjkO+L4OYAxWCRnq5mBHRuFOB0Prc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kId5WHOOyajpKS2gdMHVkK4eDVViFzUKEwCw7ZXXrgs=;
        b=UGwVPttyYOtmsOuZE8eAaKiOjgxj05qb5Aj05zciABnCtaYujIZMM+YY3EOaPskw4F
         JhxurTQc6uYGnKuRjbilGN9dDcJcI5NsDrf8OQuXueoh+id7Ohoifc5s6/JPyGYX898K
         4lRag+t7SNyJ9pXZKxcKiAUXfu/oHsYpTb8QUZsjrCkMuGTBX4dy4CV8U9XwcTYJPUi0
         VEzlH318EKB68wUaQZt6wlNVoM6AEtJog6YtE57Z+TDBhWCPG16inyRhVZZHjejIVlPU
         gzBePMR+2QiLl9C/udKcgY7U5Mrus7keIC25vT2ST9aSAb8NTbTIHC6gWkNduX8GbMGX
         SPvA==
X-Gm-Message-State: AOAM532ErpVKSEReblb6YTM9qnUU5eeyZbL3v1kPrSF9Lj2moOoV9DNE
        SnH+TDdxOM7BF8nkFav93TnGAQ==
X-Google-Smtp-Source: ABdhPJzq2Z4/wfqSM1Vi8RdIuKsojoIeUeRVtVQ8JJpuupMWm80lA9DoaLvvtitZ3IRwIawC4+H4qg==
X-Received: by 2002:a5d:4385:: with SMTP id i5mr10641852wrq.420.1591901202824;
        Thu, 11 Jun 2020 11:46:42 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id e15sm5430890wme.9.2020.06.11.11.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 11:46:41 -0700 (PDT)
Date:   Thu, 11 Jun 2020 18:46:40 +0000
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
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH RESEND v9 18/18] media: platform: Add jpeg enc feature
Message-ID: <20200611184640.GC8694@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-20-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-20-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:53PM +0800, Xia Jiang wrote:
> Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> decode and encode have great similarities with function operation.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: add member variable(struct v4l2_rect) in out_q structure for storing
>     the active crop information.
>     move the renaming exsting functions/defines/variables to a separate patch.
> ---
>  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 845 +++++++++++++++---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  44 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 193 ++++
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h | 123 +++
>  5 files changed, 1084 insertions(+), 126 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> 

Thank you for the patch. Please see my comments inline.

[snip]
> +static int mtk_jpeg_enc_querycap(struct file *file, void *priv,
> +				 struct v4l2_capability *cap)
> +{
> +	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
> +
> +	strscpy(cap->driver, MTK_JPEG_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, MTK_JPEG_NAME " encoder", sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +		 dev_name(jpeg->dev));
> +
> +	return 0;
> +}

I can see that this function differs from mtk_jpeg_dec_querycap() only with
the " encoder" string. Perhaps they could be merged?

> +
>  static int mtk_jpeg_dec_querycap(struct file *file, void *priv,
>  				 struct v4l2_capability *cap)
>  {
> @@ -88,6 +157,54 @@ static int mtk_jpeg_dec_querycap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static int vidioc_jpeg_enc_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct mtk_jpeg_ctx *ctx = ctrl_to_ctx(ctrl);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_JPEG_RESTART_INTERVAL:
> +		ctx->restart_interval = ctrl->val;
> +		break;
> +	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
> +		ctx->enc_quality = ctrl->val;
> +		break;
> +	case V4L2_CID_JPEG_ACTIVE_MARKER:
> +		ctx->enable_exif = ctrl->val & V4L2_JPEG_ACTIVE_MARKER_APP1 ?
> +				   true : false;

nit: If ctx->enable_exif is of the bool type, the ternary operator could be
removed, because any non-zero value is implicitly turned into 1, as per [1].

[1] https://www.kernel.org/doc/html/v5.6/process/coding-style.html#using-bool

[snip]
> +static int mtk_jpeg_enc_enum_fmt_vid_cap(struct file *file, void *priv,
> +					 struct v4l2_fmtdesc *f)
> +{
> +	return mtk_jpeg_enum_fmt(mtk_jpeg_enc_formats,
> +				 MTK_JPEG_ENC_NUM_FORMATS, f,
> +				 MTK_JPEG_FMT_FLAG_ENC_CAPTURE);
> +}
> +
>  static int mtk_jpeg_dec_enum_fmt_vid_cap(struct file *file, void *priv,
>  					 struct v4l2_fmtdesc *f)
>  {
> @@ -117,6 +242,14 @@ static int mtk_jpeg_dec_enum_fmt_vid_cap(struct file *file, void *priv,
>  				 MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
>  }
>  
> +static int mtk_jpeg_enc_enum_fmt_vid_out(struct file *file, void *priv,
> +					 struct v4l2_fmtdesc *f)
> +{
> +	return mtk_jpeg_enum_fmt(mtk_jpeg_enc_formats,
> +				 MTK_JPEG_ENC_NUM_FORMATS, f,
> +				 MTK_JPEG_FMT_FLAG_ENC_OUTPUT);

Do we need separate implementations of these? "formats" and "num_formats"
could be specified by the match data struct and used in a generic function.

Also, do we need separate flags for ENC_OUTPUT/CAPTURE and
DEC_OUTPUT/CAPTURE?

> +}
> +
>  static int mtk_jpeg_dec_enum_fmt_vid_out(struct file *file, void *priv,
>  					 struct v4l2_fmtdesc *f)
>  {
> @@ -132,93 +265,66 @@ mtk_jpeg_get_q_data(struct mtk_jpeg_ctx *ctx, enum v4l2_buf_type type)
>  	return &ctx->cap_q;
>  }
>  
> -static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
> -						 u32 pixelformat,
> +static struct mtk_jpeg_fmt *mtk_jpeg_find_format(u32 pixelformat,
>  						 unsigned int fmt_type)
>  {
> -	unsigned int k, fmt_flag;
> +	unsigned int k;
> +	struct mtk_jpeg_fmt *fmt;
>  
> -	fmt_flag = (fmt_type == MTK_JPEG_FMT_TYPE_OUTPUT) ?
> -		   MTK_JPEG_FMT_FLAG_DEC_OUTPUT :
> -		   MTK_JPEG_FMT_FLAG_DEC_CAPTURE;
> +	for (k = 0; k < MTK_JPEG_ENC_NUM_FORMATS; k++) {
> +		fmt = &mtk_jpeg_enc_formats[k];
> +
> +		if (fmt->fourcc == pixelformat && fmt->flags & fmt_type)
> +			return fmt;
> +	}
>  
>  	for (k = 0; k < MTK_JPEG_DEC_NUM_FORMATS; k++) {
> -		struct mtk_jpeg_fmt *fmt = &mtk_jpeg_dec_formats[k];
> +		fmt = &mtk_jpeg_dec_formats[k];
>  
> -		if (fmt->fourcc == pixelformat && fmt->flags & fmt_flag)
> +		if (fmt->fourcc == pixelformat && fmt->flags & fmt_type)
>  			return fmt;
>  	}

We should only need to iterate through one of the arrays. My suggestion
above about making "formats" and "num_formats" a member of the match data
should take care of this one too.

>  
>  	return NULL;
>  }
>  
> -static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
> -				       struct v4l2_format *f)
> -{
> -	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> -	struct mtk_jpeg_q_data *q_data;
> -	int i;
> -
> -	q_data = mtk_jpeg_get_q_data(ctx, f->type);
> -
> -	pix_mp->width = q_data->w;
> -	pix_mp->height = q_data->h;
> -	pix_mp->pixelformat = q_data->fmt->fourcc;
> -	pix_mp->num_planes = q_data->fmt->colplanes;
> -
> -	for (i = 0; i < pix_mp->num_planes; i++) {
> -		pix_mp->plane_fmt[i].bytesperline = q_data->bytesperline[i];
> -		pix_mp->plane_fmt[i].sizeimage = q_data->sizeimage[i];
> -	}
> -}
> -
> -static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
> -				   struct mtk_jpeg_fmt *fmt,
> -				   struct mtk_jpeg_ctx *ctx, int q_type)
> +static int vidioc_try_fmt(struct v4l2_format *f, struct mtk_jpeg_fmt *fmt)

The name is a bit misleading, because it's suggesting that it's the
vidioc_try_fmt callback, but it's just an internal helper. I think the
original name was fine.

>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	int i;
>  
>  	pix_mp->field = V4L2_FIELD_NONE;
> -
> -	if (ctx->state != MTK_JPEG_INIT) {
> -		mtk_jpeg_adjust_fmt_mplane(ctx, f);
> -		return 0;
> -	}

Is it okay to remove this? My understanding is that it prevented changing
the format while streaming, which should is as expected.

> -
>  	pix_mp->num_planes = fmt->colplanes;
>  	pix_mp->pixelformat = fmt->fourcc;
>  
> -	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
> -		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[0];
> -
> +	if (fmt->fourcc == V4L2_PIX_FMT_JPEG) {
>  		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
>  				       MTK_JPEG_MAX_HEIGHT);
>  		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
>  				      MTK_JPEG_MAX_WIDTH);
> -
> -		pfmt->bytesperline = 0;
> -		/* Source size must be aligned to 128 */
> -		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
> -		if (pfmt->sizeimage == 0)
> -			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
> -		return 0;
> +		pix_mp->plane_fmt[0].bytesperline = 0;
> +		pix_mp->plane_fmt[0].sizeimage =
> +				round_up(pix_mp->plane_fmt[0].sizeimage, 128);
> +		if (pix_mp->plane_fmt[0].sizeimage == 0)
> +			pix_mp->plane_fmt[0].sizeimage =
> +				MTK_JPEG_DEFAULT_SIZEIMAGE;
> +	} else {
> +		pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
> +				       MTK_JPEG_MIN_HEIGHT,
> +				       MTK_JPEG_MAX_HEIGHT);
> +		pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
> +				      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
> +		for (i = 0; i < pix_mp->num_planes; i++) {
> +			struct v4l2_plane_pix_format *pfmt =
> +							&pix_mp->plane_fmt[i];
> +			u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
> +			u32 h = pix_mp->height * fmt->v_sample[i] / 4;
> +
> +			pfmt->bytesperline = stride;
> +			pfmt->sizeimage = stride * h;
> +		}
>  	}
>  
> -	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> -	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
> -			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
> -	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
> -			      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
> -
> -	for (i = 0; i < fmt->colplanes; i++) {
> -		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[i];
> -		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
> -		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
> -
> -		pfmt->bytesperline = stride;
> -		pfmt->sizeimage = stride * h;
> -	}
>  	return 0;

Are all the changes above needed for the encoder? If I'm looking correctly,
they're mostly refactoring and should be done in a separate patch. However,
I don't see any big issue with the existing coding style in this function,
so perhaps the refactoring could be avoided.

>  }
>  
> @@ -271,14 +377,35 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static int mtk_jpeg_enc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
> +					       struct v4l2_format *f)
> +{
> +	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +	struct mtk_jpeg_fmt *fmt;
> +
> +	fmt = mtk_jpeg_find_format(f->fmt.pix_mp.pixelformat,
> +				   MTK_JPEG_FMT_FLAG_ENC_CAPTURE);
> +	if (!fmt)
> +		fmt = ctx->cap_q.fmt;
> +
> +	v4l2_dbg(2, debug, &ctx->jpeg->v4l2_dev, "(%d) try_fmt:%c%c%c%c\n",
> +		 f->type,
> +		 (fmt->fourcc & 0xff),
> +		 (fmt->fourcc >>  8 & 0xff),
> +		 (fmt->fourcc >> 16 & 0xff),
> +		 (fmt->fourcc >> 24 & 0xff));
> +
> +	return vidioc_try_fmt(f, fmt);
> +}

Is there really anything encoder-specific in this function? Could the same
function as the decoder be used instead?

> +
>  static int mtk_jpeg_dec_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  					       struct v4l2_format *f)
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
>  	struct mtk_jpeg_fmt *fmt;
>  
> -	fmt = mtk_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat,
> -				   MTK_JPEG_FMT_TYPE_CAPTURE);
> +	fmt = mtk_jpeg_find_format(f->fmt.pix_mp.pixelformat,
> +				   MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
>  	if (!fmt)
>  		fmt = ctx->cap_q.fmt;
>  
> @@ -289,7 +416,33 @@ static int mtk_jpeg_dec_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  		 (fmt->fourcc >> 16 & 0xff),
>  		 (fmt->fourcc >> 24 & 0xff));
>  
> -	return mtk_jpeg_try_fmt_mplane(f, fmt, ctx, MTK_JPEG_FMT_TYPE_CAPTURE);
> +	if (ctx->state != MTK_JPEG_INIT) {
> +		mtk_jpeg_g_fmt_vid_mplane(file, priv, f);
> +		return 0;
> +	}

Is this really limited to the decoder? In general currently we don't
support changing the resolution from the userspace when streaming is
started and it applies to both encoder and decoder.

> +
> +	return vidioc_try_fmt(f, fmt);
> +}
> +
> +static int mtk_jpeg_enc_try_fmt_vid_out_mplane(struct file *file, void *priv,
> +					       struct v4l2_format *f)
> +{
> +	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +	struct mtk_jpeg_fmt *fmt;
> +
> +	fmt = mtk_jpeg_find_format(f->fmt.pix_mp.pixelformat,
> +				   MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> +	if (!fmt)
> +		fmt = ctx->out_q.fmt;
> +
> +	v4l2_dbg(2, debug, &ctx->jpeg->v4l2_dev, "(%d) try_fmt:%c%c%c%c\n",
> +		 f->type,
> +		 (fmt->fourcc & 0xff),
> +		 (fmt->fourcc >>  8 & 0xff),
> +		 (fmt->fourcc >> 16 & 0xff),
> +		 (fmt->fourcc >> 24 & 0xff));
> +
> +	return vidioc_try_fmt(f, fmt);
>  }

Ditto.

>  
>  static int mtk_jpeg_dec_try_fmt_vid_out_mplane(struct file *file, void *priv,
> @@ -298,8 +451,8 @@ static int mtk_jpeg_dec_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
>  	struct mtk_jpeg_fmt *fmt;
>  
> -	fmt = mtk_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat,
> -				   MTK_JPEG_FMT_TYPE_OUTPUT);
> +	fmt = mtk_jpeg_find_format(f->fmt.pix_mp.pixelformat,
> +				   MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
>  	if (!fmt)
>  		fmt = ctx->out_q.fmt;
>  
> @@ -310,17 +463,21 @@ static int mtk_jpeg_dec_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  		 (fmt->fourcc >> 16 & 0xff),
>  		 (fmt->fourcc >> 24 & 0xff));
>  
> -	return mtk_jpeg_try_fmt_mplane(f, fmt, ctx, MTK_JPEG_FMT_TYPE_OUTPUT);
> +	if (ctx->state != MTK_JPEG_INIT) {
> +		mtk_jpeg_g_fmt_vid_mplane(file, priv, f);
> +		return 0;
> +	}

Ditto.

> +
> +	return vidioc_try_fmt(f, fmt);
>  }
>  
>  static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
> -				 struct v4l2_format *f)
> +				 struct v4l2_format *f, unsigned int fmt_type)
>  {
>  	struct vb2_queue *vq;
>  	struct mtk_jpeg_q_data *q_data = NULL;
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> -	unsigned int f_type;
>  	int i;
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> @@ -334,12 +491,11 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
>  		return -EBUSY;
>  	}
>  
> -	f_type = V4L2_TYPE_IS_OUTPUT(f->type) ?
> -			 MTK_JPEG_FMT_TYPE_OUTPUT : MTK_JPEG_FMT_TYPE_CAPTURE;
> -
> -	q_data->fmt = mtk_jpeg_find_format(ctx, pix_mp->pixelformat, f_type);
> +	q_data->fmt = mtk_jpeg_find_format(pix_mp->pixelformat, fmt_type);
>  	q_data->w = pix_mp->width;
>  	q_data->h = pix_mp->height;
> +	q_data->crop_rect.width = pix_mp->width;
> +	q_data->crop_rect.height = pix_mp->height;
>  	ctx->colorspace = pix_mp->colorspace;
>  	ctx->ycbcr_enc = pix_mp->ycbcr_enc;
>  	ctx->xfer_func = pix_mp->xfer_func;
> @@ -365,6 +521,19 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
>  	return 0;
>  }
>  
> +static int mtk_jpeg_enc_s_fmt_vid_out_mplane(struct file *file, void *priv,
> +					     struct v4l2_format *f)
> +{
> +	int ret;
> +
> +	ret = mtk_jpeg_enc_try_fmt_vid_out_mplane(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
> +				     MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> +}
> +
>  static int mtk_jpeg_dec_s_fmt_vid_out_mplane(struct file *file, void *priv,
>  					     struct v4l2_format *f)
>  {
> @@ -374,7 +543,21 @@ static int mtk_jpeg_dec_s_fmt_vid_out_mplane(struct file *file, void *priv,
>  	if (ret)
>  		return ret;
>  
> -	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f);
> +	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
> +				     MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
> +}
> +
> +static int mtk_jpeg_enc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
> +					     struct v4l2_format *f)
> +{
> +	int ret;
> +
> +	ret = mtk_jpeg_enc_try_fmt_vid_cap_mplane(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
> +				     MTK_JPEG_FMT_FLAG_ENC_CAPTURE);
>  }
>  
>  static int mtk_jpeg_dec_s_fmt_vid_cap_mplane(struct file *file, void *priv,
> @@ -386,7 +569,8 @@ static int mtk_jpeg_dec_s_fmt_vid_cap_mplane(struct file *file, void *priv,
>  	if (ret)
>  		return ret;
>  
> -	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f);
> +	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
> +				     MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
>  }

Is it really necessary to have separate variants of the above functions for
decoder and encoder?

>  
>  static void mtk_jpeg_queue_src_chg_event(struct mtk_jpeg_ctx *ctx)
> @@ -411,6 +595,29 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
>  	return v4l2_ctrl_subscribe_event(fh, sub);
>  }
>  
> +static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
> +				    struct v4l2_selection *s)
> +{
> +	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		return -EINVAL;
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_CROP:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		s->r.width = ctx->out_q.w;
> +		s->r.height = ctx->out_q.h;
> +		s->r.left = 0;
> +		s->r.top = 0;

Is this really correct? The function seems to be returning the full frame
size regardless of the selection target. For BOUNDS and DEFAULTS this would
be the correct behavior indeed, but CROP should return the active crop
rectangle, as set by S_SELECTION.

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
>  static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
>  				    struct v4l2_selection *s)
>  {
> @@ -440,6 +647,29 @@ static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
> +				    struct v4l2_selection *s)
> +{
> +	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		return -EINVAL;
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		s->r.left = 0;
> +		s->r.top = 0;
> +		s->r.width = min(s->r.width, ctx->out_q.w);
> +		s->r.height = min(s->r.height, ctx->out_q.h);
> +		ctx->out_q.crop_rect = s->r;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int mtk_jpeg_dec_s_selection(struct file *file, void *priv,
>  				    struct v4l2_selection *s)
>  {
> @@ -484,6 +714,33 @@ static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
>  	return v4l2_m2m_qbuf(file, fh->m2m_ctx, buf);
>  }
>  
> +static const struct v4l2_ioctl_ops mtk_jpeg_enc_ioctl_ops = {
> +	.vidioc_querycap                = mtk_jpeg_enc_querycap,
> +	.vidioc_enum_fmt_vid_cap	= mtk_jpeg_enc_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_out	= mtk_jpeg_enc_enum_fmt_vid_out,
> +	.vidioc_try_fmt_vid_cap_mplane	= mtk_jpeg_enc_try_fmt_vid_cap_mplane,
> +	.vidioc_try_fmt_vid_out_mplane	= mtk_jpeg_enc_try_fmt_vid_out_mplane,
> +	.vidioc_g_fmt_vid_cap_mplane    = mtk_jpeg_g_fmt_vid_mplane,
> +	.vidioc_g_fmt_vid_out_mplane    = mtk_jpeg_g_fmt_vid_mplane,
> +	.vidioc_s_fmt_vid_cap_mplane    = mtk_jpeg_enc_s_fmt_vid_cap_mplane,
> +	.vidioc_s_fmt_vid_out_mplane    = mtk_jpeg_enc_s_fmt_vid_out_mplane,
> +	.vidioc_qbuf                    = mtk_jpeg_qbuf,

Not directly a comment for this patch, but since the previous patch removed
the LAST_FRAME handling, wouldn't it be enough to just use v4l2_m2m_qbuf()
as this callback?

[snip]
> +static void mtk_jpeg_enc_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +
> +	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "(%d) buf_q id=%d, vb=%p\n",
> +		 vb->vb2_queue->type, vb->index, vb);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, to_vb2_v4l2_buffer(vb));
> +}
> +
>  static void mtk_jpeg_dec_buf_queue(struct vb2_buffer *vb)
>  {
>  	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> @@ -664,6 +932,15 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
>  		return v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  }
>  
> +static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
> +{
> +	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> +	struct vb2_v4l2_buffer *vb;
> +
> +	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> +}
> +
>  static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
>  {
>  	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
> @@ -699,6 +976,15 @@ static const struct vb2_ops mtk_jpeg_dec_qops = {
>  	.stop_streaming     = mtk_jpeg_dec_stop_streaming,
>  };
>  
> +static const struct vb2_ops mtk_jpeg_enc_qops = {
> +	.queue_setup        = mtk_jpeg_queue_setup,
> +	.buf_prepare        = mtk_jpeg_buf_prepare,
> +	.buf_queue          = mtk_jpeg_enc_buf_queue,
> +	.wait_prepare       = vb2_ops_wait_prepare,
> +	.wait_finish        = vb2_ops_wait_finish,
> +	.stop_streaming     = mtk_jpeg_enc_stop_streaming,
> +};
> +
>  static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
>  				 struct vb2_buffer *src_buf,
>  				 struct mtk_jpeg_bs *bs)
> @@ -736,6 +1022,85 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
>  	return 0;
>  }
>  
> +static void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
> +				 struct vb2_buffer *dst_buf,
> +				 struct mtk_jpeg_enc_bs *bs)
> +{
> +	bs->dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +	bs->dma_addr_offset = ctx->enable_exif ? MTK_JPEG_MAX_EXIF_SIZE : 0;
> +	bs->dma_addr_offsetmask = bs->dma_addr & JPEG_ENC_DST_ADDR_OFFSET_MASK;
> +	bs->size = vb2_plane_size(dst_buf, 0);

We're computing these values and then writing to the hardware straightaway.
Do we need to save these values to the bs struct? If no, do we need the bs
struct at all?

> +
> +	mtk_jpeg_enc_set_dst_addr(base, bs->dma_addr, bs->size,
> +				  bs->dma_addr_offset,
> +				  bs->dma_addr_offsetmask);
> +}
> +
> +static void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx, void __iomem *base,
> +				 struct vb2_buffer *src_buf)
> +{
> +	int i;
> +	dma_addr_t	dma_addr;

nit: Only one space should be between variable type and name.

> +
> +	mtk_jpeg_enc_set_img_size(base, ctx->out_q.crop_rect.width,
> +				  ctx->out_q.crop_rect.height);
> +	mtk_jpeg_enc_set_blk_num(base, ctx->out_q.fmt->fourcc,
> +				 ctx->out_q.crop_rect.width,
> +				 ctx->out_q.crop_rect.height);
> +	mtk_jpeg_enc_set_stride(base, ctx->out_q.fmt->fourcc, ctx->out_q.w,
> +				ctx->out_q.h, ctx->out_q.bytesperline[0]);
> +
> +	for (i = 0; i < src_buf->num_planes; i++) {
> +		dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, i) +
> +			   src_buf->planes[i].data_offset;
> +		mtk_jpeg_enc_set_src_addr(base, dma_addr, i);
> +	}
> +}
> +
> +static void mtk_jpeg_enc_device_run(void *priv)
> +{
> +	struct mtk_jpeg_ctx *ctx = priv;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> +	unsigned long flags;
> +	struct mtk_jpeg_src_buf *jpeg_src_buf;
> +	struct mtk_jpeg_enc_bs enc_bs;
> +	int ret;
> +
> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> +
> +	ret = pm_runtime_get_sync(jpeg->dev);
> +	if (ret < 0)
> +		goto enc_end;
> +
> +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> +
> +	/*
> +	 * Resetting the hardware every frame is to ensure that all the
> +	 * registers are cleared. This is a hardware requirement.
> +	 */
> +	mtk_jpeg_enc_reset(jpeg->reg_base);
> +
> +	mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf, &enc_bs);
> +	mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
> +	mtk_jpeg_enc_set_config(jpeg->reg_base, ctx->out_q.fmt->hw_format,
> +				ctx->enable_exif, ctx->enc_quality,
> +				ctx->restart_interval);
> +	mtk_jpeg_enc_start(jpeg->reg_base);

Could we just move the above 5 functions into one function inside
mtk_jpeg_enc_hw.c that takes mtk_jpeg_dev pointer as its argument, let's
say mtk_jpeg_enc_hw_run() and simply program all the data to the registers
directly, without the extra level of abstractions?

> +	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
> +	return;
> +
> +enc_end:
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +	v4l2_m2m_buf_done(dst_buf, buf_state);
> +	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +}
> +
>  static void mtk_jpeg_dec_device_run(void *priv)
>  {
>  	struct mtk_jpeg_ctx *ctx = priv;
> @@ -785,6 +1150,11 @@ static void mtk_jpeg_dec_device_run(void *priv)
>  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  }
>  
> +static int mtk_jpeg_enc_job_ready(void *priv)
> +{
> +		return 1;
> +}
> +

The callback is optional, so can be just removed if it always returns 1.

>  static int mtk_jpeg_dec_job_ready(void *priv)
>  {
>  	struct mtk_jpeg_ctx *ctx = priv;
> @@ -792,6 +1162,11 @@ static int mtk_jpeg_dec_job_ready(void *priv)
>  	return (ctx->state == MTK_JPEG_RUNNING) ? 1 : 0;
>  }
>  
> +static const struct v4l2_m2m_ops mtk_jpeg_enc_m2m_ops = {
> +	.device_run = mtk_jpeg_enc_device_run,
> +	.job_ready  = mtk_jpeg_enc_job_ready,
> +};
> +
>  static const struct v4l2_m2m_ops mtk_jpeg_dec_m2m_ops = {
>  	.device_run = mtk_jpeg_dec_device_run,
>  	.job_ready  = mtk_jpeg_dec_job_ready,
> @@ -830,24 +1205,109 @@ static int mtk_jpeg_dec_queue_init(void *priv, struct vb2_queue *src_vq,
>  	return ret;
>  }
>  
> -static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
> +static int mtk_jpeg_enc_queue_init(void *priv, struct vb2_queue *src_vq,
> +				   struct vb2_queue *dst_vq)
>  {
> +	struct mtk_jpeg_ctx *ctx = priv;
>  	int ret;
>  
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes = VB2_DMABUF | VB2_MMAP;
> +	src_vq->drv_priv = ctx;
> +	src_vq->buf_struct_size = sizeof(struct mtk_jpeg_src_buf);
> +	src_vq->ops = &mtk_jpeg_enc_qops;
> +	src_vq->mem_ops = &vb2_dma_contig_memops;
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->jpeg->lock;
> +	src_vq->dev = ctx->jpeg->dev;
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->ops = &mtk_jpeg_enc_qops;
> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->jpeg->lock;
> +	dst_vq->dev = ctx->jpeg->dev;
> +	ret = vb2_queue_init(dst_vq);
> +
> +	return ret;
> +}

This only differs in "ops" from the decoder implementation. Perhaps
both functions could be merged?

> +
> +static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
> +{
> +	int ret, i;
> +
>  	ret = mtk_smi_larb_get(jpeg->larb);
>  	if (ret)
>  		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> -	clk_prepare_enable(jpeg->clk_jdec_smi);
> -	clk_prepare_enable(jpeg->clk_jdec);
> +
> +	for (i = 0; i < jpeg->variant->num_clocks; i++) {
> +		ret = clk_prepare_enable(jpeg->clocks[i]);

Instead of an open coded loop, could the clk_bulk_*() helpers be used
instead? (Look for devm_clk_bulk_get() and devm_clk_bulk_prepare_enable().)

> +		if (ret) {
> +			while (--i >= 0)
> +				clk_disable_unprepare(jpeg->clocks[i]);

nit: The typical convention is to do error handling in an error path on the
bottom of the function.

Also, it would be nice to print an error message.

> +		}
> +	}
>  }
>  
>  static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>  {
> -	clk_disable_unprepare(jpeg->clk_jdec);
> -	clk_disable_unprepare(jpeg->clk_jdec_smi);
> +	int i;
> +
> +	for (i = jpeg->variant->num_clocks - 1; i >= 0; i--)
> +		clk_disable_unprepare(jpeg->clocks[i]);

Ditto.

>  	mtk_smi_larb_put(jpeg->larb);
>  }
>  
> +static irqreturn_t mtk_jpeg_enc_irq(int irq, void *priv)
> +{
> +	struct mtk_jpeg_dev *jpeg = priv;
> +	struct mtk_jpeg_ctx *ctx;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_src_buf *jpeg_src_buf;
> +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> +	u32 enc_irq_ret;
> +	u32 enc_ret, result_size;
> +
> +	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
> +	if (!ctx) {
> +		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> +
> +	enc_ret = mtk_jpeg_enc_get_and_clear_int_status(jpeg->reg_base);

We should check the interrupt status at the beginning of the function and
return IRQ_NONE if there wasn't any flag set.

> +	enc_irq_ret = mtk_jpeg_enc_enum_result(jpeg->reg_base, enc_ret);
> +
> +	if (enc_irq_ret >= MTK_JPEG_ENC_RESULT_STALL)
> +		mtk_jpeg_enc_reset(jpeg->reg_base);
> +
> +	if (enc_irq_ret != MTK_JPEG_ENC_RESULT_DONE) {
> +		dev_err(jpeg->dev, "encode failed\n");
> +		goto enc_end;
> +	}

As I suggested before, it would have been much more clear if the interrupt
status bits were just directly read and checked in this function, without
introducing the additional abstraction.

> +
> +	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
> +	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
> +
> +	buf_state = VB2_BUF_STATE_DONE;
> +
> +enc_end:
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +	v4l2_m2m_buf_done(dst_buf, buf_state);
> +	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	pm_runtime_put(ctx->jpeg->dev);
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  {
>  	struct mtk_jpeg_dev *jpeg = priv;
> @@ -893,36 +1353,130 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  	return IRQ_HANDLED;
>  }
>  
> +static void mtk_jpeg_set_enc_default_params(struct mtk_jpeg_ctx *ctx)
> +{
> +	struct mtk_jpeg_q_data *q = &ctx->out_q;
> +	struct v4l2_pix_format_mplane *pix_mp;
> +
> +	pix_mp = kmalloc(sizeof(*pix_mp), GFP_KERNEL);

Do we need to allocate this pix_mp? Could we instead just embed it inside
ctx?

Also, this is actually a memory leak, because I don't see this structure
saved anywhere or freed.

> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> +	ctx->colorspace = V4L2_COLORSPACE_JPEG,
> +	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;

Since we already have a v4l2_pix_format_mplane struct which has fields for
the above 4 values, could we just store them there?

Also, I don't see this driver handling the colorspaces in any way, but it
seems to allow changing them from the userspace. This is incorrect, because
the userspace has no way to know that the colorspace is not handled.
Instead, the try_fmt implementation should always override the
userspace-provided colorspace configuration with the ones that the driver
assumes.

> +	pix_mp->width = MTK_JPEG_MIN_WIDTH;
> +	pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> +
> +	q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_YUYV,
> +				      MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> +	vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +				    fmt.pix_mp), q->fmt);
> +	q->w = pix_mp->width;
> +	q->h = pix_mp->height;
> +	q->crop_rect.width = pix_mp->width;
> +	q->crop_rect.height = pix_mp->height;
> +	q->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> +	q->bytesperline[0] = pix_mp->plane_fmt[0].bytesperline;

Actually, do we need this custom mtk_jpeg_q_data struct? Why couldn't we
just keep the same values inside the standard v4l2_pix_format_mplane
struct?

In general it's preferred to use the standard kernel structures as much as
possible and only introduce local driver structures for data that can't be
stored in generic ones.

> +
> +	q = &ctx->cap_q;
> +	q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_JPEG,
> +				      MTK_JPEG_FMT_FLAG_ENC_CAPTURE);
> +	pix_mp->width = MTK_JPEG_MIN_WIDTH;
> +	pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> +	vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +				    fmt.pix_mp), q->fmt);
> +	q->w = pix_mp->width;
> +	q->h = pix_mp->height;
> +	q->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> +	q->bytesperline[0] = pix_mp->plane_fmt[0].bytesperline;

Ditto.

> +}
> +
>  static void mtk_jpeg_set_dec_default_params(struct mtk_jpeg_ctx *ctx)
>  {
>  	struct mtk_jpeg_q_data *q = &ctx->out_q;
> +	struct v4l2_pix_format_mplane *pix_mp;
>  	int i;
>  
> +	pix_mp = kmalloc(sizeof(*pix_mp), GFP_KERNEL);
> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
>  	ctx->colorspace = V4L2_COLORSPACE_JPEG,
>  	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>  	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
>  	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> -
> -	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> -					      MTK_JPEG_FMT_TYPE_OUTPUT);
> -	q->w = MTK_JPEG_MIN_WIDTH;
> -	q->h = MTK_JPEG_MIN_HEIGHT;
> -	q->bytesperline[0] = 0;
> -	q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
> +	pix_mp->width = MTK_JPEG_MIN_WIDTH;
> +	pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> +
> +	q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_JPEG,
> +				      MTK_JPEG_FMT_FLAG_DEC_OUTPUT);
> +	vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +				    fmt.pix_mp), q->fmt);
> +	q->w = pix_mp->width;
> +	q->h = pix_mp->height;
> +	q->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> +	q->bytesperline[0] = pix_mp->plane_fmt[0].bytesperline;
>  
>  	q = &ctx->cap_q;
> -	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUV420M,
> -					      MTK_JPEG_FMT_TYPE_CAPTURE);
> -	q->w = MTK_JPEG_MIN_WIDTH;
> -	q->h = MTK_JPEG_MIN_HEIGHT;
> -
> +	q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_YUV420M,
> +				      MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
> +	pix_mp->width = MTK_JPEG_MIN_WIDTH;
> +	pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> +	vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +				    fmt.pix_mp), q->fmt);
> +	q->w = pix_mp->width;
> +	q->h = pix_mp->height;
>  	for (i = 0; i < q->fmt->colplanes; i++) {
> -		u32 stride = q->w * q->fmt->h_sample[i] / 4;
> -		u32 h = q->h * q->fmt->v_sample[i] / 4;
> +		q->sizeimage[i] = pix_mp->plane_fmt[i].sizeimage;
> +		q->bytesperline[i] = pix_mp->plane_fmt[i].bytesperline;
> +	}
> +}
>  

Same comments as for the encoder version.

On top of that, both functions are almost identical and it should be
possible to merge them.

> -		q->bytesperline[i] = stride;
> -		q->sizeimage[i] = stride * h;
> +static int mtk_jpeg_enc_open(struct file *file)
> +{
> +	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
> +	struct video_device *vfd = video_devdata(file);
> +	struct mtk_jpeg_ctx *ctx;
> +	int ret = 0;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	if (mutex_lock_interruptible(&jpeg->lock)) {
> +		ret = -ERESTARTSYS;
> +		goto free;
> +	}
> +
> +	v4l2_fh_init(&ctx->fh, vfd);
> +	file->private_data = &ctx->fh;
> +	v4l2_fh_add(&ctx->fh);
> +
> +	ctx->jpeg = jpeg;
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
> +					    mtk_jpeg_enc_queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto error;
>  	}
> +
> +	ret = mtk_jpeg_enc_ctrls_setup(ctx);
> +	if (ret) {
> +		v4l2_err(&jpeg->v4l2_dev, "Failed to setup jpeg enc controls\n");
> +		goto error;
> +	}
> +	mtk_jpeg_set_enc_default_params(ctx);
> +
> +	mutex_unlock(&jpeg->lock);
> +	return 0;
> +
> +error:
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	mutex_unlock(&jpeg->lock);
> +free:
> +	kfree(ctx);
> +	return ret;
>  }

It looks like the queue_init argument to v4l2_m2m_ctx_init() and control
handling would be the only differences from the decoder version. Perhaps
the functions can be merged?

>  
>  static int mtk_jpeg_dec_open(struct file *file)
> @@ -953,6 +1507,12 @@ static int mtk_jpeg_dec_open(struct file *file)
>  		goto error;
>  	}
>  
> +	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, 0);
> +	ret = v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> +	if (ret) {
> +		v4l2_err(&jpeg->v4l2_dev, "Failed to setup jpeg dec controls\n");
> +		goto error;
> +	}

There are no controls for the decoder, so there should be no need to set up
a control handler.

>  	mtk_jpeg_set_dec_default_params(ctx);
>  	mutex_unlock(&jpeg->lock);
>  	return 0;
> @@ -973,6 +1533,7 @@ static int mtk_jpeg_release(struct file *file)
>  
>  	mutex_lock(&jpeg->lock);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>  	v4l2_fh_del(&ctx->fh);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
> @@ -980,6 +1541,15 @@ static int mtk_jpeg_release(struct file *file)
>  	return 0;
>  }
>  
> +static const struct v4l2_file_operations mtk_jpeg_enc_fops = {
> +	.owner          = THIS_MODULE,
> +	.open           = mtk_jpeg_enc_open,
> +	.release        = mtk_jpeg_release,
> +	.poll           = v4l2_m2m_fop_poll,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap           = v4l2_m2m_fop_mmap,
> +};
> +

If we merge the .open() implementation, the same struct could be used for
both decoder and encoder.

[snip]
> @@ -1042,8 +1619,12 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  		return jpeg_irq;
>  	}
>  
> -	ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq, 0,
> -			       pdev->name, jpeg);
> +	if (jpeg->variant->is_encoder)
> +		ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_enc_irq,
> +				       0, pdev->name, jpeg);
> +	else
> +		ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq,
> +				       0, pdev->name, jpeg);

Rather than having "is_encoder" in the variant struct, would it make more
sense to have "irq_handler" instead? That would avoid the explicit if.

>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
>  			jpeg_irq, ret);
> @@ -1063,7 +1644,10 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  		goto err_dev_register;
>  	}
>  
> -	jpeg->m2m_dev = v4l2_m2m_init(&mtk_jpeg_dec_m2m_ops);
> +	if (jpeg->variant->is_encoder)
> +		jpeg->m2m_dev = v4l2_m2m_init(&mtk_jpeg_enc_m2m_ops);
> +	else
> +		jpeg->m2m_dev = v4l2_m2m_init(&mtk_jpeg_dec_m2m_ops);

Same here. The variant struct could have a "m2m_ops" pointer.

>  	if (IS_ERR(jpeg->m2m_dev)) {
>  		v4l2_err(&jpeg->v4l2_dev, "Failed to init mem2mem device\n");
>  		ret = PTR_ERR(jpeg->m2m_dev);
> @@ -1076,9 +1660,15 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  		goto err_vfd_jpeg_alloc;
>  	}
>  	snprintf(jpeg->vdev->name, sizeof(jpeg->vdev->name),
> -		 "%s-dec", MTK_JPEG_NAME);
> -	jpeg->vdev->fops = &mtk_jpeg_dec_fops;
> -	jpeg->vdev->ioctl_ops = &mtk_jpeg_dec_ioctl_ops;
> +		 "%s-%s", MTK_JPEG_NAME,
> +		 jpeg->variant->is_encoder ? "enc" : "dec");
> +	if (jpeg->variant->is_encoder) {
> +		jpeg->vdev->fops = &mtk_jpeg_enc_fops;
> +		jpeg->vdev->ioctl_ops = &mtk_jpeg_enc_ioctl_ops;
> +	} else {
> +		jpeg->vdev->fops = &mtk_jpeg_dec_fops;
> +		jpeg->vdev->ioctl_ops = &mtk_jpeg_dec_ioctl_ops;
> +	}

Similarly here.

[snip]
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 0b59e48495d5..9ec2c3350a16 100644
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
> @@ -16,19 +17,21 @@
>  #define MTK_JPEG_NAME		"mtk-jpeg"
>  
>  #define MTK_JPEG_COMP_MAX		3
> +#define MTK_JPEG_MAX_CLOCKS		2
> +
>  

Duplicate blank line.

>  #define MTK_JPEG_FMT_FLAG_DEC_OUTPUT	BIT(0)
>  #define MTK_JPEG_FMT_FLAG_DEC_CAPTURE	BIT(1)
> -
> -#define MTK_JPEG_FMT_TYPE_OUTPUT	1
> -#define MTK_JPEG_FMT_TYPE_CAPTURE	2
> +#define MTK_JPEG_FMT_FLAG_ENC_OUTPUT	BIT(2)
> +#define MTK_JPEG_FMT_FLAG_ENC_CAPTURE	BIT(3)

Do we need separate bits for decoder and encoder?

>  
>  #define MTK_JPEG_MIN_WIDTH	32U
>  #define MTK_JPEG_MIN_HEIGHT	32U
> -#define MTK_JPEG_MAX_WIDTH	8192U
> -#define MTK_JPEG_MAX_HEIGHT	8192U
> +#define MTK_JPEG_MAX_WIDTH	65535U
> +#define MTK_JPEG_MAX_HEIGHT	65535U

If this is a change valid for the decoder too, it should be a separate
patch.

>  
>  #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
> +#define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)

There is one thing that I realized now. If the EXIF mode is enabled, the
driver needs to ensure that the buffer is big enough to hold the EXIF data.
The vb2 .buf_prepare callback would be the right place to do that.

>  
>  /**
>   * enum mtk_jpeg_ctx_state - states of the context state machine
> @@ -42,6 +45,18 @@ enum mtk_jpeg_ctx_state {
>  	MTK_JPEG_SOURCE_CHANGE,
>  };
>  
> +/**
> + * mtk_jpeg_variant - mtk jpeg driver variant
> + * @is_encoder:		driver mode is jpeg encoder
> + * @clk_names:		clock names
> + * @num_clocks:		numbers of clock
> + */
> +struct mtk_jpeg_variant {
> +	bool is_encoder;
> +	const char		*clk_names[MTK_JPEG_MAX_CLOCKS];
> +	int			num_clocks;

hint: Please avoid tabs between types and names, as it makes it difficult
to add new fields later (the number of tabs might need to change for all
members).

[snip]
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> new file mode 100644
> index 000000000000..7fc1de920a75
> --- /dev/null
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> @@ -0,0 +1,193 @@
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
> +static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
> +	{.quality_param = 34, .hardware_value = JPEG_ENC_QUALITY_Q34},
> +	{.quality_param = 39, .hardware_value = JPEG_ENC_QUALITY_Q39},
> +	{.quality_param = 48, .hardware_value = JPEG_ENC_QUALITY_Q48},
> +	{.quality_param = 60, .hardware_value = JPEG_ENC_QUALITY_Q60},
> +	{.quality_param = 64, .hardware_value = JPEG_ENC_QUALITY_Q64},
> +	{.quality_param = 68, .hardware_value = JPEG_ENC_QUALITY_Q68},
> +	{.quality_param = 74, .hardware_value = JPEG_ENC_QUALITY_Q74},
> +	{.quality_param = 80, .hardware_value = JPEG_ENC_QUALITY_Q80},
> +	{.quality_param = 82, .hardware_value = JPEG_ENC_QUALITY_Q82},
> +	{.quality_param = 84, .hardware_value = JPEG_ENC_QUALITY_Q84},
> +	{.quality_param = 87, .hardware_value = JPEG_ENC_QUALITY_Q87},
> +	{.quality_param = 90, .hardware_value = JPEG_ENC_QUALITY_Q90},
> +	{.quality_param = 92, .hardware_value = JPEG_ENC_QUALITY_Q92},
> +	{.quality_param = 95, .hardware_value = JPEG_ENC_QUALITY_Q95},
> +	{.quality_param = 97, .hardware_value = JPEG_ENC_QUALITY_Q97},
> +};
> +
> +void mtk_jpeg_enc_reset(void __iomem *base)

I'd suggest passing struct mtk_jpeg_dev pointer to all these functions, in
case more data about the hardware is needed in the future.

> +{
> +	writel(0x00, base + JPEG_ENC_RSTB);

nit: Just 0 is enough.

> +	writel(JPEG_ENC_RESET_BIT, base + JPEG_ENC_RSTB);
> +	writel(0x00, base + JPEG_ENC_CODEC_SEL);

Ditto.

> +}
> +
> +u32 mtk_jpeg_enc_get_and_clear_int_status(void __iomem *base)
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
> +
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
> +{
> +	return readl(base + JPEG_ENC_DMA_ADDR0) -
> +	       readl(base + JPEG_ENC_DST_ADDR0);
> +}
> +
> +u32 mtk_jpeg_enc_enum_result(void __iomem *base, u32 irq_status)
> +{
> +	if (irq_status & JPEG_ENC_INT_STATUS_DONE)
> +		return MTK_JPEG_ENC_RESULT_DONE;
> +	else if (irq_status & JPEG_ENC_INT_STATUS_STALL)
> +		return MTK_JPEG_ENC_RESULT_STALL;
> +	else
> +		return MTK_JPEG_ENC_RESULT_VCODEC_IRQ;
> +}

It looks like the driver only cares about 2 cases: DONE and anything else.
Actually it also cares about a case where no bits are set in irq_status,
which could be an interrupt controller misconfiguration or an interrupt
generated by another device on the same shared IRQ line, which should be
handled by returning IRQ_NONE. Since interrupt handling is a low level
hardware operation, I'd suggest another design:
- put the irq_handler_t function here in this file and have it directly
  access the hardware registers and check the interrupt bits,
- add an mtk_jpeg_enc_done(..., enum vb2_buffer_state state, size_t
  payload), which would be called from this low level interrupt handler and
  do the V4L2 buffer and M2M job handling.

WDYT?

> +
> +void mtk_jpeg_enc_set_img_size(void __iomem *base, u32 width, u32 height)

If we pass struct mtk_jpeg_dev to this function, the width and height
arguments wouldn't be necessary, as they could be directly retrieved from
the driver state.

Similar advice applies to the other functions in this file.

> +{
> +	u32 value;
> +
> +	value = width << 16 | height;
> +	writel(value, base + JPEG_ENC_IMG_SIZE);
> +}
> +
> +void mtk_jpeg_enc_set_blk_num(void __iomem *base, u32 enc_format, u32 width,
> +			      u32 height)
> +{
> +	u32 blk_num;
> +	u32 is_420;
> +	u32 padding_width;
> +	u32 padding_height;
> +	u32 luma_blocks;
> +	u32 chroma_blocks;
> +
> +	is_420 = (enc_format == V4L2_PIX_FMT_NV12M ||
> +		  enc_format == V4L2_PIX_FMT_NV21M) ? 1 : 0;
> +	padding_width = round_up(width, 16);
> +	padding_height = round_up(height, is_420 ? 16 : 8);
> +
> +	luma_blocks = padding_width / 8 * padding_height / 8;
> +	if (is_420)
> +		chroma_blocks = luma_blocks / 4;
> +	else
> +		chroma_blocks = luma_blocks / 2;
> +
> +	blk_num = luma_blocks + 2 * chroma_blocks - 1;
> +
> +	writel(blk_num, base + JPEG_ENC_BLK_NUM);
> +}

My comments for this function from v7 haven't been addressed.

> +
> +void mtk_jpeg_enc_set_stride(void __iomem *base, u32 enc_format, u32 width,
> +			     u32 height, u32 bytesperline)
> +{
> +	u32 img_stride;
> +	u32 mem_stride;
> +
> +	if (enc_format == V4L2_PIX_FMT_NV12M ||
> +	    enc_format == V4L2_PIX_FMT_NV21M) {
> +		img_stride = round_up(width, 16);
> +		mem_stride = bytesperline;
> +	} else {
> +		img_stride = round_up(width * 2, 32);
> +		mem_stride = img_stride;
> +	}
> +
> +	writel(img_stride, base + JPEG_ENC_IMG_STRIDE);
> +	writel(mem_stride, base + JPEG_ENC_STRIDE);
> +}
> +

My comments for this function from v7 haven't been addressed.

> +void mtk_jpeg_enc_set_src_addr(void __iomem *base, u32 src_addr,
> +			       u32 plane_index)
> +{
> +	if (!plane_index)
> +		writel(src_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
> +	else
> +		writel(src_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);

Do we need this plane_index if we only have 2 planes? Also, for interleaved
formats, like YUYV, what should the LUMA and CHROMA registers be set to?

> +}
> +
> +void mtk_jpeg_enc_set_dst_addr(void __iomem *base, u32 dst_addr,
> +			       u32 stall_size, u32 init_offset,
> +			       u32 offset_mask)
> +{
> +	writel(init_offset & ~0xf, base + JPEG_ENC_OFFSET_ADDR);
> +	writel(offset_mask & 0xf, base + JPEG_ENC_BYTE_OFFSET_MASK);
> +	writel(dst_addr & ~0xf, base + JPEG_ENC_DST_ADDR0);
> +	writel((dst_addr + stall_size) & ~0xf, base + JPEG_ENC_STALL_ADDR0);
> +}
> +
> +static void mtk_jpeg_enc_set_quality(void __iomem *base, u32 quality)
> +{
> +	u32 value;
> +	u32 i, enc_quality;
> +
> +	enc_quality = mtk_jpeg_enc_quality[0].hardware_value;
> +	for (i = 0; i < ARRAY_SIZE(mtk_jpeg_enc_quality); i++) {
> +		if (quality <= mtk_jpeg_enc_quality[i].quality_param) {
> +			enc_quality = mtk_jpeg_enc_quality[i].hardware_value;
> +			break;
> +		}
> +	}
> +
> +	value = readl(base + JPEG_ENC_QUALITY);

nit: Is it still necessary to read the register here? Typically the reserved
bits would be defined as SBZ (should be zero) and it should be safe to just
write 0 to them.

> +	value = (value & JPEG_ENC_QUALITY_MASK) | enc_quality;
> +	writel(value, base + JPEG_ENC_QUALITY);
> +}
> +
> +static void mtk_jpeg_enc_set_ctrl(void __iomem *base, u32 enc_format,
> +				  bool exif_en, u32 restart_interval)
> +{
> +	u32 value;
> +
> +	value = readl(base + JPEG_ENC_CTRL);

nit: Is it still necessary to read the register here?

> +	value &= ~JPEG_ENC_CTRL_YUV_FORMAT_MASK;
> +	value |= (enc_format & 3) << 3;
> +	if (exif_en)
> +		value |= JPEG_ENC_CTRL_FILE_FORMAT_BIT;
> +	else
> +		value &= ~JPEG_ENC_CTRL_FILE_FORMAT_BIT;
> +	if (restart_interval)
> +		value |= JPEG_ENC_CTRL_RESTART_EN_BIT;
> +	else
> +		value &= ~JPEG_ENC_CTRL_RESTART_EN_BIT;
> +	writel(value, base + JPEG_ENC_CTRL);
> +}
> +

Best regards,
Tomasz
