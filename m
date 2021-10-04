Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB3842139D
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 18:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236252AbhJDQIT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 12:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236440AbhJDQIO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 12:08:14 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B26CC061745;
        Mon,  4 Oct 2021 09:06:25 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id l7so43169924edq.3;
        Mon, 04 Oct 2021 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GqpwaHcYLWxKjnZgog6w5RyFafP586fBMegQAr62NIY=;
        b=QHqHkuI29B7ysAsKw3DIQtMpkDe2IVUsf2mPVI1tuSQczP83Om194FDjMbL035HJEp
         +97UN/SmVU9e4K5PhrDyR2lP+pKHeZUsiQTY/WZNayt46flF8OW7m1+WNRB7kq1scb3C
         cZBteAEGktBh+Lp9YjVp8KqmGSjKDLxykRAEPL/zr0kTaXfaWr3utY4re7T08wraYNmX
         mXH4xoYa49n7so495p8mkAEvW1BsxCIdmJEz6SvhneLxyiBt2fRvLhNR0mf2dEWJTgvK
         Ffjq2BQiN5EhrU6ImaLSxnrqCIUPAQcHEtSVecLdRPxDMLGGnNThFiOsaz7y9nwvTPGl
         4RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GqpwaHcYLWxKjnZgog6w5RyFafP586fBMegQAr62NIY=;
        b=Xvmzwfrpo30Zl+C99/PBurilbPeajB50JgEzQ/1W9Om/SBuagPSS+vduYk05ExOGSS
         VVVmjaH2l2Nvp1GsEt3+7ohCWE8hf2ZidFF68vRYuhyjgphIV6+5kQjNVe0wu+drUrXc
         xRRuO5fWZ1gg/AeWFnLjYCnsm5WjbJ/Np3seyTLI2TVDkENcQNzBwwpXQHak7jo2bK0S
         PQ5M8X7cYYIs0MdiN9i+WXV/K9dQCK396JqrBkixmJ5ftnf9Tw3km0swpnrrGBpE4jX3
         e5GpIOZwCEFAjrqmyG9kvcMKM+SzKfKlI2M6/aMygwOU73TJAvIC+GDsch0MLc0lvIYr
         qV9w==
X-Gm-Message-State: AOAM531nH4AXpRpCNEBZsV2YmtJReLBjf7WYl06uNvogP2RKQwUiZCKH
        TYKhO04sa7pK3GzWq+Zhaug=
X-Google-Smtp-Source: ABdhPJyBAp9owrsAfLgtmeoTzk6EGj3S9yhX24KyVsty+2JN9PWNljDsMFTcAhhxDmedLBudzk9ZHg==
X-Received: by 2002:a50:d8cf:: with SMTP id y15mr19412186edj.66.1633363499052;
        Mon, 04 Oct 2021 09:04:59 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id p10sm2240068ejf.45.2021.10.04.09.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 09:04:58 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: cedrus: Don't kernel map most buffers
Date:   Mon, 04 Oct 2021 18:04:56 +0200
Message-ID: <2933502.8iB9r8yIO8@kista>
In-Reply-To: <0cb81145-16d9-fd28-832e-4010646e9512@xs4all.nl>
References: <20210912060812.222996-1-jernej.skrabec@gmail.com> <0cb81145-16d9-fd28-832e-4010646e9512@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne ponedeljek, 04. oktober 2021 ob 10:10:55 CEST je Hans Verkuil napisal(a):
> Hi Jernej,
> 
> Some comments below:
> 
> On 12/09/2021 08:08, Jernej Skrabec wrote:
> > Except VP8 probability coefficients buffer, all other buffers are never
> 
> Except -> Except for
> 

Ok.

