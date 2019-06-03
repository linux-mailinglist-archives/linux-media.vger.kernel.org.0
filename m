Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2596332F81
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 14:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfFCMXf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 08:23:35 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:46511 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfFCMXf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 08:23:35 -0400
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2E134100004;
        Mon,  3 Jun 2019 12:23:28 +0000 (UTC)
Date:   Mon, 3 Jun 2019 14:23:28 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] media: cedrus: Improve H264 memory efficiency
Message-ID: <20190603122328.kczqsr4pza2ggvbk@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
 <20190530211516.1891-8-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eyhk33onwxqf3gu2"
Content-Disposition: inline
In-Reply-To: <20190530211516.1891-8-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--eyhk33onwxqf3gu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2019 at 11:15:16PM +0200, Jernej Skrabec wrote:
> H264 decoder driver preallocated pretty big worst case mv col buffer
> pool. It turns out that pool is most of the time much bigger than it
> needs to be.
>
> Solution implemented here is to allocate memory only if capture buffer
> is actually used and only as much as it is really necessary.
>
> This is also preparation for 4K video decoding support, which will be
> implemented later.

What is it doing exactly to prepare for 4k?

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 -
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 81 +++++++------------
>  2 files changed, 28 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 16c1bdfd243a..fcbbbef65494 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -106,10 +106,6 @@ struct cedrus_ctx {
>
>  	union {
>  		struct {
> -			void		*mv_col_buf;
> -			dma_addr_t	mv_col_buf_dma;
> -			ssize_t		mv_col_buf_field_size;
> -			ssize_t		mv_col_buf_size;
>  			void		*pic_info_buf;
>  			dma_addr_t	pic_info_buf_dma;
>  			void		*neighbor_info_buf;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index b2290f98d81a..758fd0049e8f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -54,17 +54,14 @@ static void cedrus_h264_write_sram(struct cedrus_dev *dev,
>  		cedrus_write(dev, VE_AVC_SRAM_PORT_DATA, *buffer++);
>  }
>
> -static dma_addr_t cedrus_h264_mv_col_buf_addr(struct cedrus_ctx *ctx,
> -					      unsigned int position,
> +static dma_addr_t cedrus_h264_mv_col_buf_addr(struct cedrus_buffer *buf,
>  					      unsigned int field)
>  {
> -	dma_addr_t addr = ctx->codec.h264.mv_col_buf_dma;
> -
> -	/* Adjust for the position */
> -	addr += position * ctx->codec.h264.mv_col_buf_field_size * 2;
> +	dma_addr_t addr = buf->extra_buf_dma;
>
>  	/* Adjust for the field */
> -	addr += field * ctx->codec.h264.mv_col_buf_field_size;
> +	if (field)
> +		addr += buf->extra_buf_size / 2;
>
>  	return addr;
>  }
> @@ -76,7 +73,6 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
>  				struct cedrus_h264_sram_ref_pic *pic)
>  {
>  	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
> -	unsigned int position = buf->codec.h264.position;
>
>  	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
>  	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
> @@ -84,10 +80,8 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
>
>  	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
>  	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1));
> -	pic->mv_col_top_ptr =
> -		cpu_to_le32(cedrus_h264_mv_col_buf_addr(ctx, position, 0));
> -	pic->mv_col_bot_ptr =
> -		cpu_to_le32(cedrus_h264_mv_col_buf_addr(ctx, position, 1));
> +	pic->mv_col_top_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 0));
> +	pic->mv_col_bot_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 1));
>  }
>
>  static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
> @@ -142,6 +136,28 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
>  	output_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
>  	output_buf->codec.h264.position = position;
>
> +	if (!output_buf->extra_buf_size) {
> +		const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
> +		unsigned int field_size;
> +
> +		field_size = DIV_ROUND_UP(ctx->src_fmt.width, 16) *
> +			DIV_ROUND_UP(ctx->src_fmt.height, 16) * 16;
> +		if (!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE))
> +			field_size = field_size * 2;
> +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +			field_size = field_size * 2;
> +
> +		output_buf->extra_buf_size = field_size * 2;
> +		output_buf->extra_buf =
> +			dma_alloc_coherent(dev->dev,
> +					   output_buf->extra_buf_size,
> +					   &output_buf->extra_buf_dma,
> +					   GFP_KERNEL);
> +
> +		if (!output_buf->extra_buf)
> +			output_buf->extra_buf_size = 0;
> +	}
> +

That also means that instead of allocating that buffer exactly once,
you now allocate it for each output buffer?

I guess that it will cleaned up by your previous patch at
buffer_cleanup time, so after it's no longer a reference frame?

What is the average memory usage before, and after that change during
a playback, and what is the runtime cost of doing it multiple times
instead of once?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--eyhk33onwxqf3gu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPURQAAKCRDj7w1vZxhR
xQTuAQDxJ1RMufUbH3eDRtX9HW0gxGhrJuNi1JtqtOlRUQxP9gEAhrUoGxyQYYQw
ZarXFHSd/6ngImXRgIlWm5yMFMfIpAg=
=9+qh
-----END PGP SIGNATURE-----

--eyhk33onwxqf3gu2--
