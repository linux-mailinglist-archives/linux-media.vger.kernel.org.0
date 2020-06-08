Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C891F1703
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 12:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbgFHKyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 06:54:45 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48547 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbgFHKyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 06:54:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iFQEjQOAvCKzeiFQHjlkRl; Mon, 08 Jun 2020 12:54:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591613675; bh=JwiNATWvHmYPC822WoZvJngHWwwJGvWgPN16ySnOo58=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=T/sjhwoJcrYywHLU7bPr54rWUbjlh7tPVFa2uLee6MsOoXIi70Q403e6lxsT+8B8r
         OtmZvEItM/kSl37ujukyzvd+N98GKPihb6Cp3AYc1h6zx2NCJQ8V8oJQcszAEmucV8
         oGiWH4nRlCMrAXABUu224G/jhv43uVUSM7uoG/JWLwVteER8gNmXlI17Dw7Hn8Ql+f
         7YAvhUQV66djMEjiM7Nr9pVssyg3M9WTU7nlNt64acgBVlbSNcTSTJwnxd5SmOF0j9
         PKOY4+2/74AOu8SndRNc05iuaiNMr6XvPxbSHh4t1EZA2tp57jmEqhdQt3ZZkwchV7
         07nn6D6mfAIxQ==
Subject: Re: [PATCH RESEND v9 18/18] media: platform: Add jpeg enc feature
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        senozhatsky@chromium.org, mojahsu@chromium.org,
        drinkcat@chromium.org, maoguang.meng@mediatek.com,
        sj.huang@mediatek.com
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-20-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ad649e4e-bc7e-3443-37fa-4dd64bef76db@xs4all.nl>
Date:   Mon, 8 Jun 2020 12:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200604090553.10861-20-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFZtUiLhwOOZqX7dHKnJuPRHIdNJkSbibRMdpM4yssmj5MEelfUf4Dffc85UV1PFqxglu9FMIljH2jFoaz89504BSIO5NEVn9nn3Nx1uGLLXEjx41TMh
 CiDyylLkeXZrb2esBRdC2YvwDeMSBJeXhZUAuxQrvr4dBk7zL6zt3NEGUqjgTAx3x3i1OfpQnVrse3T6l3L8bI3sLAqlrzmPWWpEmXc1UEzXOwYp7YRAz+yS
 sHL/EpE/Eelcs8DZBcvzVHLtliDhsgzYRXNoqJ7vWMlwN112j95UrF+6Kk4BOnNL+QK8gNs87DCQF4Q/07PaU9R7e7JsuCrIqRvZyataa7a40ZBgMgAtYrg0
 feediZbgbGa2DJV647p7wWuXUzQQ4lkZW6iB8m1HV596JlEm2UoqR2x5La1KzTH8wCL/zgQAC87GI2XkSMD0twGx+2iPctZjSpkgKEtpRyNpTUpVzXRgt53/
 u/h5wCEqRLxHAx+FUmSrLd7MJOGPYXJkQmYgeMuXjOMkWaahGWOTZ2rIo205aSAs5LtFptj3qDc6+Ufu5tzQp53DVqdnr15Hdit5erKeTQasQI9IUoyL8HcI
 I2A5iz9jeCwmUix8JghB25gc/72F8I77zkmcE3yL/SWC0c8gIm7yV5277nMjdnmbXVF9K2dbPIJilL/lksQJJPcZFF1SlAfaBUsGuXiiWeIijbo0H+ND/aIS
 l8zn/sFs8V2letNQ0LhgVkNzJSOI8ju3OeAXtESpxww7Sa0+v6jSvhdMowMSzxCL5RaL6Cn54hruEpxFGrtb2sF69bXBhNwfhpMarQP4M6shOX2GKF2HJw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/06/2020 11:05, Xia Jiang wrote:
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
> index 29b8b82c606c..d7ef69920530 100644
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
> @@ -23,10 +24,59 @@
>  #include <media/videobuf2-dma-contig.h>
>  #include <soc/mediatek/smi.h>
>  
> +#include "mtk_jpeg_enc_hw.h"
>  #include "mtk_jpeg_dec_hw.h"
>  #include "mtk_jpeg_core.h"
>  #include "mtk_jpeg_dec_parse.h"
>  
> +static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
> +	{
> +		.fourcc		= V4L2_PIX_FMT_JPEG,
> +		.colplanes	= 1,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_CAPTURE,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_NV12M,
> +		.hw_format	= JPEG_ENC_YUV_FORMAT_NV12,
> +		.h_sample	= {4, 4},
> +		.v_sample	= {4, 2},
> +		.colplanes	= 2,
> +		.h_align	= 4,
> +		.v_align	= 4,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_OUTPUT,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_NV21M,
> +		.hw_format	= JEPG_ENC_YUV_FORMAT_NV21,
> +		.h_sample	= {4, 4},
> +		.v_sample	= {4, 2},
> +		.colplanes	= 2,
> +		.h_align	= 4,
> +		.v_align	= 4,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_OUTPUT,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_YUYV,
> +		.hw_format	= JPEG_ENC_YUV_FORMAT_YUYV,
> +		.h_sample	= {8},
> +		.v_sample	= {4},
> +		.colplanes	= 1,
> +		.h_align	= 5,
> +		.v_align	= 3,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_OUTPUT,
> +	},
> +	{
> +		.fourcc		= V4L2_PIX_FMT_YVYU,
> +		.hw_format	= JPEG_ENC_YUV_FORMAT_YVYU,
> +		.h_sample	= {8},
> +		.v_sample	= {4},
> +		.colplanes	= 1,
> +		.h_align	= 5,
> +		.v_align	= 3,
> +		.flags		= MTK_JPEG_FMT_FLAG_ENC_OUTPUT,
> +	},
> +};
> +
>  static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
>  	{
>  		.fourcc		= V4L2_PIX_FMT_JPEG,
> @@ -53,6 +103,7 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
>  	},
>  };
>  
> +#define MTK_JPEG_ENC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_enc_formats)
>  #define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
>  
>  struct mtk_jpeg_src_buf {
> @@ -64,6 +115,11 @@ struct mtk_jpeg_src_buf {
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
> @@ -75,6 +131,19 @@ static inline struct mtk_jpeg_src_buf *mtk_jpeg_vb2_to_srcbuf(
>  	return container_of(to_vb2_v4l2_buffer(vb), struct mtk_jpeg_src_buf, b);
>  }
>  
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
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops mtk_jpeg_enc_ctrl_ops = {
> +	.s_ctrl = vidioc_jpeg_enc_s_ctrl,
> +};
> +
> +static int mtk_jpeg_enc_ctrls_setup(struct mtk_jpeg_ctx *ctx)
> +{
> +	const struct v4l2_ctrl_ops *ops = &mtk_jpeg_enc_ctrl_ops;
> +	struct v4l2_ctrl_handler *handler = &ctx->ctrl_hdl;
> +
> +	v4l2_ctrl_handler_init(handler, 3);
> +
> +	v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_RESTART_INTERVAL, 0, 100,
> +			  1, 0);
> +	v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_COMPRESSION_QUALITY, 48,
> +			  100, 1, 90);
> +	v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_ACTIVE_MARKER, 0,
> +			  V4L2_JPEG_ACTIVE_MARKER_APP1, 0, 0);
> +
> +	if (handler->error) {
> +		v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +		return handler->error;
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
> @@ -109,6 +226,14 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
>  	return 0;
>  }
>  
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
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	int i;
>  
>  	pix_mp->field = V4L2_FIELD_NONE;
> -
> -	if (ctx->state != MTK_JPEG_INIT) {
> -		mtk_jpeg_adjust_fmt_mplane(ctx, f);

The removal of this function seems unrelated to adding the jpeg enc feature.
It's not obvious to me why this is no longer needed and what replaces it.

I think this is something that should be split off to its own patch.

> -		return 0;
> -	}
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

