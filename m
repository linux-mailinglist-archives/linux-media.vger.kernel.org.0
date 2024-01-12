Return-Path: <linux-media+bounces-3656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC382C69C
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 22:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939E01F24D9F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 21:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75899171A2;
	Fri, 12 Jan 2024 21:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rx7/vKjG"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E41168CC
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 21:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705094808;
	bh=damUuOhGJN7l4KRF559lD7FnkIoXJP9qmc7s2sF8Ftw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rx7/vKjGD6JWhyv/ZqbHu8+s23OexcuHjwtJuWCDjfle87TX3Mqs1ZgDISbYGL4jk
	 ThdBtLXYEtnbaYwd2bin1f95lsx7cpFWzHFLcVGzsGjbjrwr7mTPxZGNt6U7+9yDAB
	 8BRUFSkamnWGNV8X/uQVpRd6jn6E421oVn1MqKA57LoV7K+hniLPf7lYsxoI/mJD1F
	 R4iLyNVrwJ/uC2Zq7KouEr3HPZx9pwY7YRUD1cjFpvr/wLe/Vy+zqkIevxkv7ZiDgG
	 GM1CnDJu+C3KPfpb7tbB1Fhp2qh9Nniivu2jG8kFJvaWpn/ojailpyCau9Kb3we2Sc
	 qHAqcIko5U1lQ==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 081523782017;
	Fri, 12 Jan 2024 21:26:47 +0000 (UTC)
Message-ID: <aff1bae8-b87e-4331-bff7-9c385322b8da@collabora.com>
Date: Fri, 12 Jan 2024 22:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: Add missing doc comment for
 waiting_in_dqbuf
To: Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@collabora.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20240105134020.34312-1-andrzej.p@collabora.com>
 <CAAFQd5DEfvaGVLdPzjpfRwFMJcrXstp2QyTp-BJqzncXOxTvRQ@mail.gmail.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <CAAFQd5DEfvaGVLdPzjpfRwFMJcrXstp2QyTp-BJqzncXOxTvRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tomasz,

W dniu 10.01.2024 o 13:41, Tomasz Figa pisze:
> On Fri, Jan 5, 2024 at 10:40 PM Andrzej Pietrasiewicz
> <andrzej.p@collabora.com> wrote:
>>
>> While at it rearrange other comments to match the order of struct members.
>>
>> Fixes: d65842f7126a ("media: vb2: add waiting_in_dqbuf flag")
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>>   include/media/videobuf2-core.h | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>> index e41204df19f0..5020e052eda0 100644
>> --- a/include/media/videobuf2-core.h
>> +++ b/include/media/videobuf2-core.h
>> @@ -72,6 +72,10 @@ struct vb2_buffer;
>>    *              argument to other ops in this structure.
>>    * @put_userptr: inform the allocator that a USERPTR buffer will no longer
>>    *              be used.
>> + * @prepare:   called every time the buffer is passed from userspace to the
>> + *             driver, useful for cache synchronisation, optional.
>> + * @finish:    called every time the buffer is passed back from the driver
>> + *             to the userspace, also optional.
>>    * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operation;
>>    *                used for DMABUF memory types; dev is the alloc device
>>    *                dbuf is the shared dma_buf; returns ERR_PTR() on failure;
>> @@ -86,10 +90,6 @@ struct vb2_buffer;
>>    *             dmabuf.
>>    * @unmap_dmabuf: releases access control to the dmabuf - allocator is notified
>>    *               that this driver is done using the dmabuf for now.
>> - * @prepare:   called every time the buffer is passed from userspace to the
>> - *             driver, useful for cache synchronisation, optional.
>> - * @finish:    called every time the buffer is passed back from the driver
>> - *             to the userspace, also optional.
>>    * @vaddr:     return a kernel virtual address to a given memory buffer
>>    *             associated with the passed private structure or NULL if no
>>    *             such mapping exists.
>> @@ -484,7 +484,6 @@ struct vb2_buf_ops {
>>    *             caller. For example, for V4L2, it should match
>>    *             the types defined on &enum v4l2_buf_type.
>>    * @io_modes:  supported io methods (see &enum vb2_io_modes).
>> - * @alloc_devs:        &struct device memory type/allocator-specific per-plane device
>>    * @dev:       device to use for the default allocation context if the driver
>>    *             doesn't fill in the @alloc_devs array.
>>    * @dma_attrs: DMA attributes to use for the DMA.
>> @@ -550,6 +549,7 @@ struct vb2_buf_ops {
>>    *             @start_streaming can be called. Used when a DMA engine
>>    *             cannot be started unless at least this number of buffers
>>    *             have been queued into the driver.
>> + * @alloc_devs:        &struct device memory type/allocator-specific per-plane device
>>    */
>>   /*
>>    * Private elements (won't appear at the uAPI book):
>> @@ -571,6 +571,8 @@ struct vb2_buf_ops {
>>    * @waiting_for_buffers: used in poll() to check if vb2 is still waiting for
>>    *             buffers. Only set for capture queues if qbuf has not yet been
>>    *             called since poll() needs to return %EPOLLERR in that situation.
>> + * @waiting_in_dqbuf: set whenever vb2_queue->lock is released while waiting for
>> + *             a buffer to arrive so that -EBUSY can be returned when appropriate
> 
> Appreciate documentation improvements. Thanks!
>

I haven't been hunting for opportunities to improve the documentation,
the opportunity has found me ;P

> Just one comment: Could we make it more clear who sets it? For example >      Set by the core for the duration of a blocking DQBUF, when it has
> to wait for
>      a buffer to become available with vb2_queue->lock released. Used to prevent
>      destroying the queue by other threads.

Makes sense for me.

@Nicolas are you ok with changing the text and retaining your R-b?

Andrzej
> 
> WDYT?
> 
> Best regards,
> Tomasz
> 


