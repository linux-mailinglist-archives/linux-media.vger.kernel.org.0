Return-Path: <linux-media+bounces-59300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCL8IYGS6Gl9MgIAu9opvQ
	(envelope-from <linux-media+bounces-59300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:18:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEB443DA7
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52BF5301704E
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B62D3C198C;
	Wed, 22 Apr 2026 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLQZJ+1k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D33F1DF256;
	Wed, 22 Apr 2026 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849529; cv=none; b=FoSj3Nv0cQKCSPfP6/5+guIJfDbg5R0V1CFAHRoltVk4DEPFjeds/D4DQOAXv8ZPjsBwWCNBxDaRsQ6Do8uB8gn31knUOZ8h6qye4P5nBMF1esS6Pk1Np6A4fGviNp3axHK8JYWdmXaf8quxB0M7uQuqFoIze9Xgrq6N73m+hGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849529; c=relaxed/simple;
	bh=K8pcoY2WgjFw92Yz0dOk8n5L/ZPIsmzw+Zb1EkmEH/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nBPvIP8xYYvHn6Gi3atrvlD+WleH6SRpfMdCYmDqH13ULnWi2L2fMCDu5OUFQZSuXXQQHnZLf7Y615hoElaSZXblc1OxUZzeV5ft8OTpvbQfauuRHgwhr3ozmxh1ZuGBrINLjVmPs2jsihp2p3feR+ZGhE2ybs7xZ82P5Gy/Vgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLQZJ+1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7191C19425;
	Wed, 22 Apr 2026 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776849528;
	bh=K8pcoY2WgjFw92Yz0dOk8n5L/ZPIsmzw+Zb1EkmEH/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LLQZJ+1kSY/o60d6TTX7DKYBkuuD8VNc4XiuneZZhwI/K3F3/KYPHPlKbb/7y41F0
	 gW1geJvdRNu0QQF2ij+TdA1Ko6jujZCK/cQOjIaqyw1+Do9f0iniyArT4lNax/LEZV
	 hM6b/dNMUWVUMQmA71kXlXPG59YnQYZW9oqBVyfSD41/HPP2mLSWqE4thBh30kYWAe
	 ++lrrvZfP3q9VR1MrQ0mrIYbQIm5mwvKy5DbT3+ooWNPnWVuklVR8qXC5xAHiG3bju
	 uV+jNi6tXJJiBLTXufIj9S5p9mECdkVaQQ3Uo/5V7pf2LGjpD8hv6xWI7SxI3bKhVG
	 N/ctHrkaSbPjA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>, Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
	ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
In-Reply-To: <20260421121004.GA3611611@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us> <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
Date: Wed, 22 Apr 2026 14:48:37 +0530
Message-ID: <yq5aik9jcpzm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59300-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aneesh.kumar@kernel.org,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5AEB443DA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Tue, Apr 21, 2026 at 01:53:31PM +0200, Jiri Pirko wrote:
>> >> You reach there when is_swiotlb_force_bounce(dev) is true and
>> >> DMA_ATTR_CC_SHARED is set. What am I missing?
>> >>
>> >
>> >So a swiotlb_force_bounce will not use swiotlb bouncing if
>> >DMA_ATTR_CC_SHARED is set ? 
>> 
>> Correct. Bouncing does not make sense in this case, as shared memory is
>> already being mapped.
>
> It is a little bit mangled, there are many reasons force_swiotlb can
> be set, but we loose them as it flows through - swiotlb_init()
> just has a simple SWIOTLB_FORCE
>
> Ideally DMA_ATTR_CC_SHARED would skip swiotlb only if it is being
> selected for CC reasons. For instance if you have the swiotlb force
> command line parameter I would still expect it bounce shared memory.
>
> Arguably I think this arch flow is misdesigned, the
> is_swiotlb_force_bounce() should not be used for CC. dma_capable() is
> the correct API to check if the device can DMA to the presented
> address, and it will trigger swiotlb_map() just the same without
> creating this gap.
>
> Jason

Something like this?

static inline dma_addr_t dma_direct_map_phys(struct device *dev,
		phys_addr_t phys, size_t size, enum dma_data_direction dir,
		unsigned long attrs, bool flush)
{
	dma_addr_t dma_addr;

	if (is_swiotlb_force_bounce(dev)) {
		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
			return DMA_MAPPING_ERROR;

		return swiotlb_map(dev, phys, size, dir, attrs);
	}

	if (attrs & DMA_ATTR_MMIO) {
		dma_addr = phys;
		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
			goto err_overflow;
		goto dma_mapped;
	} else if (attrs & DMA_ATTR_CC_SHARED) {
		dma_addr = phys_to_dma_unencrypted(dev, phys);
	} else {
		dma_addr = phys_to_dma_encrypted(dev, phys);
	}

	if (unlikely(!dma_capable(dev, dma_addr, size, true, attrs)) ||
	    dma_kmalloc_needs_bounce(dev, size, dir)) {
		if (is_swiotlb_active(dev) &&
		    !(attrs & DMA_ATTR_REQUIRE_COHERENT))
			return swiotlb_map(dev, phys, size, dir, attrs);
		goto err_overflow;
	}

dma_mapped:
	if (!dev_is_dma_coherent(dev) &&
	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
		arch_sync_dma_for_device(phys, size, dir);
		if (flush)
			arch_sync_dma_flush();
	}
	return dma_addr;

and dma_capable() now does
static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
		bool is_ram, unsigned long attrs)
{
....

	/*
	 * if phys addr attribute is encrypted but the
	 * device is forcing an encrypted dma addr
	 */
	if (!(attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
		return false;
...

}


-aneesh