This is probably related to the same mtk_jpeg_adjust_fmt_mplane() removal.

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

If TGT_CROP can be set, then g_selection should return ctx->out_q.crop_rect
for that target, and not ctx->out_q.w/h. That's for CROP_BOUNDS/CROP_DEFAULT
only.

> +		s->r.left = 0;
> +		s->r.top = 0;
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

Is it a hardware limitation that left/top can only be 0?

> +		s->r.width = min(s->r.width, ctx->out_q.w);
> +		s->r.height = min(s->r.height, ctx->out_q.h);
> +		ctx->out_q.crop_rect = s->r;

I'd rename crop_rect to enc_crop_rect.

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

I also looked at the current decoder selection code and I see no reason why
s_selection is supported at all for the decoder since you can't actually set
a compose rectangle, whatever you pass is just ignored.

I would recommend that mtk_jpeg_dec_s_selection() is just removed in a separate
patch. The presence of that ioctl suggests that you can set the compose rectangle
when in reality you can't. That can be confusing for applications.

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
> +	.vidioc_subscribe_event         = mtk_jpeg_subscribe_event,
> +	.vidioc_g_selection		= mtk_jpeg_enc_g_selection,
> +	.vidioc_s_selection		= mtk_jpeg_enc_s_selection,
> +
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf                = v4l2_m2m_ioctl_querybuf,
> +	.vidioc_dqbuf                   = v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_expbuf                  = v4l2_m2m_ioctl_expbuf,
> +	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
> +
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +};
> +
>  static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
>  	.vidioc_querycap                = mtk_jpeg_dec_querycap,
>  	.vidioc_enum_fmt_vid_cap	= mtk_jpeg_dec_enum_fmt_vid_cap,
> @@ -575,8 +832,9 @@ static bool mtk_jpeg_check_resolution_change(struct mtk_jpeg_ctx *ctx,
>  	}
>  
>  	q_data = &ctx->cap_q;
> -	if (q_data->fmt != mtk_jpeg_find_format(ctx, param->dst_fourcc,
> -						MTK_JPEG_FMT_TYPE_CAPTURE)) {
> +	if (q_data->fmt !=
> +	    mtk_jpeg_find_format(param->dst_fourcc,
> +				 MTK_JPEG_FMT_FLAG_DEC_CAPTURE)) {
>  		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "format change\n");
>  		return true;
>  	}
> @@ -597,9 +855,8 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
>  	q_data = &ctx->cap_q;
>  	q_data->w = param->dec_w;
>  	q_data->h = param->dec_h;
> -	q_data->fmt = mtk_jpeg_find_format(ctx,
> -					   param->dst_fourcc,
> -					   MTK_JPEG_FMT_TYPE_CAPTURE);
> +	q_data->fmt = mtk_jpeg_find_format(param->dst_fourcc,
> +					   MTK_JPEG_FMT_FLAG_DEC_CAPTURE);
>  
>  	for (i = 0; i < q_data->fmt->colplanes; i++) {
>  		q_data->bytesperline[i] = param->mem_stride[i];
> @@ -616,6 +873,17 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
>  		 param->dec_w, param->dec_h);
>  }
>  
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
> +		if (ret) {
> +			while (--i >= 0)
> +				clk_disable_unprepare(jpeg->clocks[i]);
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
> +	enc_irq_ret = mtk_jpeg_enc_enum_result(jpeg->reg_base, enc_ret);
> +
> +	if (enc_irq_ret >= MTK_JPEG_ENC_RESULT_STALL)
> +		mtk_jpeg_enc_reset(jpeg->reg_base);
> +
> +	if (enc_irq_ret != MTK_JPEG_ENC_RESULT_DONE) {
> +		dev_err(jpeg->dev, "encode failed\n");
> +		goto enc_end;
> +	}
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

Huh? It's allocated, but not freed?

This appears to be a temporary struct, so why not just do:

	struct v4l2_pix_format_mplane pix_mp = {};

> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> +	ctx->colorspace = V4L2_COLORSPACE_JPEG,
> +	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> +	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +	pix_mp->width = MTK_JPEG_MIN_WIDTH;
> +	pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> +
> +	q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_YUYV,
> +				      MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> +	vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> +				    fmt.pix_mp), q->fmt);

