Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA195BEEAD
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 11:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbfIZJrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 05:47:01 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45729 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727450AbfIZJrB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 05:47:01 -0400
Received: from [IPv6:2001:420:44c1:2577:ecda:45b4:8d5:2e68] ([IPv6:2001:420:44c1:2577:ecda:45b4:8d5:2e68])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DQMPiCwYX9D4hDQMSi4PBY; Thu, 26 Sep 2019 11:46:57 +0200
Subject: Re: [PATCH v3 5/5] media: platform: Add jpeg dec/enc feature
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com
References: <20190924074303.22713-1-xia.jiang@mediatek.com>
 <20190924074303.22713-6-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1298ebe9-0109-1994-302d-b234e1f839ba@xs4all.nl>
Date:   Thu, 26 Sep 2019 11:46:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924074303.22713-6-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKx7IkYJyu+58YFMDqbapBJnWJAihrzPfpf0k2T657NjnBnsC6YoA3Xa/jSq8ENeppM9Amb0cREx0PJKM8btNplPoMd4aIbMWX0E9MCmE8KzXZUIqQb0
 yZxnkKDHZkK4LcdfP9eZu1dZDfqPVcwBNAmoPNI9EdtCW6D4Ll5Pi0TFUOmlwYKUlHYoPqwZLp5U4mVIeNrERQLJ+1wNyIZ/7MGp5j8iyXBTrWinEI/gWcNm
 IGjTXArWksM1vuUvgdRFQtp5ObrRu0r11hPh+Pw4DosYP5YnUMVGsgYcdWF17lT3SABoTk7C1lzO3ec+LZUsPFaup9B5wYe4l2fPbQaOmGfCRcfrJHi7Ys5Q
 yBV2VaCVNf4qkvPNdGQA1WB0ZzLErpXA+uoRvbQ9Af1vm3E+bDzWOFi6nKMCtUSD5OW1VewRdoKF0DqADh4m79GZIgC2Swm5VZRtU4+KcVWdrOefmrDa+MQ1
 EFOLRuGIqBcrYgBHPxpFyowajql0oDcB0RobcfbUPBtG62/v1K4odXhcyJR7CQ+b4aiFVU2105NwtXHNGOWug9fbjF9CHUeYnsNiWWBPk27sJkfzUCR7qv+S
 sQgVUdQhMTfsFNf5C99hOE2qyZfxWGAbkJ/cR5B1xitY3BhAz24n8xmCdJeZYmm2G6xfLmENAHDgJpEAUQ8b9rDe9FiGhgIVhADBfnTPDguZ/w2IjA2YMPcN
 NCoVnV3eEeR4pJmYSBX7+1hKwgcIAZgukP8Ardd/tRX5AImw6W3/gg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/24/19 9:43 AM, Xia Jiang wrote:
> Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> decode and encode have great similarities with function operation.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v3: delete Change-Id
>     only test once handler->error after the last v4l2_ctrl_new_std()
>     seperate changes of v4l2-ctrls.c and v4l2-controls.h to new patch
> v2: fix compliance test fail, check created buffer size in driver
> ---
>  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 735 ++++++++++++++----
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 114 ++-
>  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 175 +++++
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  60 ++
>  .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  49 ++
>  7 files changed, 975 insertions(+), 170 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
>  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
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
> index 5f0990fce8ef..aa18b01802ed 100644
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
> +					MTK_JPEG_FMT_FLAG_ENC_CAPTURE,
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
> @@ -86,10 +133,70 @@ static int mtk_jpeg_querycap(struct file *file, void *priv,
>  {
>  	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
>  
> -	strscpy(cap->driver, MTK_JPEG_NAME " decoder", sizeof(cap->driver));
> -	strscpy(cap->card, MTK_JPEG_NAME " decoder", sizeof(cap->card));
> -	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> -		 dev_name(jpeg->dev));
> +	strscpy(cap->driver, MTK_JPEG_NAME, sizeof(cap->driver));
> +	if (jpeg->mode ==  MTK_JPEG_ENC)
> +		strscpy(cap->card, MTK_JPEG_NAME " encoder", sizeof(cap->card));
> +	else
> +		strscpy(cap->card, MTK_JPEG_NAME " decoder", sizeof(cap->card));
> +		snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +			 dev_name(jpeg->dev));
> +
> +	return 0;
> +}
> +
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
> +	case V4L2_CID_JPEG_ENABLE_EXIF:
> +		p->enable_exif = ctrl->val;
> +		break;
> +	}
> +
> +	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "%s val = %d",
> +		 v4l2_ctrl_get_name(ctrl->id), ctrl->val);
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
> +		v4l2_ctrl_new_std(handler, ops, V4L2_CID_JPEG_ENABLE_EXIF, 0,
> +				  1, 1, 0);
> +
> +		if (handler->error) {
> +			v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +			return handler->error;
> +		}
> +	}
> +
> +	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
>  
>  	return 0;
>  }
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
> @@ -202,7 +320,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> -	int i;
> +	int i, align_w, align_h;
>  
>  	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
>  	pix_mp->field = V4L2_FIELD_NONE;
> @@ -216,36 +334,111 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  	pix_mp->pixelformat = fmt->fourcc;
>  
>  	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
> -		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[0];
> +		if (jpeg->mode == MTK_JPEG_ENC) {
> +			pix_mp->height = clamp(pix_mp->height,
> +					       MTK_JPEG_MIN_HEIGHT,
> +					       MTK_JPEG_MAX_HEIGHT);
> +			pix_mp->width = clamp(pix_mp->width,
> +					      MTK_JPEG_MIN_WIDTH,
> +					      MTK_JPEG_MAX_WIDTH);
> +			align_w = pix_mp->width;
> +			align_h = pix_mp->height;
> +			align_w = round_up(align_w, 2);
> +			if (pix_mp->num_planes == 1U) {
> +				align_w = align_w << 1;
> +				mtk_jpeg_bound_align_image(&align_w,
> +							   MTK_JPEG_MIN_WIDTH,
> +							   MTK_JPEG_MAX_WIDTH,
> +							   5, &align_h,
> +							   MTK_JPEG_MIN_HEIGHT,
> +							   MTK_JPEG_MAX_HEIGHT,
> +							   3);
> +				pix_mp->plane_fmt[0].bytesperline = align_w;
> +				pix_mp->plane_fmt[0].sizeimage =
> +					align_w * align_h;
> +			} else if (pix_mp->num_planes == 2U) {
> +				mtk_jpeg_bound_align_image(&align_w,
> +							   MTK_JPEG_MIN_WIDTH,
> +							   MTK_JPEG_MAX_WIDTH,
> +							   4, &align_h,
> +							   MTK_JPEG_MIN_HEIGHT,
> +							   MTK_JPEG_MAX_HEIGHT,
> +							   4);
> +				pix_mp->plane_fmt[0].bytesperline = align_w;
> +				pix_mp->plane_fmt[0].sizeimage =
> +					align_w * align_h;
> +				pix_mp->plane_fmt[1].bytesperline = align_w;
> +				pix_mp->plane_fmt[1].sizeimage =
> +					(align_w * align_h) / 2;
> +			} else {
> +				v4l2_err(&ctx->jpeg->v4l2_dev,
> +					 "Unsupport num planes = %d\n",
> +					 pix_mp->num_planes);
> +			}
> +			goto end;
> +		} else {
> +			struct v4l2_plane_pix_format *pfmt =
> +						&pix_mp->plane_fmt[0];
> +
> +			mtk_jpeg_bound_align_image(&pix_mp->width,
> +						   MTK_JPEG_MIN_WIDTH,
> +					   MTK_JPEG_MAX_WIDTH, 0,
> +						   &pix_mp->height,
> +						   MTK_JPEG_MIN_HEIGHT,
> +					   MTK_JPEG_MAX_HEIGHT, 0);
> +
> +			pfmt->bytesperline = 0;
> +			/* Source size must be aligned to 128 */
> +			pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
> +			if (pfmt->sizeimage == 0)
> +				pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
> +
> +			goto end;
> +		}
> +	}

The differences between capture and output are too large IMHO. I would
recommend splitting this into different functions, one for the encoder,
one for the decoder.

