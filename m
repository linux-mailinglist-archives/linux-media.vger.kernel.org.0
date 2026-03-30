Return-Path: <linux-media+bounces-57603-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLcdEANeymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57603-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:26:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9150F35A3AF
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEE4D30916B0
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25B33BE163;
	Mon, 30 Mar 2026 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B1BQ7hEv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B93C1415;
	Mon, 30 Mar 2026 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869547; cv=none; b=T2JgQB2uS3RqN2lyrmZN72wfdAx3g+nfOQZ0Kwn1guQFdhfOoWXB2h2e/Gb1c+lkEQ5Jpuw1FVibjImwrAfd5fFFbDEME3kx0SnDzCNlo/eYnqKLMt6DIbHGrW8ZWEjilsxVYRpr6OklLBy9hqKxrn0H/0XH/0NQl3ch9npG5jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869547; c=relaxed/simple;
	bh=BMxF8k7WDOdY4GNs+BCsDPiah3NbnYje0B6b8TATQ48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uyh6KvrenksqA8vLrugvJYazlzc+1CdBMbzXbjPJcpaO/fLrc9CpxUruKukR0lqe35W3Fwoeh7FlXwB4KsPhNPP0iJ/SCZbvEyMvcUArr8YNyEl/OGINIOV98hmpZUd5fTLxv8heVcWvP6x+nTpakUqYGUU9Kw3k1PkPQ6McR5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B1BQ7hEv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CCC923B9;
	Mon, 30 Mar 2026 13:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774869461;
	bh=BMxF8k7WDOdY4GNs+BCsDPiah3NbnYje0B6b8TATQ48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B1BQ7hEv6R4rW8exrDVEtkw1okq26osW/JA3YOnW5sp6BFM9GN1WulWlluuCq0aIg
	 7gQhxGod99KBsMpnjA3PYB1ZfPDmbzl4m6V8ooriCnzlADHGdEmn6nIi0n74Gr8THF
	 3myrhCY2DF8cFc3P+uTPK4ysGMqPQThxXmR9R9lk=
Message-ID: <aebf7c60-c478-4952-83ef-d7e9cf98cd1d@ideasonboard.com>
Date: Mon, 30 Mar 2026 12:19:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] media: rzg2l-cru: Split hw locking from buffers
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
 <20260327-b4-cru-rework-v1-9-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-9-3b7d0430f538@ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-57603-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9150F35A3AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Split the locking between a spinlock dedicated to protect the hardware
> slots programming (hw_lock) and one lock (qlock) to protect the queue of
> buffers submitted by userspace.
> 
> Do not rework the locking strategy yet but start simply by splitting the
> locking in two.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>   .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 32 +++++++++++++---------
>   1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a79b17e146bf..9406a089ec9f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -112,19 +112,21 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>   	struct rzg2l_cru_buffer *buf, *node;
>   	unsigned int i;
>   
> -	guard(spinlock_irq)(&cru->qlock);
> -
> -	for (i = 0; i < cru->num_buf; i++) {
> -		if (cru->queue_buf[i]) {
> -			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> -					state);
> -			cru->queue_buf[i] = NULL;
> +	scoped_guard(spinlock_irq, &cru->hw_lock) {
> +		for (i = 0; i < cru->num_buf; i++) {
> +			if (cru->queue_buf[i]) {
> +				vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
> +						state);
> +				cru->queue_buf[i] = NULL;
> +			}
>   		}
>   	}
>   
> -	list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
> -		vb2_buffer_done(&buf->vb.vb2_buf, state);
> -		list_del(&buf->list);
> +	scoped_guard(spinlock_irq, &cru->qlock) {
> +		list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
> +			vb2_buffer_done(&buf->vb.vb2_buf, state);
> +			list_del(&buf->list);
> +		}
>   	}
>   }
>   
> @@ -198,12 +200,16 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
>   	struct rzg2l_cru_buffer *buf;
>   	dma_addr_t phys_addr;
>   
> +	lockdep_assert_held(&cru->hw_lock);

I think this condition mightn't be true at the point of this commit; as far as I can see this 
function is called without hw_lock being held in rzg2l_cru_initialize_axi() until patch 12.

> +
>   	/* A already populated slot shall never be overwritten. */
>   	if (WARN_ON(cru->queue_buf[slot]))
>   		return;
>   
>   	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
>   
> +	guard(spinlock)(&cru->qlock);
> +
>   	if (list_empty(&cru->buf_list)) {
>   		cru->queue_buf[slot] = NULL;
>   		phys_addr = cru->scratch_phys;
> @@ -342,7 +348,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>   	unsigned int retries = 0;
>   	u32 icnms;
>   
> -	scoped_guard(spinlock_irq, &cru->qlock) {
> +	scoped_guard(spinlock_irq, &cru->hw_lock) {
>   		/* Disable and clear the interrupt */
>   		cru->info->disable_interrupts(cru);
>   	}
> @@ -560,7 +566,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   	u32 amnmbs;
>   	int slot;
>   
> -	guard(spinlock_irqsave)(&cru->qlock);
> +	guard(spinlock_irqsave)(&cru->hw_lock);
>   
>   	irq_status = rzg2l_cru_read(cru, CRUnINTS);
>   	if (!irq_status)
> @@ -662,7 +668,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   	u32 irq_status;
>   	int slot;
>   
> -	guard(spinlock)(&cru->qlock);
> +	guard(spinlock)(&cru->hw_lock);
>   
>   	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
>   	if (!irq_status)
> 


