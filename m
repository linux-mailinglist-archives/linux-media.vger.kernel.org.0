Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4C36E1828
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 12:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404567AbfJWKjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 06:39:55 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41141 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404434AbfJWKjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 06:39:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id q7so12666768pfh.8
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2019 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rIAkd9XpCDZgjimcyvtAAGDGDpbYdId4O4JHBZhzx7k=;
        b=PJ6RCYkTx5QKdhF8Cqf8rvYFDHjtdWIye/15D/u5zi2FXto1qQQxo/oBcHQhnLdJ4M
         fktGOJ6xNUrgX809a3qcMnjlL1UNkLwCZE+OBK3zH9U6QyQeZJEKPl33ps8xRCqvOI58
         Fd709fX/jHhTBFTPLH7B2syzeiPEQVfouEnWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rIAkd9XpCDZgjimcyvtAAGDGDpbYdId4O4JHBZhzx7k=;
        b=BkfiP3BQ/MomtiXDpTfwNw7GBoZx5TJ0cJQD6sYxqqj6SpaIobv5AMOIfCGl6Pb5By
         /pvYWr+Aq1NBjrJ++xYcvkkdsXO6k7CUh+QeKU3oi25wtEfT5M8TuCSrv/b37qfq8jqy
         L9q1A2kwTUpHBf4D2Ob9cc9A0DMU3X5KzB5ypwwbAB7EoBqUiU3NiY+EWLGRZMSSDLT3
         7/7/WnIfKWkpF8ByKvKAuo4J/6ANAsL2+N8rDzsaf6gQ8uTH/p5rPy4IwzOxxSTEbLdm
         bf/lxk0Am0K31dCNakX4R9cIZti7jBzMtZXY9vRfwK9ux62+2wIlOJNz/vI103ENxNkV
         VDsw==
X-Gm-Message-State: APjAAAUVSfNJnRNCmoPJJGo2eSvKTlUmD3j1aUt7CIkaHEe0k82vYjrS
        aI1j0rSNUz8/iiTya3ByBDyfpQ==
X-Google-Smtp-Source: APXvYqwY/Mowsb4EoSvgrB+IHwLQprlMLz+CMjb+Cf/dDRHWiE+v3SP3PTOGzE4cgggdHoTr8IS/cA==
X-Received: by 2002:a63:6b0a:: with SMTP id g10mr8839178pgc.296.1571827192268;
        Wed, 23 Oct 2019 03:39:52 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
        by smtp.gmail.com with ESMTPSA id n2sm23293179pgg.77.2019.10.23.03.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 03:39:51 -0700 (PDT)
Date:   Wed, 23 Oct 2019 19:39:45 +0900
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
Subject: Re: [PATCH v4 5/5] media: platform: Add jpeg dec/enc feature
Message-ID: <20191023103945.GA41089@chromium.org>
References: <20191017084033.28299-1-xia.jiang@mediatek.com>
 <20191017084033.28299-6-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017084033.28299-6-xia.jiang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Oct 17, 2019 at 04:40:38PM +0800, Xia Jiang wrote:
> Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> decode and encode have great similarities with function operation.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v4: split mtk_jpeg_try_fmt_mplane() to two functions, one for encoder,
>     one for decoder.
>     split mtk_jpeg_set_default_params() to two functions, one for
>     encoder, one for decoder.
>     add cropping support for encoder in g/s_selection ioctls.
>     change exif mode support by using V4L2_JPEG_ACTIVE_MARKER_APP1.
>     change MTK_JPEG_MAX_WIDTH/MTK_JPEG_MAX_HEIGH from 8192 to 65535 by
>     specification.
>     move width shifting operation behind aligning operation in
>     mtk_jpeg_try_enc_fmt_mplane() for bug fix.
>     fix user abuseing data_offset issue for DMABUF in
>     mtk_jpeg_set_enc_src().
>     fix kbuild warings: change MTK_JPEG_MIN_HEIGHT/MTK_JPEG_MAX_HEIGHT
>                         and MTK_JPEG_MIN_WIDTH/MTK_JPEG_MAX_WIDTH from
>                         'int' type to 'unsigned int' type.
>                         fix msleadingly indented of 'else'.
> 
> v3: delete Change-Id.
>     only test once handler->error after the last v4l2_ctrl_new_std().
>     seperate changes of v4l2-ctrls.c and v4l2-controls.h to new patch.
> 
> v2: fix compliance test fail, check created buffer size in driver.
> ---
>  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 731 +++++++++++++++---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 123 ++-
>  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 175 +++++
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  60 ++
>  .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  49 ++
>  7 files changed, 1004 insertions(+), 146 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> 

First of all, thanks for the patch!

Please check my comments below.

My general feeling about this code is that the encoder hardware block is
completely orthogonal from the decoder block and there is very little code
reuse from the original decoder driver. 

Moreover, a lot of existing code now needs if (decoder) { ... } else {... }
segments, which complicates the code.

Would it perhaps make sense to instead create a separate mtk-jpeg-enc
driver?

It would also give us a fresh start in terms of code quality, as the
existing mtk-jpeg driver has a lot of quality issues unfortunately. (Some
of my comments to this patch actually relate to the issues with the
original code, not introduced by this patch, but we need to fix them if
changing this driver already.)

