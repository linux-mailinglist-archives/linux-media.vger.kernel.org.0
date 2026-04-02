Return-Path: <linux-media+bounces-57913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJquCmEAzmntkAYAu9opvQ
	(envelope-from <linux-media+bounces-57913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 07:36:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9246638408F
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 07:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 173C330774EF
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 05:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F5636C0DC;
	Thu,  2 Apr 2026 05:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p8XIiW60"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBD1EFFA1
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 05:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108142; cv=none; b=p9Rw5Y/PERwVrjXkpfsKRfk6dDd35kxBzcFetwgAt5D7GoV3Op3S1ZyaDq/TD9x2Q8qHBKul3S9uqcsa47p06KhOdxKA3YwNRdZOrkzn/xyZBOi+OEm6pe2obWdO1KsCq2OHwsPiyXDOoy1qkli5KhlG6XpJysQLRs507Vannak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108142; c=relaxed/simple;
	bh=Jsp3hvzWZmL04lh2Nu+ptJjapaIB0FyHUdyBhiCrUe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=iQTgUzrWmXbVAolvUpVvkRUzjXmLYWTKxeoszIBIncIpnhJ/CQoMVi7CuybKRhhtoVMRLcDmns5tJ6X4hs17mgpgaLp4DXeIJuvcOT2XnU9vTdC2XBrABA6rVVbqMAD6XPIpyp3WkpndvXYYdtkTcUAJ15buwHqbqW/D7OC/5D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=p8XIiW60; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260402053531euoutp01bd971dc9bcf5df4882091ff1e0a8b28a~ic3C0a97z1354013540euoutp01_
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 05:35:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260402053531euoutp01bd971dc9bcf5df4882091ff1e0a8b28a~ic3C0a97z1354013540euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1775108131;
	bh=a2ALkW+kbFi61LCOo/jIn51RH7T6kZmUYLT9OKC04kY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=p8XIiW60yygB4duGaUeoZzDfligbEwHtpLxRKPqjeP2cqMQWJ+aTAA2Z0f9PB4ogv
	 WDtvy6XPjlMBFeX6dzvhvNPWVy42IetKV0iqUCf17GbTcsP+CcfJqQS7K4Q0Ue+mmb
	 7tV4tDH1JCgqUAho30DqQ2/fTx8iM0loupZzjumw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260402053530eucas1p1f0754eb1edb4acdb0d52b31d9ff6c4f9~ic3B75IsG1210612106eucas1p1C;
	Thu,  2 Apr 2026 05:35:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260402053528eusmtip1ac753cbaaed704e10d0c4a64bfd0adad~ic3A3bQA60232302323eusmtip1d;
	Thu,  2 Apr 2026 05:35:28 +0000 (GMT)
Message-ID: <f6de2c2d-132c-4344-9b58-6e6ef1eb15a6@samsung.com>
Date: Thu, 2 Apr 2026 07:35:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly shared/decrypted memory
To: Sumit Semwal <sumit.semwal@linaro.org>, Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
	tjmercier@google.com, christian.koenig@amd.com, robin.murphy@arm.com,
	jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com,
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAO_48GEUXpcFBiyJAMgTcGPSq56-mZ0qnO3FrFRM2LoGd8W6HA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260402053530eucas1p1f0754eb1edb4acdb0d52b31d9ff6c4f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260402044147eucas1p25971b90eb6aa1ef03a2a1136d812f039
X-EPHeader: CA
X-CMS-RootMailID: 20260402044147eucas1p25971b90eb6aa1ef03a2a1136d812f039
References: <20260325192352.437608-1-jiri@resnulli.us>
	<CGME20260402044147eucas1p25971b90eb6aa1ef03a2a1136d812f039@eucas1p2.samsung.com>
	<CAO_48GEUXpcFBiyJAMgTcGPSq56-mZ0qnO3FrFRM2LoGd8W6HA@mail.gmail.com>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-57913-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,nvidia.com:email,samsung.com:dkim,samsung.com:mid,resnulli.us:email]
X-Rspamd-Queue-Id: 9246638408F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 06:41, Sumit Semwal wrote:
> On Thu, 26 Mar 2026 at 00:53, Jiri Pirko <jiri@resnulli.us> wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
>> run with private/encrypted memory which creates a challenge
>> for devices that do not support DMA to it (no TDISP support).
>>
>> For kernel-only DMA operations, swiotlb bounce buffering provides a
>> transparent solution by copying data through shared memory.
>> However, the only way to get this memory into userspace is via the DMA
>> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
>> the use of the memory to a single DMA device, and is incompatible with
>> pin_user_pages().
>>
>> These limitations are particularly problematic for the RDMA subsystem
>> which makes heavy use of pin_user_pages() and expects flexible memory
>> usage between many different DMA devices.
>>
>> This patch series enables userspace to explicitly request shared
>> (decrypted) memory allocations from new dma-buf system_cc_shared heap.
>> Userspace can mmap this memory and pass the dma-buf fd to other
>> existing importers such as RDMA or DRM devices to access the
>> memory. The DMA API is improved to allow the dma heap exporter to DMA
>> map the shared memory to each importing device.
> Thank you for the patch series, it looks good to me.
>
> Marek, if you are ok, please could you take it through your tree, with my
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

I've applied both patches to dma-mapping-for-next. Thanks!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


