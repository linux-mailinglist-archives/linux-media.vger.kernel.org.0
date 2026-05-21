Return-Path: <linux-media+bounces-62535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOuZFjkvD2r+HQYAu9opvQ
	(envelope-from <linux-media+bounces-62535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 18:13:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2A5A8FFF
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 18:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E8A1318F865
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0874A367288;
	Thu, 21 May 2026 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEhNVt1G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB20364053;
	Thu, 21 May 2026 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377752; cv=none; b=HhsPsumepOrxv0pqYoAFqdHOrTh5NipZxar7DakpW6oESn36P7EULMdW6St2dfBpRCiDCrLoMjxZL9cv6OWxZVPdxogNp2YNnVAg0JyWeF0vXB9WiwGL78AwwDeqDJ5efHh269iRKnY7sxKsMjtW1v3OXWFl9XaJYQjOF4Bb1Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377752; c=relaxed/simple;
	bh=nTShFhtTFDx5K0LL6iQ8e4S3RlT5C2DB/RmwSrUra00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zfb99fY2S/r75DHNZvYI1sqJDVLyd9AVW+Ca9zf3OjnpL0MLyNg42UkeDmLvzRfXfkxTbKYrLHIdA7C2wo76hckq/QFBap/SW5GDYearvyo2YDvuthU+X9Ptbx2rYxi0q5BmUx5TM3Qja4zpewMeIFpXzta81m0sJ55R0Zfqfcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEhNVt1G; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBDC1F00A3B;
	Thu, 21 May 2026 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377751;
	bh=5PUD/3vmVzMg81CR18Fk250apIi9RXyWW+eG5eaM6s8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bEhNVt1GsNTReAabbrbOrGd7094+P/Sa5116B7JLNnREdhOzMGX2Gz8rO+jhs2hjr
	 zSsrlqBKOoM5flIzMvqZnYd7J9cRg2EDO74CdatpbE2YJ1B0uNV1ztRl6S0G+N0vsU
	 yB1er4WO6TtsqsXhRMk1/TlGmKa+L1/FsD2GOdqw+oQm9GLeFT3Bj3KKSnDOBHF4B/
	 U+yyOFENz4I54n62JgPRSNPUjWlQ+ltOi5Wo2jvwQbED3vUWkLuR6lXfvEDJvLC4tN
	 p2nKWsvyoT705a20eObfWQInTblFf6CCtvyGPA+dGyxm9WCeiQxTawQdn76dB9GHg8
	 A/2+Gwm/0LbAQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
	ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
In-Reply-To: <20260426130531.GF804026@ziepe.ca>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us> <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca> <yq5aik9jcpzm.fsf@kernel.org>
 <20260424225514.GE804026@ziepe.ca> <20260426130531.GF804026@ziepe.ca>
Date: Thu, 21 May 2026 21:05:39 +0530
Message-ID: <yq5azf1s6aic.fsf@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62535-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ziepe.ca:email]
X-Rspamd-Queue-Id: EFB2A5A8FFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jason Gunthorpe <jgg@ziepe.ca> writes:

>> > static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>> > 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
>> > 		unsigned long attrs, bool flush)
>> > {
>> > 	dma_addr_t dma_addr;
>> > 
>> > 	if (is_swiotlb_force_bounce(dev)) {
>> > 		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>> > 			return DMA_MAPPING_ERROR;
>> > 
>> > 		return swiotlb_map(dev, phys, size, dir, attrs);
>> > 	}
>> > 
>> > 	if (attrs & DMA_ATTR_MMIO) {
>> > 		dma_addr = phys;
>> > 		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
>> > 			goto err_overflow;
>> > 		goto dma_mapped;
>> 
>> I suspect P2P is probably broken on CC because this doesn't make
>> sense..
>
> Actually, I suppose it is fully broken because it will jump to swiotlb
> and then should fail.
>
>> This should flow into the
>> phys_to_dma_unencrypted/phys_to_dma_encrypted block as well AFAICT, it
>> shouldn't just assign phys. Assigning phys to dma on a CC system is
>> always wrong, right?
>> 
>> It is is more like
>> 
>>         /* To be updated, callers should specify MMIO | CC_SHARED instead of
>> 	   * implying it. */
>>         if (attrs & DMA_ATTR_MMIO)
>> 	   attrs |= DMA_ATTR_CC_SHARED;
>
> So no need for this if, we can go directly to marking the MMIO callers
> with DMA_ATTR_CC_SHARED once this is fixed for mmio:
>
>>         if (attrs & DMA_ATTR_CC_SHARED) {
>>  		dma_addr = phys_to_dma_unencrypted(dev, phys);
>>  	} else {
>>  		dma_addr = phys_to_dma_encrypted(dev, phys);
>>  	}
>
> Jasn

I am wondering whether this is better

static inline dma_addr_t dma_direct_map_phys(struct device *dev,
		phys_addr_t phys, size_t size, enum dma_data_direction dir,
		unsigned long attrs, bool flush)
{
	dma_addr_t dma_addr;

	/*
	 * For a device requiring unencrypted DMA, MMIO memory is treated
	 * as shared.
	 */
	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
		attrs |= DMA_ATTR_CC_SHARED;

.....

	if (attrs & DMA_ATTR_CC_SHARED)
		dma_addr = phys_to_dma_unencrypted(dev, phys);
	else
		dma_addr = phys_to_dma_encrypted(dev, phys);

	if (attrs & DMA_ATTR_MMIO) {
		if (unlikely(!dma_capable(dev, dma_addr, size, false, attrs)))
			goto err_overflow;
		goto dma_mapped;
	}


....
-aneesh