> diff --git a/drivers/media/platform/mtk-jpeg/Makefile b/drivers/media/platform/mtk-jpeg/Makefile
> index 48516dcf96e6..76c33aad0f3f 100644
> --- a/drivers/media/platform/mtk-jpeg/Makefile
> +++ b/drivers/media/platform/mtk-jpeg/Makefile
> @@ -1,3 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -mtk_jpeg-objs := mtk_jpeg_core.o mtk_jpeg_dec_hw.o mtk_jpeg_dec_parse.o
> +mtk_jpeg-objs := mtk_jpeg_core.o \
> +		 mtk_jpeg_dec_hw.o \
> +		 mtk_jpeg_dec_parse.o \
> +		 mtk_jpeg_enc_hw.o
>  obj-$(CONFIG_VIDEO_MEDIATEK_JPEG) += mtk_jpeg.o
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index abc506a552c1..087b62bb1d5c 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2016 MediaTek Inc.
>   * Author: Ming Hsiu Tsai <minghsiu.tsai@mediatek.com>
>   *         Rick Chang <rick.chang@mediatek.com>
> + *         Xia Jiang <xia.jiang@mediatek.com>
>   */
>  
>  #include <linux/clk.h>
> @@ -23,6 +24,7 @@
>  #include <media/videobuf2-dma-contig.h>
>  #include <soc/mediatek/smi.h>
>  
> +#include "mtk_jpeg_enc_hw.h"
>  #include "mtk_jpeg_dec_hw.h"
>  #include "mtk_jpeg_core.h"
>  #include "mtk_jpeg_dec_parse.h"
> @@ -31,7 +33,8 @@ static struct mtk_jpeg_fmt mtk_jpeg_formats[] = {
>  	{
>  		.fourcc		= V4L2_PIX_FMT_JPEG,
>  		.colplanes	= 1,
> -		.flags		= MTK_JPEG_FMT_FLAG_DEC_OUTPUT,
> +		.flags		= MTK_JPEG_FMT_FLAG_DEC_OUTPUT |
> +				  MTK_JPEG_FMT_FLAG_ENC_CAPTURE,
>  	},
>  	{
>  		.fourcc		= V4L2_PIX_FMT_YUV420M,
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
>  
>  #define MTK_JPEG_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_formats)
> @@ -65,11 +104,19 @@ struct mtk_jpeg_src_buf {
>  	struct list_head list;
>  	int flags;
>  	struct mtk_jpeg_dec_param dec_param;
> +	struct mtk_jpeg_enc_param enc_param;
>  };
>  
> +#define MTK_MAX_CTRLS_HINT	20

I can see only 3 controls registered by this driver. Moreover, wouldn't it
be more readable if the v4l2_ctrl_handler_init() call had "3" directly
passed to it? Then the reader can see that there are 3 calls to
v4l2_ctrl_new_std() just below it and the meaning behind the value of 3 is
clear.

> +
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
> @@ -86,14 +133,74 @@ static int mtk_jpeg_querycap(struct file *file, void *priv,
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
> +	struct jpeg_enc_param *p = &ctx->jpeg_param;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +	int ret = 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_JPEG_RESTART_INTERVAL:
> +		p->restart_interval = ctrl->val;
> +		break;
> +	case V4L2_CID_JPEG_COMPRESSION_QUALITY:
> +		p->enc_quality = ctrl->val;
> +		break;
> +	case V4L2_CID_JPEG_ACTIVE_MARKER:
> +		p->enable_exif = ctrl->val & V4L2_JPEG_ACTIVE_MARKER_APP1;
> +		break;
> +	}
> +
> +	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "%s val = %d",
> +		 v4l2_ctrl_get_name(ctrl->id), ctrl->val);

Generic V4L2 logs can already dump all V4L2 IOCTL calls, so perhaps we
could remove this?

> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops mtk_jpeg_ctrl_ops = {
> +	.s_ctrl = vidioc_jpeg_s_ctrl,
> +};
> +
> +int mtk_jpeg_ctrls_setup(struct mtk_jpeg_ctx *ctx)
> +{
> +	const struct v4l2_ctrl_ops *ops = &mtk_jpeg_ctrl_ops;
> +	struct v4l2_ctrl_handler *handler = &ctx->ctrl_hdl;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +
> +	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
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
> @@ -118,23 +225,29 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
>  static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
> +	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +
>  	return mtk_jpeg_enum_fmt(mtk_jpeg_formats, MTK_JPEG_NUM_FORMATS, f,
> +				 ctx->jpeg->mode == MTK_JPEG_ENC ?
> +				 MTK_JPEG_FMT_FLAG_ENC_CAPTURE :
>  				 MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
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
>  }
>  
> -static struct mtk_jpeg_q_data *mtk_jpeg_get_q_data(struct mtk_jpeg_ctx *ctx,
> -						   enum v4l2_buf_type type)
> +static struct mtk_jpeg_q_data *
> +mtk_jpeg_get_q_data(struct mtk_jpeg_ctx *ctx, enum v4l2_buf_type type)
>  {
> -	if (V4L2_TYPE_IS_OUTPUT(type))
> -		return &ctx->out_q;
> -	return &ctx->cap_q;
> +	return V4L2_TYPE_IS_OUTPUT(type) ? &ctx->out_q : &ctx->cap_q;

Is this change necessary?

>  }
>  
>  static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
> @@ -143,9 +256,14 @@ static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
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
>  
>  	for (k = 0; k < MTK_JPEG_NUM_FORMATS; k++) {
>  		struct mtk_jpeg_fmt *fmt = &mtk_jpeg_formats[k];
> @@ -196,9 +314,99 @@ static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
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
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +	int i, align_w, align_h;
> +
> +	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));

The core already takes care of zeroing this.

> +	pix_mp->field = V4L2_FIELD_NONE;
> +
> +	if (ctx->state != MTK_JPEG_INIT) {
> +		mtk_jpeg_adjust_fmt_mplane(ctx, f);
> +		goto end;
> +	}
> +
> +	pix_mp->num_planes = fmt->colplanes;
> +	pix_mp->pixelformat = fmt->fourcc;
> +
> +	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {

There are separate ops for out_mplane and cap_mplane. Wouldn't it make more
sense to have them handled in separate functions?

> +		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> +				       MTK_JPEG_MAX_HEIGHT);
> +		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
> +				      MTK_JPEG_MAX_WIDTH);
> +		align_w = pix_mp->width;
> +		align_h = pix_mp->height;
> +		align_w = round_up(align_w, 2);
> +		if (pix_mp->num_planes == 1U) {
> +			mtk_jpeg_bound_align_image(&align_w,
> +						   MTK_JPEG_MIN_WIDTH,
> +						   MTK_JPEG_MAX_WIDTH, 5,
> +						   &align_h,
> +						   MTK_JPEG_MIN_HEIGHT,
> +						   MTK_JPEG_MAX_HEIGHT, 3);

I'd suggest removing the mtk_jpeg_bound_align_image(), as we don't need the
complex computation that's happening there. All we need is:

	pix_mp->height = clamp(round_up(pix_mp->height, 8), MTK_JPEG_MIN_HEIGHT,
			       MTK_JPEG_MAX_HEIGHT);
	pix_mp->width = clamp(round_up(pix_mp->width, 32), MTK_JPEG_MIN_WIDTH,
			      MTK_JPEG_MAX_WIDTH);

Note that contrary to the existing code, the aligned width and height
_must_ be returned back to the application and not only hidden inside
bytesperline and sizeimage.

> +			align_w = align_w << 1;
> +			pix_mp->plane_fmt[0].bytesperline = align_w;
> +			pix_mp->plane_fmt[0].sizeimage = align_w * align_h;
> +		} else if (pix_mp->num_planes == 2U) {
> +			mtk_jpeg_bound_align_image(&align_w,
> +						   MTK_JPEG_MIN_WIDTH,
> +						   MTK_JPEG_MAX_WIDTH, 4,
> +						   &align_h,
> +						   MTK_JPEG_MIN_HEIGHT,
> +						   MTK_JPEG_MAX_HEIGHT, 4);
> +			pix_mp->plane_fmt[0].bytesperline = align_w;
> +			pix_mp->plane_fmt[0].sizeimage = align_w * align_h;
> +			pix_mp->plane_fmt[1].bytesperline = align_w;
> +			pix_mp->plane_fmt[1].sizeimage =
> +				(align_w * align_h) / 2;

Could we parametrize these calculations from the format array and use a for
loop over the planes instead?

> +		} else {
> +			v4l2_err(&jpeg->v4l2_dev,
> +				 "Unsupport num planes = %d\n",
> +				 pix_mp->num_planes);

Isn't this impossible?

> +		}
> +	} else {
> +		mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> +					   MTK_JPEG_MAX_WIDTH, 0,
> +					   &pix_mp->height,
> +					   MTK_JPEG_MIN_HEIGHT,
> +					   MTK_JPEG_MAX_HEIGHT, 0);

Same here, could we just use clamp() directly?

> +
> +		if (fmt->fourcc == V4L2_PIX_FMT_JPEG) {

Can we have any other format on this queue?

> +			pix_mp->plane_fmt[0].bytesperline = 0;
> +			pix_mp->plane_fmt[0].sizeimage =
> +				mtk_jpeg_align(pix_mp->plane_fmt[0].sizeimage,
> +					       128);

What's mtk_jpeg_align()? Why couldn't we just use round_up() directly?

> +			if (pix_mp->plane_fmt[0].sizeimage == 0)
> +				pix_mp->plane_fmt[0].sizeimage =
> +					MTK_JPEG_DEFAULT_SIZEIMAGE;

I think there is some reasonable upper bound of the compressed image size
given the resolution. Could we use that here instead?

> +		}
> +	}
> +
> +	for (i = 0; i < fmt->colplanes; i++) {
> +		struct v4l2_plane_pix_format *pfmt =
> +				&pix_mp->plane_fmt[i];
> +		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));

