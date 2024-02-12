Return-Path: <linux-media+bounces-5046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27297851DB4
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 20:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87A2AB2124D
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 19:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C860F45C18;
	Mon, 12 Feb 2024 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="12Ai//o7"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94817481A5
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 19:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707765218; cv=none; b=I6e6/81yvjRXxqggw9P1zjnYvW7oqNR5afBGCLczdP/iqMqRdH+VxyJVdHfs8Us9qrP6CcQowcbqpJaq6YmvLjDQzy0VVYIEzI0xSZCCxvSkG8rFLCoeetSAd96KJ1UjWk4e4dms3Q4lu888qnUcufBDpz3bhIYZ6ZIJIzvGJSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707765218; c=relaxed/simple;
	bh=f4+VBR33TXrwn56q90U+5VDHhNS2nWJD+0xVn5wqyjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+85DkkAoEiEoys+pdR7NYVWvkS2ZOijRapqD0okm7E44AK9TEsJzgHCxleddBhjJZ5UCL/vZO2nca/BNNtt2t3vhCIg8OylZygH5IF7ICrflzrRy5aNDoQZ+rwXP6XbGYzfSsHgi4QiG5hq4lDebdafMrGtC/2wJPbLb3GHzRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=12Ai//o7; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707765215;
	bh=f4+VBR33TXrwn56q90U+5VDHhNS2nWJD+0xVn5wqyjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=12Ai//o70EFHmVJy75vwaDfEwceWHDVNuwpvkJkydpEXpzpdIMMq6Cvh+K6+66bs1
	 3bdQSOn2CJA8/Sww5nlkwXH8lY7pMvV2l8yesdjnke5Kf4mM85NjXwOLG770GcxtKS
	 c3oKGlCTiO8+zvHDHRKgil1rMYzHO8qHS4+LHTy8h/pUenZEpesVSeK7GihnRV36OT
	 UKXuxZPbvOQlES0Ir6+iNxHcRip1vEF4rtlnmnCke61VNN+/bfefD+1K/mHhEPs/cU
	 Yqj1m/GHtYEe/PSt+y6DYXh+Vh1Gngx/2J6IsFvNsucJsXk8gwm1iU4AM8N6hlwymC
	 Zphk1t303iGnQ==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9B5F33782075;
	Mon, 12 Feb 2024 19:13:34 +0000 (UTC)
Message-ID: <20be3164-fd65-4765-ae52-dfc51ced34b1@collabora.com>
Date: Mon, 12 Feb 2024 20:13:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: Add missing doc comment for
 waiting_in_dqbuf
To: Hans Verkuil <hverkuil@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@collabora.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20240105134020.34312-1-andrzej.p@collabora.com>
 <CAAFQd5DEfvaGVLdPzjpfRwFMJcrXstp2QyTp-BJqzncXOxTvRQ@mail.gmail.com>
 <aff1bae8-b87e-4331-bff7-9c385322b8da@collabora.com>
 <687072e8-f7c6-4cef-91cd-8f26295ff2af@xs4all.nl>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <687072e8-f7c6-4cef-91cd-8f26295ff2af@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hans,

