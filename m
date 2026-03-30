Return-Path: <linux-media+bounces-57625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCMTJPOBymkW9gUAu9opvQ
	(envelope-from <linux-media+bounces-57625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:00:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F435C78C
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6757305F652
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA96D3A16A6;
	Mon, 30 Mar 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jnzCYuJ6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C253A3E71;
	Mon, 30 Mar 2026 13:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878760; cv=none; b=Z+QZ34IO1NtEC6zKN6RtCPFMcDQuGwg8stKPEbWTzKRgIDvQZntwP4Qqu6jXX0shDtTRHAgsi9qliAQ2onLycFsKX0Avv2RXQ2zh/VsGuf61/Tvu/QMi+TXc1JBwaO2SPRBssZowkhAF3Lc9avur7lr2ukRfn9L6wyGw/FEdskY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878760; c=relaxed/simple;
	bh=KGJwUb5Ky9+r+pq/Mx30mCqEWIkAGdiVSTVbXQL79X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bW6yyOpkc/biCLqdgqlqFF+ATs+Df3XhSeWvJ2wU0htMizBarWl/6ecUUPeKuk8YCtOg1ib4ztMAMXpBgXwiVIzJxV4z1z7PuloK4oUEuRlCI6Os5gCVn3sSd+Nzlv57Z/NqEoqhvwazD32ojx/b/EQkbWs8KhulE22499AOVps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jnzCYuJ6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC43523B9;
	Mon, 30 Mar 2026 15:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774878667;
	bh=KGJwUb5Ky9+r+pq/Mx30mCqEWIkAGdiVSTVbXQL79X4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jnzCYuJ6epim4gUn5Lg4r5j9NSri1kUGN08HFQeGSbax3DqCwSYfNxC8CPbxNwk/B
	 M1INTjfAOrvinl/0ezUe748Kud7l43j7hJ0xE3u4/FTl1kBGvePKzVbv8JDJk+qSl/
	 Wiiu4iaUQ+WosvoGfSSFBP2I7Qit4BcIOIKgb8i8=
Message-ID: <4cef8a9f-37ad-4b2e-9662-f6693e83452e@ideasonboard.com>
Date: Mon, 30 Mar 2026 14:52:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] media: rz2gl-cru: Return pending buffers in order
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
 <20260327-b4-cru-rework-v1-11-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-11-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57625-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: E46F435C78C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Buffers are programmed into slots in queueing order.
> 
> When returning pending buffers we can't simply start from the first slot
> but we should actually iterate slots starting from the one is use. The
> rzg3e_cru_irq() handler already uses 'active_slot', make rzg2l_cru_irq()
> use it as well to know where to start iterating from.
> 
> As the pattern of iterating over slots in order will be used for slots
> programming in the next patches, provide an helper macro to do that.
> 
> While at it, rename return_unused_buffers() to rzg2l_cru_return_buffers().
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 68 +++++++++++++++-------
>   1 file changed, 47 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 17e0153052e1..a6b606c63f90 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -43,6 +43,24 @@ struct rzg2l_cru_buffer {
>   #define to_buf_list(vb2_buffer) \
>   	(&container_of(vb2_buffer, struct rzg2l_cru_buffer, vb)->list)
>   
> +/*
> + * The CRU hardware cycles over its slots when transferring frames. All drivers
> + * structure that contains programming data for the slots, such as the memory
> + * destination addresses have to be iterated as they were circular buffers.
> + *
> + * Provide here utilities to iterate over slots and the associated data.
> + */
> +static inline unsigned int rzg2l_cru_slot_next(struct rzg2l_cru_dev *cru,
> +					       unsigned int slot)
> +{
> +	return (slot + 1) % cru->num_buf;
> +}
> +
> +/* Start cycling on cru slots from the one after 'start'. */
> +#define for_each_cru_slot_from(cru, slot, start)			\
> +	for (slot = rzg2l_cru_slot_next(cru, start);			\
> +	     slot != start; slot = rzg2l_cru_slot_next(cru, slot))
> +
>   /* -----------------------------------------------------------------------------
>    * DMA operations
>    */
> @@ -106,28 +124,36 @@ __rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
>   	 __rzg2l_cru_read_constant(cru, offset) : \
>   	 __rzg2l_cru_read(cru, offset))
>   
> -static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> -				  enum vb2_buffer_state state)
> +static void rzg2l_cru_return_buffers(struct rzg2l_cru_dev *cru,
> +				     enum vb2_buffer_state state)

yay for the name correction! Also looks good to me. Thanks for the set:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   {
>   	struct rzg2l_cru_buffer *buf, *node;
> -	unsigned int i;
>   
>   	scoped_guard(spinlock_irq, &cru->hw_lock) {
> -		for (i = 0; i < cru->num_buf; i++) {
> -			if (cru->queue_buf[i]) {
> -				vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> -						state);
> -				cru->queue_buf[i] = NULL;
> -			}
> +		/* Return the buffer in progress first, if not completed yet. */
> +		unsigned int slot = cru->active_slot;
> +
> +		if (cru->queue_buf[slot]) {
> +			vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf, state);
> +			cru->queue_buf[slot] = NULL;
>   		}
> -	}
>   
> -	scoped_guard(spinlock_irq, &cru->qlock) {
> -		list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
> -			vb2_buffer_done(&buf->vb.vb2_buf, state);
> -			list_del(&buf->list);
> +		/* Return all the pending buffers after the active one. */
> +		for_each_cru_slot_from(cru, slot, cru->active_slot) {
> +			if (!cru->queue_buf[slot])
> +				continue;
> +
> +			vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf, state);
> +			cru->queue_buf[slot] = NULL;
>   		}
>   	}
> +
> +	guard(spinlock_irq)(&cru->qlock);
> +
> +	list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> +		list_del(&buf->list);
> +	}
>   }
>   
>   static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> @@ -591,16 +617,16 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   
>   	/* Prepare for capture and update state */
>   	amnmbs = rzg2l_cru_read(cru, AMnMBS);
> -	slot = amnmbs & AMnMBS_MBSTS;
> +	cru->active_slot = amnmbs & AMnMBS_MBSTS;
>   
>   	/*
>   	 * AMnMBS.MBSTS indicates the destination of Memory Bank (MB).
>   	 * Recalculate to get the current transfer complete MB.
>   	 */
> -	if (slot == 0)
> +	if (cru->active_slot == 0)
>   		slot = cru->num_buf - 1;
>   	else
> -		slot--;
> +		slot = cru->active_slot - 1;
>   
>   	/*
>   	 * To hand buffers back in a known order to userspace start
> @@ -669,7 +695,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   	}
>   
>   	slot = cru->active_slot;
> -	cru->active_slot = (cru->active_slot + 1) % cru->num_buf;
> +	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
>   
>   	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
>   	cru->buf_addr[slot] = 0;
> @@ -743,7 +769,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>   	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>   					  &cru->scratch_phys, GFP_KERNEL);
>   	if (!cru->scratch) {
> -		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
> +		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
>   		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
>   		ret = -ENOMEM;
>   		goto assert_presetn;
> @@ -751,7 +777,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>   
>   	ret = rzg2l_cru_set_stream(cru, 1);
>   	if (ret) {
> -		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
> +		rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_QUEUED);
>   		goto out;
>   	}
>   
> @@ -788,7 +814,7 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
>   	dma_free_coherent(cru->dev, cru->format.sizeimage,
>   			  cru->scratch, cru->scratch_phys);
>   
> -	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
> +	rzg2l_cru_return_buffers(cru, VB2_BUF_STATE_ERROR);
>   
>   	reset_control_assert(cru->presetn);
>   	clk_disable_unprepare(cru->vclk);
> 


