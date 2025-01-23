Return-Path: <linux-media+bounces-25184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E62A19F07
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82940188E685
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 07:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49DF20B7FF;
	Thu, 23 Jan 2025 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cXWTZtbM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9A201100;
	Thu, 23 Jan 2025 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617636; cv=none; b=nlwecbGj3tULIN+/vHSGrsgkAvDfHiQZlE8pfK7xYeYn9wiVgTBzB9W3j43mfKTe38a7BkDTmHGFeM5SDpmtCDKBmn39+pWaLO9hDEvCVuXXSaztGEfZotjZZqNvl/FAS5OxZYHephjX2qgDNfdysDT0PxCRc5GIMig0955XBQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617636; c=relaxed/simple;
	bh=ITaRo1gxxN/4bZQ1G4Xo4u9yosN4/MjAWXcUncqv6rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EOvlFP1Lzy73/PfkSoSyfjdpSKKqoSkMbApyAXaSZOkR6L+lEW3LaWPZOpMhAWSh1xDVaZWujseaod7abOH0eM6g0Cz7K5g7WaDnkMK1cwOcOPjxEw2xdfA/B4n0NqM561hXrVGiaLgSKNnKjH84EXwFJ918C0UOd9EyCFaRoiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cXWTZtbM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10C4E3A4;
	Thu, 23 Jan 2025 08:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737617569;
	bh=ITaRo1gxxN/4bZQ1G4Xo4u9yosN4/MjAWXcUncqv6rU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=cXWTZtbM3RA2mL2/fhBsmeHNOSEJoX9Oy8cpthJ/aHCS4YXxmpueKkjf70UnZK9BF
	 BpbLp++n+JBw6KbmNPXs9GgUfg+C2qZKOjZ9ruOkH3QZbD6s+Ddg1vabfcgmA+HsJJ
	 13jBnhpBe0gSdJcJzBI11qWJLIboxH5FOJLakjFo=
Message-ID: <6e97c265-7a09-4ea4-9e9f-7fb81da4662f@ideasonboard.com>
Date: Thu, 23 Jan 2025 09:33:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: rcar-vin: Simplify the shutdown process
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
 <20250122165353.1273739-5-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250122165353.1273739-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/01/2025 18:53, Niklas Söderlund wrote:
