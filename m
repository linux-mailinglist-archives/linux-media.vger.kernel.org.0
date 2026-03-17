Return-Path: <linux-media+bounces-56001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJYCMJQQuWkaoQEAu9opvQ
	(envelope-from <linux-media+bounces-56001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:28:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C442A5A63
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8837F305D6E7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB6C3988F8;
	Tue, 17 Mar 2026 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="V7LTjojG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F60E396596
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 08:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773735990; cv=none; b=PxMizCFeGjos3PTHKMz+N9oHNZt73DSoJf9YNt95C/EsbAqz1K1v6H4a7siJgOyaRi9BQMItPZXBzgLGo6dKllzShGyvs7RdazgI6l0ixrWqjpPEaeJ0MSFjVRacqW/gbuz/KO/NTV6OlWUPm3ggdgGThPHL18gZFo8ZgQGHxv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773735990; c=relaxed/simple;
	bh=0irRjcsn/6mH9qY9dx/psDtVRnHKTVG73clSDMUFvDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gq8QoMmGDMS+PUpDalva1jZ6nJnvr6PikYVT3MzjWawMKtt2rC4T5uhu/7A/qcGSFBOj+Bd/B2SlAFGVbvuGttwrW3WxVn5c0pfrofi++UZekqs00F8jO07eiPpIyxX68cU9yZXj5LOGgyR7ffRyyLNcRvi7+AS3ePw6ggLXNws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=V7LTjojG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48534237460so59109185e9.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 01:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773735985; x=1774340785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xf2CUvi8YSfRB4MbEru11u5aBtMS7TuUP2oF3ZpZ3ic=;
        b=V7LTjojGMq9h8LIE0SI+1EV7kVdoopSOnntcufRA9wrwyl2MLHB7MIZtwQ6p8jYlJD
         7NABzrCknWISuDwvB07pnVnKmZnZJoBLP9/zQ0i/SWsTF7MKuszES4EMb6GScypQ7czw
         O0cZsoaG5OAc+CKdPHMnim427pjjkrbWZ4z9qJ40Z0/0rELrvJGsZ7+kqzr3eRmtNqVc
         ANJZ3H54OG1vp4BzHOBKAAfb+aMdUQlg/ekEhQksp8LILL6aspjCq1526But0GExS1si
         Njn99sqIukIS5zY1i460io6I1fhJEHzfyXIt0rUcIPRjXm1i8BOABQK7eZyNv4xFeWUi
         3Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735985; x=1774340785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xf2CUvi8YSfRB4MbEru11u5aBtMS7TuUP2oF3ZpZ3ic=;
        b=XIaUYoEdnpVXTlAncPClD+Tuf4nKI7OKywFLeb1tfwElbPXcTpTH1OPiBkS+O86iJo
         cDhKOcqjMmwgaAz/CQQ01WqB9V42YVBXC/ZUjhFUqLbGPM52SRO76D8dCEeCfhy2CY4g
         WEVD/Ws4BklGiH8EsiggWq5ahtg4dz9CduEU+qE3yel4m7SdaSbauVxSpzgmjKWPkb9e
         1PXI/6/fohXhjEyQ5XITXsR/kDcCXvoQRLS5rYcbVGq1WkBL2OvLgI5txVNbNknTTB0t
         TNqEfHqyrBIGMMOniO3mLQ04zArLyBZ1kbWWxAgNVbTHy+Gu4ii5m6OwhBuwyaBYWBA+
         ZcLw==
X-Forwarded-Encrypted: i=1; AJvYcCWmjVPrEhQjZlJBdryo2kHVjAJ7LLllQ6FHiKJy+2NRljvsVSxZtoeKwPYO+5Buk5ErMml3fTIyTJw5uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjkKDECHLRbyDaolItyvR+kEPUevv17Awsey+mS3ItWwwmYSJ7
	dW63j4NHnyH714yGELVGCG5XgNtvXrA2myBhOx/hlppp984M6XHWvTNNLFvgbY+VBLA=
X-Gm-Gg: ATEYQzymflQC90xVN2gbk5U9K3Gdqyrbw+ukluCuO2URWUPU+qh22ECcESJvZ46Dt0w
	WSgOcGxLCzQUxjWlbs3zHS60mVPy+lkHJ+hDh0CVk23GeaPbiMEoah5jg8cHVWnNzrh1ILQYkdn
	kmk4HOdVvuEZz3vKssTsNzN+Gz9aOgwkpk/2Fcapmwgy91/xg706EbkXlqRSevt6geoT/BhfRAw
	1ntcEpobsedBRQ/sIWn3G21FnFPnukS7MYZ9y79RfkV5Ro6dK2fZcsBuTDHshaSrerdKw4NIm+U
	/ASzBOpHJgev+bmGxk1YIEi+2wxnnPOet4YghE7jnjEMmKuWzvE5UVChs+WRHIF45g1KCjYhVml
	QXtHrZ+GP0GeCkL5ZJzXDXqC99qTaLWTbDxDPHXxv1tcBd5kxwDW4B3NcHU71gnzRFk+9sN6lya
	Uz79gY8FvlO1yjBLEoECEgCkhLLgbtjNi5fV3qgyZAzJU=
X-Received: by 2002:a05:600c:c8f:b0:485:3c05:24dc with SMTP id 5b1f17b1804b1-48556710c02mr263331735e9.33.1773735985061;
        Tue, 17 Mar 2026 01:26:25 -0700 (PDT)
Received: from FV6GYCPJ69 ([2001:1ae9:6084:ab00:81f8:c391:4972:647b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea97e8esm52842845e9.5.2026.03.17.01.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:26:24 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:26:21 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Robin Murphy <robin.murphy@arm.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, jgg@ziepe.ca, leon@kernel.org, 
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v4 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for
 pre-decrypted memory
Message-ID: <lufy3ppgiy7637iravgzabajj67chmqvg22qc3fd2yqe2p33ws@b54vibhehth2>
References: <20260316125857.617836-1-jiri@resnulli.us>
 <20260316125857.617836-2-jiri@resnulli.us>
 <15fcfa5e-c4b9-4b56-8f84-20dd5f66d643@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15fcfa5e-c4b9-4b56-8f84-20dd5f66d643@arm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56001-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli-us.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,nvidia.com:email]
X-Rspamd-Queue-Id: 27C442A5A63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mon, Mar 16, 2026 at 07:25:55PM +0100, robin.murphy@arm.com wrote:
>On 2026-03-16 12:58 pm, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Current CC designs don't place a vIOMMU in front of untrusted devices.
>> Instead, the DMA API forces all untrusted device DMA through swiotlb
>> bounce buffers (is_swiotlb_force_bounce()) which copies data into
>> decrypted memory on behalf of the device.
>> 
>> When a caller has already arranged for the memory to be decrypted
>> via set_memory_decrypted(), the DMA API needs to know so it can map
>> directly using the unencrypted physical address rather than bounce
>> buffering. Following the pattern of DMA_ATTR_MMIO, add
>> DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
>> caller knows what kind of memory it has and must inform the DMA API
>> for it to work correctly.
>
>Echoing Jason's point, if the intent of this is to indicate shared memory,
>please call it DMA_ATTR_CC_SHARED. Yes, some of the existing APIs are badly
>named because they conflated intent with implementation details; that is no
>reason to keep wilfully making the same mistake.
>
>At least with Arm CCA, the architecture enforces *confidentiality* pretty
>much orthogonally to encryption - if your threat model excludes physical
>attacks against DRAM, you can still have Realms isolated from each other (and
>of course other execution states) without even implementing the memory
>encryption feature; conversely if you do have it, then even all the
>shared/host memory may still be physically encrypted, it just has its own
>context (key) distinct from the Realm ones. Similarly, while it's not a
>"true" CoCo environment, pKVM has a similar notion of shared vs. private
>which can benefit from piggy-backing off much of the CoCo infrastructure in
>places like the DMA layer, but has nothing whatsoever to do with actual
>encryption.
>
>Furthermore, "shared" is just shorter and more readable, even before I invoke
>the previous discussion of why it should be "unencrypted" rather than
>"decrypted" anyway ;)

Okay, fair points. I'll rename it to shared for "v5". Thanks!


>
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>> v3->v4:
>> - added some sanity checks to dma_map_phys and dma_unmap_phys
>> - enhanced documentation of DMA_ATTR_CC_DECRYPTED attr
>> v1->v2:
>> - rebased on top of recent dma-mapping-fixes
>> ---
>>   include/linux/dma-mapping.h | 10 ++++++++++
>>   include/trace/events/dma.h  |  3 ++-
>>   kernel/dma/direct.h         | 14 +++++++++++---
>>   kernel/dma/mapping.c        | 13 +++++++++++--
>>   4 files changed, 34 insertions(+), 6 deletions(-)
>> 
>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>> index 29973baa0581..476964d2b22f 100644
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -85,6 +85,16 @@
>>    * a cacheline must have this attribute for this to be considered safe.
>>    */
>>   #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
>> +/*
>> + * DMA_ATTR_CC_DECRYPTED: Indicates the DMA mapping is decrypted (shared) for
>> + * confidential computing guests. For normal system memory the caller must have
>> + * called set_memory_decrypted(), and pgprot_decrypted must be used when
>> + * creating CPU PTEs for the mapping. The same decrypted semantic may be passed
>> + * to the vIOMMU when it sets up the IOPTE. For MMIO use together with
>
>That being "the vIOMMU" that you said doesn't exist, and which is explicitly
>not supported?...

Yeah, I wanted to draw the full picture. I can put a not like "(when it
is going to be introduced)" or something like that to be clear.


>
>> + * DMA_ATTR_MMIO to indicate decrypted MMIO. Unless DMA_ATTR_MMIO is provided
>> + * a struct page is required.
>> + */
>> +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>>   /*
>>    * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
>> diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
>> index 33e99e792f1a..b8082d5177c4 100644
>> --- a/include/trace/events/dma.h
>> +++ b/include/trace/events/dma.h
>> @@ -32,7 +32,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
>>   		{ DMA_ATTR_ALLOC_SINGLE_PAGES, "ALLOC_SINGLE_PAGES" }, \
>>   		{ DMA_ATTR_NO_WARN, "NO_WARN" }, \
>>   		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
>> -		{ DMA_ATTR_MMIO, "MMIO" })
>> +		{ DMA_ATTR_MMIO, "MMIO" }, \
>> +		{ DMA_ATTR_CC_DECRYPTED, "CC_DECRYPTED" })
>>   DECLARE_EVENT_CLASS(dma_map,
>>   	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
>> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
>> index e89f175e9c2d..c047a9d0fda3 100644
>> --- a/kernel/dma/direct.h
>> +++ b/kernel/dma/direct.h
>> @@ -84,16 +84,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>>   	dma_addr_t dma_addr;
>>   	if (is_swiotlb_force_bounce(dev)) {
>> -		if (attrs & DMA_ATTR_MMIO)
>> -			return DMA_MAPPING_ERROR;
>> +		if (!(attrs & DMA_ATTR_CC_DECRYPTED)) {
>> +			if (attrs & DMA_ATTR_MMIO)
>> +				return DMA_MAPPING_ERROR;
>> -		return swiotlb_map(dev, phys, size, dir, attrs);
>> +			return swiotlb_map(dev, phys, size, dir, attrs);
>> +		}
>> +	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
>> +		return DMA_MAPPING_ERROR;
>>   	}
>>   	if (attrs & DMA_ATTR_MMIO) {
>>   		dma_addr = phys;
>>   		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>>   			goto err_overflow;
>> +	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
>> +		dma_addr = phys_to_dma_unencrypted(dev, phys);
>> +		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>> +			goto err_overflow;
>>   	} else {
>>   		dma_addr = phys_to_dma(dev, phys);
>>   		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
>> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
>> index 3928a509c44c..abb0c88b188b 100644
>> --- a/kernel/dma/mapping.c
>> +++ b/kernel/dma/mapping.c
>> @@ -157,6 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>>   {
>>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>>   	bool is_mmio = attrs & DMA_ATTR_MMIO;
>> +	bool is_cc_decrypted = attrs & DMA_ATTR_CC_DECRYPTED;
>>   	dma_addr_t addr = DMA_MAPPING_ERROR;
>>   	BUG_ON(!valid_dma_direction(dir));
>> @@ -165,8 +166,11 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>>   		return DMA_MAPPING_ERROR;
>>   	if (dma_map_direct(dev, ops) ||
>> -	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
>> +	    (!is_mmio && !is_cc_decrypted &&
>> +	     arch_dma_map_phys_direct(dev, phys + size)))
>>   		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
>> +	else if (is_cc_decrypted)
>> +		return DMA_MAPPING_ERROR;
>>   	else if (use_dma_iommu(dev))
>
>...although, why *shouldn't* this be allowed with a vIOMMU? (Especially given
>that a vIOMMU for untrusted devices can be emulated by the host VMM without
>the CoCo hypervisor having to care at all - again, at least on Arm and other
>architectures where IOMMUs are regular driver model devices)

Well, when iommu path is able to consume the attr, this restriction
should be lifted. This is basically a sanity check for the
dma_map_phys() caller.


>
>>   		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
>>   	else if (ops->map_phys)
>
>Or indeed any other non-direct ops? Obviously all the legacy architectures
>like Alpha are never going to see this or care, but I could imagine Xen and
>possibly PowerPC might.

Same here.


>
>Thanks,
>Robin.
>
>> @@ -203,11 +207,16 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
>>   {
>>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>>   	bool is_mmio = attrs & DMA_ATTR_MMIO;
>> +	bool is_cc_decrypted = attrs & DMA_ATTR_CC_DECRYPTED;
>>   	BUG_ON(!valid_dma_direction(dir));
>> +
>>   	if (dma_map_direct(dev, ops) ||
>> -	    (!is_mmio && arch_dma_unmap_phys_direct(dev, addr + size)))
>> +	    (!is_mmio && !is_cc_decrypted &&
>> +	     arch_dma_unmap_phys_direct(dev, addr + size)))
>>   		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
>> +	else if (is_cc_decrypted)
>> +		return;
>>   	else if (use_dma_iommu(dev))
>>   		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
>>   	else if (ops->unmap_phys)
>

