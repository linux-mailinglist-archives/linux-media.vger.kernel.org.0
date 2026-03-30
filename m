Return-Path: <linux-media+bounces-57610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QChfJE1mymll8gUAu9opvQ
	(envelope-from <linux-media+bounces-57610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:02:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E7135ABD8
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0687300B07B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FC63C9EC3;
	Mon, 30 Mar 2026 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RXE/U+lt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA63288D0;
	Mon, 30 Mar 2026 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871711; cv=none; b=j1uD3KLryTLXIYKVYG/CPyWO6lRKIXiZ/rq5vLI30rpyKvE4lvVNnYF+AJMjWZGkRiXiBiLVMAOaZrUuqIVPoPQ3KZS3yHBebXD/s/PNxEIeMS5Y2CGY133QR6HOWCNlLocH5Wby5fJhspwNU+b/PeNB9jgfIALR6jWq2oza7wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871711; c=relaxed/simple;
	bh=tjnHFNlDh/zGHEeDwN1i1k8ONltewKbDC8kfuiDtMvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xy18J9Ceyfgmop6YITM+PMQNcYwFP6gr2+PfWx8GLVAgpl43zxh1BEQqY+/gEM89cNZlu2BmxMGl4EUwPfJGUl7eEgw7c4HIRE0YAacufXZoaTtl71tsPH4XAfbSkHJbbqUTLCEm324Iw7YfD5oKsNqN7d5tSNP5Y/ptAgvkvR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RXE/U+lt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2804723B9;
	Mon, 30 Mar 2026 13:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774871625;
	bh=tjnHFNlDh/zGHEeDwN1i1k8ONltewKbDC8kfuiDtMvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RXE/U+ltR2Y/FaiS8XFkrRB1iFPSqMalOr4eJY/EI3bbBqspWJzQEx+JdKEuawGUn
	 KsqWQXnB5wNNqVOn4+Vzg1X2lR7kmtwM7UxMnGiGxUFkQZ8+nS7OEXzyfRP6ML589A
	 WW/Zz4ANnxrVT6ApnCU9wTQ6Ub09KABEhZCJ8yFg=
Message-ID: <35e9a646-3dbe-4dcf-acfa-01cec0dc098d@ideasonboard.com>
Date: Mon, 30 Mar 2026 12:55:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] media: rzg2l-cru: Remove the 'state' variable
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-13-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-13-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57610-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,bp.renesas.com,vger.kernel.org,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5E7135ABD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The cru driver uses a 'state' variable for debugging purpose in the
> interrupt handler. The state is used to detect invalid usage conditions
> that are not meant to happen unless the driver has a bug in handling the
> stop and start conditions.
> 
> Remove the state variable which seems to be a debugging leftover.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Just one comment near the bottom...

