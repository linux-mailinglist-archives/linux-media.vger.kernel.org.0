Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66EA3D3BFD
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbfJKJMH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 11 Oct 2019 05:12:07 -0400
Received: from mailoutvs2.siol.net ([185.57.226.193]:57541 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726585AbfJKJMH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:12:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id DB47D5209CC;
        Fri, 11 Oct 2019 11:12:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id KiaWomx4yjNh; Fri, 11 Oct 2019 11:12:03 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 3EBB1520F4A;
        Fri, 11 Oct 2019 11:12:03 +0200 (CEST)
Received: from jernej-laptop.localnet (unknown [89.216.49.66])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 8F606520FBF;
        Fri, 11 Oct 2019 11:12:02 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCHv3 8/8] media: cedrus: Add support for holding capture buffer
Date:   Fri, 11 Oct 2019 11:12:02 +0200
Message-ID: <2723071.MNAxPYmo87@jernej-laptop>
In-Reply-To: <20191010131152.68984-9-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl> <20191010131152.68984-9-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 10. oktober 2019 ob 15:11:52 CEST je Hans Verkuil napisal(a):
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> When frame contains multiple slices and driver works in slice mode, it's
> more efficient to hold capture buffer in queue until all slices of a
> same frame are decoded.
> 
> Add support for that to Cedrus driver by exposing and implementing
> V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> [hverkuil-cisco@xs4all.nl: rewritten to use
> v4l2_m2m_buf_done_and_job_finish] Signed-off-by: Hans Verkuil
> <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c   | 16 ++--------------
>  .../staging/media/sunxi/cedrus/cedrus_video.c    | 14 ++++++++++++++
>  2 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c index
> a942cd9bed57..e7e18424bab1 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -103,7 +103,6 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>  {
>  	struct cedrus_dev *dev = data;
>  	struct cedrus_ctx *ctx;
> -	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	enum vb2_buffer_state state;
>  	enum cedrus_irq_status status;
> 
> @@ -121,24 +120,13 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>  	dev->dec_ops[ctx->current_codec]->irq_disable(ctx);
>  	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
> 
> -	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
> -	if (!src_buf || !dst_buf) {
> -		v4l2_err(&dev->v4l2_dev,
> -			 "Missing source and/or destination 
buffers\n");
> -		return IRQ_HANDLED;
> -	}
> -
>  	if (status == CEDRUS_IRQ_ERROR)
>  		state = VB2_BUF_STATE_ERROR;
>  	else
>  		state = VB2_BUF_STATE_DONE;
> 
> -	v4l2_m2m_buf_done(src_buf, state);
> -	v4l2_m2m_buf_done(dst_buf, state);
> -
> -	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
> +					 state);
> 
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_video.c index
> 3ec3a2db790c..82198b2bb081 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -303,6 +303,17 @@ static int cedrus_s_fmt_vid_out(struct file *file, void
> *priv,
> 
>  	ctx->src_fmt = f->fmt.pix;
> 
> +	switch (ctx->src_fmt.pixelformat) {
> +	case V4L2_PIX_FMT_H264_SLICE:
> +		vq->subsystem_flags |=
> +			VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> +		break;
> +	default:
> +		vq->subsystem_flags &=
> +			
(u32)~VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;

I checked again and I think we can drop this cast.

Best regards,
Jernej

> +		break;
> +	}
> +
>  	/* Propagate colorspace information to capture. */
>  	ctx->dst_fmt.colorspace = f->fmt.pix.colorspace;
>  	ctx->dst_fmt.xfer_func = f->fmt.pix.xfer_func;
> @@ -336,6 +347,9 @@ const struct v4l2_ioctl_ops cedrus_ioctl_ops = {
>  	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
>  	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> 
> +	.vidioc_try_decoder_cmd		= 
v4l2_m2m_ioctl_stateless_try_decoder_cmd,
> +	.vidioc_decoder_cmd		= 
v4l2_m2m_ioctl_stateless_decoder_cmd,
> +
>  	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
>  	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
>  };




