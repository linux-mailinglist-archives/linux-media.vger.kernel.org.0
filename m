Return-Path: <linux-media+bounces-27207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A02A49606
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D0FD7A6F1F
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378AF25A2D8;
	Fri, 28 Feb 2025 09:54:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4A6256C8F;
	Fri, 28 Feb 2025 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736495; cv=none; b=UK5gY4SBx6D07QX9807lZg5HrOFfGb3YN2+Z4an+svRQUlJoG6wNp7VT0mvsTOes9kHeuMVohNM7JiPhJptOcg2riKDdk0J22y4C2uZoQhhncHYBrVIky+vMIX7oW2qAHKt7flt1KnNA1gZ2UMrD+3pWii0jvfMOSi/+kkpeJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736495; c=relaxed/simple;
	bh=QhTcE4pzCYDReq4QuRU+fEWaJS0axrD67vP0FmJzmPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEjksUOok37kQjDiq44uccbmu/1FA15fLFH448pGZBORwC2enEkB3BCmUTGFyfUBK0bQ7KcT05GdII9HTcwlvjPVSvUOQY5X6K5irkkGA7cxZ8pW4QY2Nqoi7Ry5stgjcSplmdPveLStA5yHyjKWAmwveEslt0agcM6WuYJAWg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAECFC4CED6;
	Fri, 28 Feb 2025 09:54:52 +0000 (UTC)
Message-ID: <f3f0b205-15a4-4999-87e3-769caf730aeb@xs4all.nl>
Date: Fri, 28 Feb 2025 10:54:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
 <87ldtraz5v.fsf@gmail.com>
 <2b0bbccdbbc30c8587f2e3b2ee7bb0a4a1225e20.camel@ndufresne.ca>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <2b0bbccdbbc30c8587f2e3b2ee7bb0a4a1225e20.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2025 03:58, Nicolas Dufresne wrote:
> Le jeudi 27 février 2025 à 23:46 +0300, Mikhail Rudenko a écrit :
>> Hi Jacopo,
>>
>> On 2025-02-27 at 18:05 +01, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>>
>>> Hi Mikhail
>>>
>>> On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
>>>>
>>>> Hi Laurent,
>>>>
>>>> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>>>>
>>>>> On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
>>>>>> Currently, the rkisp1 driver always uses coherent DMA allocations for
>>>>>> video capture buffers. However, on some platforms, using non-coherent
>>>>>> buffers can improve performance, especially when CPU processing of
>>>>>> MMAP'ed video buffers is required.
>>>>>>
>>>>>> For example, on the Rockchip RK3399 running at maximum CPU frequency,
>>>>>> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
>>>>>> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
>>>>>> non-coherent DMA allocation. CPU usage also decreases accordingly.
>>>>>
>>>>> What's the time taken by the cache management operations ?
>>>>
>>>> Sorry for the late reply, your question turned out a little more
>>>> interesting than I expected initially. :)
>>>>
>>>> When capturing using Yavta with MMAP buffers under the conditions mentioned
>>>> in the commit message, ftrace gives 437.6 +- 1.1 us for
>>>> dma_sync_sgtable_for_cpu and 409 +- 14 us for
>>>> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
>>>> buffers in this case is more CPU-efficient even when considering cache
>>>> management overhead.
>>>>
>>>> When trying to do the same measurements with libcamera, I failed. In a
>>>> typical libcamera use case when MMAP buffers are allocated from a
>>>> device, exported as dmabufs and then used for capture on the same device
>>>> with DMABUF memory type, cache management in kernel is skipped [1]
>>>> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
>>>> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>>>>
>>>> So it looks like to make this change really useful, the above issue of
>>>> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
>>>> solved. I'm not an expert in this area, so any advice is kindly welcome. :)
>>>
>>> It would be shame if we let this discussion drop dead.. cache
>>> management policies are relevant for performances, specifically for
>>> cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
>>>
>>>>
>>>> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
>>>
>>> I would like to know from Hans if the decision to disallow cache-hints
>>> for dmabuf importers is a design choice or is deeply rooted in other
>>> reasons I might be missing.
>>>
>>> I'm asking because the idea is for libcamera to act solely as dma-buf
>>> importer, the current alloc-export-then-import trick is an helper for
>>> applications to work around the absence of a system allocator.
>>>
>>> If the requirement to disable cache-hints for importers cannot be
>>> lifted, for libcamera it means we would not be able to use it.
>>
>> Meanwhile, I have posted a patch, which re-enables cache management ops
>> for non-coherent dmabufs exported from dma-contig allocator [1]. It is
>> currently waiting for review.
>>
>> [1] https://lore.kernel.org/all/20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com/

I rely heavily on Tomasz Figa for review of such patches. He was OK with the
patch, but he suggested waiting a bit for more comments. My plan was to pick it
up end of next week if there are no further comments.

Regards,

	Hans

> 
> Thanks for you work, this matches what I was referring to missing in my
> previous reply.
> 
> I don't think there is any intention to block or deprecate it, but
> partially enabling leads to problems. Do we need something in the SG
> allocator to ?
> 
> Nicolas
> 
>>
>>>
>>>> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
>>>> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>>>>
>>>> --
>>>> Best regards,
>>>> Mikhail Rudenko
>>>>
>>
>>
>> --
>> Best regards,
>> Mikhail Rudenko
>>
> 
> 


