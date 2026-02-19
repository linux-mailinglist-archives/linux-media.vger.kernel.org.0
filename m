Return-Path: <linux-media+bounces-53105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONTQGDA4l2l2vwIAu9opvQ
	(envelope-from <linux-media+bounces-53105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 17:20:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C35160960
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 17:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A559300DEC6
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 16:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E3934BA2E;
	Thu, 19 Feb 2026 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ivdDN6lX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D39345CD9;
	Thu, 19 Feb 2026 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771517997; cv=none; b=DQW4vioFyoq9oVLrWRlfZFLvmDBI559Yk85QnzXysXX4Uifk6aetmD3U+Qu5I2fhFirYYztlLelb40jhKSyY0Xxg/6tlvt6VvoQYGnDlZNujzTXT1+J/i6QD/pL6hFfVIQxhJGeb286kXav15TRvOFgg3hWY1T0AQq1xkJCX+R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771517997; c=relaxed/simple;
	bh=kzoF1Sqejd9zm0QrGdiWY9BZ2fRayBCXMiqLyljXYf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyLI0oORkSzMmiLdSiYytqklBBALL7r1YE2Cu/f2g9jRM0jR3Cr1V+1SDh6tzXn8L5jCcEM618ghY7QHKYCwtKnf10KguxeIiDoBP+KLRMMmOcfsi7pQTw6rExVIUaIuaSywbvU2JsitcsIuT5LIAPIwUWFyf8Z9G580cgWR+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ivdDN6lX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771517988;
	bh=kzoF1Sqejd9zm0QrGdiWY9BZ2fRayBCXMiqLyljXYf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ivdDN6lXI5+8KO+M99OJHAg3uoRp42TeaXM0Zk/FQWS88eFNOkikiBAkikq0C7fu/
	 EhJei0NVFdpLlxEyUueq43Ya/n8QHz70Dzbq02Dmc9UNWhlq9E9G8BF5lxyVYJK4yS
	 EDeqGrFhTtql2XqTYIxh/AL6Zl3RRH4KnBNsmdw0nAoX/z/g3xRR5ZzYcKxmYZEP9n
	 FAjzWhkAaeWYEPWkQ15uISMinbQ5qEgpCLLIhP9/UXD8aHaOH8gi3TJEhvous/GwbE
	 u/9Kxqang4wdDydjvm0rZn/19ADOzr5owlxoqKBM580xevXv++N31EvQX6JPLNCHqY
	 jize3nbd2kOtQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B1D9017E01B1;
	Thu, 19 Feb 2026 17:19:47 +0100 (CET)
Message-ID: <d701a97d-6051-4a32-ada6-bf014e385c68@collabora.com>
Date: Thu, 19 Feb 2026 17:19:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: comply with minimum number of
 buffers requirement
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
 <20260216-rkcif-fixes-v1-2-b16db20b6d68@collabora.com>
 <20260219091301.GF520738@killaraus.ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260219091301.GF520738@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53105-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 08C35160960
X-Rspamd-Action: no action

Hi Laurent,

On 2/19/26 10:13, Laurent Pinchart wrote:
> On Mon, Feb 16, 2026 at 02:49:57PM +0100, Michael Riesch via B4 Relay wrote:
>> From: Michael Riesch <michael.riesch@collabora.com>
>>
>> Each stream requires CIF_REQ_BUFS_MIN=1 buffers to enable streaming.
>> However, it failed with only one buffer provided.
>>
>> Comply with the minimum number of buffers requirement and accept
>> exactly one buffer.
>>
>> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
>> Cc: stable@kernel.org
>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>> ---
>>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++-----------
>>  1 file changed, 21 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> index e00010a91e8b..5a5ab9e7e86e 100644
>> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
>> @@ -106,19 +106,6 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
>>  {
>>  	struct v4l2_pix_format_mplane *pix = &stream->pix;
>>  
>> -	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
>> -	if (!stream->buffers[0])
>> -		goto err_buff_0;
>> -
>> -	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
>> -	if (!stream->buffers[1])
>> -		goto err_buff_1;
>> -
>> -	if (stream->queue_buffer) {
>> -		stream->queue_buffer(stream, 0);
>> -		stream->queue_buffer(stream, 1);
>> -	}
>> -
>>  	stream->dummy.size = pix->num_planes * pix->plane_fmt[0].sizeimage;
>>  	stream->dummy.vaddr =
>>  		dma_alloc_attrs(stream->rkcif->dev, stream->dummy.size,
>> @@ -132,16 +119,30 @@ static int rkcif_stream_init_buffers(struct rkcif_stream *stream)
>>  			stream->dummy.buffer.buff_addr[i - 1] +
>>  			pix->plane_fmt[i - 1].bytesperline * pix->height;
>>  
>> -	return 0;
>> +	stream->buffers[0] = rkcif_stream_pop_buffer(stream);
>> +	if (!stream->buffers[0])
>> +		goto err_buff_0;
> 
> Why do you move this after allocation of the dummy buffer, to then add
> dma_free_attrs() in the err_buff_0 error path ?

To keep the two rkcif_stream_pop_buffer calls together. We need to
allocate the dummy in any case, but in case the second pop fails we use
it -- this was not the case before.

> 
>>  
>> -err_dummy:
>> -	rkcif_stream_return_buffer(stream->buffers[1], VB2_BUF_STATE_QUEUED);
>> -	stream->buffers[1] = NULL;
>> +	stream->buffers[1] = rkcif_stream_pop_buffer(stream);
>> +	if (!stream->buffers[1]) {
>> +		stream->buffers[stream->frame_phase] = &stream->dummy.buffer;
>> +		stream->buffers[stream->frame_phase]->is_dummy = true;
>> +	}
>> +
>> +	if (stream->queue_buffer) {
>> +		stream->queue_buffer(stream, 0);
>> +		stream->queue_buffer(stream, 1);
>> +	}
>> +
>> +	return 0;
>>  
>> -err_buff_1:
>> -	rkcif_stream_return_buffer(stream->buffers[0], VB2_BUF_STATE_QUEUED);
>> -	stream->buffers[0] = NULL;
>>  err_buff_0:
>> +	dma_free_attrs(stream->rkcif->dev, stream->dummy.size,
>> +		       stream->dummy.vaddr,
>> +		       stream->dummy.buffer.buff_addr[0],
>> +		       DMA_ATTR_NO_KERNEL_MAPPING);
>> +	stream->dummy.vaddr = NULL;
>> +err_dummy:
>>  	return -EINVAL;
> 
> You can drop the err_dummy label and return -EINVAL directly. Except you
> should probably return -ENOMEM as the failure comes from
> dma_alloc_attrs().

Makes sense, will fix.

Best regards,
Michael

> 
>>  }
>>  
> 


