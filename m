Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB3642070A
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 10:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhJDINF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 04:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhJDINA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 04:13:00 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB481C061745;
        Mon,  4 Oct 2021 01:11:03 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id XJ3nmn8Ch3tiGXJ3qmgbxb; Mon, 04 Oct 2021 10:11:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633335060; bh=bKjOBDJpshLMetjuil3udBnbogUC1cEVU3iYd0ovcNU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=U5mhqHA8NmLhpHMkM+KVrVRk3WJH3be49kQ4xZ+WMalOwBnxJmNG1Kie29gJHUtz9
         uIuB2VOnHW+ccaV/HhLKM/eorrFAZ/W3POxfTZxLMtF+ZcUNeysQdsHUmedZEGqudu
         grbbwztBfw+Gjsy1pg1Vwxp84qlanXOL/bMirQDKYu7HJ0HJgtXLAhLkmbQP4AIOSv
         63XRuOFm824B9jM147+pQ5aRb87oQTT1z2JCxzlACD3a8i7L84ySg9EvrcDcvoW1tf
         zyrjZ+ms0aQ+w6TX/5RfwUL16oSp8MGdkWQ75f72qNbIW8DMQo2Bwua+2iMZV6KcLK
         q2ww92ooaasxA==
Subject: Re: [PATCH] media: cedrus: Don't kernel map most buffers
To:     Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20210912060812.222996-1-jernej.skrabec@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0cb81145-16d9-fd28-832e-4010646e9512@xs4all.nl>
Date:   Mon, 4 Oct 2021 10:10:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210912060812.222996-1-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBMt3TknJanoRj5XaDGvKAbA5J/Kc0TpqWWzZwsBzxIw5qT5LVovXcL9S+TdvZWxi2Y23IlM9kaJvh8A/fHRh+FsMiprApVRDZS16anWExhy56qgjEzA
 xbZ0pUA46ok7+HdpN77jXyuRRWx1qZBPQUQBjMzWv7nM918pIOnjVWxY/R4j+1ywUtYbEQct8C1k6pRQzbvrXNsgKlaGp3XkDmvzCdVQai+xnMl+ZAFVgHqN
 2ACyYq+6B4j68M6fEji2wXq0i4UyH4o5owpAjlXYJ262obS6srW9+G7f0BKOaulozzuLn17gfbUnCu37a49SHVdxNW/4DD7wjqRDq07XcFw6rgEhHBu5aH+Z
 MRehKXl+qpP9Q76R82LNaqmO+CozjOOrjnca8gal26j2omSljJT0W4wxFCXrsEpH7M4Grqd0Q2JMrZkAfpkTV5lJcdSQgziXdNkalvXNPPFQeMukFPSAkIzO
 1Ul0UrxCLmFc8YcVuIUF2YQjQ0Xo9NHkGDkyAC26A+rIpZdW5sbUhiQ6oao16DjZ84Axk0E730nnOPKrSwebXvQfJSB/ChWvT6VhnApcF0brW3JeZUefqhzE
 Oik=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

Some comments below:

On 12/09/2021 08:08, Jernej Skrabec wrote:
> Except VP8 probability coefficients buffer, all other buffers are never

Except -> Except for

> accessed by CPU. That allows us to mark them with DMA_ATTR_NO_KERNEL_MAPPING
> flag. This helps with decoding big (like 4k) videos on 32-bit ARM
> platforms where default vmalloc size is relatively small - 240 MiB.
> Since auxiliary buffer are not yet efficiently allocated, this can be
> easily exceeded. Even if allocation is optimized, 4k videos will still
> often exceed this limit.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 102 ++++++++++--------
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  28 ++---
>  .../staging/media/sunxi/cedrus/cedrus_video.c |   2 +
>  3 files changed, 73 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index de7442d4834d..6e38b37d9fe1 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -538,23 +538,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  
>  	ctx->codec.h264.pic_info_buf_size = pic_info_size;
>  	ctx->codec.h264.pic_info_buf =
> -		dma_alloc_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
> -				   &ctx->codec.h264.pic_info_buf_dma,
> -				   GFP_KERNEL);
> +		dma_alloc_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> +				&ctx->codec.h264.pic_info_buf_dma,
> +				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>  	if (!ctx->codec.h264.pic_info_buf)
>  		return -ENOMEM;
>  
>  	/*
>  	 * That buffer is supposed to be 16kiB in size, and be aligned
> -	 * on 16kiB as well. However, dma_alloc_coherent provides the
> +	 * on 16kiB as well. However, dma_alloc_attrs provides the
>  	 * guarantee that we'll have a CPU and DMA address aligned on

Does the 'CPU' part of this sentence still make sense since the CPU
won't access the buffer?

>  	 * the smallest page order that is greater to the requested
>  	 * size, so we don't have to overallocate.
>  	 */
>  	ctx->codec.h264.neighbor_info_buf =
> -		dma_alloc_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> -				   &ctx->codec.h264.neighbor_info_buf_dma,
> -				   GFP_KERNEL);
> +		dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> +				&ctx->codec.h264.neighbor_info_buf_dma,
> +				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);

