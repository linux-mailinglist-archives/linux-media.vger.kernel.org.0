Return-Path: <linux-media+bounces-42161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEADB5116A
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F2701C8236D
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AE030F544;
	Wed, 10 Sep 2025 08:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJW5cXg1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26B528B501
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493279; cv=none; b=HJW1GlT7sIvizp7cFU4bH6N3z5pEL0Negdnqas9dW5nkTb13O22c4wcNbzZNtN5DwX4jjT2zpXpuh2p/l3wiC4vrvsOXFiFXcgxEfirRT8Qy+OYnd7LYsWUyPm4yv1QPDCIuc9m5mdR1l76jcx25K94R2NRfWrnVQeeUsC+l0nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493279; c=relaxed/simple;
	bh=KgcOXv/EFCXjvuu3Qes9EMvx3ZXz0TV2e7rwGvIV7Fc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dpc9IzOMRde6usm8gFUMfwU2/jMVmEfM99vGJHVN1VIQ/X7SgIdO0I7AnrtFt3ZGxdY+aO6d7Q0GkEKgdsB5B5W7GrN6A9KZqPoQm41W8rtpYab1O4dFJmYAB14JWUeR6ZXtM/iUXUueWZuEqmTbNT1SlZZLVvaxufPq9vQZJMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJW5cXg1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8708AC4CEF0;
	Wed, 10 Sep 2025 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757493279;
	bh=KgcOXv/EFCXjvuu3Qes9EMvx3ZXz0TV2e7rwGvIV7Fc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=KJW5cXg1Xowk2hsMbpaKXs1xHmk/VpZpxrF36hw/Aq5vuzyNAsHYdu32avioiKeId
	 gwWMN/BLKWt4pPzPAZv/HjD+Ao0RFDiV52Da9pqSdE6fAv6R8Z1q9mHfiNF6zkbnxS
	 dZ/XOOr6prI0AEIDyNs9wUwwJDcXGrQf96r1Hom3fTPXDqkIT/rr3df7Fsad2r5ubp
	 T0a77KHEGNxMI6VPCsNBCic5HlXuGR/IUrw6PsTSV/rWNVas/qoeSw0C97AEqJSAnz
	 tXpAO24MyLue7MoLpeh9P1IEQqG1C3XAF+VURt8oG/kTuaOGYNJ9Ty8HNKmdeR4Uj8
	 kHha7o9vIjdEA==
Message-ID: <93bc9147-26fb-47bd-a385-be369a4568f3@kernel.org>
Date: Wed, 10 Sep 2025 10:34:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3 v4l-utils] common: Use posix_memalign for allocating
 userptr buffers
To: Tomasz Figa <tfiga@chromium.org>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>, linux-media@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240625112425.37172-1-fusibrandon13@gmail.com>
 <fb3c5f48-8a82-445c-b015-dde4f4f58def@xs4all.nl>
 <CAAFQd5AmgbkWy5sUDM7Po-KjU+3YnnAD512rtymDsULiVH8JKw@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAAFQd5AmgbkWy5sUDM7Po-KjU+3YnnAD512rtymDsULiVH8JKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Brandon,

There have been no replies to the questions raised for this patch, so
I am marking it as Rejected in patchwork.

If you believe this is really needed, then just repost and give some more
information.

Regards,

	Hans

On 22/10/2024 12:14, Tomasz Figa wrote:
> On Thu, Oct 17, 2024 at 7:51 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Brandon,
>>
>> On 25/06/2024 13:24, Brandon Cheo Fusi wrote:
>>> When dealing with a userptr pointing to a buffer in userspace,
>>> videobuf2 swaps the corresponding physical pages with other pages
>>> so we have a contiguous area of memory for DMA. This only works if
>>> the userptr is page aligned.
>>>
>>> The current way of allocating user buffers using malloc only
>>> guarantees alignment up to `alignof(max_align_t)`, which is usually
>>> 16. So replace malloc with posix_memalign to ensure the returned
>>> pointer is on a page boundary.
>>
>> With which driver is this tested? USERPTR is really supposed to work
>> with malloc()ed memory.
> 
> In theory yes, but the entire idea of USERPTR is shaky enough that
> some hardware may not work if the pointer is not aligned enough.
> Another aspect is security - IOMMUs can only work on page granularity,
> so if the first page of the buffer is preceded (or last page followed)
> by some other data, that data would be leaked to the hardware.
> 
> That said, that doesn't seem to be what the commit description refers
> to and actually it's kind of wrong - videobuf2 doesn't do anything to
> make the userptr memory contiguous. It's all down to the DMA mapping
> ops of the device, and if it's behind an IOMMU, it should just work
> regardless of the alignment, minus the user data leak caveat I
> mentioned.
> 
> Besides that, any idea why this function actually even uses userptr?
> (I assume this is libv4l?)
> 
>>
>> There have been drivers in the past that used contiguous DMA but still
>> allowed USERPTR, but that was a hack and these days you would use DMABUF.
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
>>> ---
>>>  utils/common/v4l-helpers.h | 9 +++++----
>>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
>>> index cf0e92d..aa9ee26 100644
>>> --- a/utils/common/v4l-helpers.h
>>> +++ b/utils/common/v4l-helpers.h
>>> @@ -1661,10 +1661,11 @@ static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
>>>               return 0;
>>>       for (b = from; b < v4l_queue_g_buffers(q); b++) {
>>>               for (p = 0; p < v4l_queue_g_num_planes(q); p++) {
>>> -                     void *m = malloc(v4l_queue_g_length(q, p));
>>> -
>>> -                     if (m == NULL)
>>> -                             return errno;
>>> +                     void *m;
>>> +                     int ret = posix_memalign(&m, getpagesize(),
>>> +                                             v4l_queue_g_length(q, p));
>>> +                     if (ret)
>>> +                             return ret;
>>>                       v4l_queue_s_userptr(q, b, p, m);
>>>               }
>>>       }
>>
> 