The core already zeroes this.

> +	}
> +end:
> +	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "wxh:%ux%u\n",
> +		 pix_mp->width, pix_mp->height);
> +	for (i = 0; i < pix_mp->num_planes; i++) {
> +		v4l2_dbg(2, debug, &jpeg->v4l2_dev,
> +			 "plane[%d] bpl=%u, size=%u\n",
> +			 i,
> +			 pix_mp->plane_fmt[i].bytesperline,
> +			 pix_mp->plane_fmt[i].sizeimage);
> +	}

Generic V4L2 debug logs already print this.

> +	return 0;
> +}
> +
> +static int mtk_jpeg_try_dec_fmt_mplane(struct v4l2_format *f,
> +				       struct mtk_jpeg_fmt *fmt,
> +				       struct mtk_jpeg_ctx *ctx, int q_type)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> @@ -233,6 +441,10 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  	}
>  
>  	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> +	pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> +			       MTK_JPEG_MAX_HEIGHT);
> +	pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
> +			      MTK_JPEG_MAX_WIDTH);

Why is this needed? Doesn't the call below already include these clamps?

(That said, it would be cleaner if mtk_jpeg_bound_align_image() was removed
and replaced with clamp() calls directly, because of the confusing behavior
of v4l_bound_align_image().

>  	mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
>  				   MTK_JPEG_MAX_WIDTH, fmt->h_align,
>  				   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> @@ -316,6 +528,7 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
>  	struct mtk_jpeg_fmt *fmt;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  
>  	fmt = mtk_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat,
>  				   MTK_JPEG_FMT_TYPE_CAPTURE);
> @@ -329,7 +542,12 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  		 (fmt->fourcc >> 16 & 0xff),
>  		 (fmt->fourcc >> 24 & 0xff));
>  
> -	return mtk_jpeg_try_fmt_mplane(f, fmt, ctx, MTK_JPEG_FMT_TYPE_CAPTURE);
> +
> +	return jpeg->mode == MTK_JPEG_ENC ?
> +	       mtk_jpeg_try_enc_fmt_mplane(f, fmt, ctx,
> +					   MTK_JPEG_FMT_TYPE_CAPTURE) :
> +	       mtk_jpeg_try_dec_fmt_mplane(f, fmt, ctx,
> +					   MTK_JPEG_FMT_TYPE_CAPTURE);

The ternary operator isn't a universal replacement for if/else. It should
be limited to simple expressions only. Function calls don't count as simple
expressions.

>  }
>  
>  static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
> @@ -337,6 +555,7 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
>  	struct mtk_jpeg_fmt *fmt;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  
>  	fmt = mtk_jpeg_find_format(ctx, f->fmt.pix_mp.pixelformat,
>  				   MTK_JPEG_FMT_TYPE_OUTPUT);
> @@ -350,7 +569,12 @@ static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  		 (fmt->fourcc >> 16 & 0xff),
>  		 (fmt->fourcc >> 24 & 0xff));
>  
> -	return mtk_jpeg_try_fmt_mplane(f, fmt, ctx, MTK_JPEG_FMT_TYPE_OUTPUT);
> +	return jpeg->mode == MTK_JPEG_ENC ?
> +	       mtk_jpeg_try_enc_fmt_mplane(f, fmt, ctx,
> +					   MTK_JPEG_FMT_TYPE_OUTPUT) :
> +	       mtk_jpeg_try_dec_fmt_mplane(f, fmt, ctx,
> +					   MTK_JPEG_FMT_TYPE_OUTPUT);

Ditto.

> +

Unnecessary blank line.

