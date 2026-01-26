Return-Path: <linux-media+bounces-51577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB6VIo5+d2m9hgEAu9opvQ
	(envelope-from <linux-media+bounces-51577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 15:47:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3289189B4D
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 15:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF18E301705D
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 14:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BEF2FF151;
	Mon, 26 Jan 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="IvusYAoC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077B155757;
	Mon, 26 Jan 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438845; cv=pass; b=tjeJgcrY/zMY610u/SN/IkGGXM/4YBUrSd/ULq2GzafedJW9Rvyyqviip+gNFYr7sAxYq4BKvwxsWsVaHnpNNi1KEMIJIpXewaprmMcHpZY34MGVSGuOhWNc0OfIeYysFPE12+6egUz7pgA5NSeg8kokxoo0mBdxweQFoo55IX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438845; c=relaxed/simple;
	bh=ud1/yhum8fSasYKC+1JF/nMd2KhAyqTk3cYwbNVA2M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axkqmxGbCV5jy5NXQ36GMxsVqNwLWLSYyDNMcnrKHhib66eyNgQ2Ahb6Eju0A9PriOrbBIy55ssVjKjsrgTlZYUoKIBwKqFMB171shZ8up3WQ8k/zrdekJysDm75+rpy/QCmscLJhy6ESmx+D+oxGdWbLSiogBXspyik+KNph0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=IvusYAoC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1769438821; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g7QZPLCFJG4diwhCtqex30R/0irfBRYPcfcikzCMvM5y+qBwyhb+JayIBxqGW7JvwAYrweeMfHk/G5Ibg7SEBUOVS6obQ0fKM0f0m2unudjrI+lgbSWaUFNCxxYK8MtngNpONm+yeI4QamIGBoYF7DvlTWH+QneTCrJVEgLD1tU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769438821; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3ssbdTUHNW+Tvz0qqW64nDulngnRtrkUBEpIXz/HKr8=; 
	b=E7q2ZLT6DX7svkaJf5hOSioRIS1KZ1HEBBDZEl7E0oQciCVRnvxb6NR2xX2su5posSyc1l9ab7qmJy8rByyRMJhWL4vEUkuT+RQcTTaoH6j9TLnCYsyYrIPZ1J/MCx5bFM96uxBxlRzm6TlFedmZ157hBfdOoNYUk0yJu/kmzOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769438821;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3ssbdTUHNW+Tvz0qqW64nDulngnRtrkUBEpIXz/HKr8=;
	b=IvusYAoCZolGFd1MCeYIUo9SgrSLUSraYPZ1Ar5Ng5TYTHxH822JgqW6UooSAP5H
	8AsMs1ug4g22pPboNBT9+o+63xfFDZ1PEZos7kPOMlcOKjbHx1xPVO89/lWKuXdOR4W
	dDXmu8vNI6yIEGRDlgW8WUReRXMVEGHR1ah1kEtk=
Received: by mx.zohomail.com with SMTPS id 1769438819623670.7730935133327;
	Mon, 26 Jan 2026 06:46:59 -0800 (PST)
Message-ID: <ad70a610-f5a8-4091-8f32-e5c2caee9685@collabora.com>
Date: Mon, 26 Jan 2026 15:46:54 +0100
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51577-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[136.143.188.112:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3289189B4D
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

It is working but not in the order you expect.
TLB invalidation occurs before each decoding frames by calling vsi_iommu_restore_ctx().
After that decoder map all the needed buffer and perform decoding.

Benjamin

>
> Will
>

