Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E80736649
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 23:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFEVHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 17:07:38 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53551 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfFEVHi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 17:07:38 -0400
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1E24924000B;
        Wed,  5 Jun 2019 21:07:33 +0000 (UTC)
Message-ID: <870e55d3697583841700258b184ed4f5f3a8fb03.camel@bootlin.com>
Subject: Re: [PATCH 4/7] media: cedrus: Remove dst_bufs from context
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Wed, 05 Jun 2019 23:07:33 +0200
In-Reply-To: <20190530211516.1891-5-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
         <20190530211516.1891-5-jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le jeudi 30 mai 2019 à 23:15 +0200, Jernej Skrabec a écrit :
> This array is just duplicated capture buffer queue. Remove it and adjust
> code to look into capture buffer queue instead.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers and thanks,

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 +---
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  4 ++--
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 22 -------------------
>  3 files changed, 3 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 3f476d0fd981..d8e6777e5e27 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -100,8 +100,6 @@ struct cedrus_ctx {
>  	struct v4l2_ctrl_handler	hdl;
>  	struct v4l2_ctrl		**ctrls;
>  
> -	struct vb2_buffer		*dst_bufs[VIDEO_MAX_FRAME];
> -
>  	union {
>  		struct {
>  			void		*mv_col_buf;
> @@ -187,7 +185,7 @@ static inline dma_addr_t cedrus_dst_buf_addr(struct cedrus_ctx *ctx,
>  	if (index < 0)
>  		return 0;
>  
> -	buf = ctx->dst_bufs[index];
> +	buf = ctx->fh.m2m_ctx->cap_q_ctx.q.bufs[index];
>  	return buf ? cedrus_buf_addr(buf, &ctx->dst_fmt, plane) : 0;
>  }
>  
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index d0ee3f90ff46..b2290f98d81a 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -119,7 +119,7 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
>  		if (buf_idx < 0)
>  			continue;
>  
> -		cedrus_buf = vb2_to_cedrus_buffer(ctx->dst_bufs[buf_idx]);
> +		cedrus_buf = vb2_to_cedrus_buffer(cap_q->bufs[buf_idx]);
>  		position = cedrus_buf->codec.h264.position;
>  		used_dpbs |= BIT(position);
>  
> @@ -194,7 +194,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>  		if (buf_idx < 0)
>  			continue;
>  
> -		ref_buf = to_vb2_v4l2_buffer(ctx->dst_bufs[buf_idx]);
> +		ref_buf = to_vb2_v4l2_buffer(cap_q->bufs[buf_idx]);
>  		cedrus_buf = vb2_v4l2_to_cedrus_buffer(ref_buf);
>  		position = cedrus_buf->codec.h264.position;
>  
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index e2b530b1a956..681dfe3367a6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -411,26 +411,6 @@ static void cedrus_queue_cleanup(struct vb2_queue *vq, u32 state)
>  	}
>  }
>  
> -static int cedrus_buf_init(struct vb2_buffer *vb)
> -{
> -	struct vb2_queue *vq = vb->vb2_queue;
> -	struct cedrus_ctx *ctx = vb2_get_drv_priv(vq);
> -
> -	if (!V4L2_TYPE_IS_OUTPUT(vq->type))
> -		ctx->dst_bufs[vb->index] = vb;
> -
> -	return 0;
> -}
> -
> -static void cedrus_buf_cleanup(struct vb2_buffer *vb)
> -{
> -	struct vb2_queue *vq = vb->vb2_queue;
> -	struct cedrus_ctx *ctx = vb2_get_drv_priv(vq);
> -
> -	if (!V4L2_TYPE_IS_OUTPUT(vq->type))
> -		ctx->dst_bufs[vb->index] = NULL;
> -}
> -
>  static int cedrus_buf_out_validate(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> @@ -517,8 +497,6 @@ static void cedrus_buf_request_complete(struct vb2_buffer *vb)
>  static struct vb2_ops cedrus_qops = {
>  	.queue_setup		= cedrus_queue_setup,
>  	.buf_prepare		= cedrus_buf_prepare,
> -	.buf_init		= cedrus_buf_init,
> -	.buf_cleanup		= cedrus_buf_cleanup,
>  	.buf_queue		= cedrus_buf_queue,
>  	.buf_out_validate	= cedrus_buf_out_validate,
>  	.buf_request_complete	= cedrus_buf_request_complete,