>  
> +	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> +	if (jpeg->mode == MTK_JPEG_ENC) {
>  		mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
>  					   MTK_JPEG_MAX_WIDTH, 0,
>  					   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
>  					   MTK_JPEG_MAX_HEIGHT, 0);
>  
> -		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
> -		pfmt->bytesperline = 0;
> -		/* Source size must be aligned to 128 */
> -		pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
> -		if (pfmt->sizeimage == 0)
> -			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
> -		goto end;
> +		if (fmt->fourcc == V4L2_PIX_FMT_JPEG) {
> +			pix_mp->plane_fmt[0].bytesperline = 0;
> +			pix_mp->plane_fmt[0].sizeimage =
> +				mtk_jpeg_align(pix_mp->plane_fmt[0].sizeimage,
> +					       128);
> +			if (pix_mp->plane_fmt[0].sizeimage == 0)
> +				pix_mp->plane_fmt[0].sizeimage =
> +					MTK_JPEG_DEFAULT_SIZEIMAGE;
> +		}
> +	} else {
> +		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> +				       MTK_JPEG_MAX_HEIGHT);
> +		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
> +				      MTK_JPEG_MAX_WIDTH);
> +		mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> +					   MTK_JPEG_MAX_WIDTH, fmt->h_align,
> +					   &pix_mp->height,
> +					   MTK_JPEG_MIN_HEIGHT,
> +					   MTK_JPEG_MAX_HEIGHT, fmt->v_align);
> +
> +		for (i = 0; i < fmt->colplanes; i++) {
> +			struct v4l2_plane_pix_format *pfmt =
> +					&pix_mp->plane_fmt[i];
> +			u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
> +			u32 h = pix_mp->height * fmt->v_sample[i] / 4;
> +
> +			pfmt->bytesperline = stride;
> +			pfmt->sizeimage = stride * h;
> +		}
>  	}
>  
> -	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> -	mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> -				   MTK_JPEG_MAX_WIDTH, fmt->h_align,
> -				   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> -				   MTK_JPEG_MAX_HEIGHT, fmt->v_align);
> -
>  	for (i = 0; i < fmt->colplanes; i++) {
> -		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[i];
> -		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
> -		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
> -
> +		struct v4l2_plane_pix_format *pfmt =
> +				&pix_mp->plane_fmt[i];
>  		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
> -		pfmt->bytesperline = stride;
> -		pfmt->sizeimage = stride * h;
>  	}
>  end:
>  	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "wxh:%ux%u\n",
> @@ -446,9 +639,9 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
>  	switch (sub->type) {
>  	case V4L2_EVENT_SOURCE_CHANGE:
>  		return v4l2_src_change_event_subscribe(fh, sub);
> -	default:
> -		return -EINVAL;
>  	}
> +
> +	return v4l2_ctrl_subscribe_event(fh, sub);
>  }

This appears to be a bug fix. Please put this in a separate patch.

