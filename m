Return-Path: <linux-media+bounces-51062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E83D3AB34
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 15:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6354830128C3
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 14:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09742368294;
	Mon, 19 Jan 2026 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="gh5Q6yQs"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01824374186;
	Mon, 19 Jan 2026 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831456; cv=pass; b=WrmGRAH6kcoVIxxLljta3SLQBqOlvHnjxTYCE7PjXqqpphEzXBSC9XmczQs4zFe9Yt70Al9GLoUukerIlrCCgEeHOB2KPIFb5iitBVmMD7huQQEcbcCsVVdD5g21gC8l6lkQw5qi7jxWUjPdb8uhvEqzoqSORo0FIk2sFoEHzTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831456; c=relaxed/simple;
	bh=hc8cddGBd+8xBygWKrfl4ivDTlIyapPN8Xk1e8Cr47Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fdme0chQ07X+YX4j8zKIWZeS6HiASeugTy/yvVQwKA0tceSsYfntcNynyY/fChViKfnvgrgV76qV/jXHhpQrcjRoZgmBODLythOBGh2EJhXa2R393RpTbIiT0m6+sZiU9VURCJuzaWnYwLkfdzkrfCMXW2Vj8PZp53wiCLlWUOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=gh5Q6yQs; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1768831430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OtWYQut6leSWPEL7MijwgiwtnBCxJ1c6iM9L4KAFpH8/HU16Hirz7V7wVjgQqm8Mi1j0hpX/vEu2QEQJrCpjkSIDzGwpXYEd7yT+P3zcj3P4B3OFFnL5HIwOsp1ltkVHZ3MtLg7cxbCzG1faZ6j+Tom/sX2PfiDmlkrbZKqLiE4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768831430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q62aMHmAxbn1lufZfZAjq5qpqwqeRKoV0pt8VHtML4U=; 
	b=VodykyzYLP8iNG4jjO6iCA5x48oeK+d//LgOhvHxgg4A9NadNsC2pxoHcsSPHjaiYSk0bhEn/sSVKHg9UzjTDq7vtBCGGfRwy0wdIsMD0R9oyLAR7uqMr2cM7I6p3aTIlDx9LjGy0MCJFdptYB38QM3uC9W6Yam4m7v1Xpnih9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768831430;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=q62aMHmAxbn1lufZfZAjq5qpqwqeRKoV0pt8VHtML4U=;
	b=gh5Q6yQsaf2If7qeHRFmZm12lFFILlQp0LA9EDdG/bj2FvfqEKmIr1T2dBRqxkUc
	fXH18IRmY4pSWVLU/FrKZzEH1n6ZxyZ/I9IxCwJ3Y0BkZBKGkxOzKrJm6Y3/BAYabHJ
	O0QfYmGv8Le3T1BuLfigtAEQeLYJP3ByA7YMmyfQ=
Received: by mx.zohomail.com with SMTPS id 1768831429842878.6665974799806;
	Mon, 19 Jan 2026 06:03:49 -0800 (PST)
Message-ID: <b8f43fe8-3e07-4d98-a50d-817c31370710@collabora.com>
Date: Mon, 19 Jan 2026 15:03:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
 <aWeTQ50DOtntcniN@willie-the-truck>
 <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
 <aW4kb5EbxbrhTOxK@willie-the-truck>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <aW4kb5EbxbrhTOxK@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 19/01/2026 à 13:32, Will Deacon a écrit :
