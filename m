Return-Path: <linux-media+bounces-43132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD70B9DDAD
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 09:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F8D4A2F1C
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 07:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6772E9EC7;
	Thu, 25 Sep 2025 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YrW/A+e9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711912E9726;
	Thu, 25 Sep 2025 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758785343; cv=none; b=s9+zlyO1/drCca0auaTVaqmYwX4HogvXsN5pITu7WZjN3AU9AZYjKrXyBqo/5J5hXhLE/VpqYP1juCwaUJyrIXWuiM6R5/fODpaP24PlxXwPEO1n+n9zoYQWR+/Pkfj7HTX5rvxMvNsxOdQF4xVVkjrL4bEmVt2fT5FmmSY/diw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758785343; c=relaxed/simple;
	bh=z21Xp4TuXHyCW4xtMz/OOCsZSb7Kaf5SWHB7K7mD714=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbvujRxWActDEpBmhZ/1Hj1zXzgu+SjKHftYVJZjPCkQyH9IbZ5/hwsNPJ80fSrvL6inOgK2bmIoVZi6JoN+ysogp5W0Dh7vrjswoOGhHLlTOrBXwCNFOOuWCTo3ckegSsrvFHOctzIaKpMfIKXTlcT5ImLfF2cN8ZIIoTc0wQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YrW/A+e9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B35FBE91;
	Thu, 25 Sep 2025 09:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758785251;
	bh=z21Xp4TuXHyCW4xtMz/OOCsZSb7Kaf5SWHB7K7mD714=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrW/A+e9Va5WN1aYaEF5voDen7kynHSJvb+tW2ovoWaqiLOi+xSAs0R+GwOweyOig
	 MB4oMsacYfWEsVxFZo3m6wEEi0odSNTqlAQS9kiDMXJXpKOosA//i9sVj60gOtB5CH
	 CTsWJgx/wFZrvnZK4ydTqXG4mF8RItwEVkzGCipM=
Date: Thu, 25 Sep 2025 09:28:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: rkisp1: Improve frame sequence correctness on
 stats and params buffers
Message-ID: <xxj3awe4ezdf242bpiktov4tb2xb3r6l6c5rtmrywubniwlbik@bubb5l6psz6i>
References: <20250922182003.3712101-2-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922182003.3712101-2-stefan.klug@ideasonboard.com>

Hi Stefan

On Mon, Sep 22, 2025 at 08:19:57PM +0200, Stefan Klug wrote:
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
> to incorrect sequence numbers on stats and params buffers which in turn
> breaks the regulation in user space. Fix that by adding a frame_active
> flag to distinguish between these cases and handle the start of frame
> either at the beginning or at the end of the rkisp1_isp_isr().
>
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> ---
>
> Hi all,
>
> Here is an updated version of the patch with a fix for a typo that was
> spotted in the last review.
>
> Changes in v3:
> - Fixed typo in comment
> - Collected r-by tag
>
> Changes in v2:
> - Removed test for !frame_active in second v_start handler
> - Improved comments

Thanks for addressing these
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> Best regards,
> Stefan
>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++++++++----
>  2 files changed, 23 insertions(+), 5 deletions(-)
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
> index 8c29a1c9309a..660c1fd7efcc 100644
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
> @@ -1111,15 +1115,20 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
>
> -	/* Vertical sync signal, starting generating new frame */
> -	if (status & RKISP1_CIF_ISP_V_START) {
> -		rkisp1->isp.frame_sequence++;
> -		rkisp1_isp_queue_event_sof(&rkisp1->isp);
> +	/*
> +	 * Vertical sync signal, starting new frame. Defer handling of vsync
> +	 * after RKISP1_CIF_ISP_FRAME if the previous frame was not completed
> +	 * yet.
> +	 */
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
> @@ -1138,6 +1147,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  	if (status & RKISP1_CIF_ISP_FRAME) {
>  		u32 isp_ris;
>
> +		rkisp1->isp.frame_active = false;
>  		rkisp1->debug.complete_frames++;
>
>  		/* New frame from the sensor received */
> @@ -1152,5 +1162,12 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  		rkisp1_params_isr(rkisp1);
>  	}
>
> +	/*
> +	 * Deferred handling of vsync if RKISP1_CIF_ISP_V_START and
> +	 * RKISP1_CIF_ISP_FRAME occurred in the same irq.
> +	 */
> +	if (status & RKISP1_CIF_ISP_V_START)
> +		rkisp1_isp_sof(&rkisp1->isp);
> +
>  	return IRQ_HANDLED;
>  }
> --
> 2.48.1
>