> > accessed by CPU. That allows us to mark them with 
DMA_ATTR_NO_KERNEL_MAPPING
> > flag. This helps with decoding big (like 4k) videos on 32-bit ARM
> > platforms where default vmalloc size is relatively small - 240 MiB.
> > Since auxiliary buffer are not yet efficiently allocated, this can be
> > easily exceeded. Even if allocation is optimized, 4k videos will still
> > often exceed this limit.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 102 ++++++++++--------
> >  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  28 ++---
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |   2 +
> >  3 files changed, 73 insertions(+), 59 deletions(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/
staging/media/sunxi/cedrus/cedrus_h264.c
> > index de7442d4834d..6e38b37d9fe1 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -538,23 +538,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
> >  
> >  	ctx->codec.h264.pic_info_buf_size = pic_info_size;
> >  	ctx->codec.h264.pic_info_buf =
> > -		dma_alloc_coherent(dev->dev, ctx-
>codec.h264.pic_info_buf_size,
> > -				   &ctx-
>codec.h264.pic_info_buf_dma,
> > -				   GFP_KERNEL);
> > +		dma_alloc_attrs(dev->dev, ctx-
>codec.h264.pic_info_buf_size,
> > +				&ctx-
>codec.h264.pic_info_buf_dma,
> > +				GFP_KERNEL, 
DMA_ATTR_NO_KERNEL_MAPPING);
> >  	if (!ctx->codec.h264.pic_info_buf)
> >  		return -ENOMEM;
> >  
> >  	/*
> >  	 * That buffer is supposed to be 16kiB in size, and be aligned
> > -	 * on 16kiB as well. However, dma_alloc_coherent provides the
> > +	 * on 16kiB as well. However, dma_alloc_attrs provides the
> >  	 * guarantee that we'll have a CPU and DMA address aligned on
> 
> Does the 'CPU' part of this sentence still make sense since the CPU
> won't access the buffer?
> 

Good catch! I'll remove it.

> >  	 * the smallest page order that is greater to the requested
> >  	 * size, so we don't have to overallocate.
> >  	 */
> >  	ctx->codec.h264.neighbor_info_buf =
> > -		dma_alloc_coherent(dev->dev, 
CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> > -				   &ctx-
>codec.h264.neighbor_info_buf_dma,
> > -				   GFP_KERNEL);
> > +		dma_alloc_attrs(dev->dev, 
CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> > +				&ctx-
>codec.h264.neighbor_info_buf_dma,
> > +				GFP_KERNEL, 
DMA_ATTR_NO_KERNEL_MAPPING);
> 
> I think it would be good to have a comment for all these dma_alloc_attrs
> calls where you note that these buffers are used by the HW only, and
> never by the CPU, hence the use of DMA_ATTR_NO_KERNEL_MAPPING.
> 

Ok.

> >  	if (!ctx->codec.h264.neighbor_info_buf) {
> >  		ret = -ENOMEM;
> >  		goto err_pic_buf;
> > @@ -582,10 +582,11 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
> >  
> >  	mv_col_size = field_size * 2 * CEDRUS_H264_FRAME_NUM;
> >  	ctx->codec.h264.mv_col_buf_size = mv_col_size;
> > -	ctx->codec.h264.mv_col_buf = dma_alloc_coherent(dev->dev,
> > -							
ctx->codec.h264.mv_col_buf_size,
> > -							
&ctx->codec.h264.mv_col_buf_dma,
> > -							
GFP_KERNEL);
> > +	ctx->codec.h264.mv_col_buf =
> > +		dma_alloc_attrs(dev->dev,
> > +				ctx->codec.h264.mv_col_buf_size,
> > +				&ctx->codec.h264.mv_col_buf_dma,
> > +				GFP_KERNEL, 
DMA_ATTR_NO_KERNEL_MAPPING);
> >  	if (!ctx->codec.h264.mv_col_buf) {
> >  		ret = -ENOMEM;
> >  		goto err_neighbor_buf;
> > @@ -600,10 +601,10 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
> >  		ctx->codec.h264.deblk_buf_size =
> >  			ALIGN(ctx->src_fmt.width, 32) * 12;
> >  		ctx->codec.h264.deblk_buf =
> > -			dma_alloc_coherent(dev->dev,
> > -					   ctx-
>codec.h264.deblk_buf_size,
> > -					   &ctx-
>codec.h264.deblk_buf_dma,
> > -					   GFP_KERNEL);
> > +			dma_alloc_attrs(dev->dev,
> > +					ctx-
>codec.h264.deblk_buf_size,
> > +					&ctx-
>codec.h264.deblk_buf_dma,
> > +					GFP_KERNEL, 
DMA_ATTR_NO_KERNEL_MAPPING);
> >  		if (!ctx->codec.h264.deblk_buf) {
> >  			ret = -ENOMEM;
> >  			goto err_mv_col_buf;
> > @@ -616,10 +617,10 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
> >  		ctx->codec.h264.intra_pred_buf_size =
> >  			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
> >  		ctx->codec.h264.intra_pred_buf =
> > -			dma_alloc_coherent(dev->dev,
> > -					   ctx-
>codec.h264.intra_pred_buf_size,
> > -					   &ctx-
>codec.h264.intra_pred_buf_dma,
> > -					   GFP_KERNEL);
> > +			dma_alloc_attrs(dev->dev,
> > +					ctx-
>codec.h264.intra_pred_buf_size,
> > +					&ctx-
>codec.h264.intra_pred_buf_dma,
> > +					GFP_KERNEL, 
DMA_ATTR_NO_KERNEL_MAPPING);
> >  		if (!ctx->codec.h264.intra_pred_buf) {
> >  			ret = -ENOMEM;
> >  			goto err_deblk_buf;
> > @@ -629,24 +630,28 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
> >  	return 0;
> >  
> >  err_deblk_buf:
> > -	dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
> > -			  ctx->codec.h264.deblk_buf,
> > -			  ctx->codec.h264.deblk_buf_dma);
> > +	dma_free_attrs(dev->dev, ctx->codec.h264.deblk_buf_size,
> > +		       ctx->codec.h264.deblk_buf,
> > +		       ctx->codec.h264.deblk_buf_dma,
> > +		       DMA_ATTR_NO_KERNEL_MAPPING);
> >  
> >  err_mv_col_buf:
> > -	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
> > -			  ctx->codec.h264.mv_col_buf,
> > -			  ctx->codec.h264.mv_col_buf_dma);
> > +	dma_free_attrs(dev->dev, ctx->codec.h264.mv_col_buf_size,
> > +		       ctx->codec.h264.mv_col_buf,
> > +		       ctx->codec.h264.mv_col_buf_dma,
> > +		       DMA_ATTR_NO_KERNEL_MAPPING);
> >  
> >  err_neighbor_buf:
> > -	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> > -			  ctx->codec.h264.neighbor_info_buf,
> > -			  ctx->codec.h264.neighbor_info_buf_dma);
> > +	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> > +		       ctx->codec.h264.neighbor_info_buf,
> > +		       ctx->codec.h264.neighbor_info_buf_dma,
> > +		       DMA_ATTR_NO_KERNEL_MAPPING);
> >  
> >  err_pic_buf:
> > -	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
> > -			  ctx->codec.h264.pic_info_buf,
> > -			  ctx->codec.h264.pic_info_buf_dma);
> > +	dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> > +		       ctx->codec.h264.pic_info_buf,
> > +		       ctx->codec.h264.pic_info_buf_dma,
> > +		       DMA_ATTR_NO_KERNEL_MAPPING);
> >  	return ret;
> >  }
> >  
> > @@ -654,23 +659,28 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
> >  {
> >  	struct cedrus_dev *dev = ctx->dev;
> >  
> > -	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
> > -			  ctx->codec.h264.mv_col_buf,
> > -			  ctx->codec.h264.mv_col_buf_dma);
> > -	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> > -			  ctx->codec.h264.neighbor_info_buf,
> > -			  ctx->codec.h264.neighbor_info_buf_dma);
> > -	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
> > -			  ctx->codec.h264.pic_info_buf,
> > -			  ctx->codec.h264.pic_info_buf_dma);
> > +	dma_free_attrs(dev->dev, ctx->codec.h264.mv_col_buf_size,
> > +		       ctx->codec.h264.mv_col_buf,
> > +		       ctx->codec.h264.mv_col_buf_dma,
> > +		       DMA_ATTR_NO_KERNEL_MAPPING);
> > +	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
> > +		       ctx->codec.h264.neighbor_info_buf,
> > +		       ctx->codec.h264.neighbor_info_buf_dma,
> > +		       DMA_ATTR_NO_KERNEL_MAPPING);
> > +	dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
> > +		       ctx->codec.h264.pic_info_buf,
> > +		       ctx->codec.h264.pic_info_buf_dma,
> > +		       DMA_ATTR_NO_KERNEL_MAPPING);
> >  	if (ctx->codec.h264.deblk_buf_size)
> > -		dma_free_coherent(dev->dev, ctx-
>codec.h264.deblk_buf_size,
> > -				  ctx->codec.h264.deblk_buf,
> > -				  ctx->codec.h264.deblk_buf_dma);
> > +		dma_free_attrs(dev->dev, ctx-
>codec.h264.deblk_buf_size,
> > +			       ctx->codec.h264.deblk_buf,
> > +			       ctx->codec.h264.deblk_buf_dma,
> > +			       DMA_ATTR_NO_KERNEL_MAPPING);
> >  	if (ctx->codec.h264.intra_pred_buf_size)
> > -		dma_free_coherent(dev->dev, ctx-
>codec.h264.intra_pred_buf_size,
> > -				  ctx->codec.h264.intra_pred_buf,
> > -				  ctx-
>codec.h264.intra_pred_buf_dma);
> > +		dma_free_attrs(dev->dev, ctx-
>codec.h264.intra_pred_buf_size,
> > +			       ctx->codec.h264.intra_pred_buf,
> > +			       ctx->codec.h264.intra_pred_buf_dma,
> > +			       DMA_ATTR_NO_KERNEL_MAPPING);
> >  }
> >  
> >  static void cedrus_h264_trigger(struct cedrus_ctx *ctx)
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/
staging/media/sunxi/cedrus/cedrus_h265.c
> > index 3d9561d4aadb..bb7eb56106c5 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > @@ -351,10 +351,10 @@ static void cedrus_h265_setup(struct cedrus_ctx 
*ctx,
> >  			ctx->codec.h265.mv_col_buf_unit_size;
> >  
> >  		ctx->codec.h265.mv_col_buf =
> > -			dma_alloc_coherent(dev->dev,
> > -					   ctx-
>codec.h265.mv_col_buf_size,
> > -					   &ctx-
>codec.h265.mv_col_buf_addr,
> > -					   GFP_KERNEL);
> > +			dma_alloc_attrs(dev->dev,
> > +					ctx-
>codec.h265.mv_col_buf_size,
> > +					&ctx-
>codec.h265.mv_col_buf_addr,
> > +					GFP_KERNEL, 
DMA_ATTR_NO_KERNEL_MAPPING);
> >  		if (!ctx->codec.h265.mv_col_buf) {
> >  			ctx->codec.h265.mv_col_buf_size = 0;
> >  			// TODO: Abort the process here.
> > @@ -668,9 +668,9 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
> >  	ctx->codec.h265.mv_col_buf_size = 0;
> >  
> >  	ctx->codec.h265.neighbor_info_buf =
> > -		dma_alloc_coherent(dev->dev, 
CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> > -				   &ctx-
>codec.h265.neighbor_info_buf_addr,
> > -				   GFP_KERNEL);
> > +		dma_alloc_attrs(dev->dev, 
CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> > +				&ctx-
>codec.h265.neighbor_info_buf_addr,
> > +				GFP_KERNEL, 
DMA_ATTR_NO_KERNEL_MAPPING);
> >  	if (!ctx->codec.h265.neighbor_info_buf)
> >  		return -ENOMEM;
> >  
> > @@ -682,16 +682,18 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
> >  	struct cedrus_dev *dev = ctx->dev;
> >  
> >  	if (ctx->codec.h265.mv_col_buf_size > 0) {
> > -		dma_free_coherent(dev->dev, ctx-
>codec.h265.mv_col_buf_size,
> > -				  ctx->codec.h265.mv_col_buf,
> > -				  ctx-
>codec.h265.mv_col_buf_addr);
> > +		dma_free_attrs(dev->dev, ctx-
>codec.h265.mv_col_buf_size,
> > +			       ctx->codec.h265.mv_col_buf,
> > +			       ctx->codec.h265.mv_col_buf_addr,
> > +			       DMA_ATTR_NO_KERNEL_MAPPING);
> >  
> >  		ctx->codec.h265.mv_col_buf_size = 0;
> >  	}
> >  
> > -	dma_free_coherent(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> > -			  ctx->codec.h265.neighbor_info_buf,
> > -			  ctx->codec.h265.neighbor_info_buf_addr);
> > +	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
> > +		       ctx->codec.h265.neighbor_info_buf,
> > +		       ctx->codec.h265.neighbor_info_buf_addr,
> > +		       DMA_ATTR_NO_KERNEL_MAPPING);
> >  }
> >  
> >  static void cedrus_h265_trigger(struct cedrus_ctx *ctx)
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/
staging/media/sunxi/cedrus/cedrus_video.c
> > index 66714609b577..800ffa5382de 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -568,6 +568,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue 
*src_vq,
> >  
> >  	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> >  	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	src_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> >  	src_vq->drv_priv = ctx;
> >  	src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
> >  	src_vq->ops = &cedrus_qops;
> > @@ -584,6 +585,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue 
*src_vq,
> >  
> >  	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> >  	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> > +	src_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> 
> This should be dst_vq!
> 
> I'm also not quite sure that it is right to use this for the destination
> buffer. Could this cause problems if this buffer is exported to a dmabuf
> and another driver will be using it and requiring a kernel mapping.

Hm, if I fix this, it actually breaks DRM mapping. For some reason it expects 
vmap to be valid. I'll drop this for now.

Thanks for review!

Best regards,
Jernej

> 
> Regards,
> 
> 	Hans
> 
> >  	dst_vq->drv_priv = ctx;
> >  	dst_vq->buf_struct_size = sizeof(struct cedrus_buffer);
> >  	dst_vq->ops = &cedrus_qops;
> > 
> 
> 