>   .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 15 -----
>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 74 +---------------------
>   2 files changed, 3 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index bc66b0c8c15e..56359491739e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -36,20 +36,6 @@ enum rzg2l_csi2_pads {
>   
>   struct rzg2l_cru_dev;
>   
> -/**
> - * enum rzg2l_cru_dma_state - DMA states
> - * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
> - * @RZG2L_CRU_DMA_STARTING:  Capture starting up
> - * @RZG2L_CRU_DMA_RUNNING:   Operation in progress have buffers
> - * @RZG2L_CRU_DMA_STOPPING:  Stopping operation
> - */
> -enum rzg2l_cru_dma_state {
> -	RZG2L_CRU_DMA_STOPPED = 0,
> -	RZG2L_CRU_DMA_STARTING,
> -	RZG2L_CRU_DMA_RUNNING,
> -	RZG2L_CRU_DMA_STOPPING,
> -};
> -
>   struct rzg2l_cru_csi {
>   	struct v4l2_async_connection *asd;
>   	struct v4l2_subdev *subdev;
> @@ -173,7 +159,6 @@ struct rzg2l_cru_dev {
>   	struct vb2_v4l2_buffer *queue_buf[RZG2L_CRU_HW_BUFFER_MAX];
>   	struct list_head buf_list;
>   	unsigned int sequence;
> -	enum rzg2l_cru_dma_state state;
>   
>   	struct v4l2_pix_format format;
>   };
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 45b58e2183bf..30424e2b6cc0 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -399,8 +399,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>   	if (icnms)
>   		dev_err(cru->dev, "Failed stop HW, something is seriously broken\n");
>   
> -	cru->state = RZG2L_CRU_DMA_STOPPED;
> -
>   	/* Wait until the FIFO becomes empty */
>   	for (retries = 5; retries > 0; retries--) {
>   		if (cru->info->fifo_empty(cru))
> @@ -588,8 +586,6 @@ static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
>   
>   static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
>   {
> -	cru->state = RZG2L_CRU_DMA_STOPPING;
> -
>   	rzg2l_cru_set_stream(cru, 0);
>   }
>   
> @@ -601,8 +597,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   	u32 amnmbs;
>   	int slot;
>   
> -	guard(spinlock_irqsave)(&cru->hw_lock);
> -
>   	irq_status = rzg2l_cru_read(cru, CRUnINTS);
>   	if (!irq_status)
>   		return IRQ_RETVAL(handled);
> @@ -611,20 +605,9 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   
>   	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
>   
> -	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> -	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> -		dev_dbg(cru->dev, "IRQ while state stopped\n");
> -		return IRQ_RETVAL(handled);
> -	}
> -
> -	/* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOPPING' */
> -	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> -		if (irq_status & CRUnINTS_SFS)
> -			dev_dbg(cru->dev, "IRQ while state stopping\n");
> -		return IRQ_RETVAL(handled);
> -	}
> +	/* Calculate slot and prepare for new capture. */
> +	guard(spinlock_irqsave)(&cru->hw_lock);
>   
> -	/* Prepare for capture and update state */
>   	amnmbs = rzg2l_cru_read(cru, AMnMBS);
>   	cru->active_slot = amnmbs & AMnMBS_MBSTS;
>   
> @@ -637,20 +620,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   	else
>   		slot = cru->active_slot - 1;
>   
> -	/*
> -	 * To hand buffers back in a known order to userspace start
> -	 * to capture first from slot 0.
> -	 */
> -	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> -		if (slot != 0) {
> -			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> -			return IRQ_RETVAL(handled);
> -		}
> -
> -		dev_dbg(cru->dev, "Capture start synced!\n");
> -		cru->state = RZG2L_CRU_DMA_RUNNING;
> -	}
> -
>   	/* Capture frame */
>   	if (cru->queue_buf[slot]) {
>   		cru->queue_buf[slot]->field = cru->format.field;
> @@ -678,49 +647,18 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   	u32 irq_status;
>   	int slot;
>   
> -	guard(spinlock)(&cru->hw_lock);
> -
>   	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
>   	if (!irq_status)
>   		return IRQ_NONE;
>   
> -	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> -
>   	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
>   
> -	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> -	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> -		dev_dbg(cru->dev, "IRQ while state stopped\n");
> -		return IRQ_HANDLED;
> -	}
> -
> -	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> -		if (irq_status & CRUnINTS2_FExS(0) ||
> -		    irq_status & CRUnINTS2_FExS(1) ||
> -		    irq_status & CRUnINTS2_FExS(2) ||
> -		    irq_status & CRUnINTS2_FExS(3))
> -			dev_dbg(cru->dev, "IRQ while state stopping\n");
> -		return IRQ_HANDLED;
> -	}
> -
> +	guard(spinlock)(&cru->hw_lock);
>   	slot = cru->active_slot;
>   	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
>   
>   	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
>   
> -	/*
> -	 * To hand buffers back in a known order to userspace start
> -	 * to capture first from slot 0.
> -	 */
> -	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> -		if (slot != 0) {
> -			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> -			return IRQ_HANDLED;
> -		}
> -		dev_dbg(cru->dev, "Capture start synced!\n");
> -		cru->state = RZG2L_CRU_DMA_RUNNING;
> -	}
> -
>   	/* Capture frame */
>   	if (cru->queue_buf[slot]) {
>   		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
> @@ -730,9 +668,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   		buf->vb2_buf.timestamp = ktime_get_ns();
>   		vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
>   		cru->queue_buf[slot] = NULL;
> -	} else {
> -		/* Scratch buffer was used, dropping frame. */
> -		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
>   	}

I guess this change was accidental? For the rest:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   
>   	cru->sequence++;
> @@ -789,7 +724,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>   		goto out;
>   	}
>   
> -	cru->state = RZG2L_CRU_DMA_STARTING;
>   	dev_dbg(cru->dev, "Starting to capture\n");
>   	return 0;
>   
> @@ -862,8 +796,6 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>   	spin_lock_init(&cru->hw_lock);
>   	spin_lock_init(&cru->qlock);
>   
> -	cru->state = RZG2L_CRU_DMA_STOPPED;
> -
>   	for (i = 0; i < RZG2L_CRU_HW_BUFFER_MAX; i++)
>   		cru->queue_buf[i] = NULL;
>   
> 


