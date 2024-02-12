Return-Path: <linux-media+bounces-4972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB7851194
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 11:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B42DB25E2F
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 10:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D0F28DDE;
	Mon, 12 Feb 2024 10:52:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A520DCF
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707735139; cv=none; b=iQtb6nz8TKl7haqbWEwQA7l27SK6vznpd4JE84RKiVrvGhWkXUYVlVqJJ61DttfW0KKxxonneuo6syWzYETSt4Wk6kB8DREhb0XAekG03UpgZN8pjP6Q8llO0yWgVqQA0wkshlh0n0jbhF267DyPsCw8+KWQUSbf9wD24V1vNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707735139; c=relaxed/simple;
	bh=TjYgUAARjf8offzwtlAbqZGtCyhSe8UncG3S71Xu0hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=op4fuUjWKw334KPM74DIhB6ww3RX9FHKudbmvfRWTm6Hkdm30M1ZsbLC6rZgPyTH6NcKa5Nf8Nqbj3V7+xc7vx+E/oyhBh+Ujp08Hv7knNCAvNlPKJaIN0sCqAaB+/wRoP2BLjPWKJ839lm2QSRxR535qxGpBXGOh0/V/Lh2wtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CA3C433C7;
	Mon, 12 Feb 2024 10:52:17 +0000 (UTC)
Message-ID: <687072e8-f7c6-4cef-91cd-8f26295ff2af@xs4all.nl>
Date: Mon, 12 Feb 2024 11:52:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: Add missing doc comment for
 waiting_in_dqbuf
Content-Language: en-US, nl
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@collabora.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20240105134020.34312-1-andrzej.p@collabora.com>
 <CAAFQd5DEfvaGVLdPzjpfRwFMJcrXstp2QyTp-BJqzncXOxTvRQ@mail.gmail.com>
 <aff1bae8-b87e-4331-bff7-9c385322b8da@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <aff1bae8-b87e-4331-bff7-9c385322b8da@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/01/2024 22:26, Andrzej Pietrasiewicz wrote:
> Hi Tomasz,
> 
> W dniu 10.01.2024 o 13:41, Tomasz Figa pisze:
>> On Fri, Jan 5, 2024 at 10:40 PM Andrzej Pietrasiewicz
>> <andrzej.p@collabora.com> wrote:
>>>
>>> While at it rearrange other comments to match the order of struct members.
>>>
>>> Fixes: d65842f7126a ("media: vb2: add waiting_in_dqbuf flag")
>>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>>> ---
>>>   include/media/videobuf2-core.h | 12 +++++++-----
>>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>>> index e41204df19f0..5020e052eda0 100644
>>> --- a/include/media/videobuf2-core.h
>>> +++ b/include/media/videobuf2-core.h
>>> @@ -72,6 +72,10 @@ struct vb2_buffer;
>>>    *              argument to other ops in this structure.
>>>    * @put_userptr: inform the allocator that a USERPTR buffer will no longer
>>>    *              be used.
>>> + * @prepare:   called every time the buffer is passed from userspace to the
>>> + *             driver, useful for cache synchronisation, optional.
>>> + * @finish:    called every time the buffer is passed back from the driver
>>> + *             to the userspace, also optional.
>>>    * @attach_dmabuf: attach a shared &struct dma_buf for a hardware operation;
>>>    *                used for DMABUF memory types; dev is the alloc device
>>>    *                dbuf is the shared dma_buf; returns ERR_PTR() on failure;
>>> @@ -86,10 +90,6 @@ struct vb2_buffer;
>>>    *             dmabuf.
>>>    * @unmap_dmabuf: releases access control to the dmabuf - allocator is notified
>>>    *               that this driver is done using the dmabuf for now.
>>> - * @prepare:   called every time the buffer is passed from userspace to the
>>> - *             driver, useful for cache synchronisation, optional.
>>> - * @finish:    called every time the buffer is passed back from the driver
>>> - *             to the userspace, also optional.
>>>    * @vaddr:     return a kernel virtual address to a given memory buffer
>>>    *             associated with the passed private structure or NULL if no
>>>    *             such mapping exists.
>>> @@ -484,7 +484,6 @@ struct vb2_buf_ops {
>>>    *             caller. For example, for V4L2, it should match
>>>    *             the types defined on &enum v4l2_buf_type.
>>>    * @io_modes:  supported io methods (see &enum vb2_io_modes).
>>> - * @alloc_devs:        &struct device memory type/allocator-specific per-plane device
>>>    * @dev:       device to use for the default allocation context if the driver
>>>    *             doesn't fill in the @alloc_devs array.
>>>    * @dma_attrs: DMA attributes to use for the DMA.
>>> @@ -550,6 +549,7 @@ struct vb2_buf_ops {
>>>    *             @start_streaming can be called. Used when a DMA engine
>>>    *             cannot be started unless at least this number of buffers
>>>    *             have been queued into the driver.
>>> + * @alloc_devs:        &struct device memory type/allocator-specific per-plane device
>>>    */
>>>   /*
>>>    * Private elements (won't appear at the uAPI book):
>>> @@ -571,6 +571,8 @@ struct vb2_buf_ops {
>>>    * @waiting_for_buffers: used in poll() to check if vb2 is still waiting for
>>>    *             buffers. Only set for capture queues if qbuf has not yet been
>>>    *             called since poll() needs to return %EPOLLERR in that situation.
>>> + * @waiting_in_dqbuf: set whenever vb2_queue->lock is released while waiting for
>>> + *             a buffer to arrive so that -EBUSY can be returned when appropriate
>>
>> Appreciate documentation improvements. Thanks!
>>
> 
> I haven't been hunting for opportunities to improve the documentation,
> the opportunity has found me ;P
> 
>> Just one comment: Could we make it more clear who sets it? For example >      Set by the core for the duration of a blocking DQBUF, when it has
>> to wait for
>>      a buffer to become available with vb2_queue->lock released. Used to prevent
>>      destroying the queue by other threads.
> 
> Makes sense for me.
> 
> @Nicolas are you ok with changing the text and retaining your R-b?
> 
> Andrzej

Since this patch no longer applies, I think it is best if you make a v2.

I'll mark this one as "Changes Requested" in patchwork.

Regards,

	Hans


>>
>> WDYT?
>>
>> Best regards,
>> Tomasz
>>
> 
> 


