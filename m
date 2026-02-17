Return-Path: <linux-media+bounces-52974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JaFKk5elGnODAIAu9opvQ
	(envelope-from <linux-media+bounces-52974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:25:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE9614BE88
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30FD230432C9
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 12:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC92339B3D;
	Tue, 17 Feb 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bup9UnAv"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0F339876;
	Tue, 17 Feb 2026 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771331115; cv=none; b=hKJRtXegEUyaXZRA7ABdT2oqyl3SleOMxwG8hhiTzRJRQ3ung4TuLtgZLV/2dTj8CUufiYH4dnuWGjgLvuztS7mMxwJYU7j+zhJF1vCjFKOBWkUyLB0hGIxuEp4yyLoxQXN24Uysicl97P9t3gM++J7jVcipFTjAJkfdg7SNsDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771331115; c=relaxed/simple;
	bh=GyWpm1OvKFeNuabdefWlpxAQ7+bEShb8BHADcv3Mbqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDLK6u+pbOHeqh2GEsAUsduGwGuC5uP9WhaApIfZdSXsBdRsBRLHnTaHQTJweJK6dXVMGloRzNUcV4fTXKHJbFsLymyCqj0KWA4RvgGvfCoqyFrg/zxevCFmR9OmrMq77VBJW/09lZp7bI64EjH1Zm+f/gNul8ELzKHnX4zft5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bup9UnAv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771331111;
	bh=GyWpm1OvKFeNuabdefWlpxAQ7+bEShb8BHADcv3Mbqc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bup9UnAvluGCNoLDUkRBGqW3M3XlqXwkAp4dnX8yIecHvFggYLlGQy4iQf9oWNOIh
	 2Dl0CukM0Hws801FPyfYIhoYuPSiuFw01rN5VCQzAE6zwFbW84Z/oz437xRo993m0K
	 ImGzRA8ZKvHZ5GpoK+vawjMsWlTfVxW9kwy4DWN0Lvn5971SgO3CT2hBYwLe8hraSI
	 k7pDSBUOuTvT0m5RRPM23KFvhfOAYLmz7Zaun2BqdqzZ0ub9a7n5IdIy/O2TA6exMe
	 4eRPHL/tI7f3AbvFVx4ZtwWd8h/QIStKx7hxNNIXAl2g/7fqn22ruZnYpIDbxCnnou
	 hEjezCpf4Y79g==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 392C617E0C21;
	Tue, 17 Feb 2026 13:25:11 +0100 (CET)
Message-ID: <23791918-8fed-404d-ad51-d97966ff58c1@collabora.com>
Date: Tue, 17 Feb 2026 13:25:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: comply with minimum number of
 buffers requirement
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
 <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52974-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 2DE9614BE88
X-Rspamd-Action: no action

Hi all,

On 2/16/26 14:49, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Each stream requires CIF_REQ_BUFS_MIN=1 buffers to enable streaming.
> However, it failed with only one buffer provided.
> 
> Comply with the minimum number of buffers requirement and accept
> exactly one buffer.
> 
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> Cc: stable@kernel.org
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++-----------
>  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index e00010a91e8b..5a5ab9e7e86e 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -106,19 +106,6 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
>  {
>  	struct v4l2_pix_format_mplane *pix = &stream->pix;
>  
> -	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> -	if (!stream->buffers[0])
> -		goto err_buff_0;
> -
> -	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> -	if (!stream->buffers[1])
> -		goto err_buff_1;
> -
> -	if (stream->queue_buffer) {
> -		stream->queue_buffer(stream, 0);
> -		stream->queue_buffer(stream, 1);
> -	}
> -
>  	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
>  	stream->dummy.vaddr =
>  		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
> @@ -132,16 +119,30 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
>  			stream->dummy.buffer.buff_addr[i - 1] +
>  			pix->plane_fmt[i - 1].bytesperline * pix->height;
>  
> -	return 0;
> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[0])
> +		goto err_buff_0;
>  
> -err_dummy:
> -	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
> -	stream->buffers[1] = NULL;
> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
> +	if (!stream->buffers[1]) {
> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
> +		stream->buffers[stream->frame_phase]->is_dummy = true;

Apparently I was too quick on the trigger here. This should read
"stream->buffers[1]" in both lines *facepalm*. Will wait for other
responses and send a v2.

Best regards,
Michael

> +	}
> +
> +	if (stream->queue_buffer) {
> +		stream->queue_buffer(stream, 0);
> +		stream->queue_buffer(stream, 1);
> +	}
> +
> +	return 0;
>  
> -err_buff_1:
> -	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
> -	stream->buffers[0] = NULL;
>  err_buff_0:
> +	dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
> +		       stream->dummy.vaddr,
> +		       stream->dummy.buffer.buff_addr[0],
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> +	stream->dummy.vaddr = NULL;
> +err_dummy:
>  	return -EINVAL;
>  }
>  
> 