>  
>  static int mtk_jpeg_g_selection(struct file *file, void *priv,
> @@ -571,6 +764,13 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
>  	if (!q_data)
>  		return -EINVAL;
>  
> +	if (*num_planes) {
> +		for (i = 0; i < *num_planes; i++)
> +			if (sizes[i] < q_data->sizeimage[i])
> +				return -EINVAL;
> +		return 0;
> +	}
> +
>  	*num_planes = q_data->fmt->colplanes;
>  	for (i = 0; i < q_data->fmt->colplanes; i++) {
>  		sizes[i] = q_data->sizeimage[i];

Also appears to be a bug fix.

> @@ -651,10 +851,92 @@ static void mtk_jpeg_set_queue_data(struct mtk_jpeg_ctx *ctx,
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
> +	default:
> +		v4l2_err(&jpeg->v4l2_dev, "Unsupport fourcc =%d\n",
> +			 q_data_src->fmt->fourcc);
> +		break;
> +	}
> +	param->enc_w = q_data_src->w;
> +	param->enc_h = q_data_src->h;
> +
> +	if (jpeg_params->enc_quality >= 97)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q97;
> +	else if (jpeg_params->enc_quality >= 95)
> +		param->enc_quality = JPEG_ENCODE_QUALITY_Q95;
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
> +
> +	param->enable_exif = jpeg_params->enable_exif;
> +	param->restart_interval = jpeg_params->restart_interval;
> +
> +	width_even = ((param->enc_w + 1) >> 1) << 1;
> +	is_420 = (param->enc_format == JPEG_YUV_FORMAT_NV12 ||
> +		  param->enc_format == JPEG_YUV_FORMAT_NV12) ? 1 : 0;
> +	padding_width = mtk_jpeg_align(param->enc_w, 16);
> +	padding_height = mtk_jpeg_align(param->enc_h, is_420 ? 16 : 8);
> +	if (!is_420)
> +		width_even = width_even << 1;
> +
> +	param->img_stride = mtk_jpeg_align(width_even, (is_420 ? 16 : 32));
> +	param->mem_stride = mtk_jpeg_align(width_even, (is_420 ? 16 : 32));
> +	param->total_encdu =
> +		((padding_width >> 4) * (padding_height >> (is_420 ? 4 : 3)) *
> +		(is_420 ? 6 : 4)) - 1;
> +
> +	v4l2_dbg(0, 2, &jpeg->v4l2_dev, "fmt %d, w,h %d,%d, enable_exif %d,",
> +		 "enc_quality %d, restart_interval %d,img_stride %d,",
> +		 "mem_stride %d,totalEncDu %d\n",
> +		 param->enc_format, param->enc_w, param->enc_h,
> +		 param->enable_exif, param->enc_quality,
> +		 param->restart_interval, param->img_stride,
> +		 param->mem_stride, param->total_encdu);
> +}
> +
>  static void mtk_jpeg_buf_queue(struct vb2_buffer *vb)
>  {
>  	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>  	struct mtk_jpeg_dec_param *param;
> +	struct mtk_jpeg_enc_param *enc_param;
>  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	bool header_valid;
> @@ -666,29 +948,45 @@ static void mtk_jpeg_buf_queue(struct vb2_buffer *vb)
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
> +		enc_param = &jpeg_src_buf->enc_param;
> +		memset(enc_param, 0, sizeof(*enc_param));
> +		mtk_jpeg_set_param(ctx, enc_param);
> +		if (jpeg_src_buf->flags & MTK_JPEG_BUF_FLAGS_LAST_FRAME) {
> +			v4l2_dbg(1, debug, &jpeg->v4l2_dev, "Got eos");
> +			goto end;
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
> @@ -731,16 +1029,16 @@ static void mtk_jpeg_stop_streaming(struct vb2_queue *q)
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
> @@ -795,6 +1093,28 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
>  	return 0;
>  }
>  
> +static void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx,
> +				 struct vb2_buffer *dst_buf,
> +				 struct mtk_jpeg_enc_bs *bs)
> +{
> +	bs->dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0) &
> +		      (~JPEG_ENC_DST_ADDR_OFFSET_MASK);
> +	bs->dma_addr_offset = 0;
> +	bs->dma_addr_offsetmask = bs->dma_addr & JPEG_ENC_DST_ADDR_OFFSET_MASK;
> +	bs->size = mtk_jpeg_align(vb2_plane_size(dst_buf, 0), 128);
> +}
> +
> +static void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,
> +				 struct vb2_buffer *src_buf,
> +				 struct mtk_jpeg_enc_fb *fb)
> +{
> +	int i;
> +
> +	for (i = 0; i < src_buf->num_planes; i++)
> +		fb->fb_addr[i].dma_addr =
> +			vb2_dma_contig_plane_dma_addr(src_buf, i);
> +}
> +
>  static void mtk_jpeg_device_run(void *priv)
>  {
>  	struct mtk_jpeg_ctx *ctx = priv;
> @@ -805,6 +1125,8 @@ static void mtk_jpeg_device_run(void *priv)
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	struct mtk_jpeg_bs bs;
>  	struct mtk_jpeg_fb fb;
> +	struct mtk_jpeg_enc_bs enc_bs;
> +	struct mtk_jpeg_enc_fb enc_fb;
>  	int i;
>  
>  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> @@ -815,30 +1137,45 @@ static void mtk_jpeg_device_run(void *priv)
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
>  	return;
>  
> -dec_end:
> +device_run_end:
>  	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>  	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  	v4l2_m2m_buf_done(src_buf, buf_state);
> @@ -898,30 +1235,30 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
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
> +	u32 ret, result_size;
>  	int i;
>  
> -	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
> -	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
>  	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
>  	if (!ctx) {
>  		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
> @@ -932,21 +1269,42 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
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
>  
> -	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
> -		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
> -				      jpeg_src_buf->dec_param.comp_size[i]);
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
> +				      result_size);
> +	} else {
> +		ret = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
> +		irq_ret = mtk_jpeg_dec_enum_result(ret);
> +
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
> @@ -956,32 +1314,72 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>  static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
>  {
>  	struct mtk_jpeg_q_data *q = &ctx->out_q;
> -	int i;
> +	int i, align_w, align_h;
> +
> +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
>  
>  	ctx->colorspace = V4L2_COLORSPACE_JPEG,
>  	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>  	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
>  	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>  
> -	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> +	if (ctx->jpeg->mode == MTK_JPEG_ENC) {
> +		q->w = MTK_JPEG_MIN_WIDTH;
> +		q->h = MTK_JPEG_MIN_HEIGHT;
> +
> +		q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUYV,
>  					      MTK_JPEG_FMT_TYPE_OUTPUT);
> -	q->w = MTK_JPEG_MIN_WIDTH;
> -	q->h = MTK_JPEG_MIN_HEIGHT;
> -	q->bytesperline[0] = 0;
> -	q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
> +
> +		align_w = q->w;
> +		align_h = q->h;
> +		align_w = round_up(align_w, 2);
> +		align_w = align_w << 1;
> +		v4l_bound_align_image(&align_w,
> +				      MTK_JPEG_MIN_WIDTH,
> +				      MTK_JPEG_MAX_WIDTH, 5,
> +				      &align_h,
> +				      MTK_JPEG_MIN_HEIGHT,
> +				      MTK_JPEG_MAX_HEIGHT, 3, 0);
> +
> +		if (align_w < MTK_JPEG_MIN_WIDTH &&
> +		    (align_w + 32) <= MTK_JPEG_MAX_WIDTH)
> +			align_w += 32;
> +		if (align_h < MTK_JPEG_MIN_HEIGHT &&
> +		    (align_h + 8) <= MTK_JPEG_MAX_HEIGHT)
> +			align_h += 8;
> +
> +		q->sizeimage[0] = align_w * align_h;
> +		q->bytesperline[0] = align_w;
> +	} else {
> +		q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> +					      MTK_JPEG_FMT_TYPE_OUTPUT);
> +		q->w = MTK_JPEG_MIN_WIDTH;
> +		q->h = MTK_JPEG_MIN_HEIGHT;
> +		q->bytesperline[0] = 0;
> +		q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
> +	}
>  
>  	q = &ctx->cap_q;
> -	q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUV420M,
> +	if (ctx->jpeg->mode == MTK_JPEG_ENC) {
> +		q->w = MTK_JPEG_MIN_WIDTH;
> +		q->h = MTK_JPEG_MIN_HEIGHT;
> +		q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> +					      MTK_JPEG_FMT_TYPE_CAPTURE);
> +		q->bytesperline[0] = 0;
> +		q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
> +	} else {
> +		q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUV420M,
>  					      MTK_JPEG_FMT_TYPE_CAPTURE);
> -	q->w = MTK_JPEG_MIN_WIDTH;
> -	q->h = MTK_JPEG_MIN_HEIGHT;
> +		q->w = MTK_JPEG_MIN_WIDTH;
> +		q->h = MTK_JPEG_MIN_HEIGHT;
>  
> -	for (i = 0; i < q->fmt->colplanes; i++) {
> -		u32 stride = q->w * q->fmt->h_sample[i] / 4;
> -		u32 h = q->h * q->fmt->v_sample[i] / 4;
> +		for (i = 0; i < q->fmt->colplanes; i++) {
> +			u32 stride = q->w * q->fmt->h_sample[i] / 4;
> +			u32 h = q->h * q->fmt->v_sample[i] / 4;
>  
> -		q->bytesperline[i] = stride;
> -		q->sizeimage[i] = stride * h;
> +			q->bytesperline[i] = stride;
> +			q->sizeimage[i] = stride * h;
> +		}
>  	}
>  }

