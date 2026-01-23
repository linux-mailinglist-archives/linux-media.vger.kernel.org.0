Return-Path: <linux-media+bounces-51409-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEcqGOZAc2mWtwAAu9opvQ
	(envelope-from <linux-media+bounces-51409-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:35:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D1873722
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7314C31212AF
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF72372B5F;
	Fri, 23 Jan 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sJbWYLjE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7096C2E54DE;
	Fri, 23 Jan 2026 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160591; cv=none; b=l0Gstrde9ApqEPcVpxk3i2+rBBCbHaFq0tD0x/lDxqAdrMTgHYwl3hvImq8NyrmKxodselSATi7sEgWxWVssGLyPmZfq3tiANwrk8qxwklY2UopMGGe0bjotzyOsmN5TlBAWRjrt5pgHyHzWxm9jQHLcmVZfzo+g3tMYV8zDQuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160591; c=relaxed/simple;
	bh=+fizITse9wckHDqQB9yBp+EcEOSVwqQ1geFX0U5lj3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXF70N3pNNTtWUKic4VjF9BSTY0QlIK4z+aWNTseag1VRTpSZ2S3TjcyTpREQMcTtDmcsuxhm1LLDjTD9JFrag2waKUed66A3oyQDmKGgxyQJSA9mi3E/5BjE2DKEykxrTVfZHvHYP+/h17DJVv84Ut11MmilAuWYBblCgHm5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sJbWYLjE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD7B71FE4;
	Fri, 23 Jan 2026 10:29:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769160543;
	bh=+fizITse9wckHDqQB9yBp+EcEOSVwqQ1geFX0U5lj3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sJbWYLjEiNQiOJAReRR9GHGkzDzexOYP97UQ6tbskd7+va0H160pwxPY5q46oznX0
	 p8W2xgHOIalTtKJtK4zQuVU89TthYO4tpMmVUYkLRIjasncvQFAcmkSNcaCavywSpM
	 mG+qlK0hE3rLjIl/NNhOLvjmLEZ4fCUyq3OTn7PE=
Message-ID: <18ead528-5e24-419b-b7b3-9b1018124c93@ideasonboard.com>
Date: Fri, 23 Jan 2026 11:29:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/18] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260121135424.1185710-1-r-donadkar@ti.com>
 <20260121135424.1185710-16-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20260121135424.1185710-16-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51409-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid,ti.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1D1873722
X-Rspamd-Action: no action

Hi,

