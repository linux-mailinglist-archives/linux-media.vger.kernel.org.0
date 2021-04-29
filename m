Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCE836EA11
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 14:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhD2MLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 08:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhD2MLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 08:11:31 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE8BC06138B;
        Thu, 29 Apr 2021 05:10:44 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:11ef:dfbe:29a3:d3d] (unknown [IPv6:2a02:810a:880:f54:11ef:dfbe:29a3:d3d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0FD591F4340C;
        Thu, 29 Apr 2021 13:10:43 +0100 (BST)
Subject: Re: [PATCH v4 05/15] media: mtk-vcodec: vdec: support stateless API
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-6-acourbot@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <2aa7f058-38b2-2a31-d59b-bba96c39cc29@collabora.com>
Date:   Thu, 29 Apr 2021 14:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210427111526.1772293-6-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 27.04.21 13:15, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Support the stateless codec API that will be used by MT8183.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>   drivers/media/platform/mtk-vcodec/Makefile    |   1 +
>   .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 +++-
>   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
>   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++++++++++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
>   5 files changed, 446 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> 
> diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> index 9c3cbb5b800e..4ba93d838ab6 100644
> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -12,6 +12,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>   		vdec_vpu_if.o \
>   		mtk_vcodec_dec.o \
>   		mtk_vcodec_dec_stateful.o \
> +		mtk_vcodec_dec_stateless.o \
>   		mtk_vcodec_dec_pm.o \
>   
>   mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 4ad2662a43b2..01c5333d6cff 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -46,6 +46,13 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
>   static int vidioc_try_decoder_cmd(struct file *file, void *priv,
>   				struct v4l2_decoder_cmd *cmd)
>   {
> +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +
> +	/* Use M2M stateless helper if relevant */
> +	if (ctx->dev->vdec_pdata->uses_stateless_api)
> +		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
> +								cmd);
> +
>   	switch (cmd->cmd) {
>   	case V4L2_DEC_CMD_STOP:
>   	case V4L2_DEC_CMD_START:
> @@ -72,6 +79,10 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
>   	if (ret)
>   		return ret;
>   
> +	/* Use M2M stateless helper if relevant */
> +	if (ctx->dev->vdec_pdata->uses_stateless_api)
> +		return v4l2_m2m_ioctl_stateless_decoder_cmd(file, priv, cmd);
> +
>   	mtk_v4l2_debug(1, "decoder cmd=%u", cmd->cmd);
>   	dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
>   				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> @@ -414,7 +425,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
>   	 * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
>   	 * if using the stateful API.
>   	 */
> -	if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
> +	if (!dec_pdata->uses_stateless_api &&
> +	    (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
>   	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
>   		mtk_v4l2_err("out_q_ctx buffers already requested");
>   		ret = -EBUSY;
> @@ -457,6 +469,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
>   		ctx->quantization = pix_mp->quantization;
>   		ctx->xfer_func = pix_mp->xfer_func;
>   
> +		ctx->current_codec = fmt->fourcc;
>   		if (ctx->state == MTK_STATE_FREE) {
>   			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
>   			if (ret) {
> @@ -468,6 +481,49 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
>   		}
>   	}
>   
> +	/*
> +	 * If using the stateless API, S_FMT should have the effect of setting
> +	 * the CAPTURE queue resolution no matter which queue it was called on.
> +	 */
> +	if (dec_pdata->uses_stateless_api) {
> +		ctx->picinfo.pic_w = pix_mp->width;
> +		ctx->picinfo.pic_h = pix_mp->height;
> +
> +		ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo);
> +		if (ret) {
> +			mtk_v4l2_err("[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail",
> +				ctx->id);
> +			return -EINVAL;
> +		}
> +
> +		ctx->last_decoded_picinfo = ctx->picinfo;
> +
> +		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1) {
> +			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
> +				ctx->picinfo.fb_sz[0] +
> +				ctx->picinfo.fb_sz[1];
> +			ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
> +				ctx->picinfo.buf_w;
> +		} else {
> +			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
> +				ctx->picinfo.fb_sz[0];
> +			ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
> +				ctx->picinfo.buf_w;
> +			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1] =
> +				ctx->picinfo.fb_sz[1];
> +			ctx->q_data[MTK_Q_DATA_DST].bytesperline[1] =
> +				ctx->picinfo.buf_w;
> +		}
> +
> +		ctx->q_data[MTK_Q_DATA_DST].coded_width = ctx->picinfo.buf_w;
> +		ctx->q_data[MTK_Q_DATA_DST].coded_height = ctx->picinfo.buf_h;
> +		mtk_v4l2_debug(2, "[%d] vdec_if_init() num_plane = %d wxh=%dx%d pic wxh=%dx%d sz[0]=0x%x sz[1]=0x%x",
> +			ctx->id, pix_mp->num_planes,
> +			ctx->picinfo.buf_w, ctx->picinfo.buf_h,
> +			ctx->picinfo.pic_w, ctx->picinfo.pic_h,
> +			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0],
> +			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1]);
> +	}
>   	return 0;
>   }
>   
> @@ -765,9 +821,15 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
>   		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
>   			struct mtk_video_dec_buf *buf_info = container_of(
>   				 src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
> -			if (!buf_info->lastframe)
> +			if (!buf_info->lastframe) {
> +				struct media_request *req =
> +					src_buf->vb2_buf.req_obj.req;
>   				v4l2_m2m_buf_done(src_buf,
>   						VB2_BUF_STATE_ERROR);
> +				if (req)
> +					v4l2_ctrl_request_complete(req,
> +								&ctx->ctrl_hdl);
> +			}
>   		}
>   		return;
>   	}
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> index 6a18cb3bfe07..6b29d7d9ae15 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> @@ -45,6 +45,7 @@ struct vdec_fb {
>    * @lastframe:		Intput buffer is last buffer - EOS
>    * @error:		An unrecoverable error occurs on this buffer.
>    * @frame_buffer:	Decode status, and buffer information of Capture buffer
> + * @bs_buffer:	Output buffer info
>    *
>    * Note : These status information help us track and debug buffer state
>    */
> @@ -55,12 +56,18 @@ struct mtk_video_dec_buf {
>   	bool	queued_in_vb2;
>   	bool	queued_in_v4l2;
>   	bool	lastframe;
> +
>   	bool	error;
> -	struct vdec_fb	frame_buffer;
> +
> +	union {
> +		struct vdec_fb	frame_buffer;
> +		struct mtk_vcodec_mem	bs_buffer;
> +	};
>   };
>   
>   extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
>   extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
> +extern const struct media_device_ops mtk_vcodec_media_ops;
>   
>   
>   /*
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> new file mode 100644
> index 000000000000..75ddf53e2876
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c

Hi, when compiling with -DDEBUG flag, I got some compilation errors for this file.

Thanks,
Dafna

> @@ -0,0 +1,370 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "media/videobuf2-v4l2.h"
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <linux/module.h>
> +
> +#include "mtk_vcodec_drv.h"
> +#include "mtk_vcodec_dec.h"
> +#include "mtk_vcodec_intr.h"
> +#include "mtk_vcodec_util.h"
> +#include "vdec_drv_if.h"
> +#include "mtk_vcodec_dec_pm.h"
> +
> +/**
> + * struct mtk_stateless_control  - CID control type
> + * @cfg: control configuration
> + * @codec_type: codec type (V4L2 pixel format) for CID control type
> + */
> +struct mtk_stateless_control {
> +	struct v4l2_ctrl_config cfg;
> +	int codec_type;
> +};
> +
> +static const struct mtk_stateless_control mtk_stateless_controls[] = {
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_SPS,
> +		},
> +		.codec_type = V4L2_PIX_FMT_H264_SLICE,
> +	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_PPS,
> +		},
> +		.codec_type = V4L2_PIX_FMT_H264_SLICE,
> +	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> +		},
> +		.codec_type = V4L2_PIX_FMT_H264_SLICE,
> +	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> +		},
> +		.codec_type = V4L2_PIX_FMT_H264_SLICE,
> +	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> +			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +			.menu_skip_mask =
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> +		},
> +		.codec_type = V4L2_PIX_FMT_H264_SLICE,
> +	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
> +			.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +			.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +			.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +		},
> +		.codec_type = V4L2_PIX_FMT_H264_SLICE,
> +	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_H264_START_CODE,
> +			.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +			.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +			.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
> +		},
> +		.codec_type = V4L2_PIX_FMT_H264_SLICE,
> +	}
> +};
> +#define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
> +
> +static const struct mtk_video_fmt mtk_video_formats[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.type = MTK_FMT_DEC,
> +		.num_planes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_MM21,
> +		.type = MTK_FMT_FRAME,
> +		.num_planes = 2,
> +	},
> +};
> +#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> +#define DEFAULT_OUT_FMT_IDX    0
> +#define DEFAULT_CAP_FMT_IDX    1
> +
> +static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
> +	{
> +		.fourcc	= V4L2_PIX_FMT_H264_SLICE,
> +		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
> +				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
> +	},
> +};
> +
> +#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
> +
> +static void mtk_vdec_stateless_set_dst_payload(struct mtk_vcodec_ctx *ctx,
> +					       struct vdec_fb *fb)
> +{
> +	struct mtk_video_dec_buf *vdec_frame_buf =
> +		container_of(fb, struct mtk_video_dec_buf, frame_buffer);
> +	struct vb2_v4l2_buffer *vb = &vdec_frame_buf->m2m_buf.vb;
> +	unsigned int cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> +
> +	vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
> +	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> +		unsigned int cap_c_size =
> +			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> +
> +		vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
> +	}
> +}
> +
> +static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
> +					   struct vb2_v4l2_buffer *vb2_v4l2)
> +{
> +	struct mtk_video_dec_buf *framebuf =
> +		container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
> +	struct vdec_fb *pfb = &framebuf->frame_buffer;
> +	struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
> +
> +	pfb = &framebuf->frame_buffer;
> +	pfb->base_y.va = NULL;
> +	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> +
> +	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> +		pfb->base_c.va = NULL;
> +		pfb->base_c.dma_addr =
> +			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
> +		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> +	}
> +	mtk_v4l2_debug(1,
> +		"id=%d Framebuf  pfb=%p VA=%p Y_DMA=%pad C_DMA=%pad Size=%zx frame_count = %d",
> +		dst_buf->index, pfb,
> +		pfb->base_y.va, &pfb->base_y.dma_addr,
> +		&pfb->base_c.dma_addr, pfb->base_y.size,
> +		ctx->decoded_frame_cnt);
> +
> +	return pfb;
> +}
> +
> +static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> +}
> +
> +static int fops_media_request_validate(struct media_request *mreq)
> +{
> +	const unsigned int buffer_cnt = vb2_request_buffer_cnt(mreq);
> +
> +	switch (buffer_cnt) {
> +	case 1:
> +		/* We expect exactly one buffer with the request */
> +		break;
> +	case 0:
> +		mtk_v4l2_err("No buffer provided with the request");
> +		return -ENOENT;
> +	default:
> +		mtk_v4l2_err("Too many buffers (%d) provided with the request",
> +			     buffer_cnt);
> +		return -EINVAL;
> +	}
> +
> +	return vb2_request_validate(mreq);
> +}
> +
> +static void mtk_vdec_worker(struct work_struct *work)
> +{
> +	struct mtk_vcodec_ctx *ctx =
> +		container_of(work, struct mtk_vcodec_ctx, decode_work);
> +	struct mtk_vcodec_dev *dev = ctx->dev;
> +	struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
> +	struct vb2_buffer *vb2_src;
> +	struct mtk_vcodec_mem *bs_src;
> +	struct mtk_video_dec_buf *dec_buf_src;
> +	struct media_request *src_buf_req;
> +	struct vdec_fb *dst_buf;
> +	bool res_chg = false;
> +	int ret;
> +
> +	vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +	if (vb2_v4l2_src == NULL) {
> +		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +		mtk_v4l2_debug(1, "[%d] no available source buffer", ctx->id);
> +		return;
> +	}
> +
> +	vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	if (vb2_v4l2_dst == NULL) {
> +		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +		mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
> +		return;
> +	}
> +
> +	vb2_src = &vb2_v4l2_src->vb2_buf;
> +	dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
> +				   m2m_buf.vb);
> +	bs_src = &dec_buf_src->bs_buffer;
> +
> +	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p buf_info = %p",
> +			ctx->id, src_buf->vb2_queue->type,
> +			src_buf->index, src_buf, src_buf_info);
> +
> +	bs_src->va = NULL;
> +	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
> +	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
> +
> +	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
> +			ctx->id, buf->va, &buf->dma_addr, buf->size, src_buf);
> +	/* Apply request controls. */
> +	src_buf_req = vb2_src->req_obj.req;
> +	if (src_buf_req)
> +		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
> +	else
> +		mtk_v4l2_err("vb2 buffer media request is NULL");
> +
> +	dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
> +	v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
> +	ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
> +	if (ret) {
> +		mtk_v4l2_err(
> +			" <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
> +			ctx->id, vb2_src->index, bs_src->size,
> +			vb2_src->timestamp, ret, res_chg);
> +		if (ret == -EIO) {
> +			mutex_lock(&ctx->lock);
> +			dec_buf_src->error = true;
> +			mutex_unlock(&ctx->lock);
> +		}
> +	}
> +
> +	mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
> +
> +	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> +		ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> +
> +	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +}
> +
> +static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vb2_v4l2 = to_vb2_v4l2_buffer(vb);
> +
> +	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
> +			ctx->id, vb->vb2_queue->type,
> +			vb->index, vb);
> +
> +	mutex_lock(&ctx->lock);
> +	v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
> +	mutex_unlock(&ctx->lock);
> +	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		return;
> +
> +	mtk_v4l2_debug(3, "(%d) id=%d, bs=%p",
> +		vb->vb2_queue->type, vb->index, src_buf);
> +
> +	/* If an OUTPUT buffer, we may need to update the state */
> +	if (ctx->state == MTK_STATE_INIT) {
> +		ctx->state = MTK_STATE_HEADER;
> +		mtk_v4l2_debug(1, "Init driver from init to header.");
> +	} else {
> +		mtk_v4l2_debug(3, "[%d] already init driver %d",
> +				ctx->id, ctx->state);
> +	}
> +}
> +
> +static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
> +{
> +	bool res_chg;
> +
> +	return vdec_if_decode(ctx, NULL, NULL, &res_chg);
> +}
> +
> +static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
> +{
> +	unsigned int i;
> +
> +	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS);
> +	if (ctx->ctrl_hdl.error) {
> +		mtk_v4l2_err("v4l2_ctrl_handler_init failed\n");
> +		return ctx->ctrl_hdl.error;
> +	}
> +
> +	for (i = 0; i < NUM_CTRLS; i++) {
> +		struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
> +
> +		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
> +		if (ctx->ctrl_hdl.error) {
> +			mtk_v4l2_err("Adding control %d failed %d",
> +					i, ctx->ctrl_hdl.error);
> +			return ctx->ctrl_hdl.error;
> +		}
> +	}
> +
> +	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> +
> +	return 0;
> +}
> +
> +const struct media_device_ops mtk_vcodec_media_ops = {
> +	.req_validate	= fops_media_request_validate,
> +	.req_queue	= v4l2_m2m_request_queue,
> +};
> +
> +static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
> +{
> +	struct vb2_queue *src_vq;
> +
> +	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
> +				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +
> +	/* Support request api for output plane */
> +	src_vq->supports_requests = true;
> +	src_vq->requires_requests = true;
> +}
> +
> +static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +	return 0;
> +}
> +
> +static struct vb2_ops mtk_vdec_request_vb2_ops = {
> +	.queue_setup	= vb2ops_vdec_queue_setup,
> +	.buf_prepare	= vb2ops_vdec_buf_prepare,
> +	.wait_prepare	= vb2_ops_wait_prepare,
> +	.wait_finish	= vb2_ops_wait_finish,
> +	.start_streaming	= vb2ops_vdec_start_streaming,
> +
> +	.buf_queue	= vb2ops_vdec_stateless_buf_queue,
> +	.buf_out_validate = vb2ops_vdec_out_buf_validate,
> +	.buf_init	= vb2ops_vdec_buf_init,
> +	.buf_finish	= vb2ops_vdec_buf_finish,
> +	.stop_streaming	= vb2ops_vdec_stop_streaming,
> +	.buf_request_complete = vb2ops_vdec_buf_request_complete,
> +};
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
> +	.chip = MTK_MT8183,
> +	.init_vdec_params = mtk_init_vdec_params,
> +	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
> +	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
> +	.vdec_formats = mtk_video_formats,
> +	.num_formats = NUM_FORMATS,
> +	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
> +	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
> +	.vdec_framesizes = mtk_vdec_framesizes,
> +	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
> +	.uses_stateless_api = true,
> +	.worker = mtk_vdec_worker,
> +	.flush_decoder = mtk_vdec_flush_decoder,
> +};
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index e5b8309785e1..78d4a7728ddf 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -250,6 +250,7 @@ struct vdec_pic_info {
>    * @encode_work: worker for the encoding
>    * @last_decoded_picinfo: pic information get from latest decode
>    * @empty_flush_buf: a fake size-0 capture buffer that indicates flush
> + * @current_codec: current set input codec, in V4L2 pixel format
>    *
>    * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
>    * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
> @@ -289,6 +290,8 @@ struct mtk_vcodec_ctx {
>   	struct vdec_pic_info last_decoded_picinfo;
>   	struct mtk_video_dec_buf *empty_flush_buf;
>   
> +	u32 current_codec;
> +
>   	enum v4l2_colorspace colorspace;
>   	enum v4l2_ycbcr_encoding ycbcr_enc;
>   	enum v4l2_quantization quantization;
> 