This is another function were there appears to be little overlap between
encoder and decoder. A candidate to split up?

>  
> @@ -1013,6 +1411,13 @@ static int mtk_jpeg_open(struct file *file)
>  		goto error;
>  	}
>  
> +	ret = mtk_jpeg_ctrls_setup(ctx);
> +	if (ret) {
> +		v4l2_err(&jpeg->v4l2_dev, "Failed to setup controls() (%d)\n",
> +			 ret);
> +		goto error;
> +	}
> +
>  	mtk_jpeg_set_default_params(ctx);
>  	mutex_unlock(&jpeg->lock);
>  	return 0;
> @@ -1033,6 +1438,7 @@ static int mtk_jpeg_release(struct file *file)
>  
>  	mutex_lock(&jpeg->lock);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>  	v4l2_fh_del(&ctx->fh);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
> @@ -1057,6 +1463,7 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
>  	if (!node)
>  		return -EINVAL;
> +
>  	pdev = of_find_device_by_node(node);
>  	if (WARN_ON(!pdev)) {
>  		of_node_put(node);
> @@ -1066,19 +1473,24 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
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
> @@ -1088,28 +1500,26 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
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
> +		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
> +			jpeg_irq, ret);
>  		goto err_req_irq;
>  	}
>  
> @@ -1133,33 +1543,35 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
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
> @@ -1167,10 +1579,10 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
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
> @@ -1190,8 +1602,8 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
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
> @@ -1202,7 +1614,11 @@ static __maybe_unused int mtk_jpeg_pm_suspend(struct device *dev)
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
> @@ -1213,7 +1629,10 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
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
> @@ -1249,11 +1668,15 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops = {
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


The g/s_selection ioctls are unchanged: that can't be right.

The decoder supports composing, but that's not valid for an encoder:
I expect cropping support for an encoder.

Regards,

	Hans
