Return-Path: <linux-media+bounces-52858-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLn0G33rkmlSzwEAu9opvQ
	(envelope-from <linux-media+bounces-52858-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:03:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4642142330
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B66F30164AA
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE742EA168;
	Mon, 16 Feb 2026 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="aC4f98GA"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E577713AD26;
	Mon, 16 Feb 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236211; cv=pass; b=sVyk3thg61Cot9t0Qkki83BDnAIdV6oiUP5zBDKcijgUL+icf5p6WZWZZJpVQWvS8bc91QTOIojAq2/ta4H9nTBic2irUCYv6ziQD8ffDLp650X+B7gf4thzhZZj6ONWs7K3qbSybloMWZdQCwRVi6Flf0o0t/2eYVOSdZaoNrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236211; c=relaxed/simple;
	bh=0njwgFrayaNC0T62T6DsfTPsgsXiWi7cnkHw5XpgQyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpUGipCmYZs8zoUjDB8ajSuCdeHArmocCq/MsM5tEGnfIURou4BgAYPHA1dX2S3OtQ+0Foa/UyeEbqKyRZlGxH8296fAzuAH7EM3u1cMt9PgVJ+vqA6R/6Bg42VuLYXR84zHa7e8qpsd6yEDd9V2jqQE+VWioNg35GiPp2Io+tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=aC4f98GA; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1771236187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GeW8WqUGujtHQ7fGuMJvSj4yMhhoojmetQb2FFSqHun6vPZrVhgIJTj7EdTFQt6czPmKT0FFCLHghSM4IyIJEfXLn1PpYg7tKa3GI1GStT1NOIBQ1E1H95gOOYUPvu2y8F+URyKthpAutq7WLkL/PWmaOI+mloYF8QRfPslDShM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771236187; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ljL0KslWAnfHi4SgTp5Lc48RlHOMSJjmrYiSfJnyksA=; 
	b=JBzTzy7Oq15p36DSt1JDx7dvNI8a2ijRnk0LzWEFAzjVXGNVzSSewo9yrYZW/NECaowKnnb0EnZgXl17E6GGp8mcAlQXR87KyjtfSOiyeVXeSg2A4tq+BLbPbBNENN2yJEm8yoDVcLaxcV8QYp2z+EEt6DO9GlsnE0Kq4H77enc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771236187;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ljL0KslWAnfHi4SgTp5Lc48RlHOMSJjmrYiSfJnyksA=;
	b=aC4f98GATAkxV1cD6g89rK/6+jKkPSZPUiSszOX5kTMz1mYdnvKWusyZhvctbhtU
	8pV+eAqCSP6mzT+f9iOaCXxtnr/+KrQiWf0hCupBIvPVLyQEdeeRAzPJxMbWo0nb8ct
	Y3wAEqSXj3X+lc1NuR9T7QqR91mkC6eUsN2GHvT0=
Received: by mx.zohomail.com with SMTPS id 1771236185662100.11990264353267;
	Mon, 16 Feb 2026 02:03:05 -0800 (PST)
Message-ID: <5f8401ba-b7fa-4fa3-850a-f815529b803c@collabora.com>
Date: Mon, 16 Feb 2026 11:03:00 +0100
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
References: <aWZui-rn5RDPwpEO@willie-the-truck>
 <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
 <aWeTQ50DOtntcniN@willie-the-truck>
 <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
 <aW4kb5EbxbrhTOxK@willie-the-truck>
 <b8f43fe8-3e07-4d98-a50d-817c31370710@collabora.com>
 <aXDL2JH_4RCDmAJv@willie-the-truck>
 <4b33b50f-f0c3-4db8-b394-dd2d4d6e3a55@collabora.com>
 <aXOsdlGMVzhHOrUr@willie-the-truck>
 <8fd2c508-cbe9-4050-ba02-85b22fcff10d@collabora.com>
 <aXd4CXE0fqWiKJXl@willie-the-truck>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <aXd4CXE0fqWiKJXl@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52858-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E4642142330
X-Rspamd-Action: no action


Le 26/01/2026 à 15:19, Will Deacon a écrit :
> On Mon, Jan 26, 2026 at 10:03:19AM +0100, Benjamin Gaignard wrote:
>> Le 23/01/2026 à 18:14, Will Deacon a écrit :
>>> On Wed, Jan 21, 2026 at 02:50:18PM +0100, Benjamin Gaignard wrote:
>>>> Le 21/01/2026 à 13:51, Will Deacon a écrit :
>>>>> On Mon, Jan 19, 2026 at 03:03:44PM +0100, Benjamin Gaignard wrote:
>>>>>>>>>>>> +static const struct iommu_ops vsi_iommu_ops = {
>>>>>>>>>>>> +	.identity_domain = &vsi_identity_domain,
>>>>>>>>>>>> +	.release_domain = &vsi_identity_domain,
>>>>>>>>>>>> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
>>>>>>>>>>>> +	.of_xlate = vsi_iommu_of_xlate,
>>>>>>>>>>>> +	.probe_device = vsi_iommu_probe_device,
>>>>>>>>>>>> +	.release_device = vsi_iommu_release_device,
>>>>>>>>>>>> +	.device_group = generic_single_device_group,
>>>>>>>>>>>> +	.owner = THIS_MODULE,
>>>>>>>>>>>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>>>>>>>>>>>> +		.attach_dev		= vsi_iommu_attach_device,
>>>>>>>>>>>> +		.map_pages		= vsi_iommu_map,
>>>>>>>>>>>> +		.unmap_pages		= vsi_iommu_unmap,
>>>>>>>>>>>> +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
>>>>>>>>>>> This has no callers and so your unmap routine appears to be broken.
>>>>>>>>>> It is a leftover of previous attempt to allow video decoder to clean/flush
>>>>>>>>>> the iommu by using a function from the API.
>>>>>>>>>> Now it is using vsi_iommu_restore_ctx().
>>>>>>>>>> I while remove it in version 12.
>>>>>>>>> Don't you still need some invalidation on the unmap path?
>>>>>>>> In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().
>>>>>>> But that just writes an invalid descriptor and doesn't appear to invalidate
>>>>>>> the TLB at all.
>>>>>>>
>>>>>>>> That clear BIT(0) so the hardware knows the page is invalid.
>>>>>>>> Do I have miss something here ?
>>>>>>> Yes, the TLB structure needs to be invalidated so that the page-table
>>>>>>> walker sees the new value that you have written in memory.
>>>>>>>
>>>>>>> The rockchip driver gets this correct...
>>>>>> Rockchip hardware have a ZAP_ONE_LINE register which didn't exist on Verisilicon
>>>>>> hardware.
>>>>> Presumably you have some sort of Verisilicon datasheet or downstream driver
>>>>> from which you can infer the TLB invalidation runes?
>>>> I have only this downstream driver:
>>>> https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c
>>>> No datasheet...
>>>>
>>>>>> I have tried to use VSI_MMU_BIT_FLUSH on VSI driver after unmapping iova
>>>>>> but it doesn't work.
>>>>> What do you mean by "doesn't work"? If it works without doing any
>>>>> invalidation at all, then it's very peculiar that adding the invalidation
>>>>> would introduce issues.
>>>> I mean VSI_MMU_BIT_FLUSH register can't be used to invalid the TLB.
>>>> I think the hardware iterates over the pages tables in memory and
>>>> check the valid/invalid bit.
>>> I bet it doesn't: that would be horrible for performance.
>>>
>>> The hardware clearly has TLB invalidation support, as the downstream driver
>>> that you linked above implements av1_iommu_flush_tlb_all() to poke it.
>>> If the hardware has a TLB, then unmapping a page-table means you need to:
>>>
>>> 1. Clear the valid bit from the descriptor in memory
>>> 2. Have some sort of memory barrier
>>> 3. Invalidate the TLB
>>> 4. Wait for the invalidation to complete
>> That exactly what I had tried to do by calling vsi_iommu_flush_tlb_all() (minux the lock)
>> after calling vsi_iommu_unmap_iova() in vsi_iommu_unmap() but that doesn't work
>> and even make the system crash sometimes.
> Then it sounds like you have some debugging to do...
>
> I don't think we should elide the TLB invalidation just because you
> couldn't get it to work.

Hi Will,

I have send a v13 of this patchset where I had included Joerg's comments.
V13 doesn't change how the TLB invalidation is done.
I have look everywhere and there is no additional bit(s) or register(s) to
do what you ask.
V13 is update to date and rebased on v6.19. Unless I receive new documents
or specifications about the hardware I don't plan to work on this anymore.

Regards,
Benjamin

>
> Will
>