dniu 12.02.2024 o 11:52, Hans Verkuil pisze:
> On 12/01/2024 22:26, Andrzej Pietrasiewicz wrote:
>> Hi Tomasz,
>>
>> W dniu 10.01.2024 o 13:41, Tomasz Figa pisze:
>>> On Fri, Jan 5, 2024 at 10:40 PM Andrzej Pietrasiewicz
>>> <andrzej.p@collabora.com> wrote:
>>>>
>>>> While at it rearrange other comments to match the order of struct members.
>>>>
>>>> Fixes: d65842f7126a ("media: vb2: add waiting_in_dqbuf flag")
>>>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>>>> ---
>>>>    include/media/videobuf2-core.h | 12 +++++++-----
>>>>    1 file changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>>>> index e41204df19f0..5020e052eda0 100644
>>>> --- a/include/media/videobuf2-core.h
>>>> +++ b/include/media/videobuf2-core.h
>>>> @@ -72,6 +72,10 @@ struct vb2_buffer;
>>>>     *              argument to other ops in this structure.
>>>>     * @put_userptr: inform the allocator that a USERPTR buffer will no longer
>>>>     *              be used.
>>>> + * @prepare:   called every time the buffer is passed from userspace to the
>>>> + *             driver, useful for cache synchronisation, optional.
>>>> + * @finish:    called every time the buffer is passed back from the driver
>>>> + *             to the userspace, also optional.
>>>>     * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operation;
>>>>     *                used for DMABUF memory types; dev is the alloc device
>>>>     *                dbuf is the shared dma_buf; returns ERR_PTR() on failure;
>>>> @@ -86,10 +90,6 @@ struct vb2_buffer;
>>>>     *             dmabuf.
>>>>     * @unmap_dmabuf: releases access control to the dmabuf - allocator is notified
>>>>     *               that this driver is done using the dmabuf for now.
>>>> - * @prepare:   called every time the buffer is passed from userspace to the
>>>> - *             driver, useful for cache synchronisation, optional.
>>>> - * @finish:    called every time the buffer is passed back from the driver
>>>> - *             to the userspace, also optional.
>>>>     * @vaddr:     return a kernel virtual address to a given memory buffer
>>>>     *             associated with the passed private structure or NULL if no
>>>>     *             such mapping exists.
>>>> @@ -484,7 +484,6 @@ struct vb2_buf_ops {
>>>>     *             caller. For example, for V4L2, it should match
>>>>     *             the types defined on &enum v4l2_buf_type.
>>>>     * @io_modes:  supported io methods (see &enum vb2_io_modes).
>>>> - * @alloc_devs:        &struct device memory type/allocator-specific per-plane device
>>>>     * @dev:       device to use for the default allocation context if the driver
>>>>     *             doesn't fill in the @alloc_devs array.
>>>>     * @dma_attrs: DMA attributes to use for the DMA.
>>>> @@ -550,6 +549,7 @@ struct vb2_buf_ops {
>>>>     *             @start_streaming can be called. Used when a DMA engine
>>>>     *             cannot be started unless at least this number of buffers
>>>>     *             have been queued into the driver.
>>>> + * @alloc_devs:        &struct device memory type/allocator-specific per-plane device
>>>>     */
>>>>    /*
>>>>     * Private elements (won't appear at the uAPI book):
>>>> @@ -571,6 +571,8 @@ struct vb2_buf_ops {
>>>>     * @waiting_for_buffers: used in poll() to check if vb2 is still waiting for
>>>>     *             buffers. Only set for capture queues if qbuf has not yet been
>>>>     *             called since poll() needs to return %EPOLLERR in that situation.
>>>> + * @waiting_in_dqbuf: set whenever vb2_queue->lock is released while waiting for
>>>> + *             a buffer to arrive so that -EBUSY can be returned when appropriate
>>>
>>> Appreciate documentation improvements. Thanks!
>>>
>>
>> I haven't been hunting for opportunities to improve the documentation,
>> the opportunity has found me ;P
>>
>>> Just one comment: Could we make it more clear who sets it? For example >      Set by the core for the duration of a blocking DQBUF, when it has
>>> to wait for
>>>       a buffer to become available with vb2_queue->lock released. Used to prevent
>>>       destroying the queue by other threads.
>>
>> Makes sense for me.
>>
>> @Nicolas are you ok with changing the text and retaining your R-b?
>>
>> Andrzej
> 
> Since this patch no longer applies, I think it is best if you make a v2.
> 
> I'll mark this one as "Changes Requested" in patchwork.
> 
> Regards,
> 
> 	Hans
> 
> 

Rebased onto latest media_tree and sent v2.

Regards,

Andrzej