I think it would be good to have a comment for all these dma_alloc_attrs
calls where you note that these buffers are used by the HW only, and
never by the CPU, hence the use of DMA_ATTR_NO_KERNEL_MAPPING.

>  	if (!ctx->codec.h264.neighbor_info_buf) {
>  		ret = -ENOMEM;
>  		goto err_pic_buf;
> @@ -582,10 +582,11 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  
>  	mv_col_size = field_size * 2 * CEDRUS_H264_FRAME_NUM;
>  	ctx->codec.h264.mv_col_buf_size = mv_col_size;
> -	ctx->codec.h264.mv_col_buf = dma_alloc_coherent(dev->dev,
> -							ctx->codec.h264.mv_col_buf_size,
> -							&ctx->codec.h264.mv_col_buf_dma,
> -							GFP_KERNEL);
> +	ctx->codec.h264.mv_col_buf =
> +		dma_alloc_attrs(dev->dev,
> +				ctx->codec.h264.mv_col_buf_size,
> +				&ctx->codec.h264.mv_col_buf_dma,
> +				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>  	if (!ctx->codec.h264.mv_col_buf) {
>  		ret = -ENOMEM;
>  		goto err_neighbor_buf;
> @@ -600,10 +601,10 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  		ctx->codec.h264.deblk_buf_size =
>  			ALIGN(ctx->src_fmt.width, 32) * 12;
>  		ctx->codec.h264.deblk_buf =
> -			dma_alloc_coherent(dev->dev,
> -					   ctx->codec.h264.deblk_buf_size,
> -					   &ctx->codec.h264.deblk_buf_dma,
> -					   GFP_KERNEL);
> +			dma_alloc_attrs(dev->dev,
> +					ctx->codec.h264.deblk_buf_size,
> +					&ctx->codec.h264.deblk_buf_dma,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>  		if (!ctx->codec.h264.deblk_buf) {
>  			ret = -ENOMEM;
>  			goto err_mv_col_buf;
> @@ -616,10 +617,10 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  		ctx->codec.h264.intra_pred_buf_size =
>  			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
>  		ctx->codec.h264.intra_pred_buf =
> -			dma_alloc_coherent(dev->dev,
> -					   ctx->codec.h264.intra_pred_buf_size,
> -					   &ctx->codec.h264.intra_pred_buf_dma,
> -					   GFP_KERNEL);
> +			dma_alloc_attrs(dev->dev,
> +					ctx->codec.h264.intra_pred_buf_size,
> +					&ctx->codec.h264.intra_pred_buf_dma,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>  		if (!ctx->codec.h264.intra_pred_buf) {
>  			ret = -ENOMEM;
>  			goto err_deblk_buf;
> @@ -629,24 +630,28 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  	return 0;
>  
>  err_deblk_buf:
> -	dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
> -			  ctx->codec.h264.deblk_buf,
> -			  ctx->codec.h264.deblk_buf_dma);
> +	dma_free_attrs(dev->dev, ctx->codec.h264.deblk_buf_size,
> +		       ctx->codec.h264.deblk_buf,
> +		       ctx->codec.h264.deblk_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
>  
>  err_mv_col_buf:
> -	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
> -			  ctx->codec.h264.mv_col_buf,
> -			  ctx->codec.h264.mv_col_buf_dma);
> +	dma_free_attrs(dev->dev, ctx->codec.h264.mv_col_buf_size,
> +		       ctx->codec.h264.mv_col_buf,
> +		       ctx->codec.h264.mv_col_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
>  
>  err_neighbor_buf:
> -	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> -			  ctx->codec.h264.neighbor_info_buf,
> -			  ctx->codec.h264.neighbor_info_buf_dma);
> +	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> +		       ctx->codec.h264.neighbor_info_buf,
> +		       ctx->codec.h264.neighbor_info_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
>  
>  err_pic_buf:
> -	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
> -			  ctx->codec.h264.pic_info_buf,
> -			  ctx->codec.h264.pic_info_buf_dma);
> +	dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> +		       ctx->codec.h264.pic_info_buf,
> +		       ctx->codec.h264.pic_info_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
>  	return ret;
>  }
>  
> @@ -654,23 +659,28 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev = ctx->dev;
>  
> -	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
> -			  ctx->codec.h264.mv_col_buf,
> -			  ctx->codec.h264.mv_col_buf_dma);
> -	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> -			  ctx->codec.h264.neighbor_info_buf,
> -			  ctx->codec.h264.neighbor_info_buf_dma);
> -	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
> -			  ctx->codec.h264.pic_info_buf,
> -			  ctx->codec.h264.pic_info_buf_dma);
> +	dma_free_attrs(dev->dev, ctx->codec.h264.mv_col_buf_size,
> +		       ctx->codec.h264.mv_col_buf,
> +		       ctx->codec.h264.mv_col_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> +	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> +		       ctx->codec.h264.neighbor_info_buf,
> +		       ctx->codec.h264.neighbor_info_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> +	dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> +		       ctx->codec.h264.pic_info_buf,
> +		       ctx->codec.h264.pic_info_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
>  	if (ctx->codec.h264.deblk_buf_size)
> -		dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
> -				  ctx->codec.h264.deblk_buf,
> -				  ctx->codec.h264.deblk_buf_dma);
> +		dma_free_attrs(dev->dev, ctx->codec.h264.deblk_buf_size,
> +			       ctx->codec.h264.deblk_buf,
> +			       ctx->codec.h264.deblk_buf_dma,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
>  	if (ctx->codec.h264.intra_pred_buf_size)
> -		dma_free_coherent(dev->dev, ctx->codec.h264.intra_pred_buf_size,
> -				  ctx->codec.h264.intra_pred_buf,
> -				  ctx->codec.h264.intra_pred_buf_dma);
> +		dma_free_attrs(dev->dev, ctx->codec.h264.intra_pred_buf_size,
> +			       ctx->codec.h264.intra_pred_buf,
> +			       ctx->codec.h264.intra_pred_buf_dma,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
>  }
>  
>  static void cedrus_h264_trigger(struct cedrus_ctx *ctx)
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index 3d9561d4aadb..bb7eb56106c5 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -351,10 +351,10 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  			ctx->codec.h265.mv_col_buf_unit_size;
>  
>  		ctx->codec.h265.mv_col_buf =
> -			dma_alloc_coherent(dev->dev,
> -					   ctx->codec.h265.mv_col_buf_size,
> -					   &ctx->codec.h265.mv_col_buf_addr,
> -					   GFP_KERNEL);
> +			dma_alloc_attrs(dev->dev,
> +					ctx->codec.h265.mv_col_buf_size,
> +					&ctx->codec.h265.mv_col_buf_addr,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>  		if (!ctx->codec.h265.mv_col_buf) {
>  			ctx->codec.h265.mv_col_buf_size = 0;
>  			// TODO: Abort the process here.
> @@ -668,9 +668,9 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
>  	ctx->codec.h265.mv_col_buf_size = 0;
>  
>  	ctx->codec.h265.neighbor_info_buf =
> -		dma_alloc_coherent(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> -				   &ctx->codec.h265.neighbor_info_buf_addr,
> -				   GFP_KERNEL);
> +		dma_alloc_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> +				&ctx->codec.h265.neighbor_info_buf_addr,
> +				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
>  	if (!ctx->codec.h265.neighbor_info_buf)
>  		return -ENOMEM;
>  
> @@ -682,16 +682,18 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
>  	struct cedrus_dev *dev = ctx->dev;
>  
>  	if (ctx->codec.h265.mv_col_buf_size > 0) {
> -		dma_free_coherent(dev->dev, ctx->codec.h265.mv_col_buf_size,
> -				  ctx->codec.h265.mv_col_buf,
> -				  ctx->codec.h265.mv_col_buf_addr);
> +		dma_free_attrs(dev->dev, ctx->codec.h265.mv_col_buf_size,
> +			       ctx->codec.h265.mv_col_buf,
> +			       ctx->codec.h265.mv_col_buf_addr,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
>  
>  		ctx->codec.h265.mv_col_buf_size = 0;
>  	}
>  
> -	dma_free_coherent(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> -			  ctx->codec.h265.neighbor_info_buf,
> -			  ctx->codec.h265.neighbor_info_buf_addr);
> +	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> +		       ctx->codec.h265.neighbor_info_buf,
> +		       ctx->codec.h265.neighbor_info_buf_addr,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
>  }
>  
>  static void cedrus_h265_trigger(struct cedrus_ctx *ctx)
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 66714609b577..800ffa5382de 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -568,6 +568,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>  
>  	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>  	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;
>  	src_vq->drv_priv = ctx;
>  	src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
>  	src_vq->ops = &cedrus_qops;
> @@ -584,6 +585,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>  
>  	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> +	src_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;

This should be dst_vq!

I'm also not quite sure that it is right to use this for the destination
buffer. Could this cause problems if this buffer is exported to a dmabuf
and another driver will be using it and requiring a kernel mapping.

Regards,

	Hans

>  	dst_vq->drv_priv = ctx;
>  	dst_vq->buf_struct_size = sizeof(struct cedrus_buffer);
>  	dst_vq->ops = &cedrus_qops;
> 

