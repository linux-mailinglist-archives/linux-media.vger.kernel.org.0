Return-Path: <linux-media+bounces-57542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNfCKdYnymnX5gUAu9opvQ
	(envelope-from <linux-media+bounces-57542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:35:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E188D3567F1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 645AD301D6A3
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CAF539EF24;
	Mon, 30 Mar 2026 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uvsilpPG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ADE175A96;
	Mon, 30 Mar 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855828; cv=none; b=n8Xgcs3Zppo+DjSLN5xGgiKVAhIIVs5tosB44al4Zr00eUIcXPqy87syxwLQgF0x14zwnmnaUFQfwMLX0S0tVaPwpR4jsbdHrGLERUEEWW4pY1wGWMVkbc6iKXC36DbQFmWsL3kKUBxdnAIn9o7nL7p0y5U/XMHJDcd6cSPp+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855828; c=relaxed/simple;
	bh=qsC4dWrtSWxzwrvwvrROM2SL+2nFBTQ7l+hPcR8W2D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmohGXAjGerRFO8u6+wsWIH0ZnlcN9k5AuiQn2a4+VbCqCR9sY0N0ssYzAiadgG/2KK3Y7YK0/g/l7MYND3NZKJrqFBCpEvzz1N59tI6B+LjAhGUICZrX1msjWr+HTcgFV3TdySlCR1z/FuAgUoN6/tBT1zxpHDuyo9uCml7+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uvsilpPG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A936B20FF;
	Mon, 30 Mar 2026 09:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774855735;
	bh=qsC4dWrtSWxzwrvwvrROM2SL+2nFBTQ7l+hPcR8W2D8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uvsilpPGJUlp94DOEP0olm9FwEdT7qV+HEtyRl4nbG39GYh+uLPSimrBei4CeSYPb
	 HwI7epRFnQ+1xgSnrVDUZDSLFtRAw5jSQK2SU7xDSZ881cksI726VDcmh3/+khqcRO
	 mFj9vK5bKAY7joa28eV9WE5DK9gn3+xnuKjkBYxs=
Message-ID: <a0fb0bbe-b4ac-4a4a-bb5a-7e35035cbedf@ideasonboard.com>
Date: Mon, 30 Mar 2026 08:30:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] media: rzg2l-cru: Modernize spin_lock usage with
 cleanup.h
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
 <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-3-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57542-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: E188D3567F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Morning Jacopo - thanks for the set

On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Use more modern constructs from cleanup.h to express the locking
> sequences in the rzg2l driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Looks good to me:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32 +++++++---------------
>   1 file changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 98b6afbc708d..2d7ac9f37291 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -11,6 +11,7 @@
>    * Copyright (C) 2008 Magnus Damm
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/pm_runtime.h>
> @@ -110,10 +111,10 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>   				  enum vb2_buffer_state state)
>   {
>   	struct rzg2l_cru_buffer *buf, *node;
> -	unsigned long flags;
>   	unsigned int i;
>   
> -	spin_lock_irqsave(&cru->qlock, flags);
> +	guard(spinlock_irqsave)(&cru->qlock);
> +
>   	for (i = 0; i < cru->num_buf; i++) {
>   		if (cru->queue_buf[i]) {
>   			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> @@ -126,7 +127,6 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>   		vb2_buffer_done(&buf->vb.vb2_buf, state);
>   		list_del(&buf->list);
>   	}
> -	spin_unlock_irqrestore(&cru->qlock, flags);
>   }
>   
>   static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> @@ -165,13 +165,9 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
>   {
>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>   	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&cru->qlock, flags);
>   
> +	guard(spinlock_irqsave)(&cru->qlock);
>   	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
> -
> -	spin_unlock_irqrestore(&cru->qlock, flags);
>   }
>   
>   static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> @@ -465,7 +461,6 @@ void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
>   int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>   {
>   	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
> -	unsigned long flags;
>   	u8 csi_vc;
>   	int ret;
>   
> @@ -475,7 +470,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>   	csi_vc = ret;
>   	cru->svc_channel = csi_vc;
>   
> -	spin_lock_irqsave(&cru->qlock, flags);
> +	guard(spinlock_irqsave)(&cru->qlock);
>   
>   	/* Select a video input */
>   	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
> @@ -492,7 +487,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>   	/* Initialize image convert */
>   	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
>   	if (ret) {
> -		spin_unlock_irqrestore(&cru->qlock, flags);
>   		return ret;
>   	}
>   
> @@ -502,8 +496,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>   	/* Enable image processing reception */
>   	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
>   
> -	spin_unlock_irqrestore(&cru->qlock, flags);
> -
>   	return 0;
>   }
>   
> @@ -573,16 +565,15 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   {
>   	struct rzg2l_cru_dev *cru = data;
>   	unsigned int handled = 0;
> -	unsigned long flags;
>   	u32 irq_status;
>   	u32 amnmbs;
>   	int slot;
>   
> -	spin_lock_irqsave(&cru->qlock, flags);
> +	guard(spinlock_irqsave)(&cru->qlock);
>   
>   	irq_status = rzg2l_cru_read(cru, CRUnINTS);
>   	if (!irq_status)
> -		goto done;
> +		return IRQ_RETVAL(handled);
>   
>   	handled = 1;
>   
> @@ -591,14 +582,14 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
>   	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
>   		dev_dbg(cru->dev, "IRQ while state stopped\n");
> -		goto done;
> +		return IRQ_RETVAL(handled);
>   	}
>   
>   	/* Increase stop retries if capture status is 'RZG2L_CRU_DMA_STOPPING' */
>   	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
>   		if (irq_status & CRUnINTS_SFS)
>   			dev_dbg(cru->dev, "IRQ while state stopping\n");
> -		goto done;
> +		return IRQ_RETVAL(handled);
>   	}
>   
>   	/* Prepare for capture and update state */
> @@ -621,7 +612,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   	if (cru->state == RZG2L_CRU_DMA_STARTING) {
>   		if (slot != 0) {
>   			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> -			goto done;
> +			return IRQ_RETVAL(handled);
>   		}
>   
>   		dev_dbg(cru->dev, "Capture start synced!\n");
> @@ -646,9 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   	/* Prepare for next frame */
>   	rzg2l_cru_fill_hw_slot(cru, slot);
>   
> -done:
> -	spin_unlock_irqrestore(&cru->qlock, flags);
> -
>   	return IRQ_RETVAL(handled);
>   }
>   
> 


