Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7EEAD78F
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 13:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730577AbfIILD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 07:03:28 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36041 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730563AbfIILD2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 07:03:28 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 7HRyiQ8kI9b7T7HS2ifANu; Mon, 09 Sep 2019 13:03:24 +0200
Subject: Re: [PATCH 4/4] media: hantro: Support color conversion via
 post-processing
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
References: <20190903181711.7559-1-ezequiel@collabora.com>
 <20190903181711.7559-5-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <30f7135e-7580-9b69-5976-5897a9b256f4@xs4all.nl>
Date:   Mon, 9 Sep 2019 13:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903181711.7559-5-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBHviYW6Ky/yeWhQCGVq23kCUgaz27t16mpMx73f2IEnXDPyvCmEpMoDbh61On6UHkEbKfUC+C1QeFivqwnNbqJ+985sxSNtFtyYs4Ee7gB4fSfs9/e+
 D7TGxsJbGrsN5ls2wk76PEd8K+lmf2VhlVe/wR7lVreoHJlYRxCSZ4KQFnQTPTgXiZLPXJGwFpCG2mcp3PqbytWNNNXHIlogKvupnmwUXpM6/LLy4bk7YMx8
 LhUNUBmY1UhRzpb+UCR7NGQW+1Aej54rxGN0oUYUOVXutVYIl5jhstc3gxHHY0dTvxHqN51KMkdD1F2gU1rKe23eY6QbR0Uv1YZ/GOZQ2zN+OL8cAITjX5HP
 pgHndU9RGFXbvQqno3MOcxaDIdjypHJvqJfB9dxQax+zYifdbXfJFtmUyPVWZgt3cHitF3S020QE70ymwqmINV1H37NjERz1IRqB/V1HtCvJQ5IkVnU0ewqW
 0dvfZKJk2c62dPbm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/3/19 8:17 PM, Ezequiel Garcia wrote:
