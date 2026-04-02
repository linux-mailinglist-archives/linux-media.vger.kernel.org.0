Return-Path: <linux-media+bounces-57917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFzxAW4TzmmnkgYAu9opvQ
	(envelope-from <linux-media+bounces-57917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 08:57:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A23384D14
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 08:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 331F1309548D
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 06:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6ADD36657B;
	Thu,  2 Apr 2026 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rHlYBTn2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919632FA2B
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112768; cv=none; b=nGaM4i8Mr4wO+Ag5aDE/Ub3hoT+EF9e87DUJjVviyWC6KfU2PVz/AdX6FAQLTqDVxdy2posk3ig47UVCKCoNLr+ktOeEbV+dI1An0ZyG5QBYPIm8mCxb6jSWzTi16HQ/dE/YeFDJRdVHggN6YwPYRbcwLXzKME8QuaRg9ACgrUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112768; c=relaxed/simple;
	bh=ntxbhzrvVPLpB37ChB11jjkFBlUbdUl1raHBJC0jfYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=uQJRQ7p9HD1R/gZiwGazI0GcycoDXtV4G3I87NPnkiceYIDYQPf2NfCmwmRYhBhVgZmmU1Ehy3aR/y9oV0bO30UhbrJvNAViOdQsiCO9QMmvG+QyTbsClDCoDXVpMkcdvYQqhT4vX4VPYMn+GVZ8oyVT8mXy+0pAuk78Knh3X+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rHlYBTn2; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260402065242euoutp019e6c1f3ef4e755e3445479d694fceed5~id6bwvCKi0129601296euoutp01i
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 06:52:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260402065242euoutp019e6c1f3ef4e755e3445479d694fceed5~id6bwvCKi0129601296euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1775112762;
	bh=JqJnKEECHMM1x06qmTO+uD6JrQrf2ZS4nGeqK+WTZzo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rHlYBTn2z63aiI2Wo2FnFn2SBU+CLzJEwirOGkmMgdIAwBvSwtaC0tRbgDpq08nqj
	 vuo/GiwaZi1yhPtxIHmWOk0y4IHI2do/+VNOWHW8h4u4acRp9xoySzFa+7+YgdAJOI
	 lZQAw6OynspIX2Mm1rLkLYdN7Fk5dAHLEYVENr0g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260402065241eucas1p26fe08801bf816ff198a0361e0e00aa7d~id6bQM3u42082120821eucas1p2Q;
	Thu,  2 Apr 2026 06:52:41 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260402065238eusmtip2465f475377dc393f8274ea72cd5e5991~id6YxQUhd3266432664eusmtip2A;
	Thu,  2 Apr 2026 06:52:38 +0000 (GMT)
Message-ID: <7fc83a05-b392-4fc9-8ddb-1c169c698870@samsung.com>
Date: Thu, 2 Apr 2026 08:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 5/6] dma-buf: heaps: Add Coherent heap to dmabuf
 heaps
To: Maxime Ripard <mripard@redhat.com>, Andrew Davis <afd@ti.com>
Cc: Albert Esteve <aesteve@redhat.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Robin Murphy
	<robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@kernel.org>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, echanude@redhat.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260316-cherubic-eel-of-philosophy-10ef2b@houat>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260402065241eucas1p26fe08801bf816ff198a0361e0e00aa7d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260316120911eucas1p26492fa73abe29d02bb7f5da73f047abc
X-EPHeader: CA
X-CMS-RootMailID: 20260316120911eucas1p26492fa73abe29d02bb7f5da73f047abc
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
	<20260306-b4-dmabuf-heap-coherent-rmem-v3-5-3d00d36c9bc4@redhat.com>
	<e8dd476f-1be8-46fa-bf56-65fe0bfe29a1@ti.com>
	<CADSE00+-SQr3wGdgBmLowHPWE5bGxoyO4o20jZs4ma-71aOxUA@mail.gmail.com>
	<1afc696a-9afb-48af-887d-2a209680784e@ti.com>
	<CGME20260316120911eucas1p26492fa73abe29d02bb7f5da73f047abc@eucas1p2.samsung.com>
	<20260316-cherubic-eel-of-philosophy-10ef2b@houat>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-57917-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:dkim,samsung.com:mid,ti.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73A23384D14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.03.2026 13:08, Maxime Ripard wrote:
> On Wed, Mar 11, 2026 at 08:18:28AM -0500, Andrew Davis wrote:
>> On 3/11/26 5:19 AM, Albert Esteve wrote:
>>> On Tue, Mar 10, 2026 at 4:34 PM Andrew Davis <afd@ti.com> wrote:
>>>> On 3/6/26 4:36 AM, Albert Esteve wrote:
>>>>> Expose DT coherent reserved-memory pools ("shared-dma-pool"
>>>>> without "reusable") as dma-buf heaps, creating one heap per
>>>>> region so userspace can allocate from the exact device-local
>>>>> pool intended for coherent DMA.
>>>>>
>>>>> This is a missing backend in the long-term effort to steer
>>>>> userspace buffer allocations (DRM, v4l2, dma-buf heaps)
>>>>> through heaps for clearer cgroup accounting. CMA and system
>>>>> heaps already exist; non-reusable coherent reserved memory
>>>>> did not.
>>>>>
>>>>> The heap binds the heap device to each memory region so
>>>>> coherent allocations use the correct dev->dma_mem, and
>>>>> it defers registration until module_init when normal
>>>>> allocators are available.
>>>>>
>>>>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
>>>>> ---
>>>>>     drivers/dma-buf/heaps/Kconfig         |   9 +
>>>>>     drivers/dma-buf/heaps/Makefile        |   1 +
>>>>>     drivers/dma-buf/heaps/coherent_heap.c | 414 ++++++++++++++++++++++++++++++++++
>>>>>     3 files changed, 424 insertions(+)
>>>>>
>>>>> (...)
>>>> You are doing this DMA allocation using a non-DMA pseudo-device (heap_dev).
>>>> This is why you need to do that dma_coerce_mask_and_coherent(64) nonsense, you
>>>> are doing a DMA alloc for the CPU itself. This might still work, but only if
>>>> dma_map_sgtable() can handle swiotlb/iommu for all attaching devices at map
>>>> time.
>>> The concern is valid. We're allocating via a synthetic device, which
>>> ties the allocation to that device's DMA domain. I looked deeper into
>>> this trying to address the concern.
>>>
>>> The approach works because dma_map_sgtable() handles both
>>> dma_map_direct and use_dma_iommu cases in __dma_map_sg_attrs(). For
>>> each physical address in the sg_table (extracted via sg_phys()), it
>>> creates device-specific DMA mappings:
>>> - For direct mapping: it checks if the address is directly accessible
>>> (dma_capable()), and if not, it falls back to swiotlb.
>>> - For IOMMU: it creates mappings that allow the device to access
>>> physical addresses.
>>>
>>> This means every attached device gets its own device-specific DMA
>>> mapping, properly handling cases where the physical addresses are
>>> inaccessible or have DMA constraints.
>>>
>> While this means it might still "work" it won't always be ideal. Take
>> the case where the consuming device(s) have a 32bit address restriction,
>> if the allocation was done using the real devices then the backing buffer
>> itself would be allocated in <32bit mem. Whereas here the allocation
>> could end up in >32bit mem, as the CPU/synthetic device supports that.
>> Then each mapping device would instead get a bounce buffer.
>>
>> (this example might not be great as we usually know the address of
>> carveout/reserved memory regions, but substitute in whatever restriction
>> makes more sense)
>>
>> These non-reusable carveouts tend to be made for some specific device, and
>> they are made specifically because that device has some memory restriction.
>> So we might run into the situation above more than one would expect.
>>
>> Not a blocker here, but just something worth thinking on.
> As I detailed in the previous version [1] the main idea behind that work
> is to allow to get rid of dma_alloc_attrs for framework and drivers to
> allocate from the heaps instead.
>
> Robin was saying he wasn't comfortable with exposing this heap to
> userspace, and we're saying here that maybe this might not always work
> anyway (or at least that we couldn't test it fully).
>
> Maybe the best thing is to defer this series until we are at a point
> where we can start enabling the "heap allocations" in frameworks then?
> Hopefully we will have hardware to test it with by then, and we might
> not even need to expose it to userspace at all but only to the kernel.
>
> What do you think?

IMHO a good idea. Maybe in-kernel heap for the coherent allocations will 
be just enough.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