>  }
>  
>  static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
> @@ -455,11 +679,19 @@ static int mtk_jpeg_g_selection(struct file *file, void *priv,
>  				struct v4l2_selection *s)
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  
> -	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +	if (jpeg->mode == MTK_JPEG_ENC && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		return -EINVAL;
> +
> +	if (jpeg->mode == MTK_JPEG_DEC &&
> +	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>  		return -EINVAL;
>  
>  	switch (s->target) {
> +	case V4L2_SEL_TGT_CROP:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>  	case V4L2_SEL_TGT_COMPOSE:
>  	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
>  		s->r.width = ctx->out_q.w;
> @@ -484,11 +716,17 @@ static int mtk_jpeg_s_selection(struct file *file, void *priv,
>  				struct v4l2_selection *s)
>  {
>  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  
> -	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +	if (jpeg->mode == MTK_JPEG_ENC && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		return -EINVAL;
> +
> +	if (jpeg->mode == MTK_JPEG_DEC &&
> +	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>  		return -EINVAL;
>  
>  	switch (s->target) {
> +	case V4L2_SEL_TGT_CROP:
>  	case V4L2_SEL_TGT_COMPOSE:
>  		s->r.left = 0;
>  		s->r.top = 0;
> @@ -658,10 +896,92 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
>  		 param->dec_w, param->dec_h);
>  }
>  
> +static void mtk_jpeg_set_param(struct mtk_jpeg_ctx *ctx,
> +			       struct mtk_jpeg_enc_param *param)
> +{
> +	struct mtk_jpeg_q_data *q_data_src = &ctx->out_q;
> +	struct jpeg_enc_param *jpeg_params = &ctx->jpeg_param;
> +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> +	u32 width_even;
> +	u32 is_420;
> +	u32 padding_width;
> +	u32 padding_height;
> +
> +	switch (q_data_src->fmt->fourcc) {
> +	case V4L2_PIX_FMT_YUYV:
> +		param->enc_format = JPEG_YUV_FORMAT_YUYV;
> +		break;
> +	case V4L2_PIX_FMT_YVYU:
> +		param->enc_format = JPEG_YUV_FORMAT_YVYU;
> +		break;
> +	case V4L2_PIX_FMT_NV12M:
> +		param->enc_format = JPEG_YUV_FORMAT_NV12;
> +		break;
> +	case V4L2_PIX_FMT_NV21M:
> +		param->enc_format = JPEG_YUV_FORMAT_NV12;
> +		break;

Could we include enc_format in the mtk_jpeg_fmt struct and take it from
there, eliminating the need for a switch over all supported formats?

> +	default:
> +		v4l2_err(&jpeg->v4l2_dev, "Unsupport fourcc =%d\n",
> +			 q_data_src->fmt->fourcc);
> +		break;

Isn't this impossible?

> +	}
> +	param->enc_w = q_data_src->w;
> +	param->enc_h = q_data_src->h;
> +
> +	if (jpeg_params->enc_quality >= 97)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q97;
> +	else if (jpeg_params->enc_quality >= 95)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q95;

I'm wondering if the application requests 96, it doesn't expect the quality to
be _at_least_ 96. 

> +	else if (jpeg_params->enc_quality >= 92)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q92;
> +	else if (jpeg_params->enc_quality >= 90)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q90;
> +	else if (jpeg_params->enc_quality >= 87)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q87;
> +	else if (jpeg_params->enc_quality >= 84)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q84;
> +	else if (jpeg_params->enc_quality >= 80)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q80;
> +	else if (jpeg_params->enc_quality >= 74)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q74;
> +	else if (jpeg_params->enc_quality >= 64)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q64;
> +	else if (jpeg_params->enc_quality >= 60)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q60;
> +	else
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q48;

We could put this in a sorted array of <quality paramter, hardware value>
pairs and use a simple for loop instead.

> +
> +	param->enable_exif = jpeg_params->enable_exif;
> +	param->restart_interval = jpeg_params->restart_interval;
> +
> +	width_even = ((param->enc_w + 1) >> 1) << 1;

Isn't this equivalent to round_up(param->enc_w, 2)?

> +	is_420 = (param->enc_format == JPEG_YUV_FORMAT_NV12 ||
> +		  param->enc_format == JPEG_YUV_FORMAT_NV12) ? 1 : 0;
> +	padding_width = mtk_jpeg_align(param->enc_w, 16);
> +	padding_height = mtk_jpeg_align(param->enc_h, is_420 ? 16 : 8);
> +	if (!is_420)
> +		width_even = width_even << 1;
> +
> +	param->img_stride = mtk_jpeg_align(width_even, (is_420 ? 16 : 32));

Isn't this the same as bytesperline in the v4l2_pix_fmt_mplane struct?

> +	param->mem_stride = mtk_jpeg_align(width_even, (is_420 ? 16 : 32));

What's the difference between img_stride and mem_stride?

> +	param->total_encdu =
> +		((padding_width >> 4) * (padding_height >> (is_420 ? 4 : 3)) *
> +		(is_420 ? 6 : 4)) - 1;

The comment above the struct says this is the total number of 8x8 blocks.
Why would it depend on whether the format is YUV 4:2:0? Since we should
have already aligned the width and height in try_fmt, this should be as
simple as (width / 8) * (height / 8).

> +
> +	v4l2_dbg(0, 2, &jpeg->v4l2_dev, "fmt %d, w,h %d,%d, enable_exif %d,",
> +		 "enc_quality %d, restart_interval %d,img_stride %d,",
> +		 "mem_stride %d,totalEncDu %d\n",
> +		 param->enc_format, param->enc_w, param->enc_h,
> +		 param->enable_exif, param->enc_quality,
> +		 param->restart_interval, param->img_stride,
> +		 param->mem_stride, param->total_encdu);
> +}

Do we need this intermediate step, with an intermediate representation of
the parameters? Couldn't we just program the registers directly based on
the original V4L2 values, as other drivers normally do?

> +
>  static void mtk_jpeg_buf_queue(struct vb2_buffer *vb)
>  {
>  	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>  	struct mtk_jpeg_dec_param *param;
> +	struct mtk_jpeg_enc_param *enc_param;
>  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	bool header_valid;
> @@ -673,29 +993,45 @@ static void mtk_jpeg_buf_queue(struct vb2_buffer *vb)
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
> +	if (jpeg->mode ==  MTK_JPEG_ENC) {

nit: Double space after ==.

> +		enc_param = &jpeg_src_buf->enc_param;
> +		memset(enc_param, 0, sizeof(*enc_param));
> +		mtk_jpeg_set_param(ctx, enc_param);
> +		if (jpeg_src_buf->flags & MTK_JPEG_BUF_FLAGS_LAST_FRAME) {
> +			v4l2_dbg(1, debug, &jpeg->v4l2_dev, "Got eos");
> +			goto end;

Shouldn't we still change the state to RUNNING? The last frame still needs
to be encoded and the condition for getting back to the INIT state is
stopping the streaming.

> +		}
> +		if (ctx->state == MTK_JPEG_INIT)
> +			ctx->state = MTK_JPEG_RUNNING;
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
> @@ -738,16 +1074,16 @@ static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
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
>  
>  	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
>  		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> @@ -802,6 +1138,34 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
>  	return 0;
>  }
>  
> +static void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx,
> +				 struct vb2_buffer *dst_buf,
> +				 struct mtk_jpeg_enc_bs *bs)
> +{
> +	struct jpeg_enc_param *p = &ctx->jpeg_param;
> +
> +	bs->dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0) &
> +		      (~JPEG_ENC_DST_ADDR_OFFSET_MASK);

Wouldn't the hardware attempt to access the memory before the buffer in
this case? This is a recipe for a disaster (e.g. the hardware overwriting
some memory it shouldn't touch).

Could we instead check the buffer address alignment in .buf_prepare and fail if
it's not big enough?

> +	bs->dma_addr_offset = p->enable_exif ? MTK_JPEG_DEFAULT_EXIF_SIZE : 0;
> +	bs->dma_addr_offsetmask = bs->dma_addr & JPEG_ENC_DST_ADDR_OFFSET_MASK;

What is the meaning of this offset mask?

> +	bs->size = mtk_jpeg_align(vb2_plane_size(dst_buf, 0), 128);

Wouldn't this let the hardware write beyond the buffer if the original size
was not a multiple of 128? Shouldn't we round_down() insted?

> +}
> +
> +static void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,
> +				 struct vb2_buffer *src_buf,
> +				 struct mtk_jpeg_enc_fb *fb)
> +{
> +	int i;
> +
> +	for (i = 0; i < src_buf->num_planes; i++) {
> +		fb->fb_addr[i].dma_addr =
> +			vb2_dma_contig_plane_dma_addr(src_buf, i) +
> +			src_buf->planes[i].data_offset;
> +		fb->fb_addr[i].size = (size_t)src_buf->planes[i].length -

The proper way to access plane length is to call vb2_plane_size().

> +				      src_buf->planes[i].data_offset;
> +	}
> +}
> +
>  static void mtk_jpeg_device_run(void *priv)
>  {
>  	struct mtk_jpeg_ctx *ctx = priv;
> @@ -812,6 +1176,8 @@ static void mtk_jpeg_device_run(void *priv)
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	struct mtk_jpeg_bs bs;
>  	struct mtk_jpeg_fb fb;
> +	struct mtk_jpeg_enc_bs enc_bs;
> +	struct mtk_jpeg_enc_fb enc_fb;
>  	int i;
>  
>  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> @@ -822,30 +1188,45 @@ static void mtk_jpeg_device_run(void *priv)
>  		for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
>  			vb2_set_plane_payload(&dst_buf->vb2_buf, i, 0);
>  		buf_state = VB2_BUF_STATE_DONE;
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
> +		mtk_jpeg_set_enc_dst(ctx, &dst_buf->vb2_buf, &enc_bs);
> +		mtk_jpeg_set_enc_src(ctx, &src_buf->vb2_buf, &enc_fb);
> +
> +		spin_lock_irqsave(&jpeg->hw_lock, flags);

Do we actually need this lock? device_run can be only called once and only
after the hardware finished processing the current job.

> +		mtk_jpeg_enc_reset(jpeg->reg_base);
> +		mtk_jpeg_enc_set_config(jpeg->reg_base,
> +					&jpeg_src_buf->enc_param, &enc_bs,
> +					&enc_fb);
> +
> +		mtk_jpeg_enc_start(jpeg->reg_base);
> +	} else {
> +		if (mtk_jpeg_check_resolution_change
> +			(ctx, &jpeg_src_buf->dec_param)) {
> +			mtk_jpeg_queue_src_chg_event(ctx);
> +			ctx->state = MTK_JPEG_SOURCE_CHANGE;
> +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
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
> +		mtk_jpeg_dec_set_config(jpeg->reg_base,
> +					&jpeg_src_buf->dec_param, &bs, &fb);
>  
> -	mtk_jpeg_dec_start(jpeg->dec_reg_base);
> +		mtk_jpeg_dec_start(jpeg->reg_base);
> +	}
>  	spin_unlock_irqrestore(&jpeg->hw_lock, flags);

It is a good practice for spin_lock and spin_unlock to be in the same
scope, for readability reasons.

>  	return;
>  
> -dec_end:
> +device_run_end:
>  	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>  	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  	v4l2_m2m_buf_done(src_buf, buf_state);
> @@ -905,30 +1286,30 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  	ret = mtk_smi_larb_get(jpeg->larb);
>  	if (ret)
>  		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> -	clk_prepare_enable(jpeg->clk_jdec_smi);
> -	clk_prepare_enable(jpeg->clk_jdec);
> +	if (jpeg->mode == MTK_JPEG_DEC)
> +		clk_prepare_enable(jpeg->clk_jpeg_smi);
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
> +	u32	irq_ret;

In the kernel coding style, type is separated from variable name with a
single space.

> +	u32 ret, result_size;
>  	int i;
>  
> -	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
> -	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
>  	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
>  	if (!ctx) {
>  		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
> @@ -939,39 +1320,107 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
>  
> -	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
> -		mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> +	if (jpeg->mode == MTK_JPEG_ENC) {
> +		ret = mtk_jpeg_enc_get_int_status(jpeg->reg_base);
> +		irq_ret = mtk_jpeg_enc_enum_result(jpeg->reg_base, ret,
> +						   &result_size);
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
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
> +				      result_size);
> +	} else {
> +		ret = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
> +		irq_ret = mtk_jpeg_dec_enum_result(ret);
>  
> -	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
> -		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
> -				      jpeg_src_buf->dec_param.comp_size[i]);
> +		if (irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
> +			mtk_jpeg_dec_reset(jpeg->reg_base);
> +
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
> +	int align_w, align_h;
> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
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
> +	align_w = q->w;
> +	align_h = q->h;
> +	align_w = round_up(align_w, 2);
> +	v4l_bound_align_image(&align_w, MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH,
> +			      5, &align_h, MTK_JPEG_MIN_HEIGHT,
> +			      MTK_JPEG_MAX_HEIGHT, 3, 0);
> +	align_w = align_w << 1;
> +
> +	if (align_w < MTK_JPEG_MIN_WIDTH &&
> +	    (align_w + 32) <= MTK_JPEG_MAX_WIDTH)
> +		align_w += 32;
> +	if (align_h < MTK_JPEG_MIN_HEIGHT &&
> +	    (align_h + 8) <= MTK_JPEG_MAX_HEIGHT)
> +		align_h += 8;
> +
> +	q->sizeimage[0] = align_w * align_h;
> +	q->bytesperline[0] = align_w;
> +
> +	q = &ctx->cap_q;
> +	q->w = MTK_JPEG_MIN_WIDTH;
> +	q->h = MTK_JPEG_MIN_HEIGHT;
> +	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> +				      MTK_JPEG_FMT_TYPE_CAPTURE);
> +	q->bytesperline[0] = 0;
> +	q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
> +}

Could we just create an arbitrary v4l2_pix_format_mplane struct and call
s_fmt instead? In general, all of the constant values and alignments should
be already ensured by try_fmt, so this function should be redundant.

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
>  	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>  
>  	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> -					      MTK_JPEG_FMT_TYPE_OUTPUT);
> +				      MTK_JPEG_FMT_TYPE_OUTPUT);
>  	q->w = MTK_JPEG_MIN_WIDTH;
>  	q->h = MTK_JPEG_MIN_HEIGHT;
>  	q->bytesperline[0] = 0;
> @@ -979,7 +1428,7 @@ static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
>  
>  	q = &ctx->cap_q;
>  	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUV420M,
> -					      MTK_JPEG_FMT_TYPE_CAPTURE);
> +				      MTK_JPEG_FMT_TYPE_CAPTURE);
>  	q->w = MTK_JPEG_MIN_WIDTH;
>  	q->h = MTK_JPEG_MIN_HEIGHT;
>  
> @@ -1020,7 +1469,15 @@ static int mtk_jpeg_open(struct file *file)
>  		goto error;
>  	}
>  
> -	mtk_jpeg_set_default_params(ctx);
> +	ret = mtk_jpeg_ctrls_setup(ctx);
> +	if (ret) {
> +		v4l2_err(&jpeg->v4l2_dev, "Failed to setup controls() (%d)\n",
> +			 ret);
> +		goto error;
> +	}
> +
> +	jpeg->mode == MTK_JPEG_ENC ? mtk_jpeg_set_enc_default_params(ctx) :
> +				     mtk_jpeg_set_dec_default_params(ctx);

