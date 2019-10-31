Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85BCBEACD1
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 10:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfJaJrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 05:47:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45570 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfJaJrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 05:47:40 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C51E1290655;
        Thu, 31 Oct 2019 09:47:37 +0000 (GMT)
Date:   Thu, 31 Oct 2019 10:47:34 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] media: hantro: Fix H264 motion vector buffer
 offset
Message-ID: <20191031104734.6c572554@collabora.com>
In-Reply-To: <HE1PR06MB40118883BE689D89380EBD06AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <20191029012430.24566-1-jonas@kwiboo.se>
        <HE1PR06MB40118883BE689D89380EBD06AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 29 Oct 2019 01:24:49 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
> macroblock and is laid out in memory as follow:
> 
> +---------------------------+
> | Y-plane   256 bytes x MBs |
> +---------------------------+
> | UV-plane  128 bytes x MBs |
> +---------------------------+
> | MV buffer  64 bytes x MBs |
> +---------------------------+

Would be great to also have this sort of diagram as a comment in the
code.

> 
> The motion vector buffer offset is currently correct for 4:2:0 because the
> extra space for motion vectors is overallocated with an extra 64 bytes x MBs.
> 
> Wrong offset for both destination and motion vector buffer are used
> for the bottom field of field encoded content, wrong offset is
> also used for 4:0:0 (monochrome) content.
> 
> Fix this by setting the motion vector address to the expected 384 bytes x MBs
> offset for 4:2:0 and 256 bytes x MBs offset for 4:0:0 content.
> 
> Also use correct destination and motion vector buffer offset
> for the bottom field of field encoded content.
> 
> While at it also extend the check for 4:0:0 (monochrome) to include an
> additional check for High Profile (100).
> 
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Just 2 nitpicks (see below).

> ---
> Changes in v2:
>   * address remarks from Philipp and Ezequiel
>   - update commit message
>   - rename offset to bytes_per_mb
>   - remove MV_OFFSET macros
>   - move PIC_MB_WIDTH/HEIGHT_P change to separate patch
> ---
>  .../staging/media/hantro/hantro_g1_h264_dec.c | 29 +++++++++++++------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 70a6b5b26477..71bf162eaf73 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -81,7 +81,7 @@ static void set_params(struct hantro_ctx *ctx)
>  		reg |= G1_REG_DEC_CTRL4_CABAC_E;
>  	if (sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE)
>  		reg |= G1_REG_DEC_CTRL4_DIR_8X8_INFER_E;
> -	if (sps->chroma_format_idc == 0)
> +	if (sps->profile_idc >= 100 && sps->chroma_format_idc == 0)
>  		reg |= G1_REG_DEC_CTRL4_BLACKWHITE_E;
>  	if (pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED)
>  		reg |= G1_REG_DEC_CTRL4_WEIGHT_PRED_E;
> @@ -234,6 +234,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	struct hantro_dev *vpu = ctx->dev;
>  	dma_addr_t src_dma, dst_dma;
> +	size_t offset = 0;
>  
>  	src_buf = hantro_get_src_buf(ctx);
>  	dst_buf = hantro_get_dst_buf(ctx);
> @@ -244,18 +245,28 @@ static void set_buffers(struct hantro_ctx *ctx)
>  
>  	/* Destination (decoded frame) buffer. */
>  	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> -	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
> +	/* Adjust dma addr to start at second line for bottom field */
> +	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> +		offset = ALIGN(ctx->dst_fmt.width, MB_DIM);
> +	vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DST);
>  
>  	/* Higher profiles require DMV buffer appended to reference frames. */
>  	if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {
> -		size_t pic_size = ctx->h264_dec.pic_size;
> -		size_t mv_offset = round_up(pic_size, 8);
> -
> +		unsigned int bytes_per_mb = 384;

Nitpick: can you add a blank line here?

> +		/* DMV buffer for monochrome start directly after Y-plane */
> +		if (ctrls->sps->profile_idc >= 100 &&
> +		    ctrls->sps->chroma_format_idc == 0)
> +			bytes_per_mb = 256;
> +		offset = bytes_per_mb * MB_WIDTH(ctx->dst_fmt.width) *
> +			 MB_HEIGHT(ctx->dst_fmt.height);
> +
> +		/* DMV buffer is split in two for field encoded frames,

Nitpick again: can you use non-net-style comments.

		/*
		 * Blabla
		 */

> +		 * adjust offset for bottom field
> +		 */
>  		if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
> -			mv_offset += 32 * MB_WIDTH(ctx->dst_fmt.width);
> -
> -		vdpu_write_relaxed(vpu, dst_dma + mv_offset,
> -				   G1_REG_ADDR_DIR_MV);
> +			offset += 32 * MB_WIDTH(ctx->dst_fmt.width) *
> +				  MB_HEIGHT(ctx->dst_fmt.height);
> +		vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DIR_MV);
>  	}
>  
>  	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */

