Return-Path: <linux-media+bounces-56894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NlhJmW9wmlflQQAu9opvQ
	(envelope-from <linux-media+bounces-56894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:35:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0585931917B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13F6E3065F5E
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 16:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872853A63E1;
	Tue, 24 Mar 2026 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="ktXrz/zN"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60A939D6D2;
	Tue, 24 Mar 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369749; cv=pass; b=psLcpe4xQUxSmFoDXZjTlU0qe63SskyGnIau35HLFjUlHTRYVWNy0kreDo3VJX2H4nuydhhive4HG6gdgI5/BTtcAMtD+VLvRISl4pP6uxbSsGy5Az5KSf5QFgL3z3VYhX58RcXQmZ3xKR0T/8/zkJZ5q3SrkHTn1IRrxbbs6Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369749; c=relaxed/simple;
	bh=ecvPWdJIf11yJW5qL7+HunMgOS/3TYaaLwweMrzg/4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mb+UI3tvyNxJEevrGL6BfMZvgb6ZFiN2+AVqDOZH3Acy9aWhs2yIoyDu06ZjH26mqqEoXxFgGlkJa5Uka2Qjnsvei5lr3sMVFlxpvPHpG+eVGZ+MR4FBzm1j7a2ksH+9h+766NwoRBdyc8t7RmmjJQXtmqQR1Wnt+rFWCM3e2Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=ktXrz/zN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774369730; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eI9dMyF9lyTBU47/dNjJX4pYrTLhKGPqdtY8yk6tX5oCIOG4y8LQU+Jizxu15GDLuqrY4uqt2WHUvati3yXIze5uBujqYGwtFBY5H5mHTLvxHm2zWW4fFZ6BDhA9i4bMKiDSsiV2EQe5c+2jbNO0zcqCWfGLVuBX/wvk/vOyep8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774369730; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t5X3SqA0NrhU8AeVF5jet7aCXTAzqHe7Enn6xkPUCkU=; 
	b=FxFfhtT6NX1Ud2ZwoYXinAAViGyyojNLA8ssB0d+eFn4Pzwezq1KrBA29ZZljWyPz1GJpa/xtOLRWk2X5ckIfSFNgKTSzfohcI84yQORpBeVr0+Mp7RIbXmNb/vee68LX6S0+8MiV3G1t3ws2N7aG34q+3JSmjFLZUFpaSkEF18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774369730;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=t5X3SqA0NrhU8AeVF5jet7aCXTAzqHe7Enn6xkPUCkU=;
	b=ktXrz/zNw7uP6zfATbCvxvk+TSkFH+917YIv5Z8vAOMJP1mD9pejXujIsLd2f/wG
	U9hj/gBTuad5HtS3WfWSZJYkecZNVQZh/fpypDRSoKDwXQswj0oLcxOQb+V+l5bF0qK
	bIUZnFgrHbIgxYKBFxloim2OU3i+5tDxWK2YQUx4=
Received: by mx.zohomail.com with SMTPS id 1774369728573435.9502112379421;
	Tue, 24 Mar 2026 09:28:48 -0700 (PDT)
Message-ID: <e083e933-2746-4b26-ac33-3b32d362b28e@collabora.com>
Date: Tue, 24 Mar 2026 17:28:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/6] iommu: Add verisilicon IOMMU driver
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org
References: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
 <20260216095144.107356-4-benjamin.gaignard@collabora.com>
 <acKxzGk1Z541yoZ4@willie-the-truck>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <acKxzGk1Z541yoZ4@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56894-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 0585931917B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Le 24/03/2026 à 16:46, Will Deacon a écrit :
> On Mon, Feb 16, 2026 at 10:51:35AM +0100, Benjamin Gaignard wrote:
>> The Verisilicon IOMMU hardware block can be found in combination
>> with Verisilicon hardware video codecs (encoders or decoders) on
>> different SoCs.
>> Enable it will allow us to use non contiguous memory allocators
>> for Verisilicon video codecs.
>> If both decoder and this iommu driver are compiled has modules
>> there is undefined symboles issues so this iommu driver could
>> only be compiled has built-in.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   MAINTAINERS               |   8 +
>>   drivers/iommu/Kconfig     |  11 +
>>   drivers/iommu/Makefile    |   1 +
>>   drivers/iommu/vsi-iommu.c | 794 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/vsi-iommu.h |  21 +
>>   5 files changed, 835 insertions(+)
>>   create mode 100644 drivers/iommu/vsi-iommu.c
>>   create mode 100644 include/linux/vsi-iommu.h
> [...]
>
>> +static size_t vsi_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
>> +			      size_t size, size_t count, struct iommu_iotlb_gather *gather)
>> +{
>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>> +	dma_addr_t pte_dma, iova = (dma_addr_t)_iova;
>> +	unsigned long flags;
>> +	phys_addr_t pt_phys;
>> +	u32 dte;
>> +	u32 *pte_addr;
>> +	size_t unmap_size = 0;
>> +
>> +	spin_lock_irqsave(&vsi_domain->lock, flags);
>> +
>> +	dte = vsi_domain->dt[vsi_iova_dte_index(iova)];
>> +	/* Just return 0 if iova is unmapped */
>> +	if (!vsi_dte_is_pt_valid(dte))
>> +		goto unlock;
>> +
>> +	pt_phys = vsi_dte_pt_address(dte);
>> +	pte_addr = (u32 *)phys_to_virt(pt_phys) + vsi_iova_pte_index(iova);
>> +	pte_dma = pt_phys + vsi_iova_pte_index(iova) * sizeof(u32);
>> +	unmap_size = vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma, size);
>> +
>> +unlock:
>> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
>> +
>> +	return unmap_size;
>> +}
> I still think you need TLB invalidation here.
>
> I looked at the downstream code that you linked to and it litters the
> invalidation in the callers via mpp_iommu_flush_tlb(), which tend to
> invalidate _before_ starting an operation. That's very likely buggy and
> certainly not something we want upstream.
>
> The unmap routine should do the invalidation so that, when it returns,
> the pages really are unmapped from the device (assuming strict mode).
>
> I know you said that you tried to add invalidation here and it "didn't
> work", but that's not something I can really help you with.

I know you expect the hardware to work like that but that isn't not the case.
I spend quite long to try to found hidden bit(s) or an other way to do like
you want but I can't find any solution.
As you mention the downstream code suggest that the iommu can't invalidate
TLB in unmap routine so I don't see how to progress.
Maybe we should just admit that is how the hardware work.
This v13 has fixed the documentation so I don't plan to spend more time on this driver.

Benjamin

>
> Will