> On Wed, Jan 14, 2026 at 02:10:48PM +0100, Benjamin Gaignard wrote:
>> Le 14/01/2026 à 13:59, Will Deacon a écrit :
>>> On Tue, Jan 13, 2026 at 05:25:38PM +0100, Benjamin Gaignard wrote:
>>>> Le 13/01/2026 à 17:10, Will Deacon a écrit :
>>>>> Hi Benjamin,
>>>>>
>>>>> Thanks for posting a v11.
>>>>>
>>>>> On Wed, Jan 07, 2026 at 11:09:53AM +0100, Benjamin Gaignard wrote:
>>>>>> The Verisilicon IOMMU hardware block can be found in combination
>>>>>> with Verisilicon hardware video codecs (encoders or decoders) on
>>>>>> different SoCs.
>>>>>> Enable it will allow us to use non contiguous memory allocators
>>>>>> for Verisilicon video codecs.
>>>>>> If both decoder and this iommu driver are compiled has modules
>>>>>> there is undefined symboles issues so this iommu driver could
>>>>>> only be compiled has built-in.
>>>>>>
>>>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>>>> ---
>>>>>> changes in version 11:
>>>>>> - Fix dependency issue when decoder driver is build as module.
>>>>>>
>>>>>>     drivers/iommu/Kconfig     |  11 +
>>>>>>     drivers/iommu/Makefile    |   1 +
>>>>>>     drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
>>>>>>     include/linux/vsi-iommu.h |  21 +
>>>>>>     4 files changed, 841 insertions(+)
>>>>>>     create mode 100644 drivers/iommu/vsi-iommu.c
>>>>>>     create mode 100644 include/linux/vsi-iommu.h
>>>>> Based on your reply to v9:
>>>>>
>>>>> https://lore.kernel.org/all/0eff8b1a-c45f-47b1-a871-59f4a0101f0f@collabora.com/
>>>>>
>>>>> I took another look at this to see whether it had changed significantly
>>>>> from v6 when compared to the rockchip driver. Sadly, they still look
>>>>> very similar to me and I continue to suspect that the hardware is a
>>>>> derivative. I really don't understand why having a shared implementation
>>>>> of the default domain ops is difficult or controversial. Have you tried
>>>>> to write it?
>>>>>
>>>>> However, given that nobody from the Rockchip side has contributed to the
>>>>> discussion and you claim that this is a distinct piece of IP, I don't
>>>>> want to block the merging of the driver by leaving the conversation
>>>>> hanging.
>>>>>
>>>>> There is still one thing I don't understand (which, amusingly, the
>>>>> rockchip driver doesn't seem to suffer from):
>>>>>
>>>>>> +static void vsi_iommu_flush_tlb_all(struct iommu_domain *domain)
>>>>>> +{
>>>>>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>>>>>> +	struct list_head *pos;
>>>>>> +	unsigned long flags;
>>>>>> +
>>>>>> +	spin_lock_irqsave(&vsi_domain->lock, flags);
>>>>>> +
>>>>>> +	list_for_each(pos, &vsi_domain->iommus) {
>>>>>> +		struct vsi_iommu *iommu;
>>>>>> +		int ret;
>>>>>> +
>>>>>> +		iommu = list_entry(pos, struct vsi_iommu, node);
>>>>>> +		ret = pm_runtime_resume_and_get(iommu->dev);
>>>>>> +		if (ret < 0)
>>>>>> +			continue;
>>>>>> +
>>>>>> +		spin_lock(&iommu->lock);
>>>>>> +
>>>>>> +		writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
>>>>>> +		writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
>>>>>> +
>>>>>> +		spin_unlock(&iommu->lock);
>>>>>> +		pm_runtime_put_autosuspend(iommu->dev);
>>>>>> +	}
>>>>>> +
>>>>>> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
>>>>>> +}
>>>>> [...]
>>>>>
>>>>>> +static const struct iommu_ops vsi_iommu_ops = {
>>>>>> +	.identity_domain = &vsi_identity_domain,
>>>>>> +	.release_domain = &vsi_identity_domain,
>>>>>> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
>>>>>> +	.of_xlate = vsi_iommu_of_xlate,
>>>>>> +	.probe_device = vsi_iommu_probe_device,
>>>>>> +	.release_device = vsi_iommu_release_device,
>>>>>> +	.device_group = generic_single_device_group,
>>>>>> +	.owner = THIS_MODULE,
>>>>>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>>>>>> +		.attach_dev		= vsi_iommu_attach_device,
>>>>>> +		.map_pages		= vsi_iommu_map,
>>>>>> +		.unmap_pages		= vsi_iommu_unmap,
>>>>>> +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
>>>>> This has no callers and so your unmap routine appears to be broken.
>>>> It is a leftover of previous attempt to allow video decoder to clean/flush
>>>> the iommu by using a function from the API.
>>>> Now it is using vsi_iommu_restore_ctx().
>>>> I while remove it in version 12.
>>> Don't you still need some invalidation on the unmap path?
>> In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().
> But that just writes an invalid descriptor and doesn't appear to invalidate
> the TLB at all.
>
>> That clear BIT(0) so the hardware knows the page is invalid.
>> Do I have miss something here ?
> Yes, the TLB structure needs to be invalidated so that the page-table
> walker sees the new value that you have written in memory.
>
> The rockchip driver gets this correct...

Rockchip hardware have a ZAP_ONE_LINE register which didn't exist on Verisilicon
hardware.
I have tried to use VSI_MMU_BIT_FLUSH on VSI driver after unmapping iova
but it doesn't work.
So far calling dma_sync_single_for_device() seems to be enough to make iommu
and video decoder work together.

Regards,
Benjamin

> Will
>

