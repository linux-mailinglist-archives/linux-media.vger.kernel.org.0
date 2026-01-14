Return-Path: <linux-media+bounces-50700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB1D1F026
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 14:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A692F30C4302
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B69E39A7F5;
	Wed, 14 Jan 2026 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="X0ks54VN"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88099399A79;
	Wed, 14 Jan 2026 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396282; cv=pass; b=shhH+EVKGqcYrspzddN9G34XwCkPvUFkPQzbwOl9TRjVYZv6U4CT4NmXmE5FdHN6Wli20qjKJDuKAw3gLq01bVR4kwqDSM1iYYzTByPcR2uO8feVtf0FPLbBOMYQxzZLeS73u5dF6FN5qHFvEjCm5tMMIxQIRxV6XMW94OkANlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396282; c=relaxed/simple;
	bh=hEBx7s5oIuzjVK0WdxnRyJ/sv3t+07BmPx76PT3AJmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udXH7Sufn6Ss7obdhp/uXzgnTThtmKmULDJgqVZp+B7hRzZ9WX6AhhCLItzZtYNw784ExOat45YzADHbYtJMKF3d8P/tRdtmAtPwALJht4s9YybE0MDHXERhdF8B5QGyiLLh50TOehJYAOhWUoWfMmkw8xksdZy6n3WfWxlOEDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=X0ks54VN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1768396254; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fzE7FgxAedH8uxX0VAeiDhzKipXVqRZ2kiSaXoud202thrp2+5O0CXyk+xIlkiRZd5FelhJ7OfDbg7xjDiPjBQHnMrFQA4eg5yMHe2vJFDsPFTzStZaMYkZ+0a6VwBMQrDybVis6CkxQNWYIKk2FvDI+mq8EJsjL31tFIBxCJhE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768396254; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4hNT9bMCTFBIbSQvqXd0vDReNnQZh/9obugkKAGLY2o=; 
	b=Z3ypKbyrmN4UqyBQ/OpBF0Xt+PTnoN3lrsmi+bnS58U5VogPFE79P61hocJTfKf5V4yeQUd9Dfy44nOaW/WC25OHnrTWbgoBS3LtfodwTnaOr6emvOzBy7xsnqNFLv3pUEjJzX10wSd/uftfocWF4QyMhk9grdCDQXvxtzl1+lU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768396254;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4hNT9bMCTFBIbSQvqXd0vDReNnQZh/9obugkKAGLY2o=;
	b=X0ks54VN6tfrUJdG2MPakQ5UFB3h6zKvKNfKKUpWpfUgWbgTHNnEgeD2+PI0HybV
	/b/+j9T6abRwqDw2PyUsCs8QMYnRBo+QkfQoyl0BFB0gA9BjsbvJnHM3TbfTefcK6+5
	tNFmo4rlMi7g8x4CgqPkwptI/h8vsuTzlNYwEVbs=
Received: by mx.zohomail.com with SMTPS id 1768396253114813.88687353656;
	Wed, 14 Jan 2026 05:10:53 -0800 (PST)
Message-ID: <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
Date: Wed, 14 Jan 2026 14:10:48 +0100
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
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <aWeTQ50DOtntcniN@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 14/01/2026 à 13:59, Will Deacon a écrit :
> On Tue, Jan 13, 2026 at 05:25:38PM +0100, Benjamin Gaignard wrote:
>> Le 13/01/2026 à 17:10, Will Deacon a écrit :
>>> Hi Benjamin,
>>>
>>> Thanks for posting a v11.
>>>
>>> On Wed, Jan 07, 2026 at 11:09:53AM +0100, Benjamin Gaignard wrote:
>>>> The Verisilicon IOMMU hardware block can be found in combination
>>>> with Verisilicon hardware video codecs (encoders or decoders) on
>>>> different SoCs.
>>>> Enable it will allow us to use non contiguous memory allocators
>>>> for Verisilicon video codecs.
>>>> If both decoder and this iommu driver are compiled has modules
>>>> there is undefined symboles issues so this iommu driver could
>>>> only be compiled has built-in.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>> ---
>>>> changes in version 11:
>>>> - Fix dependency issue when decoder driver is build as module.
>>>>
>>>>    drivers/iommu/Kconfig     |  11 +
>>>>    drivers/iommu/Makefile    |   1 +
>>>>    drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
>>>>    include/linux/vsi-iommu.h |  21 +
>>>>    4 files changed, 841 insertions(+)
>>>>    create mode 100644 drivers/iommu/vsi-iommu.c
>>>>    create mode 100644 include/linux/vsi-iommu.h
>>> Based on your reply to v9:
>>>
>>> https://lore.kernel.org/all/0eff8b1a-c45f-47b1-a871-59f4a0101f0f@collabora.com/
>>>
>>> I took another look at this to see whether it had changed significantly
>>> from v6 when compared to the rockchip driver. Sadly, they still look
>>> very similar to me and I continue to suspect that the hardware is a
>>> derivative. I really don't understand why having a shared implementation
>>> of the default domain ops is difficult or controversial. Have you tried
>>> to write it?
>>>
>>> However, given that nobody from the Rockchip side has contributed to the
>>> discussion and you claim that this is a distinct piece of IP, I don't
>>> want to block the merging of the driver by leaving the conversation
>>> hanging.
>>>
>>> There is still one thing I don't understand (which, amusingly, the
>>> rockchip driver doesn't seem to suffer from):
>>>
>>>> +static void vsi_iommu_flush_tlb_all(struct iommu_domain *domain)
>>>> +{
>>>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>>>> +	struct list_head *pos;
>>>> +	unsigned long flags;
>>>> +
>>>> +	spin_lock_irqsave(&vsi_domain->lock, flags);
>>>> +
>>>> +	list_for_each(pos, &vsi_domain->iommus) {
>>>> +		struct vsi_iommu *iommu;
>>>> +		int ret;
>>>> +
>>>> +		iommu = list_entry(pos, struct vsi_iommu, node);
>>>> +		ret = pm_runtime_resume_and_get(iommu->dev);
>>>> +		if (ret < 0)
>>>> +			continue;
>>>> +
>>>> +		spin_lock(&iommu->lock);
>>>> +
>>>> +		writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
>>>> +		writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
>>>> +
>>>> +		spin_unlock(&iommu->lock);
>>>> +		pm_runtime_put_autosuspend(iommu->dev);
>>>> +	}
>>>> +
>>>> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
>>>> +}
>>> [...]
>>>
>>>> +static const struct iommu_ops vsi_iommu_ops = {
>>>> +	.identity_domain = &vsi_identity_domain,
>>>> +	.release_domain = &vsi_identity_domain,
>>>> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
>>>> +	.of_xlate = vsi_iommu_of_xlate,
>>>> +	.probe_device = vsi_iommu_probe_device,
>>>> +	.release_device = vsi_iommu_release_device,
>>>> +	.device_group = generic_single_device_group,
>>>> +	.owner = THIS_MODULE,
>>>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>>>> +		.attach_dev		= vsi_iommu_attach_device,
>>>> +		.map_pages		= vsi_iommu_map,
>>>> +		.unmap_pages		= vsi_iommu_unmap,
>>>> +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
>>> This has no callers and so your unmap routine appears to be broken.
>> It is a leftover of previous attempt to allow video decoder to clean/flush
>> the iommu by using a function from the API.
>> Now it is using vsi_iommu_restore_ctx().
>> I while remove it in version 12.
> Don't you still need some invalidation on the unmap path?

In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().
That clear BIT(0) so the hardware knows the page is invalid.
Do I have miss something here ?

Benjamin

>
> Will
>

