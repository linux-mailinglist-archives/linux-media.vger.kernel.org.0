Return-Path: <linux-media+bounces-27977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64707A5A35E
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 19:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4153163D43
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 18:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5D42356C4;
	Mon, 10 Mar 2025 18:45:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1A4223702;
	Mon, 10 Mar 2025 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741632300; cv=none; b=cDHZ7I8u61z4y7jQjyOGC5mklQI+2wcV0RJyxF0qTsu/AtZno32iLaVtPWE4p9ygDHNRMeOHvqfCRgePriUCT3zuKYww13OYzy9U08agR8x8LeEe/bArVpBbjsQB9sbfLCl/ZNL5NIiIAwlNpVfOoQPW20ewktSg/8kMn/IZu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741632300; c=relaxed/simple;
	bh=U9hKR3bNU8b0tHM96qWPZktlGi9udBVKJaA14lysXVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6gTkH2AIXZ22mTR9uVrcysn2es+HW5DLOm8Ux7eVvsgSoBkfk9py6NViDdbDu4uOJgatxggHTUaz/Hsc7wgFDjAu+7zZHjQnCjlzX4k2Qg6OFFn/VOztQ5q/hbj3NT1WJ4ftIF14y5CQm6bCEwTENctzgcT324gOCDdq0wq5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADD28152B;
	Mon, 10 Mar 2025 11:45:08 -0700 (PDT)
Received: from [10.57.39.174] (unknown [10.57.39.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AB873F673;
	Mon, 10 Mar 2025 11:44:53 -0700 (PDT)
Message-ID: <0b057c55-fe02-4c83-af69-37770dc83eb8@arm.com>
Date: Mon, 10 Mar 2025 18:44:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] dma: direct: Provide accessor to dmem region
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <20250310-dmem-cgroups-v1-6-2984c1bc9312@kernel.org>
 <2af9ea85-b31d-49c9-b574-38c33cc89cef@arm.com>
 <20250310-expert-piculet-of-fascination-3813cd@houat>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250310-expert-piculet-of-fascination-3813cd@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-10 4:28 pm, Maxime Ripard wrote:
> On Mon, Mar 10, 2025 at 02:56:37PM +0000, Robin Murphy wrote:
>> On 2025-03-10 12:06 pm, Maxime Ripard wrote:
>>> Consumers of the direct DMA API will have to know which region their
>>> device allocate from in order for them to charge the memory allocation
>>> in the right one.
>>
>> This doesn't seem to make much sense - dma-direct is not an allocator
>> itself, it just provides the high-level dma_alloc_attrs/dma_alloc_pages/etc.
>> interfaces wherein the underlying allocations _could_ come from CMA, but
>> also a per-device coherent/restricted pool, or a global coherent/atomic
>> pool, or the regular page allocator, or in one weird corner case the SWIOTLB
>> buffer, or...
> 
> I guess it wasn't super clear, but what I meant is that it's an
> allocator to the consumer: it gets called, and returns a buffer. How it
> does so is transparent to the device, and on the other side of the
> abstraction.
> 
> I do agree that the logic is complicated to follow, and that's what I
> was getting at in the cover letter.

Right, but ultimately my point is that when we later end up with:

struct dmem_cgroup_region *
dma_get_dmem_cgroup_region(struct device *dev)
{
	if (dma_alloc_direct(dev, get_dma_ops(dev)))
		return dma_direct_get_dmem_cgroup_region(dev);

		= dma_contiguous_get_dmem_cgroup_region(dev);

it's objectively wrong given what dma_alloc_direct() means in context:

void *dma_alloc_attrs(...)
{
	if (dma_alloc_direct(dev, ops))
		cpu_addr = dma_direct_alloc(...);

where dma_direct_alloc() may then use at least 5 different allocation 
methods, only one of which is CMA. Accounting things which are not CMA 
to CMA seems to thoroughly defeat the purpose of having such 
fine-grained accounting at all.

This is why the very notion of "consumers of dma-direct" should 
fundamentally not be a thing IMO. Drivers consume the DMA API 
interfaces, and the DMA API ultimately consumes various memory 
allocators, but what happens in between is nobody else's business; 
dma-direct happens to represent *some* paths between the two, but there 
are plenty more paths to the same (and different) allocators through 
other DMA API implementations as well. Which route a particular call 
takes to end up at a particular allocator is not meaningful unless you 
are the DMA ops dispatch code.

Or to put it another way, to even go for the "dumbest possible correct 
solution", the plumbing of dma_get_dmem_cgroup_region() would need to be 
about as complex and widespread as the plumbing of dma_alloc_attrs() 
itself ;)

I think I see why a simple DMA attribute couldn't be made to work, as 
dmem_cgroup_uncharge() can't simply look up the pool the same way 
dmem_cgroup_try_charge() found it, since we still need a cg for that and 
get_current_dmemcs() can't be assumed to be stable over time, right?
At the point I'm probably starting to lean towards a whole new DMA op 
with a properly encapsulated return type (and maybe a long-term goal of 
consolidating the 3 or 4 different allocation type we already have), or 
just have a single dmem region for "DMA API memory" and don't care where 
it came from (although I do see the issues with that too - you probably 
wouldn't want to ration a device-private pool the same way as global 
system memory, for example)

Thanks,
Robin.