On 21/01/2026 15:54, Rishikesh Donadkar wrote:
> On buffer starvation the DMA is marked IDLE, and the stale data in the
> internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
> userspace. This approach works fine for a single stream case.
> 
> But in multistream scenarios, buffer starvation for one stream can
> block the shared HW FIFO of the CSI2RX IP. This can stall the pipeline
> for all other streams, even if buffers are available for  them.
> 
> This patch introduces a new architecture, that continuously drains data
> from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
> available to the driver from the userspace. This ensures independence
> between different streams, where a slower downstream element for one
> camera does not block streaming for other cameras.
> 
> Additionally, after we drain for a stream, the next frame will be a
> partial frame, as a portion of its data will have already been drained
> before a valid buffer is queued by user space to the driver.
> Return the partial frame to user space with VB2_BUF_STATE_ERROR.
> 
> Use wait for completion barrier to make sure the shared hardware FIFO
> is cleared of the data at the end of stream after the source has stopped
> sending data.
> 
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 123 +++++++++---------
>  1 file changed, 60 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 5bb726f7d4f44..42ef8c553883f 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -82,8 +82,8 @@ struct ti_csi2rx_buffer {
>  
>  enum ti_csi2rx_dma_state {
>  	TI_CSI2RX_DMA_STOPPED,	/* Streaming not started yet. */
> -	TI_CSI2RX_DMA_IDLE,	/* Streaming but no pending DMA operation. */
>  	TI_CSI2RX_DMA_ACTIVE,	/* Streaming and pending DMA operation. */
> +	TI_CSI2RX_DMA_DRAINING, /* Dumping all the data in drain buffer */
>  };
>  
>  struct ti_csi2rx_dma {
> @@ -109,6 +109,7 @@ struct ti_csi2rx_ctx {
>  	struct v4l2_format		v_fmt;
>  	struct ti_csi2rx_dma		dma;
>  	struct media_pad		pad;
> +	struct completion		drain_complete;
>  	u32				sequence;
>  	u32				idx;
>  	u32				vc;
> @@ -249,6 +250,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>  static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>  			       struct ti_csi2rx_buffer *buf);
>  
> +/* Forward declarations needed by ti_csi2rx_drain_callback. */
> +static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
> +
>  static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
>  {
>  	unsigned int i;
> @@ -609,9 +614,32 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  
>  static void ti_csi2rx_drain_callback(void *param)
>  {
> -	struct completion *drain_complete = param;
> +	struct ti_csi2rx_ctx *ctx = param;
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dma->lock, flags);
> +
> +	if (dma->state == TI_CSI2RX_DMA_STOPPED) {
> +		complete(&ctx->drain_complete);
> +		spin_unlock_irqrestore(&dma->lock, flags);
> +		return;
> +	}
>  
> -	complete(drain_complete);
> +	/*
> +	 * If dma->queue is empty, it indicates that no buffer has been
> +	 * provided by user space. In this case, initiate a transactions
> +	 * to drain the DMA. Since one drain of size DRAIN_BUFFER_SIZE
> +	 * will be done here, the subsequent frame will be a
> +	 * partial frame, with a size of frame_size - DRAIN_BUFFER_SIZE
> +	 */
> +	if (list_empty(&dma->queue)) {
> +		if (ti_csi2rx_drain_dma(ctx))
> +			dev_warn(ctx->csi->dev, "DMA drain failed\n");
> +	} else {
> +		ti_csi2rx_dma_submit_pending(ctx);
> +	}
> +	spin_unlock_irqrestore(&dma->lock, flags);
>  }
>  
>  /*
> @@ -629,12 +657,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct ti_csi2rx_dev *csi = ctx->csi;
>  	struct dma_async_tx_descriptor *desc;
> -	struct completion drain_complete;
>  	dma_cookie_t cookie;
>  	int ret;
>  
> -	init_completion(&drain_complete);
> -
>  	desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
>  					   csi->drain.len, DMA_DEV_TO_MEM,
>  					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> @@ -644,7 +669,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>  	}
>  
>  	desc->callback = ti_csi2rx_drain_callback;
> -	desc->callback_param = &drain_complete;
> +	desc->callback_param = ctx;
>  
>  	cookie = dmaengine_submit(desc);
>  	ret = dma_submit_error(cookie);
> @@ -653,13 +678,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>  
>  	dma_async_issue_pending(ctx->dma.chan);
>  
> -	if (!wait_for_completion_timeout(&drain_complete,
> -					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
> -		dmaengine_terminate_sync(ctx->dma.chan);
> -		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
>  out:
>  	return ret;
>  }
> @@ -703,14 +721,24 @@ static void ti_csi2rx_dma_callback(void *param)
>  	spin_lock_irqsave(&dma->lock, flags);
>  
>  	WARN_ON(!list_is_first(&buf->list, &dma->submitted));
> -	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +	if (dma->state == TI_CSI2RX_DMA_DRAINING) {
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +		dma->state = TI_CSI2RX_DMA_ACTIVE;
> +	} else {
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +	}
> +
>  	list_del(&buf->list);
>  
>  	ti_csi2rx_dma_submit_pending(ctx);
>  
> -	if (list_empty(&dma->submitted))
> -		dma->state = TI_CSI2RX_DMA_IDLE;
> -
> +	if (list_empty(&dma->submitted)) {
> +		dma->state = TI_CSI2RX_DMA_DRAINING;
> +		if (ti_csi2rx_drain_dma(ctx))
> +			dev_warn(ctx->csi->dev,
> +				 "DMA drain failed on one of the transactions\n");
> +	}
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  }
>  
> @@ -746,6 +774,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>  static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct ti_csi2rx_dma *dma = &ctx->dma;
> +	struct ti_csi2rx_dev *csi = ctx->csi;
>  	enum ti_csi2rx_dma_state state;
>  	unsigned long flags;
>  	int ret;
> @@ -755,6 +784,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>  	dma->state = TI_CSI2RX_DMA_STOPPED;
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  
> +	init_completion(&ctx->drain_complete);
> +
>  	if (state != TI_CSI2RX_DMA_STOPPED) {
>  		/*
>  		 * Normal DMA termination does not clean up pending data on
> @@ -763,11 +794,20 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>  		 * enforced before terminating DMA.
>  		 */
>  		ret = ti_csi2rx_drain_dma(ctx);
> -		if (ret && ret != -ETIMEDOUT)
> +		if (ret)
>  			dev_warn(ctx->csi->dev,
>  				 "Failed to drain DMA. Next frame might be bogus\n");
>  	}
>  
> +	/* We wait for the drain to complete so that the stream stops
> +	 * cleanly, making sure the shared hardware FIFO is cleared of
> +	 * data from the current stream. No more data will be coming from
> +	 * the source after this.
> +	 */
> +	if (!wait_for_completion_timeout(&ctx->drain_complete,
> +					 msecs_to_jiffies(DRAIN_TIMEOUT_MS)))
> +		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
> +
>  	ret = dmaengine_terminate_sync(ctx->dma.chan);
>  	if (ret)
>  		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
> @@ -830,57 +870,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>  	struct ti_csi2rx_buffer *buf;
>  	struct ti_csi2rx_dma *dma = &ctx->dma;
> -	bool restart_dma = false;
>  	unsigned long flags = 0;
> -	int ret;
>  
>  	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
>  	buf->ctx = ctx;
>  
>  	spin_lock_irqsave(&dma->lock, flags);
> -	/*
> -	 * Usually the DMA callback takes care of queueing the pending buffers.
> -	 * But if DMA has stalled due to lack of buffers, restart it now.
> -	 */
> -	if (dma->state == TI_CSI2RX_DMA_IDLE) {
> -		/*
> -		 * Do not restart DMA with the lock held because
> -		 * ti_csi2rx_drain_dma() might block for completion.
> -		 * There won't be a race on queueing DMA anyway since the
> -		 * callback is not being fired.
> -		 */
> -		restart_dma = true;
> -		dma->state = TI_CSI2RX_DMA_ACTIVE;
> -	} else {
> -		list_add_tail(&buf->list, &dma->queue);
> -	}
> +	list_add_tail(&buf->list, &dma->queue);
>  	spin_unlock_irqrestore(&dma->lock, flags);
> -
> -	if (restart_dma) {
> -		/*
> -		 * Once frames start dropping, some data gets stuck in the DMA
> -		 * pipeline somewhere. So the first DMA transfer after frame
> -		 * drops gives a partial frame. This is obviously not useful to
> -		 * the application and will only confuse it. Issue a DMA
> -		 * transaction to drain that up.
> -		 */
> -		ret = ti_csi2rx_drain_dma(ctx);
> -		if (ret && ret != -ETIMEDOUT)
> -			dev_warn(ctx->csi->dev,
> -				 "Failed to drain DMA. Next frame might be bogus\n");
> -
> -		spin_lock_irqsave(&dma->lock, flags);
> -		ret = ti_csi2rx_start_dma(ctx, buf);
> -		if (ret) {
> -			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> -			dma->state = TI_CSI2RX_DMA_IDLE;
> -			spin_unlock_irqrestore(&dma->lock, flags);
> -			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
> -		} else {
> -			list_add_tail(&buf->list, &dma->submitted);
> -			spin_unlock_irqrestore(&dma->lock, flags);
> -		}
> -	}
>  }
>  
>  static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)


