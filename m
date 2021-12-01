Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED8946553D
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 19:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbhLASYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 13:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352282AbhLASYX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 13:24:23 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704DDC061757
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 10:21:02 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id s1so8336636vks.9
        for <linux-media@vger.kernel.org>; Wed, 01 Dec 2021 10:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L9kPdnw5Z2nHJxUwmKCeSjpjFBBkG0XR6dZZLiNpsr0=;
        b=3Kh6RK8qDrYqc1/mVp73jlgyTwaUy7NMTswU/RwmL10r7n0JYJ1DurGHpWdKmqpP78
         +q+hsgH/jPMM8Z8WlWFHXq2S3xnJUXz8MXB4esegcFJujj9Xulgv6jV3ABCWadBCA43q
         JpPQohOgKPLJUezZiptzsL0D03KEJouPLefTQccF42FXL8gB+/JrWiIYDwnL/x9tvegh
         ImhIIlNFJeG8pkIQ9qxpnlkElzvT7TUVb9BsRNlfsE7nkdoAWCS3IA189C0FDd9H6Gwi
         0mo3+gUhJlZHXt19Ey+iCQ9w8Dmtv77KvV567XnN+qAK3mYAjvX86g3VhDy8MLNoPLRL
         meog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L9kPdnw5Z2nHJxUwmKCeSjpjFBBkG0XR6dZZLiNpsr0=;
        b=UFDCYpRrApOGE7OO5fu/36sg43V2rralYADOetVESsohX0HOMVWiQs6m8Afbp6O4BG
         KQAbf5fcucmI3yXyJqlLVWpXmGotiYT7RUSggGwhiZF11KpYQXEx1pkQKTVVQ67i6jy3
         pu5zo1B/9dtqWW0cGdnZYBPMSKCBtreqMk+si373DamdBfrd6y/ff+oea3uDl+9aEaM0
         0u/ZsV7krP+rS710CrCWU7qBkRC1P8CcpiOlPtkAHXoNAHvrCxwO+DY2AxJajRM/W9rQ
         JbABmSQEWRn9ubkwRrXeUEsWdv2b46KK2QMNrd5CGLKhnHnYUT8Iy3OOM9MzzpFcWzAF
         U++Q==
X-Gm-Message-State: AOAM533QeFQZedO1r+eVHAh57WP+B81yMtrLQEQhkVphE8u9fWabMm0f
        jXgOhraE7MlYxrF5HEsxaygtjw==
X-Google-Smtp-Source: ABdhPJzmkxEqvjzlgFkTA3ka18uaiDBADlwMbQaiWAoMYx6Bm/Bk67r7WLEmGWhv3wrfYpPuGw8ldg==
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr9305352vke.33.1638382859378;
        Wed, 01 Dec 2021 10:20:59 -0800 (PST)
Received: from eze-laptop (host208.201-253-22.telecom.net.ar. [201.253.22.208])
        by smtp.gmail.com with ESMTPSA id 6sm202518vkq.23.2021.12.01.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 10:20:58 -0800 (PST)
Date:   Wed, 1 Dec 2021 15:20:54 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] media: hantro: Make G2/HEVC use hantro_postproc_ops
Message-ID: <Yae9BphwX9cGxhQf@eze-laptop>
References: <20211125155001.622405-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125155001.622405-1-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Thu, Nov 25, 2021 at 04:50:01PM +0100, Benjamin Gaignard wrote:
> Use the postprocessor functions introduced by Hantro G2/VP9 codec series
> and remove duplicated buffer management.
> This allow Hantro G12/HEVC to produce NV12_4L4 and NV12.
> 

Can you add the fluster score for HEVC so we confirm there are no
regressions?

Also, please make sure to test with the UVG set http://ultravideo.fi/,
as well as testing that NV12_4L4 output converted via GStreamer's
videoconvert element.

