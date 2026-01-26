Return-Path: <linux-media+bounces-51526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJhHLg8ud2kvdAEAu9opvQ
	(envelope-from <linux-media+bounces-51526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:04:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3585BD3
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE554300DA6D
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E29D3033D9;
	Mon, 26 Jan 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="k+ETJadj"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D2823DD;
	Mon, 26 Jan 2026 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418233; cv=pass; b=IBbPcQJOBnPrEtpBLDlOTZh0cKON5cHZl/pjqcHV+ESSPbP8faXqlacyiZEIEWNa56tFSzYubKCUMLcAD3vQz65bjYPTqcCbfb8jHG4cd4pRIz0RAYf9KtEF8bThb1DghJxaWa8lZH5aTswxF1szwlrncmNfsZzleGEv2Oy7ADU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418233; c=relaxed/simple;
	bh=TGimY2g/rPo873RPmUyXIir1ih5AhpTHPgfuuvqhDKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNt2u2ot8/kv6vpaV6d6+P2BM97uC6Zpm+U72ImBD98sUCqxmCj8zVUox/EPP4hDFzN5X7xHdlgLLDGs1r/6LQqX+1nyNiuXBZ8wPRLp80JrKsyZhN1STj3VeF5E8pSKeBfawxbpHTCfYZwZL8H3V0U2TcoKsh0rZ2SKbVCLKYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=k+ETJadj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1769418206; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lfh/eRNm7h3SKUFm2ewA6a/EsO2tqg1/xGQ+4lMYt1NSSKBmFa5Yo7Y0T98Fohkna4IETqDWDFUGU6JlBuzIGWRBeTuXqaUcejl+G06NT+cw+t6j2WcgdhtNfuMC+98o5/k6OJ7PGTbF6LPRaZurovzQTNKEilwh54OxdWzw4rY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769418206; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Szw4w1kPWz+z204rfjqE2SzFPSa+7l4i9w+mPzkshVs=; 
	b=HS+DgwvModzf5uvt0IgC5Gzq2xsRBnKY56Vb9GkgQOvXigBYCvEjIyhhohOsVUeRg54tcKh2LemWXFt7OTcO7nM9qefvhFi2zh4+ucq4VEIfz4jS3e8SN/S8SaAKA763hppE4FRhgnPH47hdlrV1+Mr3ddwj6n/1mnbOzn7IPB4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769418206;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Szw4w1kPWz+z204rfjqE2SzFPSa+7l4i9w+mPzkshVs=;
	b=k+ETJadj+tQfi4J6Ht/P5SsTGGRtFvu9K2hXalxlFZNnQJSLk9grhNLWdip5NIwC
	S1UYSrbLFgKI/53E7laWLIsCv2TSNC8htoWjQHbF8dFzxz0r5xvbbY55GSGQlEzHUw8
	OyROJfVgetbJCMyPXxdlEpb+3AO+h+1jPwiALJGc=
Received: by mx.zohomail.com with SMTPS id 1769418204273347.0095929584735;
	Mon, 26 Jan 2026 01:03:24 -0800 (PST)
Message-ID: <8fd2c508-cbe9-4050-ba02-85b22fcff10d@collabora.com>
Date: Mon, 26 Jan 2026 10:03:19 +0100
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
 <b8f43fe8-3e07-4d98-a50d-817c31370710@collabora.com>
 <aXDL2JH_4RCDmAJv@willie-the-truck>
 <4b33b50f-f0c3-4db8-b394-dd2d4d6e3a55@collabora.com>
 <aXOsdlGMVzhHOrUr@willie-the-truck>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <aXOsdlGMVzhHOrUr@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51526-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 59D3585BD3
X-Rspamd-Action: no action


Le 23/01/2026 à 18:14, Will Deacon a écrit :
> On Wed, Jan 21, 2026 at 02:50:18PM +0100, Benjamin Gaignard wrote:
>> Le 21/01/2026 à 13:51, Will Deacon a écrit :
>>> On Mon, Jan 19, 2026 at 03:03:44PM +0100, Benjamin Gaignard wrote:
>>>>>>>>>> +static const struct iommu_ops vsi_iommu_ops = {
>>>>>>>>>> +	.identity_domain = &vsi_identity_domain,
>>>>>>>>>> +	.release_domain = &vsi_identity_domain,
>>>>>>>>>> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
>>>>>>>>>> +	.of_xlate = vsi_iommu_of_xlate,
>>>>>>>>>> +	.probe_device = vsi_iommu_probe_device,
>>>>>>>>>> +	.release_device = vsi_iommu_release_device,
>>>>>>>>>> +	.device_group = generic_single_device_group,
>>>>>>>>>> +	.owner = THIS_MODULE,
>>>>>>>>>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>>>>>>>>>> +		.attach_dev		= vsi_iommu_attach_device,
>>>>>>>>>> +		.map_pages		= vsi_iommu_map,
>>>>>>>>>> +		.unmap_pages		= vsi_iommu_unmap,
>>>>>>>>>> +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
>>>>>>>>> This has no callers and so your unmap routine appears to be broken.
>>>>>>>> It is a leftover of previous attempt to allow video decoder to clean/flush
>>>>>>>> the iommu by using a function from the API.
>>>>>>>> Now it is using vsi_iommu_restore_ctx().
>>>>>>>> I while remove it in version 12.
>>>>>>> Don't you still need some invalidation on the unmap path?
>>>>>> In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().
>>>>> But that just writes an invalid descriptor and doesn't appear to invalidate
>>>>> the TLB at all.
>>>>>
>>>>>> That clear BIT(0) so the hardware knows the page is invalid.
>>>>>> Do I have miss something here ?
>>>>> Yes, the TLB structure needs to be invalidated so that the page-table
>>>>> walker sees the new value that you have written in memory.
>>>>>
>>>>> The rockchip driver gets this correct...
>>>> Rockchip hardware have a ZAP_ONE_LINE register which didn't exist on Verisilicon
>>>> hardware.
>>> Presumably you have some sort of Verisilicon datasheet or downstream driver
>>> from which you can infer the TLB invalidation runes?
>> I have only this downstream driver:
>> https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c
>> No datasheet...
>>
>>>> I have tried to use VSI_MMU_BIT_FLUSH on VSI driver after unmapping iova
>>>> but it doesn't work.
>>> What do you mean by "doesn't work"? If it works without doing any
>>> invalidation at all, then it's very peculiar that adding the invalidation
>>> would introduce issues.
>> I mean VSI_MMU_BIT_FLUSH register can't be used to invalid the TLB.
>> I think the hardware iterates over the pages tables in memory and
>> check the valid/invalid bit.
> I bet it doesn't: that would be horrible for performance.
>
> The hardware clearly has TLB invalidation support, as the downstream driver
> that you linked above implements av1_iommu_flush_tlb_all() to poke it.
> If the hardware has a TLB, then unmapping a page-table means you need to:
>
> 1. Clear the valid bit from the descriptor in memory
> 2. Have some sort of memory barrier
> 3. Invalidate the TLB
> 4. Wait for the invalidation to complete

That exactly what I had tried to do by calling vsi_iommu_flush_tlb_all() (minux the lock)
after calling vsi_iommu_unmap_iova() in vsi_iommu_unmap() but that doesn't work
and even make the system crash sometimes.

Benjamin

>
> All IOMMUs tend to work like that and I don't think this one is any
> different.
>
> Will
>