> The Hantro G1 decoder is able to enable a post-processor
> on the decoding pipeline, which can be used to perform
> scaling and color conversion.
> 
> The post-processor is integrated to the decoder, and it's
> possible to use it in a way that is completely transparent
> to the user.
> 
> This commit enables color conversion via post-processing,
> which means the driver now exposes YUV packed and RGB pixel
> formats, in addition to NV12.
> 
> On the YUV-to-RGB path, the post-processing pipeline
> allows to modify the image contrast, brigthness and saturation,
> so additional user controls are added to expose them.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/Makefile         |   1 +
>  drivers/staging/media/hantro/hantro.h         |  23 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  24 +-
>  .../staging/media/hantro/hantro_g1_h264_dec.c |   2 +-
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |   3 +-
>  .../staging/media/hantro/hantro_g1_vp8_dec.c  |   2 +-
>  drivers/staging/media/hantro/hantro_h264.c    |   7 +-
>  drivers/staging/media/hantro/hantro_hw.h      |  11 +
>  .../staging/media/hantro/hantro_postproc.c    | 316 ++++++++++++++++++
>  drivers/staging/media/hantro/hantro_v4l2.c    |  21 +-
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  |  21 ++
>  11 files changed, 420 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/staging/media/hantro/hantro_postproc.c
> 
> diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> index 5d6b0383d280..496b30c3c396 100644
> --- a/drivers/staging/media/hantro/Makefile
> +++ b/drivers/staging/media/hantro/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_VIDEO_HANTRO) += hantro-vpu.o
>  hantro-vpu-y += \
>  		hantro_drv.o \
>  		hantro_v4l2.o \
> +		hantro_postproc.o \
>  		hantro_h1_jpeg_enc.o \
>  		hantro_g1_h264_dec.o \
>  		hantro_g1_mpeg2_dec.o \
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index e8872f24e351..8446a1fa9ab9 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -237,6 +237,7 @@ struct hantro_ctx {
>  			  unsigned int bytesused);
>  
>  	const struct hantro_codec_ops *codec_ops;
> +	struct hantro_postproc_ctx postproc;
>  
>  	/* Specific for particular codec modes. */
>  	union {
> @@ -250,7 +251,8 @@ struct hantro_ctx {
>  /**
>   * struct hantro_fmt - information about supported video formats.
>   * @name:	Human readable name of the format.
> - * @fourcc:	FourCC code of the format. See V4L2_PIX_FMT_*.
> + * @fourcc:	FourCC code of the post-processed format. See V4L2_PIX_FMT_*.
> + * @dec_fourcc:	FourCC code of the native format. See V4L2_PIX_FMT_*.
>   * @codec_mode:	Codec mode related to this format. See
>   *		enum hantro_codec_mode.
>   * @header_size: Optional header size. Currently used by JPEG encoder.
> @@ -261,6 +263,7 @@ struct hantro_ctx {
>  struct hantro_fmt {
>  	char *name;
>  	u32 fourcc;
> +	u32 dec_fourcc;
>  	enum hantro_codec_mode codec_mode;
>  	int header_size;
>  	int max_depth;
> @@ -387,4 +390,22 @@ hantro_h264_buffer_extra_size(unsigned int width, unsigned int height)
>  	return 128 * MB_WIDTH(width) * MB_HEIGHT(height);
>  }
>  
> +static inline bool
> +hantro_use_postproc(struct hantro_ctx *ctx)
> +{
> +	return ctx->vpu_dst_fmt->fourcc != ctx->vpu_dst_fmt->dec_fourcc;
> +}
> +
> +static inline dma_addr_t
> +hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
> +{
> +	if (hantro_use_postproc(ctx))
> +		return ctx->postproc.dec_q[vb->index].dma;
> +	return vb2_dma_contig_plane_dma_addr(vb, 0);
> +}
> +
> +void hantro_postproc_setup(struct hantro_ctx *ctx);
> +void hantro_postproc_free(struct hantro_ctx *ctx);
> +int hantro_postproc_alloc(struct hantro_ctx *ctx);
> +
>  #endif /* HANTRO_H_ */
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index f550b68d46ca..300178562014 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -53,7 +53,7 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
>  	if (index < 0)
>  		return 0;
>  	buf = vb2_get_buffer(q, index);
> -	return vb2_dma_contig_plane_dma_addr(buf, 0);
> +	return hantro_get_dec_buf_addr(ctx, buf);
>  }
>  
>  static int
> @@ -165,6 +165,9 @@ void hantro_finish_run(struct hantro_ctx *ctx)
>  {
>  	struct vb2_v4l2_buffer *src_buf;
>  
> +	if (hantro_use_postproc(ctx))
> +		hantro_postproc_setup(ctx);
> +
>  	src_buf = hantro_get_src_buf(ctx);
>  	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
>  				   &ctx->ctrl_handler);
> @@ -365,8 +368,9 @@ static int hantro_ctrls_setup(struct hantro_dev *vpu,
>  			      int allowed_codecs)
>  {
>  	int i, num_ctrls = ARRAY_SIZE(controls);
> +	int postproc_ctrls = (allowed_codecs & HANTRO_DECODERS) ? 3 : 0;
>  
> -	v4l2_ctrl_handler_init(&ctx->ctrl_handler, num_ctrls);
> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, num_ctrls + postproc_ctrls);
>  
>  	for (i = 0; i < num_ctrls; i++) {
>  		if (!(allowed_codecs & controls[i].codec))
> @@ -382,6 +386,22 @@ static int hantro_ctrls_setup(struct hantro_dev *vpu,
>  			return ctx->ctrl_handler.error;
>  		}
>  	}
> +
> +	/*
> +	 * Add post-processing controls.
> +	 * Only used if the post-processing path is enabled,
> +	 * when the application sets a CAPTURE pixel format
> +	 * that requires it.
> +	 */
> +	if (postproc_ctrls) {
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, NULL,
> +				  V4L2_CID_CONTRAST, -64, 64, 1, 0);
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, NULL,
> +				  V4L2_CID_BRIGHTNESS, -128, 127, 1, 0);
> +		v4l2_ctrl_new_std(&ctx->ctrl_handler, NULL,
> +				  V4L2_CID_SATURATION, -64, 128, 1, 0);
> +	}
> +
>  	return v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
>  }
>  
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 29130946dea4..e263a6b50651 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -241,7 +241,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>  	vdpu_write_relaxed(vpu, src_dma, G1_REG_ADDR_STR);
>  
>  	/* Destination (decoded frame) buffer. */
> -	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
>  	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
>  
>  	/* Higher profiles require DMV buffer appended to reference frames. */
> diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
> index f3bf67d8a289..63fe89ef21ae 100644
> --- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
> @@ -121,7 +121,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
>  	vdpu_write_relaxed(vpu, addr, G1_REG_RLC_VLC_BASE);
>  
>  	/* Destination frame buffer */
> -	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> +	addr = hantro_get_dec_buf_addr(ctx, dst_buf);
>  	current_addr = addr;
>  
>  	if (picture->picture_structure == PICT_BOTTOM_FIELD)
> @@ -243,7 +243,6 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
>  	hantro_g1_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
>  					&dst_buf->vb2_buf,
>  					sequence, picture, slice_params);
> -
>  	hantro_finish_run(ctx);
>  
>  	reg = G1_REG_DEC_E(1);
> diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> index cad18094fee0..e708994d1aba 100644
> --- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
> @@ -422,7 +422,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
>  	}
>  	vdpu_write_relaxed(vpu, reg, G1_REG_FWD_PIC(0));
>  
> -	dst_dma = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
> +	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
>  	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
>  }
>  
> diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> index 2227b4e12067..d00b3096b7ae 100644
> --- a/drivers/staging/media/hantro/hantro_h264.c
> +++ b/drivers/staging/media/hantro/hantro_h264.c
> @@ -13,6 +13,7 @@
>  #include <linux/types.h>
>  #include <linux/sort.h>
>  #include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-common.h>
>  
>  #include "hantro.h"
>  #include "hantro_hw.h"
> @@ -635,7 +636,11 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx)
>  	tbl = priv->cpu;
>  	memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
>  
> -	v4l2_fill_pixfmt_mp(&pix_mp, ctx->dst_fmt.pixelformat,
> +	/*
> +	 * For the decoder picture size, we want the decoder
> +	 * native pixel format, so we use dec_fourcc here.
> +	 */
> +	v4l2_fill_pixfmt_mp(&pix_mp, ctx->vpu_dst_fmt->dec_fourcc,
>  			    ctx->dst_fmt.width, ctx->dst_fmt.height);
>  	h264_dec->pic_size = pix_mp.plane_fmt[0].sizeimage;
>  
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 69b88f4d3fb3..ae1d869e7c28 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -28,11 +28,13 @@ struct hantro_variant;
>   * @cpu:	CPU pointer to the buffer.
>   * @dma:	DMA address of the buffer.
>   * @size:	Size of the buffer.
> + * @attrs:	Attributes of the DMA mapping.
>   */
>  struct hantro_aux_buf {
>  	void *cpu;
>  	dma_addr_t dma;
>  	size_t size;
> +	unsigned long attrs;
>  };
>  
>  /**
> @@ -109,6 +111,15 @@ struct hantro_vp8_dec_hw_ctx {
>  	struct hantro_aux_buf prob_tbl;
>  };
>  
> +/**
> + * struct hantro_postproc_ctx
> + *
> + * @dec_q:		References buffers, in decoder format.
> + */
> +struct hantro_postproc_ctx {
> +	struct hantro_aux_buf dec_q[VB2_MAX_FRAME];
> +};
> +
>  /**
>   * struct hantro_codec_ops - codec mode specific operations
>   *
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> new file mode 100644
> index 000000000000..17d023a253a8
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -0,0 +1,316 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro G1 post-processor support
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/types.h>
> +
> +#include "hantro.h"
> +#include "hantro_hw.h"
> +
> +#define G1_SWREG(nr)		((nr) * 4)
> +
> +#define G1_REG_PP_INTERRUPT		G1_SWREG(60)
> +#define    G1_REG_PP_READY_IRQ		BIT(12)
> +#define    G1_REG_PP_IRQ		BIT(8)
> +#define    G1_REG_PP_IRQ_DIS		BIT(4)
> +#define    G1_REG_PP_PIPELINE_EN	BIT(1)
> +#define    G1_REG_PP_EXTERNAL_TRIGGER	BIT(0)
> +#define G1_REG_PP_DEV_CONFIG		G1_SWREG(61)
> +#define     G1_REG_PP_AXI_RD_ID(v)	(((v) << 24) & GENMASK(31, 24))
> +#define     G1_REG_PP_AXI_WR_ID(v)	(((v) << 16) & GENMASK(23, 16))
> +#define     G1_REG_PP_INSWAP32_E(v)	((v) ? BIT(10) : 0)
> +#define     G1_REG_PP_DATA_DISC_E(v)	((v) ? BIT(9) : 0)
> +#define     G1_REG_PP_CLK_GATE_E(v)	((v) ? BIT(8) : 0)
> +#define     G1_REG_PP_IN_ENDIAN(v)	((v) ? BIT(7) : 0)
> +#define     G1_REG_PP_OUT_ENDIAN(v)	((v) ? BIT(6) : 0)
> +#define     G1_REG_PP_OUTSWAP32_E(v)	((v) ? BIT(5) : 0)
> +#define     G1_REG_PP_MAX_BURST(v)	(((v) << 0) & GENMASK(4, 0))
> +#define G1_REG_PP_IN_LUMA_BASE		G1_SWREG(63)
> +#define G1_REG_PP_IN_CB_BASE		G1_SWREG(64)
> +#define G1_REG_PP_IN_CR_BASE		G1_SWREG(65)
> +#define G1_REG_PP_OUT_LUMA_BASE		G1_SWREG(66)
> +#define G1_REG_PP_OUT_CHROMA_BASE	G1_SWREG(67)
> +#define G1_REG_PP_CONTRAST_ADJUST	G1_SWREG(68)
> +#define G1_REG_PP_COLOR_CONVERSION	G1_SWREG(69)
> +#define G1_REG_PP_COLOR_CONVERSION0	G1_SWREG(70)
> +#define G1_REG_PP_COLOR_CONVERSION1	G1_SWREG(71)
> +#define G1_REG_PP_INPUT_SIZE		G1_SWREG(72)
> +#define    G1_REG_PP_INPUT_SIZE_HEIGHT(v) (((v) << 9) & GENMASK(16, 9))
> +#define    G1_REG_PP_INPUT_SIZE_WIDTH(v)  (((v) << 0) & GENMASK(8, 0))
> +#define G1_REG_PP_SCALING0		G1_SWREG(79)
> +#define     G1_REG_PP_PADD_R(v)	(((v) << 23) & GENMASK(27, 23))
> +#define     G1_REG_PP_PADD_G(v)	(((v) << 18) & GENMASK(22, 18))
> +#define     G1_REG_PP_RANGEMAP_Y(v) ((v) ? BIT(31) : 0)
> +#define     G1_REG_PP_RANGEMAP_C(v) ((v) ? BIT(30) : 0)
> +#define     G1_REG_PP_YCBCR_RANGE(v) ((v) ? BIT(29) : 0)
> +#define     G1_REG_PP_RGB_16(v) ((v) ? BIT(28) : 0)
> +#define G1_REG_PP_SCALING1		G1_SWREG(80)
> +#define     G1_REG_PP_PADD_B(v)	(((v) << 18) & GENMASK(22, 18))
> +#define G1_REG_PP_MASK_R		G1_SWREG(82)
> +#define G1_REG_PP_MASK_G		G1_SWREG(83)
> +#define G1_REG_PP_MASK_B		G1_SWREG(84)
> +#define G1_REG_PP_CONTROL		G1_SWREG(85)
> +#define     G1_REG_PP_CONTROL_IN_FMT(v)	(((v) << 29) & GENMASK(31, 29))
> +#define     G1_REG_PP_CONTROL_OUT_FMT(v) (((v) << 26) & GENMASK(28, 26))
> +#define     G1_REG_PP_CONTROL_OUT_HEIGHT(v) (((v) << 15) & GENMASK(25, 15))
> +#define     G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v) << 4) & GENMASK(14, 4))
> +#define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
> +#define     G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23) & GENMASK(31, 23))
> +#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
> +#define G1_REG_PP_FUSE			G1_SWREG(99)
> +
> +#define VPU_PP_IN_YUYV			0x0
> +#define VPU_PP_IN_NV12			0x1
> +#define VPU_PP_IN_YUV420		0x2
> +#define VPU_PP_IN_YUV240_TILED		0x5
> +#define VPU_PP_OUT_RGB			0x0
> +#define VPU_PP_OUT_YUYV			0x3
> +
> +#define DEF_COLOR_COEFF_A 298
> +#define DEF_COLOR_COEFF_B 409
> +#define DEF_COLOR_COEFF_C 208
> +#define DEF_COLOR_COEFF_D 100
> +#define DEF_COLOR_COEFF_E 516
> +
> +static const struct hantro_reg reg_color_a2 = { G1_REG_PP_COLOR_CONVERSION, 18, 0x3ff };
> +static const struct hantro_reg reg_color_a1 = { G1_REG_PP_COLOR_CONVERSION, 8, 0x3ff };
> +static const struct hantro_reg reg_color_b = { G1_REG_PP_COLOR_CONVERSION0, 0, 0x3ff };
> +static const struct hantro_reg reg_color_c = { G1_REG_PP_COLOR_CONVERSION0, 10, 0x3ff };
> +static const struct hantro_reg reg_color_d = { G1_REG_PP_COLOR_CONVERSION0, 20, 0x3ff };
> +static const struct hantro_reg reg_color_e = { G1_REG_PP_COLOR_CONVERSION1, 0, 0x3ff };
> +static const struct hantro_reg reg_color_f = { G1_REG_PP_COLOR_CONVERSION1, 10, 0xff };
> +static const struct hantro_reg reg_contrast_thr1 = { G1_REG_PP_CONTRAST_ADJUST, 24, 0xff };
> +static const struct hantro_reg reg_contrast_thr2 = { G1_REG_PP_COLOR_CONVERSION, 0, 0xff };
> +static const struct hantro_reg reg_contrast_off1 = { G1_REG_PP_CONTRAST_ADJUST, 0, 0x3ff };
> +static const struct hantro_reg reg_contrast_off2 = { G1_REG_PP_CONTRAST_ADJUST, 10, 0x3ff };
> +static const struct hantro_reg reg_ycbcr_range = { G1_REG_PP_SCALING0, 29, 0x1 };
> +static const struct hantro_reg reg_pad_r = { G1_REG_PP_SCALING0, 23, 0x1f };
> +static const struct hantro_reg reg_pad_g = { G1_REG_PP_SCALING0, 18, 0x1f };
> +static const struct hantro_reg reg_pad_b = { G1_REG_PP_SCALING1, 18, 0x1f };
> +
> +static s32 hantro_postproc_get_ctrl(struct hantro_ctx *ctx, u32 id, s32 def_val)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, id);
> +	if (!ctrl)
> +		return def_val;
> +	return v4l2_ctrl_g_ctrl(ctrl);
> +}
> +
> +static void hantro_postproc_setup_rgb(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	s32 thr1y, thr2y;
> +	s32 thr1, thr2;
> +	s32 off1, off2;
> +	s32 a1, a2;
> +	s32 tmp, satur;
> +	s32 contrast, saturation, brightness;
> +
> +	contrast = hantro_postproc_get_ctrl(ctx, V4L2_CID_CONTRAST, 0);
> +	brightness = hantro_postproc_get_ctrl(ctx, V4L2_CID_BRIGHTNESS, 0);
> +	saturation = hantro_postproc_get_ctrl(ctx, V4L2_CID_SATURATION, 0);
> +
> +	if (ctx->src_fmt.quantization == V4L2_QUANTIZATION_LIM_RANGE) {
> +		s32 tmp1, tmp2;
> +
> +		thr1 = (219 * (contrast + 128)) / 512;
> +		thr1y = (219 - 2 * thr1) / 2;
> +		thr2 = 219 - thr1;
> +		thr2y = 219 - thr1y;
> +
> +		tmp1 = (thr1y * 256) / thr1;
> +		tmp2 = ((thr2y - thr1y) * 256) / (thr2 - thr1);
> +		off1 = ((thr1y - ((tmp2 * thr1) / 256)) * (s32)DEF_COLOR_COEFF_A) / 256;
> +		off2 = ((thr2y - ((tmp1 * thr2) / 256)) * (s32)DEF_COLOR_COEFF_A) / 256;
> +
> +		tmp1 = (64 * (contrast + 128)) / 128;
> +		tmp2 = 256 * (128 - tmp1);
> +		a1 = (tmp2 + off2) / thr1;
> +		a2 = a1 + (256 * (off2 - 1)) / (thr2 - thr1);
> +	} else {
> +		thr1 = (64 * (contrast + 128)) / 128;
> +		thr1y = 128 - thr1;
> +		thr2 = 256 - thr1;
> +		thr2y = 256 - thr1y;
> +		a1 = (thr1y * 256) / thr1;
> +		a2 = ((thr2y - thr1y) * 256) / (thr2 - thr1);
> +		off1 = thr1y - (a2 * thr1) / 256;
> +		off2 = thr2y - (a1 * thr2) / 256;
> +	}
> +
> +	a1 = clamp(a1, 0, 1023);
> +	a2 = clamp(a2, 0, 1023);
> +	thr1 = clamp(thr1, 0, 255);
> +	thr2 = clamp(thr2, 0, 255);
> +	off1 = clamp(off1, -512, 511);
> +	off2 = clamp(off2, -512, 511);
> +
> +	hantro_reg_write(vpu, &reg_contrast_thr1, thr1);
> +	hantro_reg_write(vpu, &reg_contrast_thr2, thr2);
> +	hantro_reg_write(vpu, &reg_contrast_off1, off1);
> +	hantro_reg_write(vpu, &reg_contrast_off2, off2);
> +	hantro_reg_write(vpu, &reg_color_a1, a1);
> +	hantro_reg_write(vpu, &reg_color_a2, a2);
> +
> +	/* Brightness */
> +	hantro_reg_write(vpu, &reg_color_f, brightness);
> +
> +	/* Saturation */
> +	satur = 64 + saturation;
> +	tmp = (satur * (s32)DEF_COLOR_COEFF_B) / 64;
> +	tmp = clamp(tmp, 0, 1023);
> +	hantro_reg_write(vpu, &reg_color_b, tmp);
> +
> +	tmp = (satur * (s32)DEF_COLOR_COEFF_C) / 64;
> +	tmp = clamp(tmp, 0, 1023);
> +	hantro_reg_write(vpu, &reg_color_c, tmp);
> +
> +	tmp = (satur * (s32)DEF_COLOR_COEFF_D) / 64;
> +	tmp = clamp(tmp, 0, 1023);
> +	hantro_reg_write(vpu, &reg_color_d, tmp);
> +
> +	tmp = (satur * (s32)DEF_COLOR_COEFF_E) / 64;
> +	tmp = clamp(tmp, 0, 1023);
> +	hantro_reg_write(vpu, &reg_color_e, tmp);
> +
> +	/* Set RGB padding and mask */
> +	switch (ctx->vpu_dst_fmt->fourcc) {
> +	case V4L2_PIX_FMT_RGBX32:
> +		hantro_reg_write(vpu, &reg_pad_r, 0);
> +		hantro_reg_write(vpu, &reg_pad_g, 8);
> +		hantro_reg_write(vpu, &reg_pad_b, 16);
> +
> +		vdpu_write_relaxed(vpu, 0xff000000, G1_REG_PP_MASK_R);
> +		vdpu_write_relaxed(vpu, 0x00ff0000, G1_REG_PP_MASK_G);
> +		vdpu_write_relaxed(vpu, 0x0000ff00, G1_REG_PP_MASK_B);
> +		break;
> +	case V4L2_PIX_FMT_XRGB32:
> +		hantro_reg_write(vpu, &reg_pad_r, 8);
> +		hantro_reg_write(vpu, &reg_pad_g, 16);
> +		hantro_reg_write(vpu, &reg_pad_b, 24);
> +
> +		vdpu_write_relaxed(vpu, 0x00ff0000, G1_REG_PP_MASK_R);
> +		vdpu_write_relaxed(vpu, 0x0000ff00, G1_REG_PP_MASK_G);
> +		vdpu_write_relaxed(vpu, 0x000000ff, G1_REG_PP_MASK_B);
> +		break;
> +	case V4L2_PIX_FMT_XBGR32:
> +		hantro_reg_write(vpu, &reg_pad_b, 0);
> +		hantro_reg_write(vpu, &reg_pad_g, 8);
> +		hantro_reg_write(vpu, &reg_pad_r, 16);
> +
> +		vdpu_write_relaxed(vpu, 0xff000000, G1_REG_PP_MASK_B);
> +		vdpu_write_relaxed(vpu, 0x00ff0000, G1_REG_PP_MASK_G);
> +		vdpu_write_relaxed(vpu, 0x0000ff00, G1_REG_PP_MASK_R);
> +		break;
> +	}
> +}
> +
> +void hantro_postproc_setup(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct vb2_v4l2_buffer *dst_buf;
> +	u32 reg, src_pp_fmt, dst_pp_fmt;
> +	dma_addr_t dst_dma;
> +
> +	/* Turn on pipeline mode. Must be done first. */
> +	vdpu_write(vpu, G1_REG_PP_PIPELINE_EN, G1_REG_PP_INTERRUPT);
> +
> +	reg = G1_REG_PP_AXI_RD_ID(0) |
> +	      G1_REG_PP_AXI_WR_ID(0) |
> +	      G1_REG_PP_INSWAP32_E(1) |
> +	      G1_REG_PP_OUTSWAP32_E(1) |
> +	      G1_REG_PP_DATA_DISC_E(0) |
> +	      G1_REG_PP_CLK_GATE_E(1) |
> +	      G1_REG_PP_IN_ENDIAN(1) |
> +	      G1_REG_PP_OUT_ENDIAN(1) |
> +	      G1_REG_PP_MAX_BURST(16);
> +	vdpu_write_relaxed(vpu, reg, G1_REG_PP_DEV_CONFIG);
> +
> +	/* Configure picture resolution. */
> +	reg = G1_REG_PP_INPUT_SIZE_HEIGHT(MB_HEIGHT(ctx->dst_fmt.height)) |
> +	      G1_REG_PP_INPUT_SIZE_WIDTH(MB_WIDTH(ctx->dst_fmt.width));
> +	vdpu_write_relaxed(vpu, reg, G1_REG_PP_INPUT_SIZE);
> +
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	vdpu_write_relaxed(vpu, dst_dma, G1_REG_PP_OUT_LUMA_BASE);
> +
> +	reg = (ctx->dst_fmt.quantization ==
> +	       V4L2_QUANTIZATION_LIM_RANGE) ? 0 : 1;

Why dst_fmt? Userspace cannot set the quantization range of the capture
format, it's either copied from the source format or explicitly set in the
driver.

I see this code in vidioc_s_fmt_cap_mplane():

        /* Colorimetry information are always propagated. */
        ctx->src_fmt.colorspace = pix_mp->colorspace;
        ctx->src_fmt.ycbcr_enc = pix_mp->ycbcr_enc;
        ctx->src_fmt.xfer_func = pix_mp->xfer_func;
        ctx->src_fmt.quantization = pix_mp->quantization;

I think this is wrong.

If I am not mistaken, userspace has parsed this information from the bytestream
and should pass it to the driver when it calls S_FMT for the output queue.
Please correct me if I am wrong. But this information has to come from somewhere.

These values should be propagated to the capture queue.

Adding YUV to RGB conversion changes this: in that case you want to convert to
full range RGB. So both ycbcr_enc and quantization can be set to the DEFAULT
value for the RGB capture format. The colorspace and xfer_func values are copied
as before since those are not converted by the post-processing step.

Regards,

	Hans

> +	hantro_reg_write(vpu, &reg_ycbcr_range, reg);
> +
> +	/* Clear this register before setting the RGB coefficients. */
> +	vdpu_write_relaxed(vpu, 0, G1_REG_PP_SCALING1);
> +
> +	switch (ctx->vpu_dst_fmt->fourcc) {
> +	case V4L2_PIX_FMT_YUYV:
> +		dst_pp_fmt = VPU_PP_OUT_YUYV;
> +		break;
> +	case V4L2_PIX_FMT_RGBX32:
> +	case V4L2_PIX_FMT_XRGB32:
> +	case V4L2_PIX_FMT_XBGR32:
> +		dst_pp_fmt = VPU_PP_OUT_RGB;
> +		hantro_postproc_setup_rgb(ctx);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	/* Currently NV12 is the only supported input pixel format. */
> +	src_pp_fmt = VPU_PP_IN_NV12;
> +
> +	/* Configure src/dst post-processor formats. */
> +	reg = G1_REG_PP_CONTROL_IN_FMT(src_pp_fmt) |
> +	      G1_REG_PP_CONTROL_OUT_FMT(dst_pp_fmt) |
> +	      G1_REG_PP_CONTROL_OUT_HEIGHT(ctx->dst_fmt.height) |
> +	      G1_REG_PP_CONTROL_OUT_WIDTH(ctx->dst_fmt.width);
> +	vdpu_write_relaxed(vpu, reg, G1_REG_PP_CONTROL);
> +
> +	reg = G1_REG_PP_ORIG_WIDTH(MB_WIDTH(ctx->dst_fmt.width));
> +	vdpu_write_relaxed(vpu, reg, G1_REG_PP_MASK1_ORIG_WIDTH);
> +	vdpu_write_relaxed(vpu, ctx->dst_fmt.width, G1_REG_PP_DISPLAY_WIDTH);
> +}
> +
> +void hantro_postproc_free(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	unsigned int i;
> +
> +	for (i = 0; i < VB2_MAX_FRAME; ++i) {
> +		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
> +
> +		if (priv->cpu) {
> +			dma_free_attrs(vpu->dev, priv->size, priv->cpu,
> +				       priv->dma, priv->attrs);
> +			priv->cpu = NULL;
> +		}
> +	}
> +}
> +
> +int hantro_postproc_alloc(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	unsigned int i, buf_size;
> +
> +	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
> +
> +	for (i = 0; i < VB2_MAX_FRAME; ++i) {
> +		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
> +
> +		priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING |
> +			      DMA_ATTR_WRITE_COMBINE |
> +			      DMA_ATTR_NON_CONSISTENT;
> +		priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
> +					    GFP_KERNEL, priv->attrs);
> +		if (!priv->cpu)
> +			return -ENOMEM;
> +		priv->size = buf_size;
> +	}
> +	return 0;
> +}
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 59adecba0e85..37a9ba71afa6 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -242,9 +242,10 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
>  		/*
>  		 * The H264 decoder needs extra space on the output buffers
>  		 * to store motion vectors. This is needed for reference
> -		 * frames.
> +		 * frames and only if the format is non-post-processed (NV12).
>  		 */
> -		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
> +		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
> +		    fmt->fourcc == V4L2_PIX_FMT_NV12)
>  			pix_mp->plane_fmt[0].sizeimage +=
>  				hantro_h264_buffer_extra_size(pix_mp->width,
>  							      pix_mp->height);
> @@ -634,10 +635,23 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
>  
>  		vpu_debug(4, "Codec mode = %d\n", codec_mode);
>  		ctx->codec_ops = &ctx->dev->variant->codec_ops[codec_mode];
> -		if (ctx->codec_ops->init)
> +		if (ctx->codec_ops->init) {
>  			ret = ctx->codec_ops->init(ctx);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (hantro_use_postproc(ctx)) {
> +			ret = hantro_postproc_alloc(ctx);
> +			if (ret)
> +				goto err_codec_exit;
> +		}
>  	}
> +	return ret;
>  
> +err_codec_exit:
> +	if (ctx->codec_ops && ctx->codec_ops->exit)
> +		ctx->codec_ops->exit(ctx);
>  	return ret;
>  }
>  
> @@ -664,6 +678,7 @@ static void hantro_stop_streaming(struct vb2_queue *q)
>  	struct hantro_ctx *ctx = vb2_get_drv_priv(q);
>  
>  	if (hantro_vq_is_coded(q)) {
> +		hantro_postproc_free(ctx);
>  		if (ctx->codec_ops && ctx->codec_ops->exit)
>  			ctx->codec_ops->exit(ctx);
>  	}
> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> index c0bdd6c02520..18d6b725309b 100644
> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
> @@ -59,6 +59,27 @@ static const struct hantro_fmt rk3288_vpu_enc_fmts[] = {
>  static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12,
> +		.dec_fourcc = V4L2_PIX_FMT_NV12,
> +		.codec_mode = HANTRO_MODE_NONE,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_RGBX32,
> +		.dec_fourcc = V4L2_PIX_FMT_NV12,
> +		.codec_mode = HANTRO_MODE_NONE,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_XRGB32,
> +		.dec_fourcc = V4L2_PIX_FMT_NV12,
> +		.codec_mode = HANTRO_MODE_NONE,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_XBGR32,
> +		.dec_fourcc = V4L2_PIX_FMT_NV12,
> +		.codec_mode = HANTRO_MODE_NONE,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUYV,
> +		.dec_fourcc = V4L2_PIX_FMT_NV12,
>  		.codec_mode = HANTRO_MODE_NONE,
>  	},
>  	{
> 

