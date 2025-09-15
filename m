Return-Path: <linux-media+bounces-42565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DFB5829D
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 18:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A3341A218C4
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 16:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E3C28313D;
	Mon, 15 Sep 2025 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c70sDKW0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA01E50E;
	Mon, 15 Sep 2025 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757955354; cv=none; b=nxsDiC2GXnnvC97xXw0gjKOHr6yebkX55uixbg+UeCb/M9tD7HKjndRHP9CRWmWzKDa0Wx154Xty0DNNBegDi1fgS1cWy3TUXzvjpwf9KEBNfjKbedo0cra+AbkzQVqVBQhZ2u1JTMnE3GqBUY5bTt/pTcWOhwyx31JrKMM7ZMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757955354; c=relaxed/simple;
	bh=ScHNo7xeAxbc9qs152ZJaY9kt3AjpGFgAP5bYGwbDhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+YoxyXZb6DNrSYf9IaCexYsQhk4f8KOFkPcFGtfOiQPdv/Iugcnhlh+YTABLFRdzRHtC82wNYeWlIcLHlcDl4utA4L+a1MHKpjkX/A2X17+xQkd9LSczP54a7VQ30hA8MXVEzQ3xwfsJZdSdgZFAREcl1GRZCFvb/E9dSjsKCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c70sDKW0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82062B0B;
	Mon, 15 Sep 2025 18:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757955272;
	bh=ScHNo7xeAxbc9qs152ZJaY9kt3AjpGFgAP5bYGwbDhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c70sDKW0Y91oM30vf++vp2z4pVbkNOEdGBxrMH87+iYEavirzIxXtUCKhgFzwH/KH
	 ivQOwVUa5MFYJGAYc2gUP6A0ScAbeK8jx6ft6jvJouGoxqtvgUx+q/8AkW3LX4d1VE
	 TQ8R7eqIgg2YgosbNbUJkyuF4YlP8QN+qRW6CNj8=
Date: Mon, 15 Sep 2025 18:55:44 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: Improve frame sequence correctness on
 stats and params buffers
Message-ID: <rthpkuipbpbp2lv2ddmruwb7fmpkmtlsnx3q6kk7gaskzpdaar@5bk3r44f2mpo>
References: <20250908094200.48002-1-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908094200.48002-1-stefan.klug@ideasonboard.com>

Hi Stefan

On Mon, Sep 08, 2025 at 11:41:48AM +0200, Stefan Klug wrote:
> On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
> handler is sometimes called with RKISP1_CIF_ISP_V_START (start of frame)
> and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
> commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
> debugfs var for irq delay") a warning was added for that. There are two
> cases where this condition can occur:
>
> 1. The v-sync and the frame-end belong to the same frame. This means,
>    the irq was heavily delayed and the warning is likely appropriate.
>
> 2. The v-sync belongs to the next frame. This can happen if the vertical
>    blanking between two frames is very short.
>
> The current code always handles case 1 although case 2 is in my
> experience the more common case and happens in regular usage. This leads

I would rather argue that 8524fa22fd2f is possibily wrong, and case 1)
would imply the interrupt has been delayed for the whole frame
duration (+ blanking), which seems unlikely to me ?

True we handle stats collection and parameters programming in irq
context, which is less than ideal and could take time (I wonder if we
should use a threaded irq, but that's a different problem)

If that's the case and we only should care about 2) would simply
handling RKISP1_CIF_ISP_FRAME before RKISP1_CIF_ISP_V_START be enough ?

> to incorrect sequence numbers on stats and params buffers which in turn
> breaks the regulation in user space. Fix that by adding a frame_active
> flag to distinguish between these cases and handle the start of frame
> either at the beginning or at the end of the rkisp1_isp_isr().
>
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c | 17 +++++++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829b..adf23416de9a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -222,6 +222,7 @@ struct rkisp1_isp {
>  	struct media_pad pads[RKISP1_ISP_PAD_MAX];
>  	const struct rkisp1_mbus_info *sink_fmt;
>  	__u32 frame_sequence;
> +	bool frame_active;
>  };
>
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 8c29a1c9309a..1469075b2d45 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>  	}
>
>  	isp->frame_sequence = -1;
> +	isp->frame_active = false;
>
>  	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
>
> @@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
>   * Interrupt handlers
>   */
>
> -static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> +static void rkisp1_isp_sof(struct rkisp1_isp *isp)
>  {
>  	struct v4l2_event event = {
>  		.type = V4L2_EVENT_FRAME_SYNC,
>  	};
>
> +	isp->frame_sequence++;
> +	isp->frame_active = true;
> +
>  	event.u.frame_sync.frame_sequence = isp->frame_sequence;
>  	v4l2_event_queue(isp->sd.devnode, &event);
>  }
> @@ -1112,14 +1116,15 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
>
>  	/* Vertical sync signal, starting generating new frame */
> -	if (status & RKISP1_CIF_ISP_V_START) {
> -		rkisp1->isp.frame_sequence++;
> -		rkisp1_isp_queue_event_sof(&rkisp1->isp);
> +	if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active) {
> +		status &= ~RKISP1_CIF_ISP_V_START;
> +		rkisp1_isp_sof(&rkisp1->isp);
>  		if (status & RKISP1_CIF_ISP_FRAME) {
>  			WARN_ONCE(1, "irq delay is too long, buffers might not be in sync\n");
>  			rkisp1->debug.irq_delay++;
>  		}
>  	}
> +
>  	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
>  		/* Clear pic_size_error */
>  		isp_err = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
> @@ -1138,6 +1143,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  	if (status & RKISP1_CIF_ISP_FRAME) {
>  		u32 isp_ris;
>
> +		rkisp1->isp.frame_active = false;
>  		rkisp1->debug.complete_frames++;
>
>  		/* New frame from the sensor received */
> @@ -1152,5 +1158,8 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  		rkisp1_params_isr(rkisp1);
>  	}
>
> +	if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active)

I think you can drop the  && !rkisp1->isp.frame_active because if you
get here and 'status & RKISP1_CIF_ISP_V_START' it means that:

1) frame_active was false and you have entered the above

        if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active) {

   and now the RKISP1_CIF_ISP_V_START bit in 'status' has been cleared
   so you don't need to handle VSYNC here

2) frame_active was true and you delayed handling V_START till here.
   If also ISP_FRAME was set, frame_start has been set to false here
   above. If ISP_FRAME was not set then it has been delivered by a
   previous interrupt and then frame_start is false.

So I guess it's enough to check if at this point RKISP1_CIF_ISP_V_START
is still set in 'status' ?

However, as said, it's seems unlikely to that your above 1) can
happen. Have you ever hit a WARN() again with this patch applied ?

> +		rkisp1_isp_sof(&rkisp1->isp);
> +
>  	return IRQ_HANDLED;
>  }
> --
> 2.48.1
>
>