As mentioned before, this kind of usage of the ternary operator is generaly
discouraged, because it makes the code difficult to read.

>  	mutex_unlock(&jpeg->lock);
>  	return 0;
>  
> @@ -1040,6 +1497,7 @@ static int mtk_jpeg_release(struct file *file)
>  
>  	mutex_lock(&jpeg->lock);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>  	v4l2_fh_del(&ctx->fh);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
> @@ -1064,6 +1522,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
>  	if (!node)
>  		return -EINVAL;
> +

Unnecessary change?

>  	pdev = of_find_device_by_node(node);
>  	if (WARN_ON(!pdev)) {
>  		of_node_put(node);
> @@ -1073,19 +1532,24 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
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
> @@ -1095,28 +1559,26 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	mutex_init(&jpeg->lock);
>  	spin_lock_init(&jpeg->hw_lock);
>  	jpeg->dev = &pdev->dev;
> +	jpeg->mode = (enum mtk_jpeg_mode)of_device_get_match_data(jpeg->dev);
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

This removal of ret assignment looks like a separate fix that should be
done in its own patch.

> +		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
> +			jpeg_irq, ret);
>  		goto err_req_irq;
>  	}
>  
> @@ -1140,33 +1602,35 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  		goto err_m2m_init;
>  	}
>  
> -	jpeg->dec_vdev = video_device_alloc();
> -	if (!jpeg->dec_vdev) {
> +	jpeg->vfd_jpeg = video_device_alloc();
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

The change from 3 to -1 also looks like something for a separate patch.

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
> +		  jpeg->mode, jpeg->vfd_jpeg->num, VIDEO_MAJOR,
> +		  jpeg->vfd_jpeg->minor);
>  
>  	platform_set_drvdata(pdev, jpeg);
>  
> @@ -1174,10 +1638,10 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
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
> @@ -1197,8 +1661,8 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
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
> @@ -1209,7 +1673,11 @@ static __maybe_unused int mtk_jpeg_pm_suspend(struct device *dev)
>  {
>  	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
>  
> -	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> +	if (jpeg->mode == MTK_JPEG_ENC)
> +		mtk_jpeg_enc_reset(jpeg->reg_base);
> +	else
> +		mtk_jpeg_dec_reset(jpeg->reg_base);
> +
>  	mtk_jpeg_clk_off(jpeg);
>  
>  	return 0;
> @@ -1220,7 +1688,10 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
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
> @@ -1256,11 +1727,15 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops = {
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
> index 999bd1427809..35ddc64af554 100644
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
> @@ -17,23 +18,77 @@
>  
>  #define MTK_JPEG_FMT_FLAG_DEC_OUTPUT	BIT(0)
>  #define MTK_JPEG_FMT_FLAG_DEC_CAPTURE	BIT(1)
> +#define MTK_JPEG_FMT_FLAG_ENC_OUTPUT	BIT(2)
> +#define MTK_JPEG_FMT_FLAG_ENC_CAPTURE	BIT(3)
>  
>  #define MTK_JPEG_FMT_TYPE_OUTPUT	1
>  #define MTK_JPEG_FMT_TYPE_CAPTURE	2
>  
> -#define MTK_JPEG_MIN_WIDTH	32
> -#define MTK_JPEG_MIN_HEIGHT	32
> -#define MTK_JPEG_MAX_WIDTH	8192
> -#define MTK_JPEG_MAX_HEIGHT	8192
> +#define MTK_JPEG_MIN_WIDTH	32U
> +#define MTK_JPEG_MIN_HEIGHT	32U
> +#define MTK_JPEG_MAX_WIDTH	65535U
> +#define MTK_JPEG_MAX_HEIGHT	65535U

Why is it okay to change this from 8192 to 65535?

>  
>  #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
> +#define MTK_JPEG_DEFAULT_EXIF_SIZE	(64 * 1024)
>  
> +#define MTK_JPEG_ENCODE		0
> +#define MTK_JPEG_DECODE		1

These two are unused.

> +
> +/**
> + * enum mtk_jpeg_ctx_state - contex state of jpeg
> + */
>  enum mtk_jpeg_ctx_state {
>  	MTK_JPEG_INIT = 0,
>  	MTK_JPEG_RUNNING,
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

Perhaps we could just have a bool is_encoder?

> +
> +/**
> + * enum jpeg_enc_yuv_fmt - yuv format of jpeg enc
> + */
> +enum jpeg_enc_yuv_fmt {
> +	JPEG_YUV_FORMAT_YUYV = 0,
> +	JPEG_YUV_FORMAT_YVYU = 1,
> +	JPEG_YUV_FORMAT_NV12 = 2,
> +	JEPG_YUV_FORMAT_NV21 = 3,
> +};

#define macros are typically used for hardware values.

> +
> +/**
> + * enum JPEG_ENCODE_QUALITY_ENUM - number of jpeg encoder quality
> + */
> +enum JPEG_ENCODE_QUALITY_ENUM {
> +	JPEG_ENCODE_QUALITY_Q60 = 0x0,
> +	JPEG_ENCODE_QUALITY_Q80 = 0x1,
> +	JPEG_ENCODE_QUALITY_Q90 = 0x2,
> +	JPEG_ENCODE_QUALITY_Q95 = 0x3,
> +
> +	JPEG_ENCODE_QUALITY_Q39 = 0x4,
> +	JPEG_ENCODE_QUALITY_Q68 = 0x5,
> +	JPEG_ENCODE_QUALITY_Q84 = 0x6,
> +	JPEG_ENCODE_QUALITY_Q92 = 0x7,
> +
> +	JPEG_ENCODE_QUALITY_Q48 = 0x8,

No enum for 0x9?

> +	JPEG_ENCODE_QUALITY_Q74 = 0xA,
> +	JPEG_ENCODE_QUALITY_Q87 = 0xB,
> +
> +	JPEG_ENCODE_QUALITY_Q34 = 0xC,

No enum for 0xd?

> +	JPEG_ENCODE_QUALITY_Q64 = 0xE,
> +	JPEG_ENCODE_QUALITY_Q82 = 0xF,
> +
> +	JPEG_ENCODE_QUALITY_Q97 = 0x10,
> +
> +	JPEG_ENCODE_QUALITY_ALL = 0xFFFFFFFF

What is the meaning of this value?

> +};

Since these are hardware register values, #define macros are preferred.

> +
>  /**
>   * struct mt_jpeg - JPEG IP abstraction
>   * @lock:		the mutex protecting this structure
> @@ -43,11 +98,12 @@ enum mtk_jpeg_ctx_state {
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
> @@ -57,11 +113,12 @@ struct mtk_jpeg_dev {
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
> @@ -101,15 +158,51 @@ struct mtk_jpeg_q_data {
>  	u32			sizeimage[VIDEO_MAX_PLANES];
>  };
>  
> +/**
> + * jpeg_enc_param - parameters of jpeg encode control
> + * @enable_exif:	EXIF enable for jpeg encode mode
> + * @enc_quality:	destination image quality in encode mode
> + * @restart_interval:	JPEG restart interval for JPEG encoding
> + */
> +struct jpeg_enc_param {
> +	u32 enable_exif;

Shouldn't this be a bool?

> +	u32 enc_quality;

This is from 0 to 100, so perhaps unsigned char?

> +	u32 restart_interval;

Ditto.

> +};
> +
> +/**
> + * mtk_jpeg_enc_param:  General jpeg encoding parameters
> + * @enc_w:		image width
> + * @enc_h:		image height
> + * @enable_exif:	EXIF enable for jpeg encode mode
> + * @enc_quality:	destination image quality in encode mode
> + * @enc_format:		input image format
> + * @restart_interval:	JPEG restart interval for JPEG encoding
> + * @img_stride:		jpeg encoder image stride
> + * @mem_stride:		jpeg encoder memory stride
> + * @total_encdu:	total 8x8 block number
> + */
> +struct mtk_jpeg_enc_param {
> +	u32 enc_w;
> +	u32 enc_h;
> +	u32 enable_exif;
> +	u32 enc_quality;
> +	u32 enc_format;
> +	u32 restart_interval;
> +	u32 img_stride;
> +	u32 mem_stride;
> +	u32 total_encdu;
> +};

All of the parameters here are already represented by corresponding generic
V4L2 state. We should be able to just convert them to the hardware
representation at the time of programing the registers, without a need to
store them in this intermediate struct.

> +
>  /**
>   * mtk_jpeg_ctx - the device context data
>   * @jpeg:		JPEG IP device for this context
>   * @out_q:		source (output) queue information
>   * @cap_q:		destination (capture) queue queue information
>   * @fh:			V4L2 file handle
> - * @dec_param		parameters for HW decoding
>   * @state:		state of the context
> - * @header_valid:	set if header has been parsed and valid

Why removing these two?

> + * @jpeg_param:		jpeg encode parameters
> + * @ctrl_hdl:		controls handler
>   * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
>   * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
>   * @quantization: enum v4l2_quantization, colorspace quantization
> @@ -121,6 +214,8 @@ struct mtk_jpeg_ctx {
>  	struct mtk_jpeg_q_data		cap_q;
>  	struct v4l2_fh			fh;
>  	enum mtk_jpeg_ctx_state		state;
> +	struct jpeg_enc_param		jpeg_param;
> +	struct v4l2_ctrl_handler	ctrl_hdl;
>  
>  	enum v4l2_colorspace colorspace;
>  	enum v4l2_ycbcr_encoding ycbcr_enc;
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
> index a37be1a48415..39d743fb572f 100644
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
> @@ -80,4 +81,4 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>  void mtk_jpeg_dec_reset(void __iomem *dec_reg_base);
>  void mtk_jpeg_dec_start(void __iomem *dec_reg_base);
>  
> -#endif /* _MTK_JPEG_HW_H */
> +#endif /* _MTK_JPEG_DEC_HW_H */
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> new file mode 100644
> index 000000000000..ac27774ccfed
> --- /dev/null
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> @@ -0,0 +1,175 @@
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
> +void mtk_jpeg_enc_reset(void __iomem *base)
> +{
> +	writel(0x00, base + JPGENC_RSTB);
> +	writel(JPEG_ENC_RESET_BIT, base + JPGENC_RSTB);
> +	writel(0x00, base + JPGENC_CODEC_SEL);
> +}
> +
> +u32 mtk_jpeg_enc_get_int_status(void __iomem *base)
> +{
> +	u32 ret;
> +
> +	ret = readl(base + JPGENC_INT_STS) &
> +		    JPEG_DRV_ENC_INT_STATUS_MASK_ALLIRQ;
> +	if (ret)
> +		writel(0, base + JPGENC_INT_STS);
> +
> +	return ret;
> +}
> +
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
> +{
> +	return readl(base + JPGENC_DMA_ADDR0) - readl(base + JPGENC_DST_ADDR0);
> +}

This is just used in the function below, so the code could just be moved
there.

> +
> +u32 mtk_jpeg_enc_enum_result(void __iomem *base, u32 irq_status, u32 *file_size)
> +{
> +	*file_size = mtk_jpeg_enc_get_file_size(base);
> +	if (irq_status & JPEG_DRV_ENC_INT_STATUS_DONE)
> +		return MTK_JPEG_ENC_RESULT_DONE;
> +	else if (irq_status & JPEG_DRV_ENC_INT_STATUS_STALL)
> +		return MTK_JPEG_ENC_RESULT_STALL;
> +	else if (irq_status & JPEG_DRV_ENC_INT_STATUS_VCODEC_IRQ)
> +		return MTK_JPEG_ENC_RESULT_VCODEC_IRQ;
> +	return MTK_JPEG_ENC_RESULT_ERROR_UNKNOWN;

This function seems to do two things at a time, which is confusing, given
that the name only refers to the result and doesn't mention the "file
size".

So an alternative option to my suggestion above would be removing the file
size handling from this function and using the dedicated function for it.

> +}
> +
> +static void mtk_jpeg_enc_set_blk_num(void __iomem *base, u32 blk_num)
> +{
> +	writel(blk_num, base + JPGENC_BLK_NUM);
> +}

Is there any benefit of having a lot of such small functions rather than
just doing everything needed in one function? This hardware doesn't have so
many parameters to configure and the caller side is generic V4L2 and vb2,
so there is no need for additional layer of abstraction.

How about the following model, as used by many other drivers:

mtk_jpeg_enc_set_src()
{
	// Set any registers related to source format and buffer
}

mtk_jpeg_enc_set_dst()
{
	// Set any registers related to destination format and buffer
}

mtk_jpeg_enc_set_params()
{
	// Set any registers related to additional encoding parameters
}

mtk_jpeg_enc_device_run(enc, ctx)
{
	mtk_jpeg_enc_set_src(enc, src_buf, src_fmt);
	mtk_jpeg_enc_set_dst(enc, dst_buf, dst_fmt);
	mtk_jpeg_enc_set_params(enc, ctx);
	// Trigger the hardware run
}

> +
> +static void mtk_jpeg_enc_set_encFormat(void __iomem *base, u32 enc_format)
> +{
> +	u32 value;
> +
> +	value = readl(base + JPGENC_CTRL);
> +	value &= ~JPEG_ENC_CTRL_YUV_BIT;
> +	value |= JPGENC_FORMAT(enc_format);
> +	writel(value, base + JPGENC_CTRL);

The model I suggested above also avoids this kind of read modify write
operations, which just unnecessarily add synchronous MMIO round trips, which
means more CPU overhead.

Given that the full state is always known by the driver, it can just write
all the register values without the need to read them back.

> +}
> +
> +static void mtk_jpeg_enc_set_img_size(void __iomem *base, u32 width, u32 height)
> +{
> +	u32 value;
> +
> +	value = JPGENC_WIDTH_HEIGHT(width, height);
> +	writel(value, base + JPGENC_IMG_SIZE);
> +}
> +
> +static void mtk_jpeg_enc_set_src_img(void __iomem *base, u32 width,
> +				     u32 height, u32 yuv_format,
> +				     u32 total_encdu)
> +{
> +	mtk_jpeg_enc_set_img_size(base, width, height);
> +	mtk_jpeg_enc_set_encFormat(base, yuv_format);
> +	mtk_jpeg_enc_set_blk_num(base, total_encdu);
> +}
> +
> +static void mtk_jpeg_enc_set_src_buf(void __iomem *base, u32 img_stride,
> +				     u32 mem_stride, u32 src_addr,
> +				     u32 src_addr_c)
> +{
> +	writel(img_stride, base + JPGENC_IMG_STRIDE);
> +	writel(mem_stride, base + JPGENC_STRIDE);
> +	writel(src_addr, base + JPGENC_SRC_LUMA_ADDR);
> +	writel(src_addr_c, base + JPGENC_SRC_CHROMA_ADDR);
> +}
> +
> +static void mtk_jpeg_enc_set_dst_buf(void __iomem *base, u32 dst_addr,
> +				     u32 stall_size, u32 init_offset,
> +				     u32 offset_mask)
> +{
> +	writel(JPGENC_INIT_OFFSET(init_offset), base + JPGENC_OFFSET_ADDR);
> +	writel(JPGENC_OFFSET_MASK(offset_mask), base + JPGENC_BYTE_OFFSET_MASK);
> +	writel(JPGENC_DST_ADDR(dst_addr), base + JPGENC_DST_ADDR0);
> +	writel(JPGENC_STALL_ADDR(dst_addr, stall_size),
> +	       base + JPGENC_STALL_ADDR0);
> +}
> +
> +static void mtk_jpeg_enc_set_quality(void __iomem *base, u32 quality)
> +{
> +	u32 value;
> +
> +	value = readl(base + JPGENC_QUALITY);
> +	value = JPGENC_SET_QUALITY(value, quality);

This macro is confusing. Could we just clear the quality bits explicitly
and then bitwise-OR the new value?

> +	writel(value, base + JPGENC_QUALITY);
> +}
> +
> +static void mtk_jpeg_enc_set_restart_interval(void __iomem *base,
> +					      u32 restart_interval)
> +{
> +	u32 value;
> +
> +	value = readl(base + JPGENC_CTRL);
> +	if (restart_interval)
> +		value |= JPEG_ENC_CTRL_RESTART_EN_BIT;
> +	else
> +		value &= ~JPEG_ENC_CTRL_RESTART_EN_BIT;
> +	writel(value, base + JPGENC_CTRL);
> +	writel(restart_interval, base + JPGENC_RST_MCU_NUM);
> +}
> +
> +static void mtk_jpeg_enc_set_encode_mode(void __iomem *base, u32 exif_en)
> +{
> +	u32 value;
> +
> +	value = readl(base + JPGENC_CTRL);
> +	value &= ~JPEG_ENC_CTRL_FILE_FORMAT_BIT;
> +	writel(value, base + JPGENC_CTRL);
> +
> +	if (exif_en) {
> +		value = readl(base + JPGENC_CTRL);
> +		value |= JPEG_ENC_EN_JFIF_EXIF;
> +		writel(value, base + JPGENC_CTRL);
> +	}
> +}
> +
> +static void mtk_jpeg_enc_set_ctrl_cfg(void __iomem *base, u32 exif_en,
> +				      u32 quality, u32 restart_interval)
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
> +	value = readl(base + JPGENC_CTRL);
> +	value |= JPEG_ENC_CTRL_INT_EN_BIT | JPEG_ENC_CTRL_ENABLE_BIT;
> +	writel(value, base + JPGENC_CTRL);
> +}
> +
> +void mtk_jpeg_enc_set_config(void __iomem *base,
> +			     struct mtk_jpeg_enc_param *config,
> +			     struct mtk_jpeg_enc_bs *bs,
> +			     struct mtk_jpeg_enc_fb *fb)
> +{
> +	mtk_jpeg_enc_set_src_img(base, config->enc_w, config->enc_h,
> +				 config->enc_format, config->total_encdu);
> +	mtk_jpeg_enc_set_src_buf(base, config->img_stride, config->mem_stride,
> +				 fb->fb_addr[0].dma_addr,
> +				 fb->fb_addr[1].dma_addr);
> +	mtk_jpeg_enc_set_dst_buf(base, bs->dma_addr, bs->size,
> +				 bs->dma_addr_offset, bs->dma_addr_offsetmask);
> +	mtk_jpeg_enc_set_ctrl_cfg(base, config->enable_exif,
> +				  config->enc_quality,
> +				  config->restart_interval);
> +}
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> new file mode 100644
> index 000000000000..7080240f6dac
> --- /dev/null
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> @@ -0,0 +1,60 @@
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
> +#define JPEG_ENC_DST_ADDR_OFFSET_MASK GENMASK(3, 0)
> +
> +#define JPEG_ENC_CTRL_YUV_BIT 0x18

0x18 isn't a single bit as the _BIT suffix would suggest. Perhaps
JPEG_ENC_CTRL_FORMAT_MASK would be more appropriate?

> +#define JPEG_ENC_CTRL_RESTART_EN_BIT            BIT(10)
> +#define JPEG_ENC_CTRL_FILE_FORMAT_BIT           BIT(5)
> +#define JPEG_ENC_EN_JFIF_EXIF                   BIT(5)
> +#define JPEG_ENC_CTRL_INT_EN_BIT                BIT(2)
> +#define JPEG_ENC_CTRL_ENABLE_BIT                BIT(0)
> +#define JPEG_ENC_RESET_BIT                      BIT(0)
> +
> +enum {
> +	MTK_JPEG_ENC_RESULT_DONE		= 0,
> +	MTK_JPEG_ENC_RESULT_STALL,
> +	MTK_JPEG_ENC_RESULT_VCODEC_IRQ,
> +	MTK_JPEG_ENC_RESULT_ERROR_UNKNOWN
> +};

Do we need these intermediate error codes? Could we just use errno values
instead?

> +
> +struct mtk_jpeg_enc_bs {
> +	dma_addr_t	dma_addr;
> +	size_t		size;
> +	u32			dma_addr_offset;
> +	u32			dma_addr_offsetmask;
> +};
> +
> +struct mtk_jpeg_mem {
> +	dma_addr_t	dma_addr;
> +	size_t		size;
> +};
> +
> +struct mtk_jpeg_enc_fb {
> +	struct mtk_jpeg_mem	fb_addr[MTK_JPEG_COMP_MAX];
> +	u32			num_planes;
> +};

Please add kerneldoc comments to the structs above.

nit: Separating types from names with a single space is more future-proof,
in case someone needs to change the layout of the struct or rename fields.

> +
> +void mtk_jpeg_enc_reset(void __iomem *base);
> +u32 mtk_jpeg_enc_get_int_status(void __iomem *base);
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base);
> +u32 mtk_jpeg_enc_enum_result(void __iomem *base, u32 irq_status,
> +			     u32 *file_size);
> +void mtk_jpeg_enc_start(void __iomem *enc_reg_base);
> +void mtk_jpeg_enc_set_config(void __iomem *base,
> +			     struct mtk_jpeg_enc_param *config,
> +			     struct mtk_jpeg_enc_bs *bs,
> +			     struct mtk_jpeg_enc_fb *fb);
> +#endif /* _MTK_JPEG_ENC_HW_H */
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> new file mode 100644
> index 000000000000..d785621cb4c6
> --- /dev/null
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Xia Jiang <xia.jiang@mediatek.com>
> + *
> + */
> +#ifndef _MTK_JPEG_ENC_REG_H
> +#define _MTK_JPEG_ENC_REG_H
> +#define MTK_JPEG_COMP_MAX		3

This doesn't look like a register-specific definition.

> +
> +#define JPEG_DRV_ENC_INT_STATUS_DONE			BIT(0)
> +#define JPEG_DRV_ENC_INT_STATUS_STALL			BIT(1)
> +#define JPEG_DRV_ENC_INT_STATUS_VCODEC_IRQ		BIT(4)
> +#define JPEG_DRV_ENC_INT_STATUS_MASK_ALLIRQ		0x13

Could we define this as an | of the specific bit definitions above rather
than hardcoding?

> +
> +#define JPGENC_RSTB				0x100

Could we agree on a consistent prefix for macros? Some use JPEG_ENC, some
JPEG_DRV_ENC and some JPGENC. How about using JPEG_ENC everywhere?

> +#define JPGENC_CTRL				0x104
> +#define JPGENC_QUALITY				0x108
> +#define JPGENC_BLK_NUM				0x10C

nit: Hex numerals in the kernel are lowercase.

> +#define JPGENC_BLK_CNT				0x110
> +#define JPGENC_INT_STS				0x11C
> +#define JPGENC_DST_ADDR0			0x120
> +#define JPGENC_DMA_ADDR0			0x124
> +#define JPGENC_STALL_ADDR0			0x128
> +#define JPGENC_OFFSET_ADDR			0x138
> +#define JPGENC_RST_MCU_NUM			0x150
> +#define JPGENC_IMG_SIZE				0x154
> +#define JPGENC_DEBUG_INFO0			0x160
> +#define JPGENC_DEBUG_INFO1			0x164
> +#define JPGENC_TOTAL_CYCLE			0x168
> +#define JPGENC_BYTE_OFFSET_MASK			0x16C
> +#define JPGENC_SRC_LUMA_ADDR			0x170
> +#define JPGENC_SRC_CHROMA_ADDR			0x174
> +#define JPGENC_STRIDE				0x178
> +#define JPGENC_IMG_STRIDE			0x17C
> +#define JPGENC_DCM_CTRL				0x300
> +#define JPGENC_CODEC_SEL			0x314
> +#define JPGENC_ULTRA_THRES			0x318
> +
> +#define JPGENC_FORMAT(x)		(((x) & 3) << 3)
> +#define JPGENC_WIDTH_HEIGHT(w, h)	(((w) << 16) | (h))
> +#define JPGENC_INIT_OFFSET(x)		((x) & (~0xF))
> +#define JPGENC_OFFSET_MASK(x)		((x) & 0xF)
> +#define JPGENC_DST_ADDR(x)		((x) & (~0xF))
> +#define JPGENC_STALL_ADDR(x, y)		(((x) + (y)) & (~0xF))
> +#define JPGENC_QUALITY_MASK		0xFFFF0000
> +#define JPGENC_SET_QUALITY(x, y)	(((x) & JPGENC_QUALITY_MASK) | (y))

JPGENC_QUALITY_MASK is only used here, so 0xffff0000 could be just used
directly.

> +
> +#endif /* _MTK_JPEG_ENC_REG_H */

I can see some bits defined in mtk_jpeg_enc_hw.h as well. Perhaps all these
could be moved there too, which would make us have 1 file less?

Best regards,
Tomasz
