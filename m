Return-Path: <linux-media+bounces-39996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E9B28683
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 21:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D46C17B4426
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 19:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D540275105;
	Fri, 15 Aug 2025 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WrPu03M4"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5519327455;
	Fri, 15 Aug 2025 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755286833; cv=none; b=GGiYNX9muUbdxbXR5uUvS2YySCaXFrAdbiWFw/Hz2lK8jJjJgrEmdX74Hs0RhqWt4foZKrQpWmnuD5eyoBA38Jkt6d6KZWUXjXnrbPL1RccABRmH5ybJtQx42mVuil3h0eOfo6JfTKNecQu+3NAhdGjKZhBZsqU4uaEzRRU0qFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755286833; c=relaxed/simple;
	bh=fSx4nn9/FHV7lAK6AnFhPNP4Bdj1k7XAbfDUX7uBKG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K+VR6w9rYYNsriN/efvsrSZ4UalwM06wEJv+Gj5pz6FNKNCttWVXIJgTnSU0HtGiT460eTxinEZ0c2lIBb18DdCHhY0ioJi9Bbk+4GsKcAEnkpKmV7RDBwIYDrQw2XJGCZMRflzjzC9KLzJEj1NJcAz4xOuoCarueWGsdk2GYwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WrPu03M4; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FJeHx32669592;
	Fri, 15 Aug 2025 14:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755286817;
	bh=LfyjrME+xUKDBHxkGHQrFTfPrNu4/XhTDGMxhaMKngg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WrPu03M4QFirNu0si7nztZ4btKN3s2k4VEqyW6v2n8DfX/v5NQQYzlsMh+wHyVqun
	 kcDWHrU60AMRZpdD2yCxi1a9geof6v7VSzkaMv1lvBjXNcFOLcv1qQzeW6JQ5lrYU2
	 dEplDBLww9wpcixVmqELUJN7Kj4ZldOp6Em1TQsU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FJeH4t2806871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 14:40:17 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 14:40:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.24; Fri, 15 Aug
 2025 14:40:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 14:40:16 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FJeG811752389;
	Fri, 15 Aug 2025 14:40:16 -0500
Message-ID: <008f6004-dcf0-42e8-b2df-f97c0ee5ba66@ti.com>
Date: Fri, 15 Aug 2025 14:40:16 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] udmabuf: Sync to attached devices
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann
	<kraxel@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Paul Cercueil
	<paul@crapouillou.net>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <20250814161049.678672-1-afd@ti.com>
 <0b963b02-dec0-4bf5-aea9-dbe3050716ee@amd.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <0b963b02-dec0-4bf5-aea9-dbe3050716ee@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 8/15/25 4:41 AM, Christian König wrote:
> On 14.08.25 18:10, Andrew Davis wrote:
>> Hello all,
>>
>> This series makes it so the udmabuf will sync the backing buffer
>> with the set of attached devices as required for DMA-BUFs when
>> doing {begin,end}_cpu_access.
> 
> Yeah the reason why we didn't do that is that this doesn't even work 100% reliable in theory. So this patchset here might make your use case work but is a bit questionable in general.
> 
> udmabuf is about turning a file descriptor created by memfd_create() into a DMA-buf. Mapping that memory can happen through the memfd as well and so it is perfectly valid to skip the DMA-buf begin_access and end_access callbacks.
> 

If someone maps the memory backed by the DMA-buf outside of the DMA-APIs then we cannot really
control that, but in this case if they do map with the DMA-API then it is *not* valid to skip
these begin_access and end_access callbacks. And that is the case I am addressing here.

Right now we are not syncing the mapping for any attached device, we just zap it from
the CPU caches using some hacky loopback and hope that is enough for the devices :/

> Additional to that when CONFIG_DMABUF_DEBUG is enabled the DMA-buf code mangles the page addresses in the sg table to prevent importers from abusing it. That makes dma_sync_sgtable_for_cpu() and dma_sync_sgtable_for_device() on the exporter side crash.
> 

I was not aware of this mangle_sg_table() hack, must have been added while I was not looking :)

Seems very broken TBH, taking a quick look, I see on this line[0] you call it, then
just a couple lines later you use that same mangled page_link to walk the SG table[1]..

If anyone enables DMA_API_DEBUG and tried to attach/map a non-contiguous DMA-BUF with
a chained sg I don't see how that doesn't crash out.

> That's the reason why DMA-buf heaps uses a copy of the sg table for calling dma_sync_sgtable_for_cpu()/dma_sync_sgtable_for_device().
> 

Could you point me to where Heaps uses a copy of the SG table? I see it using the
exact same SG table for dma_sync_sgtable_for_*() that we created when mapping the
device attachments.

Thanks,
Andrew

[0] https://github.com/torvalds/linux/blob/master/drivers/dma-buf/dma-buf.c#L1142
[1] https://github.com/torvalds/linux/blob/master/drivers/dma-buf/dma-buf.c#L1151

> It's basically a hack and should be removed, but for this we need to change all clients which is tons of work.
> 
> Regards,
> Christian.
> 
>>
>> Thanks
>> Andrew
>>
>> Changes for v2:
>>   - fix attachment table use-after-free
>>   - rebased on v6.17-rc1
>>
>> Andrew Davis (3):
>>    udmabuf: Keep track current device mappings
>>    udmabuf: Sync buffer mappings for attached devices
>>    udmabuf: Use module_misc_device() to register this device
>>
>>   drivers/dma-buf/udmabuf.c | 133 +++++++++++++++++++-------------------
>>   1 file changed, 67 insertions(+), 66 deletions(-)
>>
> 