Thanks,
Ezequiel

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../staging/media/hantro/hantro_g2_hevc_dec.c | 25 +++---
>  drivers/staging/media/hantro/hantro_hevc.c    | 79 +++----------------
>  drivers/staging/media/hantro/hantro_hw.h      | 11 +++
>  .../staging/media/hantro/hantro_postproc.c    |  3 +
>  drivers/staging/media/hantro/hantro_v4l2.c    | 19 ++---
>  5 files changed, 41 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index b35f36109a6f..6ef5430b18eb 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -341,6 +341,8 @@ static int set_ref(struct hantro_ctx *ctx)
>  	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
>  	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
>  	struct hantro_dev *vpu = ctx->dev;
> +	struct vb2_v4l2_buffer *vb2_dst;
> +	struct hantro_decoded_buffer *dst;
>  	size_t cr_offset = hantro_hevc_chroma_offset(sps);
>  	size_t mv_offset = hantro_hevc_motion_vectors_offset(sps);
>  	u32 max_ref_frames;
> @@ -426,10 +428,15 @@ static int set_ref(struct hantro_ctx *ctx)
>  		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
>  	}
>  
> -	luma_addr = hantro_hevc_get_ref_buf(ctx, decode_params->pic_order_cnt_val);
> +	vb2_dst = hantro_get_dst_buf(ctx);
> +	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
> +	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
>  	if (!luma_addr)
>  		return -ENOMEM;
>  
> +	if (hantro_hevc_add_ref_buf(ctx, decode_params->pic_order_cnt_val, luma_addr))
> +		return -EINVAL;
> +
>  	chroma_addr = luma_addr + cr_offset;
>  	mv_addr = luma_addr + mv_offset;
>  
> @@ -456,16 +463,12 @@ static int set_ref(struct hantro_ctx *ctx)
>  
>  static void set_buffers(struct hantro_ctx *ctx)
>  {
> -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct vb2_v4l2_buffer *src_buf;
>  	struct hantro_dev *vpu = ctx->dev;
> -	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> -	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> -	size_t cr_offset = hantro_hevc_chroma_offset(sps);
> -	dma_addr_t src_dma, dst_dma;
> +	dma_addr_t src_dma;
>  	u32 src_len, src_buf_len;
>  
>  	src_buf = hantro_get_src_buf(ctx);
> -	dst_buf = hantro_get_dst_buf(ctx);
>  
>  	/* Source (stream) buffer. */
>  	src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> @@ -478,11 +481,6 @@ static void set_buffers(struct hantro_ctx *ctx)
>  	hantro_reg_write(vpu, &g2_strm_start_offset, 0);
>  	hantro_reg_write(vpu, &g2_write_mvs_e, 1);
>  
> -	/* Destination (decoded frame) buffer. */
> -	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
> -
> -	hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
> -	hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma + cr_offset);
>  	hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma);
>  	hantro_write_addr(vpu, G2_TILE_FILTER_ADDR, ctx->hevc_dec.tile_filter.dma);
>  	hantro_write_addr(vpu, G2_TILE_SAO_ADDR, ctx->hevc_dec.tile_sao.dma);
> @@ -575,9 +573,6 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
>  	/* Don't compress buffers */
>  	hantro_reg_write(vpu, &g2_ref_compress_bypass, 1);
>  
> -	/* use NV12 as output format */
> -	hantro_reg_write(vpu, &g2_out_rs_e, 1);
> -
>  	/* Bus width and max burst */
>  	hantro_reg_write(vpu, &g2_buswidth, BUS_WIDTH_128);
>  	hantro_reg_write(vpu, &g2_max_burst, 16);
> diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
> index ee03123e7704..b49a41d7ae91 100644
> --- a/drivers/staging/media/hantro/hantro_hevc.c
> +++ b/drivers/staging/media/hantro/hantro_hevc.c
> @@ -44,47 +44,6 @@ size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps *sps)
>  	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
>  }
>  
> -static size_t hantro_hevc_mv_size(const struct v4l2_ctrl_hevc_sps *sps)
> -{
> -	u32 min_cb_log2_size_y = sps->log2_min_luma_coding_block_size_minus3 + 3;
> -	u32 ctb_log2_size_y = min_cb_log2_size_y + sps->log2_diff_max_min_luma_coding_block_size;
> -	u32 pic_width_in_ctbs_y = (sps->pic_width_in_luma_samples + (1 << ctb_log2_size_y) - 1)
> -				  >> ctb_log2_size_y;
> -	u32 pic_height_in_ctbs_y = (sps->pic_height_in_luma_samples + (1 << ctb_log2_size_y) - 1)
> -				   >> ctb_log2_size_y;
> -	size_t mv_size;
> -
> -	mv_size = pic_width_in_ctbs_y * pic_height_in_ctbs_y *
> -		  (1 << (2 * (ctb_log2_size_y - 4))) * 16;
> -
> -	vpu_debug(4, "%dx%d (CTBs) %zu MV bytes\n",
> -		  pic_width_in_ctbs_y, pic_height_in_ctbs_y, mv_size);
> -
> -	return mv_size;
> -}
> -
> -static size_t hantro_hevc_ref_size(struct hantro_ctx *ctx)
> -{
> -	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
> -	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
> -
> -	return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps);
> -}
> -
> -static void hantro_hevc_ref_free(struct hantro_ctx *ctx)
> -{
> -	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> -	struct hantro_dev *vpu = ctx->dev;
> -	int i;
> -
> -	for (i = 0;  i < NUM_REF_PICTURES; i++) {
> -		if (hevc_dec->ref_bufs[i].cpu)
> -			dma_free_coherent(vpu->dev, hevc_dec->ref_bufs[i].size,
> -					  hevc_dec->ref_bufs[i].cpu,
> -					  hevc_dec->ref_bufs[i].dma);
> -	}
> -}
> -
>  static void hantro_hevc_ref_init(struct hantro_ctx *ctx)
>  {
>  	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> @@ -108,37 +67,25 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
>  		}
>  	}
>  
> -	/* Allocate a new reference buffer */
> +	return 0;
> +}
> +
> +int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr)
> +{
> +	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
> +	int i;
> +
> +	/* Add a new reference buffer */
>  	for (i = 0; i < NUM_REF_PICTURES; i++) {
>  		if (hevc_dec->ref_bufs_poc[i] == UNUSED_REF) {
> -			if (!hevc_dec->ref_bufs[i].cpu) {
> -				struct hantro_dev *vpu = ctx->dev;
> -
> -				/*
> -				 * Allocate the space needed for the raw data +
> -				 * motion vector data. Optimizations could be to
> -				 * allocate raw data in non coherent memory and only
> -				 * clear the motion vector data.
> -				 */
> -				hevc_dec->ref_bufs[i].cpu =
> -					dma_alloc_coherent(vpu->dev,
> -							   hantro_hevc_ref_size(ctx),
> -							   &hevc_dec->ref_bufs[i].dma,
> -							   GFP_KERNEL);
> -				if (!hevc_dec->ref_bufs[i].cpu)
> -					return 0;
> -
> -				hevc_dec->ref_bufs[i].size = hantro_hevc_ref_size(ctx);
> -			}
>  			hevc_dec->ref_bufs_used |= 1 << i;
> -			memset(hevc_dec->ref_bufs[i].cpu, 0, hantro_hevc_ref_size(ctx));
>  			hevc_dec->ref_bufs_poc[i] = poc;
> -
> -			return hevc_dec->ref_bufs[i].dma;
> +			hevc_dec->ref_bufs[i].dma = addr;
> +			return 0;
>  		}
>  	}
>  
> -	return 0;
> +	return -EINVAL;
>  }
>  
>  void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx)
> @@ -314,8 +261,6 @@ void hantro_hevc_dec_exit(struct hantro_ctx *ctx)
>  				  hevc_dec->tile_bsd.cpu,
>  				  hevc_dec->tile_bsd.dma);
>  	hevc_dec->tile_bsd.cpu = NULL;
> -
> -	hantro_hevc_ref_free(ctx);
>  }
>  
>  int hantro_hevc_dec_init(struct hantro_ctx *ctx)
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index dbe51303724b..7286404c32ab 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -345,6 +345,7 @@ void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
>  int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
>  int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
>  dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
> +int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr);
>  void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
>  size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps);
>  size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps *sps);
> @@ -394,6 +395,16 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
>  	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
>  }
>  
> +static inline size_t
> +hantro_hevc_mv_size(unsigned int width, unsigned int height)
> +{
> +	/*
> +	 * A CTB can be 64x64, 32x32 or 16x16.
> +	 * Allocated memory for the "worse" case: 16x16
> +	 */
> +	return width * height / 16;
> +}
> +
>  int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
>  int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
>  void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index a7774ad4c445..248abe5423f0 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -146,6 +146,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>  	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME)
>  		buf_size += hantro_vp9_mv_size(ctx->dst_fmt.width,
>  					       ctx->dst_fmt.height);
> +	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE)
> +		buf_size += hantro_hevc_mv_size(ctx->dst_fmt.width,
> +						ctx->dst_fmt.height);
>  
>  	for (i = 0; i < num_buffers; ++i) {
>  		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index e4b0645ba6fc..e1fe37afe576 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -150,20 +150,6 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
>  	unsigned int num_fmts, i, j = 0;
>  	bool skip_mode_none;
>  
> -	/*
> -	 * The HEVC decoder on the G2 core needs a little quirk to offer NV12
> -	 * only on the capture side. Once the post-processor logic is used,
> -	 * we will be able to expose NV12_4L4 and NV12 as the other cases,
> -	 * and therefore remove this quirk.
> -	 */
> -	if (capture && ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE) {
> -		if (f->index == 0) {
> -			f->pixelformat = V4L2_PIX_FMT_NV12;
> -			return 0;
> -		}
> -		return -EINVAL;
> -	}
> -
>  	/*
>  	 * When dealing with an encoder:
>  	 *  - on the capture side we want to filter out all MODE_NONE formats.
> @@ -304,6 +290,11 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
>  			pix_mp->plane_fmt[0].sizeimage +=
>  				hantro_vp9_mv_size(pix_mp->width,
>  						   pix_mp->height);
> +		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
> +			 !hantro_needs_postproc(ctx, fmt))
> +			pix_mp->plane_fmt[0].sizeimage +=
> +				hantro_hevc_mv_size(pix_mp->width,
> +						    pix_mp->height);
>  	} else if (!pix_mp->plane_fmt[0].sizeimage) {
>  		/*
>  		 * For coded formats the application can specify
> -- 
> 2.30.2
> 
