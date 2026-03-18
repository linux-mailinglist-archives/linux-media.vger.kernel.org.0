Return-Path: <linux-media+bounces-56181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACPGIApiumnFUgIAu9opvQ
	(envelope-from <linux-media+bounces-56181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:27:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA8E2B7EF6
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AB733107F21
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC8E37B02C;
	Wed, 18 Mar 2026 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rY8+Fq+m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585EA37AA97;
	Wed, 18 Mar 2026 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821893; cv=none; b=b+zIk++qIS5MutiOFg2yhuBv2UcCMZs/1/Ad5UwF0zCxEnkN8Ucda6/rLlBOOSDjAh7ETo+V3JxtILVq0V5kUIHwggNuaBtrS0DRoYg12R2FuZai8fUKMkOLE2IHO6RmWG3yrXGnmdyv85GYZK1pFzV0y3lxqc+qYACMjAoVJQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821893; c=relaxed/simple;
	bh=wFbDTEvR7olB1fWLkOBoDY4V+b8vzKWvYlVrfuh1TQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iu/cycCYFRwU+xghfcYT6hIm5JEy10fa2lzHFcFR/Zd+V331ol6U5Y0cQgaqzC7oibGjHR+Xes4Yn+FXDPJ2Psx7UXNqKetAqsEFcF7bo9nFMxU0XYE/caiVaSeFnYQhqUBLIYI0D20Vz7bt8X1oKFeQrezywNrcLPPWs7WBpDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rY8+Fq+m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.33.40] (185.182.214.153.nat.pool.zt.hu [185.182.214.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 703B6379;
	Wed, 18 Mar 2026 09:16:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773821816;
	bh=wFbDTEvR7olB1fWLkOBoDY4V+b8vzKWvYlVrfuh1TQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rY8+Fq+maQOcG232S0Bm8lqr4HAUCl0I6PXWBHoTnPp9pKuQzrjXiFnDdqA3HqqSZ
	 0AW3qpYQz3KhnXGH8iRH+gT0jxOlvjUzpWTHNoRi55PWeDrKA6d14wBazLMW3uBXOZ
	 UIJy7sK35CX/WrqOImTajmeghrVn9qcYEWjm6Mzs=
Message-ID: <659d6c70-41d7-4dcf-867f-183d85118c4c@ideasonboard.com>
Date: Wed, 18 Mar 2026 09:18:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: rzv2h-ivc: Avoid double job scheduling
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, stable@vger.kernel.org
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
 <20260313-mali-ivc-fixes-v7-0-v1-6-cb0714cd1279@ideasonboard.com>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-6-cb0714cd1279@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.45 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56181-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.pocze@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,buffers.work:url]
X-Rspamd-Queue-Id: DBA8E2B7EF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

2026. 03. 13. 12:14 keltezéssel, Jacopo Mondi írta:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The scheduling of a new buffer transfer in the IVC driver is triggered
> by two occurrences of the "frame completed" interrupt.
> 
> The first interrupt occurrence identifies when all image data have been
> transferred to the ISP, the second occurrence identifies when the
> post-transfer VBLANK has completed and a new buffer can be transferred.
> 
> Under heavy system load conditions the actual execution of the workqueue
> item might be delayed and two items might happen to run concurrently,
> leading to a new frame transfer being triggered while the previous one
> has not yet finished.
> 
> This error condition is only visible because the driver maintains a
> status variable that counts the number of interrupts since the last
> transfer, and warns in case an IRQ happens before the counter has been
> reset.
> 
> To ensure sequential execution of the worqueue items and avoid a double
> buffer transfer to run concurrently, protect the whole function body
> with the spinlock that so far was solely used to reset the counter and
> inspect the interrupt counter variable at the beginning of the buffer
> transfer function.
> and return
> 
> As soon as the ongoing transfer completes, the workqueue item will be
> re-scheduled and will consume the pending buffer.
> 
> Cc: stable@vger.kernel.org
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Looks ok to me.

Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>


>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index a22aee0fe1cf..3580a57738a6 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -149,6 +149,11 @@ static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
>   					     buffers.work);
>   	struct rzv2h_ivc_buf *buf;
>   
> +	guard(spinlock_irqsave)(&ivc->spinlock);
> +
> +	if (ivc->vvalid_ifp)
> +		return;
> +
>   	/* Setup buffers */
>   	scoped_guard(spinlock_irqsave, &ivc->buffers.lock) {
>   		buf = list_first_entry_or_null(&ivc->buffers.queue,
> @@ -163,9 +168,7 @@ static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
>   	buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>   	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_SADDL_P0, buf->addr);
>   
> -	scoped_guard(spinlock_irqsave, &ivc->spinlock) {
> -		ivc->vvalid_ifp = 2;
> -	}
> +	ivc->vvalid_ifp = 2;
>   	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_FRCON, 0x1);
>   }
>   
> @@ -200,7 +203,7 @@ static void rzv2h_ivc_buf_queue(struct vb2_buffer *vb)
>   	}
>   
>   	scoped_guard(spinlock_irq, &ivc->spinlock) {
> -		if (vb2_is_streaming(vb->vb2_queue) && !ivc->vvalid_ifp)
> +		if (vb2_is_streaming(vb->vb2_queue))
>   			queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
>   	}
>   }
> 


