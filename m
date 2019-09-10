Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EBEAE93A
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 13:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730046AbfIJLe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 07:34:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40984 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfIJLe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 07:34:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C0BAF28B8CC
Message-ID: <7c8f2bc85e00b8a6600e0ef938c1fdc358003888.camel@collabora.com>
Subject: Re: [PATCH 03/12] media: hantro: Fix H264 motion vector buffer
 offset
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Tue, 10 Sep 2019 12:34:20 +0100
In-Reply-To: <HE1PR06MB40115337CD86C429EF24430CACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20190901124531.23645-1-jonas@kwiboo.se>
         <HE1PR06MB40115337CD86C429EF24430CACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A few more comments...

On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote:
> A decoded 8-bit 4:2:0 frame need memory for up to 448 macroblocks
> and is laid out in memory as follow:
> 
> +-------------------+
> > Y-plane   256 MBs |
> +-------------------+
> > UV-plane  128 MBs |
> +-------------------+
> > MV buffer  64 MBs |
> +-------------------+
> 
> The motion vector buffer offset is currently correct for 4:2:0 because
> the extra space for motion vectors is overallocated with an extra 64 MBs.
> 
> Wrong offset for both destination and motion vector buffer are used
> for the bottom field of field encoded content, wrong offset is
> also used for 4:0:0 (monochrome) content.
> 
> Fix this by always setting the motion vector address to the expected
> 384 MBs offset for 4:2:0 and 256 MBs offset for 4:0:0 content.
> 
> Also use correct destination and motion vector buffer offset
> for the bottom field of field encoded content.
> 
> While at it also extend the check for 4:0:0 (monochrome) to include an
> additional check for High Profile (100).
> 
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  .../staging/media/hantro/hantro_g1_h264_dec.c | 33 +++++++++++--------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 7ab534936843..159bd67e0a36 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -19,6 +19,9 @@
>  #include "hantro_hw.h"
>  #include "hantro_v4l2.h"
>  
> +#define MV_OFFSET_420	384
> +#define MV_OFFSET_400	256
> +

Instead of introducing these macros, I'd just use the macroblock width
and height ones explicitly. This way it's more clear where is
the code coming from.

>  static void set_params(struct hantro_ctx *ctx)
>  {
>  	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
> @@ -49,8 +52,8 @@ static void set_params(struct hantro_ctx *ctx)
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>  
>  	/* Decoder control register 1. */
> -	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(sps->pic_width_in_mbs_minus1 + 1) |
> -	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(sps->pic_height_in_map_units_minus1 + 1) |
> +	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(H264_MB_WIDTH(ctx->dst_fmt.width)) |
> +	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(H264_MB_HEIGHT(ctx->dst_fmt.height)) |

This is a nice fix, but unless I'm missing something it's unrelated to this patch.
 
>  	      G1_REG_DEC_CTRL1_REF_FRAMES(sps->max_num_ref_frames);
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
>  
> @@ -79,7 +82,7 @@ static void set_params(struct hantro_ctx *ctx)
>  		reg |= G1_REG_DEC_CTRL4_CABAC_E;
>  	if (sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE)
>  		reg |= G1_REG_DEC_CTRL4_DIR_8X8_INFER_E;
> -	if (sps->chroma_format_idc == 0)
> +	if (sps->profile_idc >= 100 && sps->chroma_format_idc == 0)
>  		reg |= G1_REG_DEC_CTRL4_BLACKWHITE_E;
>  	if (pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED)
>  		reg |= G1_REG_DEC_CTRL4_WEIGHT_PRED_E;
> @@ -233,6 +236,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	struct hantro_dev *vpu = ctx->dev;
>  	dma_addr_t src_dma, dst_dma;
> +	unsigned int offset = MV_OFFSET_420;
>  
>  	src_buf = hantro_get_src_buf(ctx);
>  	dst_buf = hantro_get_dst_buf(ctx);
> @@ -243,19 +247,20 @@ static void set_buffers(struct hantro_ctx *ctx)
>  
>  	/* Destination (decoded frame) buffer. */
>  	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> +		dst_dma += ALIGN(ctx->dst_fmt.width, H264_MB_DIM);
>  	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
>  
> -	/* Higher profiles require DMV buffer appended to reference frames. */
> -	if (ctrls->sps->profile_idc > 66) {
> -		size_t pic_size = ctx->h264_dec.pic_size;
> -		size_t mv_offset = round_up(pic_size, 8);
> -
> -		if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> -			mv_offset += 32 * H264_MB_WIDTH(ctx->dst_fmt.width);
> -
> -		vdpu_write_relaxed(vpu, dst_dma + mv_offset,
> -				   G1_REG_ADDR_DIR_MV);
> -	}
> +	/* Motion vector buffer is located after the decoded frame. */
> +	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);

I would try to rework the code to avoid calling
vb2_dma_contig_plane_dma_addr() again.

> +	if (ctrls->sps->profile_idc >= 100 && ctrls->sps->chroma_format_idc == 0)
> +		offset = MV_OFFSET_400;
> +	dst_dma += offset * H264_MB_WIDTH(ctx->dst_fmt.width) *
> +		   H264_MB_HEIGHT(ctx->dst_fmt.height);

Perhaps rename 'offset' to something different? Maybe bytes_per_mb
or similar.

> +	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> +		dst_dma += 32 * H264_MB_WIDTH(ctx->dst_fmt.width) *
> +			   H264_MB_HEIGHT(ctx->dst_fmt.height);

While here, could you replace this 32 magic number with some
meaningful macro?

> +	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DIR_MV);
>  
>  	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
>  	vdpu_write_relaxed(vpu, ctx->h264_dec.priv.dma, G1_REG_ADDR_QTABLE);

Thanks a lot,
Ezequiel