> When shutting down capture extra care was needed to try and complete a
> buffer that was involved in the emulated support for SEQ_{TB,BT}. This
> was needed as a buffer might be queued once to the driver, but two times
> to the hardware using different offsets.
> 
> As support for SEQ_{TB,BT} is now removed this shutdown process can be
> greatly simplified. And in addition the state keeping of the VIN device
> can be reduced to a single boolean value instead of keeping track of
> this SEQ_{TB,BT} stopping dance.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   .../platform/renesas/rcar-vin/rcar-core.c     |  4 +-
>   .../platform/renesas/rcar-vin/rcar-dma.c      | 75 ++++++-------------
>   .../platform/renesas/rcar-vin/rcar-vin.h      | 18 +----
>   3 files changed, 26 insertions(+), 71 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index b8e35ef4d9d8..cfbc9ec27706 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1080,7 +1080,7 @@ static int __maybe_unused rvin_suspend(struct device *dev)
>   {
>   	struct rvin_dev *vin = dev_get_drvdata(dev);
>   
> -	if (vin->state != RUNNING)
> +	if (!vin->running)
>   		return 0;
>   
>   	rvin_stop_streaming(vin);
> @@ -1092,7 +1092,7 @@ static int __maybe_unused rvin_resume(struct device *dev)
>   {
>   	struct rvin_dev *vin = dev_get_drvdata(dev);
>   
> -	if (vin->state != RUNNING)
> +	if (!vin->running)
>   		return 0;
>   
>   	/*
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index ba55ccf648de..3eb6b5fcac89 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1022,8 +1022,7 @@ static void rvin_fill_hw_slot(struct rvin_dev *vin, int slot)
>   	if (WARN_ON(vin->buf_hw[slot].buffer))
>   		return;
>   
> -	if ((vin->state != STOPPED && vin->state != RUNNING) ||
> -	    list_empty(&vin->buf_list)) {
> +	if (list_empty(&vin->buf_list)) {
>   		vin->buf_hw[slot].buffer = NULL;
>   		phys_addr = vin->scratch_phys;
>   	} else {
> @@ -1064,8 +1063,6 @@ static int rvin_capture_start(struct rvin_dev *vin)
>   	/* Continuous Frame Capture Mode */
>   	rvin_write(vin, VNFC_C_FRAME, VNFC_REG);
>   
> -	vin->state = RUNNING;
> -
>   	return 0;
>   }
>   
> @@ -1106,9 +1103,9 @@ static irqreturn_t rvin_irq(int irq, void *data)
>   	if (!(int_status & VNINTS_FIS))
>   		goto done;
>   
> -	/* Nothing to do if capture status is 'STOPPED' */
> -	if (vin->state == STOPPED) {
> -		vin_dbg(vin, "IRQ while state stopped\n");
> +	/* Nothing to do if not running. */
> +	if (!vin->running) {
> +		vin_dbg(vin, "IRQ while not running, ignoring\n");
>   		goto done;
>   	}
>   
> @@ -1389,6 +1386,8 @@ int rvin_start_streaming(struct rvin_dev *vin)
>   	if (ret)
>   		rvin_set_stream(vin, 0);
>   
> +	vin->running = true;
> +
>   	spin_unlock_irqrestore(&vin->qlock, flags);
>   
>   	return ret;
> @@ -1421,44 +1420,21 @@ static int rvin_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
>   
>   void rvin_stop_streaming(struct rvin_dev *vin)
>   {
> -	unsigned int i, retries;
>   	unsigned long flags;
> -	bool buffersFreed;
>   
>   	spin_lock_irqsave(&vin->qlock, flags);
>   
> -	if (vin->state == STOPPED) {
> +	if (!vin->running) {
>   		spin_unlock_irqrestore(&vin->qlock, flags);
>   		return;
>   	}
>   
> -	vin->state = STOPPING;
> -
> -	/* Wait until only scratch buffer is used, max 3 interrupts. */
> -	retries = 0;
> -	while (retries++ < RVIN_RETRIES) {
> -		buffersFreed = true;
> -		for (i = 0; i < HW_BUFFER_NUM; i++)
> -			if (vin->buf_hw[i].buffer)
> -				buffersFreed = false;
> -
> -		if (buffersFreed)
> -			break;
> -
> -		spin_unlock_irqrestore(&vin->qlock, flags);
> -		msleep(RVIN_TIMEOUT_MS);
> -		spin_lock_irqsave(&vin->qlock, flags);
> -	}
> -
>   	/* Wait for streaming to stop */
> -	retries = 0;
> -	while (retries++ < RVIN_RETRIES) {
> -
> +	for (unsigned int i = 0; i < RVIN_RETRIES; i++) {
>   		rvin_capture_stop(vin);
>   
>   		/* Check if HW is stopped */
>   		if (!rvin_capture_active(vin)) {
> -			vin->state = STOPPED;
>   			break;
>   		}
>   
> @@ -1467,32 +1443,25 @@ void rvin_stop_streaming(struct rvin_dev *vin)
>   		spin_lock_irqsave(&vin->qlock, flags);
>   	}
>   
> -	if (!buffersFreed || vin->state != STOPPED) {
> -		/*
> -		 * If this happens something have gone horribly wrong.
> -		 * Set state to stopped to prevent the interrupt handler
> -		 * to make things worse...
> -		 */
> -		vin_err(vin, "Failed stop HW, something is seriously broken\n");
> -		vin->state = STOPPED;
> -	}
> +	if (rvin_capture_active(vin))
> +		vin_err(vin, "Hardware did not stop\n");
> +
> +	vin->running = false;
>   
>   	spin_unlock_irqrestore(&vin->qlock, flags);
>   
> -	/* If something went wrong, free buffers with an error. */
> -	if (!buffersFreed) {
> -		return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> -		for (i = 0; i < HW_BUFFER_NUM; i++) {
> -			if (vin->buf_hw[i].buffer)
> -				vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> -						VB2_BUF_STATE_ERROR);
> -		}
> -	}
> -
>   	rvin_set_stream(vin, 0);
>   
>   	/* disable interrupts */
>   	rvin_disable_interrupts(vin);
> +
> +	/* Return unprocessed buffers from hardware. */
> +	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
> +		if (vin->buf_hw[i].buffer)
> +			vb2_buffer_done(&vin->buf_hw[i].buffer->vb2_buf,
> +					VB2_BUF_STATE_ERROR);
> +	}
> +
>   }
>   
>   static void rvin_stop_streaming_vq(struct vb2_queue *vq)
> @@ -1538,8 +1507,6 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
>   
>   	spin_lock_init(&vin->qlock);
>   
> -	vin->state = STOPPED;
> -
>   	for (i = 0; i < HW_BUFFER_NUM; i++)
>   		vin->buf_hw[i].buffer = NULL;
>   
> @@ -1642,7 +1609,7 @@ void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)
>   
>   	vin->alpha = alpha;
>   
> -	if (vin->state == STOPPED)
> +	if (!vin->running)
>   		goto out;
>   
>   	switch (vin->format.pixelformat) {
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> index f13ef379d095..934474d2334a 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
> @@ -61,18 +61,6 @@ enum rvin_isp_id {
>   	(((unsigned int)RVIN_CSI_MAX) > ((unsigned int)RVIN_ISP_MAX) ? \
>   	 (unsigned int)RVIN_CSI_MAX : (unsigned int)RVIN_ISP_MAX)
>   
> -/**
> - * enum rvin_dma_state - DMA states
> - * @STOPPED:   No operation in progress
> - * @RUNNING:   Operation in progress have buffers
> - * @STOPPING:  Stopping operation
> - */
> -enum rvin_dma_state {
> -	STOPPED = 0,
> -	RUNNING,
> -	STOPPING,
> -};
> -
>   /**
>    * struct rvin_video_format - Data format stored in memory
>    * @fourcc:	Pixelformat
> @@ -173,11 +161,11 @@ struct rvin_info {
>    * @scratch:		cpu address for scratch buffer
>    * @scratch_phys:	physical address of the scratch buffer
>    *
> - * @qlock:		protects @buf_hw, @buf_list, @sequence and @state
> + * @qlock:		Protects @buf_hw, @buf_list, @sequence and @running
>    * @buf_hw:		Keeps track of buffers given to HW slot
>    * @buf_list:		list of queued buffers
>    * @sequence:		V4L2 buffers sequence number
> - * @state:		keeps track of operation state
> + * @running:		Keeps track of if the VIN is running
>    *
>    * @is_csi:		flag to mark the VIN as using a CSI-2 subdevice
>    * @chsel:		Cached value of the current CSI-2 channel selection
> @@ -220,7 +208,7 @@ struct rvin_dev {
>   	} buf_hw[HW_BUFFER_NUM];
>   	struct list_head buf_list;
>   	unsigned int sequence;
> -	enum rvin_dma_state state;
> +	bool running;
>   
>   	bool is_csi;
>   	unsigned int chsel;


