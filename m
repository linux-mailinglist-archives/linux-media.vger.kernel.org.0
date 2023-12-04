Return-Path: <linux-media+bounces-1601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F07803687
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 15:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36113B20AF8
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4265B28DB7;
	Mon,  4 Dec 2023 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lQniG4ZJ"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7CF1980;
	Mon,  4 Dec 2023 06:25:45 -0800 (PST)
Received: from [100.73.184.104] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C49AF6602F41;
	Mon,  4 Dec 2023 14:25:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701699943;
	bh=45qXgp1iDx7haVo6dkVdFUgNfcmTAjlnwXu2xpNKsZo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lQniG4ZJYWxPaV1HSOIqtVAWjSzGmKi2vsdfo4cM1yjiu4aYRTHXClqKyEuW868p7
	 53cc9cOVW9f6M5KnDqx6E9OkAxvAwOdOxmTNviSbCE+dBZD1lfAcSNaipcpR8NB7A8
	 g6kYnNH18Daust2n6vr8wgl03H5pFlAk3sV1ncZijg0faDCKLiJD3WAmBDBRsncrVU
	 /T0aNfukD2lspZZpB0LK5T9lO/57th8wW9lcBgghzxnRxVDxYPrQmJq5L1JHYAWqXL
	 4HX23oGE5yYfsyeMzrvz0Yyr5EWVRacxLImOtI45GuUpNdaB+Ch3tIQhsJg/07Fj7g
	 kzu3Hn8r+x3+A==
Message-ID: <1823eb2d-49bf-40b1-8952-c084fe2f8a88@collabora.com>
Date: Mon, 4 Dec 2023 16:25:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/36] media: microchip: Remove useless setting of
 min_buffers_needed
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, matt.ranostay@konsulko.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231204132323.22811-1-benjamin.gaignard@collabora.com>
 <20231204132323.22811-4-benjamin.gaignard@collabora.com>
 <ab06b2c0-a290-46cd-9d97-3f9f6e3bbb36@xs4all.nl>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <ab06b2c0-a290-46cd-9d97-3f9f6e3bbb36@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/4/23 16:03, Hans Verkuil wrote:
> On 04/12/2023 14:22, Benjamin Gaignard wrote:
>> This driver uses min_buffers_needed which vb2 uses to ensure
>> start_streaming is called when at least 'min_buffers_needed'
>> buffers are queued. However, this driver doesn't need this,
>> it can stream fine without any buffers queued.
>> Just drop this unnecessary restriction.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> CC: Eugen Hristev <eugen.hristev@collabora.com>
>> ---
>>  drivers/media/platform/microchip/microchip-isc-base.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
>> index 3fba0e2844b6..63c39981f47a 100644
>> --- a/drivers/media/platform/microchip/microchip-isc-base.c
>> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
>> @@ -1821,7 +1821,6 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
>>  	q->mem_ops		= &vb2_dma_contig_memops;
>>  	q->timestamp_flags	= V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>  	q->lock			= &isc->lock;
>> -	q->min_buffers_needed	= 1;
> 
> I don't think this can be dropped. Looking at the isc_start_streaming() function
> it expects to have at least one buffer queued.

Stream goes frame by frame with DMA directly into the buffers.
Will this still work without any buffers queued ?

> 
> Regards,
> 
> 	Hans
> 
>>  	q->dev			= isc->dev;
>>  
>>  	ret = vb2_queue_init(q);
> 


