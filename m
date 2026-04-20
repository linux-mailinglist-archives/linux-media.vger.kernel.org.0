Return-Path: <linux-media+bounces-59128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGqBEf/x5WnCpQEAu9opvQ
	(envelope-from <linux-media+bounces-59128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 11:29:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7F428DC3
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 11:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C7B6300DF6A
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E5A38A718;
	Mon, 20 Apr 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="Ur9QmxFL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A138F949
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677367; cv=none; b=fY07gyGvPFdQ7+qHmRtubc3hQZa9C7423GE0y1s425a4aJuo94ehSDcIeEcBiTTKaIqUlZ3AHlElt3fTh90+2mLo20Wv75kg2cxM7u2fMd+JzMRkSzZyWj2BE2ELF5dbwXWGlcmPaRCogz4UrxNS6JO20qRYYSkRh1JGvBya39w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677367; c=relaxed/simple;
	bh=t68PnAuUVdCxSz0hVbJNZkIzL4xxh55AMqx0Abl5XQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVwCwYU3VNtgPM86lfjp2Za+vkDfril4HeUBMZ5VDrW6q34MDkMKxy4MC5E2fqJsoibu8UWlsNDPzYX2efe70lWCiC56HZfZNMITRJwtGM/LbFaR4LIccZfii9dvj70MtenSRWJz8P2I19aNhNQGx4Hz9cOpTid5f8gxx+UdGBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=Ur9QmxFL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso4028255e9.3
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1776677362; x=1777282162; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IEZHN3EejXoq9qbRm7mjl8x1VVtWAaecGDOSe23Ifhk=;
        b=Ur9QmxFLPAkZ5+HCNSQA7t61qfgSEnN+UmiJabP9OYBTqHjFzRepXfLwXrwe2plFOe
         2haL3d1+YcGs6Ll0OnbxKhAaGDpW5hwo9Q64NgrqoTyEJWkAO6JbG0yDtRaCje1W8BHo
         VgaQ7ITJTMFJ38N79kUpRIldBzpI3DDIujpi5jVtdbeYVQANMfOrc2TnESVMm/AMquhP
         Md+cZtIImT3mUQNaeqxBEmP6U46QK9kOFfapTEN1Sp8lQZ/QsRK3LDDvEa5JllrKc/Vm
         XsTM4K3LlVemnWVt7T34J10t75fvOAalTaPicUPSExfwjBUi6XIJUTkrDm+Sg1gCp9Vc
         R4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677362; x=1777282162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEZHN3EejXoq9qbRm7mjl8x1VVtWAaecGDOSe23Ifhk=;
        b=DiJjHS7tWf5hnZyzvlVyZdBGJrjbijL5a8XLlOtEzfo3vs+zZFhXOHFlskIY/aHCZk
         LN6yGBD3CRevynT9Nh8Q2XuMBSXwmFZLh8RwNdNPdFBVZ58eNsoVgCYsC4zTOx1GgRdP
         qCgKk18qrE77z2pkTZGfBXTlpIuT0H6hckwLPG3JJCc5v3Un+RTFee0thsWikCPqMesP
         liVqKKr1zTDDWvccipb2S6UKYF7PNk9h4sg4c/g9jcb21k9UNLOUdo2v980CnYZAvAUN
         b5upNrkNwzaWySkfVup5zhmZLEzcxxpbmJSDJB/BiHu9sy/Mc4HO2NjeNlhB/iFQ6EW3
         RE9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/3atJ86MH0R/Da6kY6jMcQcErFrx+UPTdXMoJfuUR4XuSPdATIRC+ELH5FvfBOtcl1b9kPskv91x7u9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9YfwPGXqQOrVZ3V9QaqsRFUz/12GspVXRC+MWQS+Rmgl8HwD
	G+snJ1Z0ihJPOuPbCRT2QsLUs7iycz72xJls6Ce1V6pnEN5He4y1ijFRcJhkSK4yxpo=
X-Gm-Gg: AeBDies+WDSLGJn6qvLO5z+NPwN9g2s2iCENUKM8LpyVcRwjvKpss30VvsEnKbi96gr
	HcXQXbiCxORep853ZAfs91w7jrPExgbR6V9si1W4/dbHF1qTrrc2oDi03MLPFmtprJfGkxDvK7i
	uDqLtkUcT3TkWqNKlSu6hhKEaAwtLEirTZoBZauIeFPogXy54fMMJ1Tlo0XzhWsxTyQgl6BC3i4
	lyrFtnrvgi0uGYv0LAz5YYKkjc5V2oO+T6xxBR26a6ZSgupPhEW6nF3YSwILmMpZ2qXMl1Uajm7
	xP/qfCp2nT8pBDY7bOPX0kSfa73D5HWyy8hxII85bx8o6UPqavXP5Jz+aucBerrH2hmU6H9e3Nx
	ONrrWbUslkSfTscjWzF4maR0cou+nUWS8VJaFJTNA35V87cqHJDPgOw5wJP2GXrIn+41IYOGQzF
	rgM1eAkJbc2/8EgpSFkwuy69TuF35roOJIGRMugxYsZp5/xQ==
X-Received: by 2002:a05:600c:a102:b0:488:ba19:da25 with SMTP id 5b1f17b1804b1-488fb759f0fmr143513465e9.12.1776677361344;
        Mon, 20 Apr 2026 02:29:21 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75af76sm85639205e9.13.2026.04.20.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:29:20 -0700 (PDT)
Date: Mon, 20 Apr 2026 11:29:17 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5atst6ywbl.fsf@kernel.org>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59128-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,resnulli-us.20251104.gappssmtp.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10E7F428DC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mon, Apr 20, 2026 at 08:34:06AM +0200, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Current CC designs don't place a vIOMMU in front of untrusted devices.
>> Instead, the DMA API forces all untrusted device DMA through swiotlb
>> bounce buffers (is_swiotlb_force_bounce()) which copies data into
>> shared memory on behalf of the device.
>>
>> When a caller has already arranged for the memory to be shared
>> via set_memory_decrypted(), the DMA API needs to know so it can map
>> directly using the unencrypted physical address rather than bounce
>> buffering. Following the pattern of DMA_ATTR_MMIO, add
>> DMA_ATTR_CC_SHARED for this purpose. Like the MMIO case, only the
>> caller knows what kind of memory it has and must inform the DMA API
>> for it to work correctly.
>>
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>> v4->v5:
>> - rebased on top od dma-mapping-for-next
>> - s/decrypted/shared/
>> v3->v4:
>> - added some sanity checks to dma_map_phys and dma_unmap_phys
>> - enhanced documentation of DMA_ATTR_CC_DECRYPTED attr
>> v1->v2:
>> - rebased on top of recent dma-mapping-fixes
>> ---
>>  include/linux/dma-mapping.h | 10 ++++++++++
>>  include/trace/events/dma.h  |  3 ++-
>>  kernel/dma/direct.h         | 14 +++++++++++---
>>  kernel/dma/mapping.c        | 13 +++++++++++--
>>  4 files changed, 34 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>> index 677c51ab7510..db8ab24a54f4 100644
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -92,6 +92,16 @@
>>   * flushing.
>>   */
>>  #define DMA_ATTR_REQUIRE_COHERENT	(1UL << 12)
>> +/*
>> + * DMA_ATTR_CC_SHARED: Indicates the DMA mapping is shared (decrypted) for
>> + * confidential computing guests. For normal system memory the caller must have
>> + * called set_memory_decrypted(), and pgprot_decrypted must be used when
>> + * creating CPU PTEs for the mapping. The same shared semantic may be passed
>> + * to the vIOMMU when it sets up the IOPTE. For MMIO use together with
>> + * DMA_ATTR_MMIO to indicate shared MMIO. Unless DMA_ATTR_MMIO is provided
>> + * a struct page is required.
>> + */
>> +#define DMA_ATTR_CC_SHARED	(1UL << 13)
>>  
>>  /*
>>   * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
>> diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
>> index 63597b004424..31c9ddf72c9d 100644
>> --- a/include/trace/events/dma.h
>> +++ b/include/trace/events/dma.h
>> @@ -34,7 +34,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
>>  		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
>>  		{ DMA_ATTR_MMIO, "MMIO" }, \
>>  		{ DMA_ATTR_DEBUGGING_IGNORE_CACHELINES, "CACHELINES_OVERLAP" }, \
>> -		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" })
>> +		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" }, \
>> +		{ DMA_ATTR_CC_SHARED, "CC_SHARED" })
>>  
>>  DECLARE_EVENT_CLASS(dma_map,
>>  	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
>> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
>> index b86ff65496fc..7140c208c123 100644
>> --- a/kernel/dma/direct.h
>> +++ b/kernel/dma/direct.h
>> @@ -89,16 +89,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>>  	dma_addr_t dma_addr;
>>  
>>  	if (is_swiotlb_force_bounce(dev)) {
>> -		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>> -			return DMA_MAPPING_ERROR;
>> +		if (!(attrs & DMA_ATTR_CC_SHARED)) {
>> +			if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>> +				return DMA_MAPPING_ERROR;
>>  
>> -		return swiotlb_map(dev, phys, size, dir, attrs);
>> +			return swiotlb_map(dev, phys, size, dir, attrs);
>> +		}
>> +	} else if (attrs & DMA_ATTR_CC_SHARED) {
>> +		return DMA_MAPPING_ERROR;
>>  	}
>>
>
>What is this check for? If we are requesting a DMA mapping with
>DMA_ATTR_CC_SHARED, shouldn’t it be allowed? If not, how would we reach

This is defensive. Only allows to map with DMA_ATTR_CC_SHARED set to
dev dev that does not support CC natively. This can be of course lifted,
if you have a case.


>the conditional below where we convert the physical address to a DMA
>address using phys_to_dma_unencrypted()?. Also, how is this supposed to
>interact with is_swiotlb_force_bounce()?”

You reach there when is_swiotlb_force_bounce(dev) is true and
DMA_ATTR_CC_SHARED is set. What am I missing?



>
>>  
>>  	if (attrs & DMA_ATTR_MMIO) {
>>  		dma_addr = phys;
>>  		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>>  			goto err_overflow;
>> +	} else if (attrs & DMA_ATTR_CC_SHARED) {
>> +		dma_addr = phys_to_dma_unencrypted(dev, phys);
>> +		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>> +			goto err_overflow;
>>  	} else {
>>  		dma_addr = phys_to_dma(dev, phys);
>>  		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
>
>-aneesh

