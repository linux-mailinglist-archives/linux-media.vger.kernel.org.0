Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C96689FEE
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 15:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbfHLNmy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 09:42:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57354 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfHLNmx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 09:42:53 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4686C28B0CA
Message-ID: <9374a16516e61978d58bff4d8721bff2f511c5c9.camel@collabora.com>
Subject: Re: [PATCH 4/7] media: cedrus: Remove dst_bufs from context
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>,
        paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 12 Aug 2019 10:42:44 -0300
In-Reply-To: <20190530211516.1891-5-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
         <20190530211516.1891-5-jernej.skrabec@siol.net>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-05-30 at 23:15 +0200, Jernej Skrabec wrote:
> This array is just duplicated capture buffer queue. Remove it and adjust
> code to look into capture buffer queue instead.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
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

I think you can use v4l2_m2m_get_dst_vq() to access the queue,
and vb2_get_buffer() to access buffers in a vb2 queue.

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

Ditto about vb2_get_buffer.

>  		position = cedrus_buf->codec.h264.position;
>  		used_dpbs |= BIT(position);
>  
> @@ -194,7 +194,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx *ctx,
>  		if (buf_idx < 0)
>  			continue;
>  
> -		ref_buf = to_vb2_v4l2_buffer(ctx->dst_bufs[buf_idx]);
> +		ref_buf = to_vb2_v4l2_buffer(cap_q->bufs[buf_idx]);

Ditto about vb2_get_buffer.

With those changes:

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

