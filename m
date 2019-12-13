Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAA811DF82
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 09:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfLMIdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 03:33:42 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47339 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725810AbfLMIdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 03:33:41 -0500
Received: from [IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478]
 ([IPv6:2001:983:e9a7:1:c93c:45bd:1710:e478])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fgOGikB1AapzpfgOIid4M6; Fri, 13 Dec 2019 09:33:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576226018; bh=Ee30oMSVoMTz0lVeXu4GyCajMpaGislRBDiveKMQgpo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vTIs7mlZ/FmrIN0UjNHk/+/vRe+6/lk44NJz1A4j9s4xfjRHxLjKAIV8vveACeF17
         16qKqgbsrloOz1YDeNBH/Y7RTKZRIfAx+0+F23pZQBvh2b/TOTiYQaxrmoRXlXHIqk
         ZO4620NhdRhlRfHAWy8048q6Y9Z0HrcB1Vac6YLUDFr7QfQmbhRjZfpl4UFBabkGMf
         s3RWwzbym8XoBDOukx85wZqdhDRtfHncQSe3D9wr2n7n7YAXLtbE+rB7bPBcV5U55I
         1+DUrP93W2qpgNGG/oKI4DK772d/GwHQmP8puui36ff18PTrO/kid21v/uHvmOZma8
         5s9S3gCEiXOWQ==
Subject: Re: [PATCH v2 4/4] media: coda: jpeg: add CODA960 JPEG encoder
 support
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
References: <20191212140255.8766-1-p.zabel@pengutronix.de>
 <20191212140255.8766-4-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a12fd0ed-a90d-51d2-0fce-2e064ca303a5@xs4all.nl>
Date:   Fri, 13 Dec 2019 09:33:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212140255.8766-4-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPBbLgS2gdLg0RcOmO80pgWU+e4wEseuetNO2QJ0GrG3M4GEN+RGUYRQqbjt5xvK0RutDtVyMZFUMq5VgOQAKOQEFhnQ31qcsJG8jVYBwG6xr1Ign9J+
 CNt/rnCk3EI4V+ofAuROpFrN2DiRbXpwoe+nCyTG2Dtiw4WqPIOiACvPGOkg/s1+0nOlDL7iBOHQnNRXdFRqzNgFtCBx2YjJnLRMg3Vya6fc/1iJyGN6FklM
 RpyOS9IlmIoNFMOhjasnbOrk7pSgh86aDwAJ5xemBxiSvn4cWED0bjez4Bat02tnNFAZ2ocCoXYZ+Co7529/JtE5aaWb4nlQCm5tXzrHNJm348+68bcaeYi7
 uqNTGpW7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Two small comments:

On 12/12/19 3:02 PM, Philipp Zabel wrote:
> This patch adds JPEG encoding support for CODA960, handling the JPEG
> hardware directly. A separate JPEG encoder video device is created due
> to the separate hardware unit and different supported pixel formats.
> While the hardware can not change subsampling on the fly, it can encode
> 4:2:2 subsampled images into JPEGs of the same subsampling.
> 
> There are two additional tracepoints added to the coda driver that can
> be used together with the v4l2:v4l2_qbuf and v4l2:v4l2_dqbuf tracepoints
> to to follow video frames through the mem2mem device when encoding or
> decoding with the CODA960 JPEG codec:
>     coda:coda_jpeg_run
>     coda:coda_jpeg_done
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Tested-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> Changes since v1 [1]:
> - fixed platform_get_irq.cocci warnings
> - fixed encoder Huffman table generation, replaced broken pointer
>   arithmetic with a structure definition
> - moved encoder Huffman table generation to start_streaming
> - dropped coda9_jpeg_load_qmat_tab return value
> 
> [1] https://patchwork.linuxtv.org/patch/60107/
> ---
>  drivers/media/platform/coda/coda-common.c |  39 +-
>  drivers/media/platform/coda/coda-jpeg.c   | 708 ++++++++++++++++++++++
>  drivers/media/platform/coda/coda.h        |   3 +
>  drivers/media/platform/coda/trace.h       |  10 +
>  4 files changed, 758 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 556f8e0f52d7..0b5abae11012 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -155,6 +155,7 @@ static const struct coda_codec coda7_codecs[] = {
>  static const struct coda_codec coda9_codecs[] = {
>  	CODA_CODEC(CODA9_MODE_ENCODE_H264, V4L2_PIX_FMT_YUV420, V4L2_PIX_FMT_H264,   1920, 1088),
>  	CODA_CODEC(CODA9_MODE_ENCODE_MP4,  V4L2_PIX_FMT_YUV420, V4L2_PIX_FMT_MPEG4,  1920, 1088),
> +	CODA_CODEC(CODA9_MODE_ENCODE_MJPG, V4L2_PIX_FMT_YUV420, V4L2_PIX_FMT_JPEG,   8192, 8192),
>  	CODA_CODEC(CODA9_MODE_DECODE_H264, V4L2_PIX_FMT_H264,   V4L2_PIX_FMT_YUV420, 1920, 1088),
>  	CODA_CODEC(CODA9_MODE_DECODE_MP2,  V4L2_PIX_FMT_MPEG2,  V4L2_PIX_FMT_YUV420, 1920, 1088),
>  	CODA_CODEC(CODA9_MODE_DECODE_MP4,  V4L2_PIX_FMT_MPEG4,  V4L2_PIX_FMT_YUV420, 1920, 1088),
> @@ -235,6 +236,22 @@ static const struct coda_video_device coda_bit_jpeg_decoder = {
>  	},
>  };
>  
> +static const struct coda_video_device coda9_jpeg_encoder = {
> +	.name = "coda-jpeg-encoder",
> +	.type = CODA_INST_ENCODER,
> +	.ops = &coda9_jpeg_encode_ops,
> +	.direct = true,
> +	.src_formats = {
> +		V4L2_PIX_FMT_NV12,
> +		V4L2_PIX_FMT_YUV420,
> +		V4L2_PIX_FMT_YVU420,
> +		V4L2_PIX_FMT_YUV422P,
> +	},
> +	.dst_formats = {
> +		V4L2_PIX_FMT_JPEG,
> +	},
> +};
> +
>  static const struct coda_video_device *codadx6_video_devices[] = {
>  	&coda_bit_encoder,
>  };
> @@ -252,6 +269,7 @@ static const struct coda_video_device *coda7_video_devices[] = {
>  };
>  
>  static const struct coda_video_device *coda9_video_devices[] = {
> +	&coda9_jpeg_encoder,
>  	&coda_bit_encoder,
>  	&coda_bit_decoder,
>  };
> @@ -721,7 +739,8 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
>  		ctx->tiled_map_type = GDI_TILED_FRAME_MB_RASTER_MAP;
>  		break;
>  	case V4L2_PIX_FMT_NV12:
> -		if (!disable_tiling && ctx->dev->devtype->product == CODA_960) {
> +		if (!disable_tiling && ctx->use_bit &&
> +		    ctx->dev->devtype->product == CODA_960) {
>  			ctx->tiled_map_type = GDI_TILED_FRAME_MB_RASTER_MAP;
>  			break;
>  		}
> @@ -1787,7 +1806,7 @@ static void coda_buf_queue(struct vb2_buffer *vb)
>  				coda_queue_source_change_event(ctx);
>  		}
>  	} else {
> -		if (ctx->inst_type == CODA_INST_ENCODER &&
> +		if ((ctx->inst_type == CODA_INST_ENCODER || !ctx->use_bit) &&
>  		    vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>  			vbuf->sequence = ctx->qsequence++;
>  		v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> @@ -2996,6 +3015,22 @@ static int coda_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	/* JPEG IRQ */
> +	if (dev->devtype->product == CODA_960) {
> +		irq = platform_get_irq_byname(pdev, "jpeg");
> +		if (irq < 0)
> +			return irq;
> +
> +		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> +						coda9_jpeg_irq_handler,
> +						IRQF_ONESHOT, CODA_NAME " jpeg",
> +						dev);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to request jpeg irq\n");
> +			return ret;
> +		}
> +	}
> +
>  	dev->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev,
>  							      NULL);
>  	if (IS_ERR(dev->rstc)) {
> diff --git a/drivers/media/platform/coda/coda-jpeg.c b/drivers/media/platform/coda/coda-jpeg.c
> index 27e20aee1a8c..983fac80a5a5 100644
> --- a/drivers/media/platform/coda/coda-jpeg.c
> +++ b/drivers/media/platform/coda/coda-jpeg.c
> @@ -5,15 +5,40 @@
>   * Copyright (C) 2014 Philipp Zabel, Pengutronix
>   */
>  
> +#include <asm/unaligned.h>
> +#include <linux/irqreturn.h>
>  #include <linux/kernel.h>
> +#include <linux/ktime.h>
> +#include <linux/slab.h>
>  #include <linux/swab.h>
> +#include <linux/videodev2.h>
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-dma-contig.h>
>  
>  #include "coda.h"
>  #include "trace.h"
>  
>  #define SOI_MARKER	0xffd8
> +#define DRI_MARKER	0xffdd
> +#define DQT_MARKER	0xffdb
> +#define DHT_MARKER	0xffc4
> +#define SOF_MARKER	0xffc0
>  #define EOI_MARKER	0xffd9
>  
> +enum {
> +	CODA9_JPEG_FORMAT_420,
> +	CODA9_JPEG_FORMAT_422,
> +	CODA9_JPEG_FORMAT_224,
> +	CODA9_JPEG_FORMAT_444,
> +	CODA9_JPEG_FORMAT_400,
> +};
> +
> +#define CODA9_JPEG_ENC_HUFF_DATA_SIZE	(256 + 256 + 16 + 16)
> +
>  /*
>   * Typical Huffman tables for 8-bit precision luminance and
>   * chrominance from JPEG ITU-T.81 (ISO/IEC 10918-1) Annex K.3
> @@ -120,6 +145,38 @@ static unsigned char chroma_q[64] = {
>  	0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c, 0x0c,
>  };
>  
> +static const unsigned char width_align[] = {
> +	[CODA9_JPEG_FORMAT_420] = 16,
> +	[CODA9_JPEG_FORMAT_422] = 16,
> +	[CODA9_JPEG_FORMAT_224] = 8,
> +	[CODA9_JPEG_FORMAT_444] = 8,
> +	[CODA9_JPEG_FORMAT_400] = 8,
> +};
> +
> +static const unsigned char height_align[] = {
> +	[CODA9_JPEG_FORMAT_420] = 16,
> +	[CODA9_JPEG_FORMAT_422] = 8,
> +	[CODA9_JPEG_FORMAT_224] = 16,
> +	[CODA9_JPEG_FORMAT_444] = 8,
> +	[CODA9_JPEG_FORMAT_400] = 8,
> +};
> +
> +static int coda9_jpeg_chroma_format(u32 pixfmt)
> +{
> +	switch (pixfmt) {
> +	case V4L2_PIX_FMT_YUV420:
> +	case V4L2_PIX_FMT_NV12:
> +		return CODA9_JPEG_FORMAT_420;
> +	case V4L2_PIX_FMT_YUV422P:
> +		return CODA9_JPEG_FORMAT_422;
> +	case V4L2_PIX_FMT_YUV444:
> +		return CODA9_JPEG_FORMAT_444;
> +	case V4L2_PIX_FMT_GREY:
> +		return CODA9_JPEG_FORMAT_400;
> +	}
> +	return -EINVAL;
> +}
> +
>  struct coda_memcpy_desc {
>  	int offset;
>  	const void *src;
> @@ -190,6 +247,380 @@ bool coda_jpeg_check_buffer(struct coda_ctx *ctx, struct vb2_buffer *vb)
>  	return false;
>  }
>  
> +static const int bus_req_num[] = {
> +	[CODA9_JPEG_FORMAT_420] = 2,
> +	[CODA9_JPEG_FORMAT_422] = 3,
> +	[CODA9_JPEG_FORMAT_224] = 3,
> +	[CODA9_JPEG_FORMAT_444] = 4,
> +	[CODA9_JPEG_FORMAT_400] = 4,
> +};
> +
> +#define MCU_INFO(mcu_block_num, comp_num, comp0_info, comp1_info, comp2_info) \
> +	(((mcu_block_num) << CODA9_JPEG_MCU_BLOCK_NUM_OFFSET) | \
> +	 ((comp_num) << CODA9_JPEG_COMP_NUM_OFFSET) | \
> +	 ((comp0_info) << CODA9_JPEG_COMP0_INFO_OFFSET) | \
> +	 ((comp1_info) << CODA9_JPEG_COMP1_INFO_OFFSET) | \
> +	 ((comp2_info) << CODA9_JPEG_COMP2_INFO_OFFSET))
> +
> +static const u32 mcu_info[] = {
> +	[CODA9_JPEG_FORMAT_420] = MCU_INFO(6, 3, 10, 5, 5),
> +	[CODA9_JPEG_FORMAT_422] = MCU_INFO(4, 3, 9, 5, 5),
> +	[CODA9_JPEG_FORMAT_224] = MCU_INFO(4, 3, 6, 5, 5),
> +	[CODA9_JPEG_FORMAT_444] = MCU_INFO(3, 3, 5, 5, 5),
> +	[CODA9_JPEG_FORMAT_400] = MCU_INFO(1, 1, 5, 0, 0),
> +};
> +
> +/*
> + * Convert Huffman table specifcations to tables of codes and code lengths.
> + * For reference, see JPEG ITU-T.81 (ISO/IEC 10918-1) [1]
> + *
> + * [1] https://www.w3.org/Graphics/JPEG/itu-t81.pdf
> + */
> +static int coda9_jpeg_gen_enc_huff_tab(struct coda_ctx *ctx, int tab_num,
> +				       int *ehufsi, int *ehufco)
> +{
> +	int i, j, k, lastk, si, code, maxsymbol;
> +	const u8 *bits, *huffval;
> +	struct {
> +		int size[256];
> +		int code[256];
> +	} *huff;
> +	static const unsigned char *huff_tabs[4] = {
> +		luma_dc, luma_ac, chroma_dc, chroma_ac,
> +	};
> +	int ret = -EINVAL;
> +
> +	huff = kzalloc(sizeof(*huff), GFP_KERNEL);
> +	if (!huff)
> +		return -ENOMEM;
> +
> +	bits = huff_tabs[tab_num];
> +	huffval = huff_tabs[tab_num] + 16;
> +
> +	maxsymbol = tab_num & 1 ? 256 : 16;
> +
> +	/* Figure C.1 - Generation of table of Huffman code sizes */
> +	k = 0;
> +	for (i = 1; i <= 16; i++) {
> +		j = bits[i - 1];
> +		if (k + j > maxsymbol)
> +			goto out;
> +		while (j--)
> +			huff->size[k++] = i;
> +	}
> +	lastk = k;
> +
> +	/* Figure C.2 - Generation of table of Huffman codes */
> +	k = 0;
> +	code = 0;
> +	si = huff->size[0];
> +	while (k < lastk) {
> +		while (huff->size[k] == si) {
> +			huff->code[k++] = code;
> +			code++;
> +		}
> +		if (code >= (1 << si))
> +			goto out;
> +		code <<= 1;
> +		si++;
> +	}
> +
> +	/* Figure C.3 - Ordering procedure for encoding procedure code tables */
> +	for (k = 0; k < lastk; k++) {
> +		i = huffval[k];
> +		if (i >= maxsymbol || ehufsi[i])
> +			goto out;
> +		ehufco[i] = huff->code[k];
> +		ehufsi[i] = huff->size[k];
> +	}
> +
> +	ret = 0;
> +out:
> +	kfree(huff);
> +	return ret;
> +}
> +
> +#define DC_TABLE_INDEX0		    0
> +#define AC_TABLE_INDEX0		    1
> +#define DC_TABLE_INDEX1		    2
> +#define AC_TABLE_INDEX1		    3
> +
> +static int coda9_jpeg_load_huff_tab(struct coda_ctx *ctx)
> +{
> +	struct {
> +		int size[4][256];
> +		int code[4][256];
> +	} *huff;
> +	u32 *huff_data;
> +	int i, j, k;
> +	int ret;
> +
> +	huff = kzalloc(sizeof(*huff), GFP_KERNEL);
> +	if (!huff)
> +		return -ENOMEM;
> +
> +	/* Generate all four (luma/chroma DC/AC) code/size lookup tables */
> +	for (i = 0; i < 4; i++) {
> +		ret = coda9_jpeg_gen_enc_huff_tab(ctx, i, huff->size[i],
> +						  huff->code[i]);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	if (!ctx->params.jpeg_huff_data) {
> +		ctx->params.jpeg_huff_data =
> +			kzalloc(sizeof(u32) * CODA9_JPEG_ENC_HUFF_DATA_SIZE,
> +				GFP_KERNEL);
> +		if (!ctx->params.jpeg_huff_data) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +	}
> +	huff_data = ctx->params.jpeg_huff_data;
> +
> +	k = 0;

k is set to 0 here, but never used elsewhere. Can it be removed?

> +	for (j = 0; j < 4; j++) {
> +		/* Store Huffman lookup tables in AC0, AC1, DC0, DC1 order */
> +		int t = (j == 0) ? AC_TABLE_INDEX0 :
> +			(j == 1) ? AC_TABLE_INDEX1 :
> +			(j == 2) ? DC_TABLE_INDEX0 :
> +				   DC_TABLE_INDEX1;
> +		/* DC tables only have 16 entries */
> +		int len = (j < 2) ? 256 : 16;
> +
> +		for (i = 0; i < len; i++) {
> +			if (huff->size[t][i] == 0 && huff->code[t][i] == 0)
> +				*(huff_data++) = 0;
> +			else
> +				*(huff_data++) =
> +					((huff->size[t][i] - 1) << 16) |
> +					huff->code[t][i];
> +		}
> +	}
> +
> +	ret = 0;
> +out:
> +	kfree(huff);
> +	return ret;
> +}
> +
> +static void coda9_jpeg_write_huff_tab(struct coda_ctx *ctx)
> +{
> +	struct coda_dev *dev = ctx->dev;
> +	u32 *huff_data = ctx->params.jpeg_huff_data;
> +	int i;
> +
> +	/* Write Huffman size/code lookup tables in AC0, AC1, DC0, DC1 order */
> +	coda_write(dev, 0x3, CODA9_REG_JPEG_HUFF_CTRL);
> +	for (i = 0; i < CODA9_JPEG_ENC_HUFF_DATA_SIZE; i++)
> +		coda_write(dev, *(huff_data++), CODA9_REG_JPEG_HUFF_DATA);
> +	coda_write(dev, 0x0, CODA9_REG_JPEG_HUFF_CTRL);
> +}
> +
> +static inline void coda9_jpeg_write_qmat_quotients(struct coda_dev *dev,
> +						   u8 *qmat, int index)
> +{
> +	int i;
> +
> +	coda_write(dev, index | 0x3, CODA9_REG_JPEG_QMAT_CTRL);
> +	for (i = 0; i < 64; i++)
> +		coda_write(dev, 0x80000 / qmat[i], CODA9_REG_JPEG_QMAT_DATA);
> +	coda_write(dev, index, CODA9_REG_JPEG_QMAT_CTRL);
> +}
> +
> +static void coda9_jpeg_load_qmat_tab(struct coda_ctx *ctx)
> +{
> +	struct coda_dev *dev = ctx->dev;
> +	u8 *luma_tab;
> +	u8 *chroma_tab;
> +
> +	luma_tab = ctx->params.jpeg_qmat_tab[0];
> +	if (!luma_tab)
> +		luma_tab = luma_q;
> +
> +	chroma_tab = ctx->params.jpeg_qmat_tab[1];
> +	if (!chroma_tab)
> +		chroma_tab = chroma_q;
> +
> +	coda9_jpeg_write_qmat_quotients(dev, luma_tab, 0x00);
> +	coda9_jpeg_write_qmat_quotients(dev, chroma_tab, 0x40);
> +	coda9_jpeg_write_qmat_quotients(dev, chroma_tab, 0x80);
> +}
> +
> +struct coda_jpeg_stream {
> +	u8 *curr;
> +	u8 *end;
> +};
> +
> +static inline int coda_jpeg_put_byte(u8 byte, struct coda_jpeg_stream *stream)
> +{
> +	if (stream->curr >= stream->end)
> +		return -EINVAL;
> +
> +	*stream->curr++ = byte;
> +
> +	return 0;
> +}
> +
> +static inline int coda_jpeg_put_word(u16 word, struct coda_jpeg_stream *stream)
> +{
> +	if (stream->curr + sizeof(__be16) > stream->end)
> +		return -EINVAL;
> +
> +	put_unaligned_be16(word, stream->curr);
> +	stream->curr += sizeof(__be16);
> +
> +	return 0;
> +}
> +
> +static int coda_jpeg_put_table(u16 marker, u8 index, const u8 *table,
> +			       size_t len, struct coda_jpeg_stream *stream)
> +{
> +	int i, ret;
> +
> +	ret = coda_jpeg_put_word(marker, stream);
> +	if (ret < 0)
> +		return ret;
> +	ret = coda_jpeg_put_word(3 + len, stream);
> +	if (ret < 0)
> +		return ret;
> +	ret = coda_jpeg_put_byte(index, stream);
> +	for (i = 0; i < len && ret == 0; i++)
> +		ret = coda_jpeg_put_byte(table[i], stream);
> +
> +	return ret;
> +}
> +
> +static int coda_jpeg_define_quantization_table(struct coda_ctx *ctx, u8 index,
> +					       struct coda_jpeg_stream *stream)
> +{
> +	return coda_jpeg_put_table(DQT_MARKER, index,
> +				   ctx->params.jpeg_qmat_tab[index], 64,
> +				   stream);
> +}
> +
> +static int coda_jpeg_define_huffman_table(u8 index, const u8 *table, size_t len,
> +					  struct coda_jpeg_stream *stream)
> +{
> +	return coda_jpeg_put_table(DHT_MARKER, index, table, len, stream);
> +}
> +
> +static int coda9_jpeg_encode_header(struct coda_ctx *ctx, int len, u8 *buf)
> +{
> +	struct coda_jpeg_stream stream = { buf, buf + len };
> +	struct coda_q_data *q_data_src;
> +	int chroma_format, comp_num;
> +	int i, ret, pad;
> +
> +	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +	chroma_format = coda9_jpeg_chroma_format(q_data_src->fourcc);
> +	if (chroma_format < 0)
> +		return 0;
> +
> +	/* Start Of Image */
> +	ret = coda_jpeg_put_word(SOI_MARKER, &stream);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Define Restart Interval */
> +	if (ctx->params.jpeg_restart_interval) {
> +		ret = coda_jpeg_put_word(DRI_MARKER, &stream);
> +		if (ret < 0)
> +			return ret;
> +		ret = coda_jpeg_put_word(4, &stream);
> +		if (ret < 0)
> +			return ret;
> +		ret = coda_jpeg_put_word(ctx->params.jpeg_restart_interval,
> +					 &stream);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Define Quantization Tables */
> +	ret = coda_jpeg_define_quantization_table(ctx, 0x00, &stream);
> +	if (ret < 0)
> +		return ret;
> +	if (chroma_format != CODA9_JPEG_FORMAT_400) {
> +		ret = coda_jpeg_define_quantization_table(ctx, 0x01, &stream);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Define Huffman Tables */
> +	ret = coda_jpeg_define_huffman_table(0x00, luma_dc, 16 + 12, &stream);
> +	if (ret < 0)
> +		return ret;
> +	ret = coda_jpeg_define_huffman_table(0x10, luma_ac, 16 + 162, &stream);
> +	if (ret < 0)
> +		return ret;
> +	if (chroma_format != CODA9_JPEG_FORMAT_400) {
> +		ret = coda_jpeg_define_huffman_table(0x01, chroma_dc, 16 + 12,
> +						     &stream);
> +		if (ret < 0)
> +			return ret;
> +		ret = coda_jpeg_define_huffman_table(0x11, chroma_ac, 16 + 162,
> +						     &stream);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Start Of Frame */
> +	ret = coda_jpeg_put_word(SOF_MARKER, &stream);
> +	if (ret < 0)
> +		return ret;
> +	comp_num = (chroma_format == CODA9_JPEG_FORMAT_400) ? 1 : 3;
> +	ret = coda_jpeg_put_word(8 + comp_num * 3, &stream);
> +	if (ret < 0)
> +		return ret;
> +	ret = coda_jpeg_put_byte(0x08, &stream);
> +	if (ret < 0)
> +		return ret;
> +	ret = coda_jpeg_put_word(q_data_src->height, &stream);
> +	if (ret < 0)
> +		return ret;
> +	ret = coda_jpeg_put_word(q_data_src->width, &stream);
> +	if (ret < 0)
> +		return ret;
> +	ret = coda_jpeg_put_byte(comp_num, &stream);
> +	if (ret < 0)
> +		return ret;
> +	for (i = 0; i < comp_num; i++) {
> +		static unsigned char subsampling[5][3] = {
> +			[CODA9_JPEG_FORMAT_420] = { 0x22, 0x11, 0x11 },
> +			[CODA9_JPEG_FORMAT_422] = { 0x21, 0x11, 0x11 },
> +			[CODA9_JPEG_FORMAT_224] = { 0x12, 0x11, 0x11 },
> +			[CODA9_JPEG_FORMAT_444] = { 0x11, 0x11, 0x11 },
> +			[CODA9_JPEG_FORMAT_400] = { 0x11 },
> +		};
> +
> +		/* Component identifier, matches SOS */
> +		ret = coda_jpeg_put_byte(i + 1, &stream);
> +		if (ret < 0)
> +			return ret;
> +		ret = coda_jpeg_put_byte(subsampling[chroma_format][i],
> +					 &stream);
> +		if (ret < 0)
> +			return ret;
> +		/* Chroma table index */
> +		ret = coda_jpeg_put_byte((i == 0) ? 0 : 1, &stream);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Pad to multiple of 8 bytes */
> +	pad = (stream.curr - buf) % 8;
> +	if (pad) {
> +		pad = 8 - pad;
> +		while (pad--) {
> +			ret = coda_jpeg_put_byte(0x00, &stream);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	return stream.curr - buf;
> +}
> +
>  /*
>   * Scale quantization table using nonlinear scaling factor
>   * u8 qtab[64], scale [50,190]
> @@ -239,3 +670,280 @@ void coda_set_jpeg_compression_quality(struct coda_ctx *ctx, int quality)
>  		coda_scale_quant_table(ctx->params.jpeg_qmat_tab[1], scale);
>  	}
>  }
> +
> +/*
> + * Encoder context operations
> + */
> +
> +static int coda9_jpeg_start_encoding(struct coda_ctx *ctx)
> +{
> +	struct coda_dev *dev = ctx->dev;
> +	int ret;
> +
> +	ret = coda9_jpeg_load_huff_tab(ctx);
> +	if (ret < 0) {
> +		v4l2_err(&dev->v4l2_dev, "error loading Huffman tables\n");
> +		return ret;
> +	}
> +	if (!ctx->params.jpeg_qmat_tab[0])
> +		ctx->params.jpeg_qmat_tab[0] = kmalloc(64, GFP_KERNEL);
> +	if (!ctx->params.jpeg_qmat_tab[1])
> +		ctx->params.jpeg_qmat_tab[1] = kmalloc(64, GFP_KERNEL);
> +	coda_set_jpeg_compression_quality(ctx, ctx->params.jpeg_quality);
> +
> +	return 0;
> +}
> +
> +static int coda9_jpeg_prepare_encode(struct coda_ctx *ctx)
> +{
> +	struct coda_q_data *q_data_src, *q_data_dst;

q_data_dst is unused.

> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct coda_dev *dev = ctx->dev;
> +	u32 start_addr, end_addr;
> +	u16 aligned_width, aligned_height;
> +	bool chroma_interleave;
> +	int chroma_format;
> +	int header_len;
> +	int ret;
> +	ktime_t timeout;
> +

<snip>

Regards,

	Hans
