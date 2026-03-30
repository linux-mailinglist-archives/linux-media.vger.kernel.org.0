Return-Path: <linux-media+bounces-57622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNunIhSAymnX9QUAu9opvQ
	(envelope-from <linux-media+bounces-57622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:52:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8766035C5B4
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9873230A6CD8
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22FC17A2EA;
	Mon, 30 Mar 2026 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y6IMS83D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4041DF748;
	Mon, 30 Mar 2026 13:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877955; cv=none; b=MKxJV/LZc2ev/9s68g4iVEVm1cMVFiEg3MsW3c1/95YsgjbNdIJyQQ2MVdhPYKChx3/I5Jf8u0C4oCeg2YP4L+8vu53L0/koIPwasCRbvF/yNQe173FbGdNorl7GndcmVWfwEohjRWgcIX5ax401FJxBgbDNSNmBiiIIxlrbddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877955; c=relaxed/simple;
	bh=ZIUBP4+9JpoIhvmXRzIjGRtiBPgFJH6aTDVmGwr9QCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5DUnA4FmkhKyYcdNlyQS60iFsXwNzrZh4KE6I6cfKzAE91MmjpArSPCadqFyZxTFm4nK3822AP2U9T9a9cj6IIhvOJDL9VGNCWlQ125M6XyOLSUtFds1HHB8Bd0iYNHiFyLCERNfdAu1SlpPSBeqy2cqmhYSlKaw+GtuwawO+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y6IMS83D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 369EB23B9;
	Mon, 30 Mar 2026 15:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774877869;
	bh=ZIUBP4+9JpoIhvmXRzIjGRtiBPgFJH6aTDVmGwr9QCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y6IMS83Dyn5Uld1pFiXFn8SfIs1bV5g2d9ZBDU2vuK1mJTuhk/2tBIEJhTdzitWZF
	 0kd4DD/hQ3dcW/Kgcjwfxp0p8CJE8Dw+rtsqYL5beMgzxED9D6Nizj+zTHghU763bA
	 z6+iwwk3oKvtEnedZYvdFtVTWtp9bHAavbqYL2wI=
Message-ID: <0de0d822-b760-43a9-8682-1687280667a1@ideasonboard.com>
Date: Mon, 30 Mar 2026 14:39:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] media: rzg2l-cru: Manually track active slot number
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
 <20260327-b4-cru-rework-v1-10-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-10-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57622-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 8766035C5B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo, thanks for the patch

On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The CRU cycles over the hardware slots where the destination address for
> the next frame has to be programmed.
> 
> The RZ/G2L version of the IP has a register that tells which is the
> last used slot by the hardware but, unfortunately, such register is not
> available on RZ/G3E and RZ/V2H(P).
> 
> The driver currently compares the value of the AMnMADRSL/H register
> which report "the memory address which the current video data was
> written to" and compares it with the address programmed in the slots.
> 
> This heuristic requires a bit of book keeping and proper locking. As the
> driver handles the FrameEnd interrupt, it's way easier to keep track
> of the slot that has been used by ourselves with a driver variable.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  7 +++--
>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 35 ++++------------------
>   2 files changed, 10 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index b46696a0012b..bc66b0c8c15e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -108,6 +108,7 @@ struct rzg2l_cru_info {
>    * @vdev:		V4L2 video device associated with CRU
>    * @v4l2_dev:		V4L2 device
>    * @num_buf:		Holds the current number of buffers enabled
> + *
>    * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
>    * @notifier:		V4L2 asynchronous subdevs notifier
>    *
> @@ -117,9 +118,10 @@ struct rzg2l_cru_info {
>    * @mdev_lock:		protects the count, notifier and csi members
>    * @pad:		media pad for the video device entity
>    *
> - * @hw_lock:		protects the slot counter, hardware programming of
> - *			slot addresses and the @buf_addr[] list
> + * @hw_lock:		protects the @active_slot counter, hardware programming
> + *			of slot addresses and the @buf_addr[] list
>    * @buf_addr:		Memory addresses where current video data is written
> + * @active_slot:	The slot in use
>    *
>    * @lock:		protects @queue
>    * @queue:		vb2 buffers queue
> @@ -160,6 +162,7 @@ struct rzg2l_cru_dev {
>   
>   	spinlock_t hw_lock;
>   	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> +	unsigned int active_slot;
>   
>   	struct mutex lock;
>   	struct vb2_queue queue;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 9406a089ec9f..17e0153052e1 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -637,31 +637,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   	return IRQ_RETVAL(handled);
>   }
>   
> -static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
> -{
> -	u64 amnmadrs;
> -	int slot;
> -
> -	/*
> -	 * When AMnMADRSL is read, AMnMADRSH of the higher-order
> -	 * address also latches the address.
> -	 *
> -	 * AMnMADRSH must be read after AMnMADRSL has been read.
> -	 */
> -	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
> -	amnmadrs |= (u64)rzg2l_cru_read(cru, AMnMADRSH) << 32;
> -
> -	/* Ensure amnmadrs is within this buffer range */
> -	for (slot = 0; slot < cru->num_buf; slot++) {
> -		if (amnmadrs >= cru->buf_addr[slot] &&
> -		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
> -			return slot;
> -	}
> -
> -	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
> -	return -EINVAL;
> -}
> -
>   irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   {
>   	struct rzg2l_cru_dev *cru = data;
> @@ -693,9 +668,8 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   		return IRQ_HANDLED;
>   	}
>   
> -	slot = rzg3e_cru_get_current_slot(cru);
> -	if (slot < 0)
> -		return IRQ_HANDLED;
> +	slot = cru->active_slot;
> +	cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
>   
>   	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
>   	cru->buf_addr[slot] = 0;
> @@ -762,6 +736,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>   		goto assert_aresetn;
>   	}
>   
> +	cru->active_slot = 0;
> +	cru->sequence = 0;
> +
>   	/* Allocate scratch buffer */
>   	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>   					  &cru->scratch_phys, GFP_KERNEL);
> @@ -772,8 +749,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>   		goto assert_presetn;
>   	}
>   
> -	cru->sequence = 0;
> -
>   	ret = rzg2l_cru_set_stream(cru, 1);
>   	if (ret) {
>   		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
> 