Yuck. Just change the vidioc_try_fmt prototype where the first argument is
a v4l2_pix_format_mplane pointer instead of a v4l2_format pointer.

> +	q->w = pix_mp->width;
> +	q->h = pix_mp->height;
> +	q->crop_rect.width = pix_mp->width;
> +	q->crop_rect.height = pix_mp->height;
> +	q->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> +	q->bytesperline[0] = pix_mp->plane_fmt[0].bytesperline;
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
> +}
> +
>  static void mtk_jpeg_set_dec_default_params(struct mtk_jpeg_ctx *ctx)
>  {
>  	struct mtk_jpeg_q_data *q = &ctx->out_q;
> +	struct v4l2_pix_format_mplane *pix_mp;
>  	int i;
>  
> +	pix_mp = kmalloc(sizeof(*pix_mp), GFP_KERNEL);

Ditto.

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
>  static const struct v4l2_file_operations mtk_jpeg_dec_fops = {
>  	.owner          = THIS_MODULE,
>  	.open           = mtk_jpeg_dec_open,
> @@ -993,6 +1563,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  {
>  	struct device_node *node;
>  	struct platform_device *pdev;
> +	int i;
>  
>  	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
>  	if (!node)
> @@ -1006,12 +1577,17 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  
>  	jpeg->larb = &pdev->dev;
>  
> -	jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
> -	if (IS_ERR(jpeg->clk_jdec))
> -		return PTR_ERR(jpeg->clk_jdec);
> +	for (i = 0; i < jpeg->variant->num_clocks; i++) {
> +		jpeg->clocks[i] = devm_clk_get(jpeg->dev,
> +					       jpeg->variant->clk_names[i]);
> +		if (IS_ERR(jpeg->clocks[i])) {
> +			dev_err(&pdev->dev, "failed to get clock: %s\n",
> +				jpeg->variant->clk_names[i]);
> +			return PTR_ERR(jpeg->clocks[i]);
> +		}
> +	}
>  
> -	jpeg->clk_jdec_smi = devm_clk_get(jpeg->dev, "jpgdec-smi");
> -	return PTR_ERR_OR_ZERO(jpeg->clk_jdec_smi);
> +	return 0;
>  }
>  
>  static int mtk_jpeg_probe(struct platform_device *pdev)
> @@ -1028,6 +1604,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	mutex_init(&jpeg->lock);
>  	spin_lock_init(&jpeg->hw_lock);
>  	jpeg->dev = &pdev->dev;
> +	jpeg->variant = of_device_get_match_data(jpeg->dev);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
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
>  	jpeg->vdev->minor = -1;
>  	jpeg->vdev->release = video_device_release;
>  	jpeg->vdev->lock = &jpeg->lock;
> @@ -1095,8 +1685,9 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  
>  	video_set_drvdata(jpeg->vdev, jpeg);
>  	v4l2_info(&jpeg->v4l2_dev,
> -		  "decoder device registered as /dev/video%d (%d,%d)\n",
> -		  jpeg->vdev->num, VIDEO_MAJOR, jpeg->vdev->minor);
> +		  "jpeg %s device registered as /dev/video%d (%d,%d)\n",
> +		  jpeg->variant->is_encoder ? "enc" : "dec", jpeg->vdev->num,
> +		  VIDEO_MAJOR, jpeg->vdev->minor);
>  
>  	platform_set_drvdata(pdev, jpeg);
>  
> @@ -1187,14 +1778,36 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops = {
>  	SET_RUNTIME_PM_OPS(mtk_jpeg_pm_suspend, mtk_jpeg_pm_resume, NULL)
>  };
>  
> +static struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
> +	.is_encoder	= false,
> +	.clk_names	= {"jpgdec-smi", "jpgdec"},
> +	.num_clocks	= 2,
> +};
> +
> +static struct mtk_jpeg_variant mt2701_jpeg_drvdata = {
> +	.is_encoder	= false,
> +	.clk_names	= {"jpgdec-smi", "jpgdec"},
> +	.num_clocks	= 2,
> +};
> +
> +static struct mtk_jpeg_variant mtk_jpeg_drvdata = {
> +	.is_encoder	= true,
> +	.clk_names	= {"jpgenc"},
> +	.num_clocks	= 1,
> +};
> +
>  static const struct of_device_id mtk_jpeg_match[] = {
>  	{
>  		.compatible = "mediatek,mt8173-jpgdec",
> -		.data       = NULL,
> +		.data = &mt8173_jpeg_drvdata,
>  	},
>  	{
>  		.compatible = "mediatek,mt2701-jpgdec",
> -		.data       = NULL,
> +		.data = &mt2701_jpeg_drvdata,
> +	},
> +	{
> +		.compatible = "mediatek,mtk-jpgenc",
> +		.data = &mtk_jpeg_drvdata,
>  	},
>  	{},
>  };
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
>  #define MTK_JPEG_FMT_FLAG_DEC_OUTPUT	BIT(0)
>  #define MTK_JPEG_FMT_FLAG_DEC_CAPTURE	BIT(1)
> -
> -#define MTK_JPEG_FMT_TYPE_OUTPUT	1
> -#define MTK_JPEG_FMT_TYPE_CAPTURE	2
> +#define MTK_JPEG_FMT_FLAG_ENC_OUTPUT	BIT(2)
> +#define MTK_JPEG_FMT_FLAG_ENC_CAPTURE	BIT(3)
>  
>  #define MTK_JPEG_MIN_WIDTH	32U
>  #define MTK_JPEG_MIN_HEIGHT	32U
> -#define MTK_JPEG_MAX_WIDTH	8192U
> -#define MTK_JPEG_MAX_HEIGHT	8192U
> +#define MTK_JPEG_MAX_WIDTH	65535U
> +#define MTK_JPEG_MAX_HEIGHT	65535U
>  
>  #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
> +#define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
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
> +};
> +
>  /**
>   * struct mt_jpeg - JPEG IP abstraction
>   * @lock:		the mutex protecting this structure
> @@ -53,9 +68,9 @@ enum mtk_jpeg_ctx_state {
>   * @alloc_ctx:		videobuf2 memory allocator's context
>   * @vdev:		video device node for jpeg mem2mem mode
>   * @reg_base:		JPEG registers mapping
> - * @clk_jdec:		JPEG hw working clock
> - * @clk_jdec_smi:	JPEG SMI bus clock
>   * @larb:		SMI device
> + * @clocks:		JPEG IP clock(s)
> + * @variant:		driver variant to be used
>   */
>  struct mtk_jpeg_dev {
>  	struct mutex		lock;
> @@ -67,14 +82,15 @@ struct mtk_jpeg_dev {
>  	void			*alloc_ctx;
>  	struct video_device	*vdev;
>  	void __iomem		*reg_base;
> -	struct clk		*clk_jdec;
> -	struct clk		*clk_jdec_smi;
>  	struct device		*larb;
> +	struct clk		*clocks[MTK_JPEG_MAX_CLOCKS];
> +	const struct mtk_jpeg_variant *variant;
>  };
>  
>  /**
>   * struct jpeg_fmt - driver's internal color format data
>   * @fourcc:	the fourcc code, 0 if not applicable
> + * @hw_format:	hardware format value
>   * @h_sample:	horizontal sample count of plane in 4 * 4 pixel image
>   * @v_sample:	vertical sample count of plane in 4 * 4 pixel image
>   * @colplanes:	number of color planes (1 for packed formats)
> @@ -84,6 +100,7 @@ struct mtk_jpeg_dev {
>   */
>  struct mtk_jpeg_fmt {
>  	u32	fourcc;
> +	u32	hw_format;
>  	int	h_sample[VIDEO_MAX_PLANES];
>  	int	v_sample[VIDEO_MAX_PLANES];
>  	int	colplanes;
> @@ -107,6 +124,7 @@ struct mtk_jpeg_q_data {
>  	u32			h;
>  	u32			bytesperline[VIDEO_MAX_PLANES];
>  	u32			sizeimage[VIDEO_MAX_PLANES];
> +	struct v4l2_rect	crop_rect;
>  };
>  
>  /**
> @@ -116,6 +134,10 @@ struct mtk_jpeg_q_data {
>   * @cap_q:		destination (capture) queue queue information
>   * @fh:			V4L2 file handle
>   * @state:		state of the context
> + * @enable_exif:	enable exif mode of jpeg encoder
> + * @enc_quality:	jpeg encoder quality
> + * @restart_interval:	jpeg encoder restart interval
> + * @ctrl_hdl:		controls handler
>   * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
>   * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
>   * @quantization: enum v4l2_quantization, colorspace quantization
> @@ -127,6 +149,10 @@ struct mtk_jpeg_ctx {
>  	struct mtk_jpeg_q_data		cap_q;
>  	struct v4l2_fh			fh;
>  	enum mtk_jpeg_ctx_state		state;
> +	bool				enable_exif;
> +	u8				enc_quality;
> +	u8				restart_interval;
> +	struct v4l2_ctrl_handler	ctrl_hdl;
>  
>  	enum v4l2_colorspace colorspace;
>  	enum v4l2_ycbcr_encoding ycbcr_enc;
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
> +{
> +	writel(0x00, base + JPEG_ENC_RSTB);
> +	writel(JPEG_ENC_RESET_BIT, base + JPEG_ENC_RSTB);
> +	writel(0x00, base + JPEG_ENC_CODEC_SEL);
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
> +
> +void mtk_jpeg_enc_set_img_size(void __iomem *base, u32 width, u32 height)
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
> +void mtk_jpeg_enc_set_src_addr(void __iomem *base, u32 src_addr,
> +			       u32 plane_index)
> +{
> +	if (!plane_index)
> +		writel(src_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
> +	else
> +		writel(src_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
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
> +void mtk_jpeg_enc_set_config(void __iomem *base, u32 enc_format, bool exif_en,
> +			     u32 quality, u32 restart_interval)
> +{
> +	mtk_jpeg_enc_set_quality(base, quality);
> +
> +	mtk_jpeg_enc_set_ctrl(base, enc_format, exif_en, restart_interval);
> +
> +	writel(restart_interval, base + JPEG_ENC_RST_MCU_NUM);
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
> index 000000000000..73faf49b667c
> --- /dev/null
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> @@ -0,0 +1,123 @@
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
> +
> +#define JPEG_ENC_INT_STATUS_DONE	BIT(0)
> +#define JPEG_ENC_INT_STATUS_STALL	BIT(1)
> +#define JPEG_ENC_INT_STATUS_VCODEC_IRQ	BIT(4)
> +#define JPEG_ENC_INT_STATUS_MASK_ALLIRQ	0x13
> +
> +#define JPEG_ENC_DST_ADDR_OFFSET_MASK	GENMASK(3, 0)
> +#define JPEG_ENC_QUALITY_MASK		GENMASK(31, 16)
> +
> +#define JPEG_ENC_CTRL_YUV_FORMAT_MASK	0x18
> +#define JPEG_ENC_CTRL_RESTART_EN_BIT	BIT(10)
> +#define JPEG_ENC_CTRL_FILE_FORMAT_BIT	BIT(5)
> +#define JPEG_ENC_CTRL_INT_EN_BIT	BIT(2)
> +#define JPEG_ENC_CTRL_ENABLE_BIT	BIT(0)
> +#define JPEG_ENC_RESET_BIT		BIT(0)
> +
> +#define JPEG_ENC_YUV_FORMAT_YUYV	0
> +#define JPEG_ENC_YUV_FORMAT_YVYU	1
> +#define JPEG_ENC_YUV_FORMAT_NV12	2
> +#define JEPG_ENC_YUV_FORMAT_NV21	3
> +
> +#define JPEG_ENC_QUALITY_Q60		0x0
> +#define JPEG_ENC_QUALITY_Q80		0x1
> +#define JPEG_ENC_QUALITY_Q90		0x2
> +#define JPEG_ENC_QUALITY_Q95		0x3
> +#define JPEG_ENC_QUALITY_Q39		0x4
> +#define JPEG_ENC_QUALITY_Q68		0x5
> +#define JPEG_ENC_QUALITY_Q84		0x6
> +#define JPEG_ENC_QUALITY_Q92		0x7
> +#define JPEG_ENC_QUALITY_Q48		0x8
> +#define JPEG_ENC_QUALITY_Q74		0xa
> +#define JPEG_ENC_QUALITY_Q87		0xb
> +#define JPEG_ENC_QUALITY_Q34		0xc
> +#define JPEG_ENC_QUALITY_Q64		0xe
> +#define JPEG_ENC_QUALITY_Q82		0xf
> +#define JPEG_ENC_QUALITY_Q97		0x10
> +
> +#define JPEG_ENC_RSTB			0x100
> +#define JPEG_ENC_CTRL			0x104
> +#define JPEG_ENC_QUALITY		0x108
> +#define JPEG_ENC_BLK_NUM		0x10C
> +#define JPEG_ENC_BLK_CNT		0x110
> +#define JPEG_ENC_INT_STS		0x11c
> +#define JPEG_ENC_DST_ADDR0		0x120
> +#define JPEG_ENC_DMA_ADDR0		0x124
> +#define JPEG_ENC_STALL_ADDR0		0x128
> +#define JPEG_ENC_OFFSET_ADDR		0x138
> +#define JPEG_ENC_RST_MCU_NUM		0x150
> +#define JPEG_ENC_IMG_SIZE		0x154
> +#define JPEG_ENC_DEBUG_INFO0		0x160
> +#define JPEG_ENC_DEBUG_INFO1		0x164
> +#define JPEG_ENC_TOTAL_CYCLE		0x168
> +#define JPEG_ENC_BYTE_OFFSET_MASK	0x16c
> +#define JPEG_ENC_SRC_LUMA_ADDR		0x170
> +#define JPEG_ENC_SRC_CHROMA_ADDR	0x174
> +#define JPEG_ENC_STRIDE			0x178
> +#define JPEG_ENC_IMG_STRIDE		0x17c
> +#define JPEG_ENC_DCM_CTRL		0x300
> +#define JPEG_ENC_CODEC_SEL		0x314
> +#define JPEG_ENC_ULTRA_THRES		0x318
> +
> +enum {
> +	MTK_JPEG_ENC_RESULT_DONE,
> +	MTK_JPEG_ENC_RESULT_STALL,
> +	MTK_JPEG_ENC_RESULT_VCODEC_IRQ
> +};
> +
> +/**
> + * struct mtk_jpeg_enc_qlt - JPEG encoder quality data
> + * @quality_param:	quality value
> + * @hardware_value:	hardware value of quality
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
> +	u32		dma_addr_offset;
> +	u32		dma_addr_offsetmask;
> +};
> +
> +void mtk_jpeg_enc_reset(void __iomem *base);
> +u32 mtk_jpeg_enc_get_and_clear_int_status(void __iomem *base);
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base);
> +u32 mtk_jpeg_enc_enum_result(void __iomem *base, u32 irq_status);
> +void mtk_jpeg_enc_set_img_size(void __iomem *base, u32 width, u32 height);
> +void mtk_jpeg_enc_set_blk_num(void __iomem *base, u32 enc_format, u32 width,
> +			      u32 height);
> +void mtk_jpeg_enc_set_stride(void __iomem *base, u32 enc_format, u32 width,
> +			     u32 height, u32 bytesperline);
> +void mtk_jpeg_enc_set_src_addr(void __iomem *base, u32 src_addr,
> +			       u32 plane_index);
> +void mtk_jpeg_enc_set_dst_addr(void __iomem *base, u32 dst_addr,
> +			       u32 stall_size, u32 init_offset,
> +			       u32 offset_mask);
> +void mtk_jpeg_enc_set_config(void __iomem *base, u32 enc_format, bool exif_en,
> +			     u32 quality, u32 restart_interval);
> +void mtk_jpeg_enc_start(void __iomem *enc_reg_base);
> +
> +#endif /* _MTK_JPEG_ENC_HW_H */
> 

Regards,

	Hans
