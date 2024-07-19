Return-Path: <linux-media+bounces-15144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FB693768F
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 12:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE8A31F21269
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 10:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE55484A46;
	Fri, 19 Jul 2024 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a5UIowur"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0458286A8;
	Fri, 19 Jul 2024 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721384286; cv=none; b=AWJ/lqQHA+KHc6t+n68qLVwIt5JVm+BpLaOFEzlui+Bw5kEdEGOfXI7kFZjjzsVYWoqJqo+GbSP8PWL7c6mSPj2158bf/cHc0MrKVVUlAAGWmBD8v5ll7t4cjdWdVxH+ZzHJ4Sa7/IoQDUldEy/EsQO0IA7MQLt9LljfNYpVdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721384286; c=relaxed/simple;
	bh=eabJF5WelVgo8hI+NNSeLgeLcjze6smG4FIDgMwhCyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q897hOh3JWwQATid6wUnHwRRAHFkBb7wVRdyS26W2onYyGrXYnmp0aWyD62XMRJVHUouMZM4uWpsMwGxO0QssnUSeqT3Zub8Q4Ct3qd5Gvegul7zEvNg7vhIzw5hpKhT81k6tPrYZDb+4ZCLqalX2RQ+Jr/iiDAV2HWGMZVBMtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a5UIowur; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-149-128.elisa-laajakaista.fi [91.157.149.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5169D471;
	Fri, 19 Jul 2024 12:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721384238;
	bh=eabJF5WelVgo8hI+NNSeLgeLcjze6smG4FIDgMwhCyQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a5UIowurNn6CsBtJF2ZEUDH+ZF+2fusWpUKbw6qi8mBuwezdddCEJ7uh4mCBnHWym
	 wD06USnloXFJzjnVODm416z1C5LsC65rCzqWtPrX0kurJaNyRBLzRty8RHkxaKk4Ge
	 Fd9rAWLDz1iTINPj9Ly2fpX7gnFt6A46yo2Jh2Dc=
Message-ID: <93ac27de-6ef3-4d4b-bc6e-707e3c12b4c2@ideasonboard.com>
Date: Fri, 19 Jul 2024 13:17:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] media: ti: j721e-csi2rx: Submit all available
 buffers
To: Jai Luthra <j-luthra@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath
 <vaishnav.a@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-13-6ae96c54c1c3@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240627-multistream-v2-13-6ae96c54c1c3@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2024 16:10, Jai Luthra wrote:
> We already make sure to submit all available buffers to DMA in each DMA
> completion callback.
> 
> Move that logic in a separate function, and use it during stream start
> as well, as most application queue all their buffers before stream on.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 43 ++++++++++++----------
>   1 file changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 84b972c251e8..a258477b9084 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -637,6 +637,27 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>   	return ret;
>   }
>   
> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
> +	struct ti_csi2rx_buffer *buf;
> +	int ret = 0;
> +
> +	/* If there are more buffers to process then start their transfer. */
> +	while (!list_empty(&dma->queue)) {
> +		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
> +		ret = ti_csi2rx_start_dma(ctx, buf);
> +		if (ret) {
> +			dev_err(ctx->csi->dev,
> +				"Failed to queue the next buffer for DMA\n");
> +			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +			break;
> +		}
> +		list_move_tail(&buf->list, &dma->submitted);
> +	}
> +	return ret;
> +}
> +
>   static void ti_csi2rx_dma_callback(void *param)
>   {
>   	struct ti_csi2rx_buffer *buf = param;
> @@ -657,18 +678,7 @@ static void ti_csi2rx_dma_callback(void *param)
>   	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>   	list_del(&buf->list);
>   
> -	/* If there are more buffers to process then start their transfer. */
> -	while (!list_empty(&dma->queue)) {
> -		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
> -
> -		if (ti_csi2rx_start_dma(ctx, buf)) {
> -			dev_err(ctx->csi->dev,
> -				"Failed to queue the next buffer for DMA\n");
> -			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> -		} else {
> -			list_move_tail(&buf->list, &dma->submitted);
> -		}
> -	}
> +	ti_csi2rx_dma_submit_pending(ctx);
>   
>   	if (list_empty(&dma->submitted))
>   		dma->state = TI_CSI2RX_DMA_IDLE;
> @@ -877,7 +887,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>   	struct ti_csi2rx_dev *csi = ctx->csi;
>   	struct ti_csi2rx_dma *dma = &ctx->dma;
> -	struct ti_csi2rx_buffer *buf;
>   	struct v4l2_subdev_krouting *routing;
>   	struct v4l2_subdev_route *route = NULL;
>   	struct media_pad *remote_pad;
> @@ -943,16 +952,13 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>   	ctx->sequence = 0;
>   
>   	spin_lock_irqsave(&dma->lock, flags);
> -	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>   
> -	ret = ti_csi2rx_start_dma(ctx, buf);
> +	ret = ti_csi2rx_dma_submit_pending(ctx);
>   	if (ret) {
> -		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
>   		spin_unlock_irqrestore(&dma->lock, flags);
> -		goto err_pipeline;
> +		goto err_dma;
>   	}
>   
> -	list_move_tail(&buf->list, &dma->submitted);
>   	dma->state = TI_CSI2RX_DMA_ACTIVE;
>   	spin_unlock_irqrestore(&dma->lock, flags);
>   
> @@ -967,7 +973,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>   
>   err_dma:
>   	ti_csi2rx_stop_dma(ctx);
> -err_pipeline:
>   	video_device_pipeline_stop(&ctx->vdev);
>   	writel(0, csi->shim + SHIM_CNTL);
>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


