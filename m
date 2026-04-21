Return-Path: <linux-media+bounces-59213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJgdNZBm52ld7wEAu9opvQ
	(envelope-from <linux-media+bounces-59213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 13:59:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E55243A5EB
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 13:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19D57301E953
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E77388363;
	Tue, 21 Apr 2026 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="J1jgE41Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB45378822
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776772420; cv=none; b=LotTlyEYZOSOZ4Dg4dBDZgnF9aEwnkd1JrDZohaHuNlL6Mq+nJ5/aUS1lZU+hyNKCRE4Wfnc6D90eI+P02EDwopLSxzedrIMcp0Q4uzJI6MhQqhuI4EJs+BR1ZeE4ctqNw9bndlIcwkea+xibI6p4BQPP432zZDlX7vPnS6EGeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776772420; c=relaxed/simple;
	bh=h9F+/Z/1756ADDD/jis6XaIQCCXn61Uy3k1fVDVehXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clk9ohnWHLf1K57km33jzAQylDK06VPreQzrXUtIdmnkxDIMqBawtzX45Vyk459QaKFKY0t+Gdu7FW1zkvaIyfQ00VVCe+o5XkAhpSypDnN6BRTNsSVPAyamshaIebcCX/N/Iuj2PeK1dfiSj3+W0Lj1OyrNcV2Iu7DCp0eb1Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=J1jgE41Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so29008535e9.3
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1776772415; x=1777377215; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qNffUEYXS7MvbYQg9u+kJhedqyXiIXCWwUXLFzfDV6w=;
        b=J1jgE41Qd4g3APe/d7vyJOY418UeEaja8VPk5YUvcUVu1iga6mYEz+8xGckTyGMoRG
         eW47KzMNwUpEGKasaTaLip/+wegVLMxsGz9VnFKGhQuN0MbqRJhStc+pPt/wc7tEIj+z
         97Ea0qNCSHW4oVBCVqdoFY999bugv9qpZeC4+4PHaPbAr2LVnwMtJbHe2izxpKXAdQT4
         6U4dN2/PfsosGHlcpykPeEzwuV33NSEKsCH8tDYrc6y7+g68Fx1SDdSjWZTr54YYGxhA
         vgSNI2HVdj2fHhgpMkWV6T+5fVVHumhE9jvs/xu8sU/m/+gi2x9NF8KDfARvF0LToVYp
         zgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776772415; x=1777377215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNffUEYXS7MvbYQg9u+kJhedqyXiIXCWwUXLFzfDV6w=;
        b=IRXp2Hv70lkWF+VwOkcN83VHQfHmlNj3Xt+t+XkXx2/qk6+hiwGvLQXDKeK0pthc5J
         HizBjMcKEb96XrfP+ci+EVFounMDwcrh7aIootAJiD2QNqN5opYdLGBEIMuByw/oNFii
         IGNV0QKJs/u5dMtPW4OKUDdpyjuQc5lOKFWWxJIeCdpF1/NUrBezpBmBgGvAz4L1Fca/
         ZTxxetjz+sGqZUrSZHZuO2LmnHbz9Iclocj9f07IREH5XB4sabg8V7+kPqZefQWxEV2T
         w/LfltZ9dUm9N40f0iHdvL1W5PTpJ/j9HS1kRwfZjW5oREVhjfSUO7+8CocmGtJxHzAo
         G0kw==
X-Forwarded-Encrypted: i=1; AFNElJ83iMuhXpNRHhiyKvSLg+MeIEDVwE5+dTZm0YQrrPPsn2yebmn3rf9XBOriWIRlrD0P1ggQ60Fx59By2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJM3tL9gyiBdeKFxFPBDXijckKoQygTz8m0Np5ZF/WZ7FCwKoa
	E16sbKoAwVgHkkFXo+mgkvdlA/LDVLc51HGatjVyOz6+nGDhaJ6NKs+lL7R0TWgD85U=
X-Gm-Gg: AeBDietgO/Pt1PIWsyv1pD9J58PDFeizyDcoPmZn0/BCSAFnLOaonWBvmMfwtcLx4LG
	9tEpHJI1fP96mg+rbjFUdqq8TzY5pIecC8PsMj52nt1kwL3aE/tl3YYKWwYd/qznd9+SNgGkjkt
	u4A0J+IPV395tV4WNwPfeNW47URQahy/MrnV+zpPRbD78cvfq8j2LxfAkE051Q0L/g75nuFeZXQ
	6FyImtIlFLuqi8G+haFJM4vYA4RZBt+a4yWj49AQlN2XMiN4dX3bhPieab3iHRHCC3eFmHi3mz0
	BnM8Rt4ojtG7QToK9CnzFBJnLs148Sivq/iTLFpvSfJNcbMWhJME/yy8fMqmLzKo9cd/DOM0g22
	gzBtKE6YT93N2YHTBPC2YqLYczm56XOMf0hN230q27dD8gqX/06z0Y/QURTk6jvdVf4YbskZNAk
	MdFia83M0yFBWqIObSPL/WqtZkkEZ/5c8HD4wU3sxOrt4d8xS0QcwjX0U9
X-Received: by 2002:a05:600c:c0c8:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488fb787bfdmr196331065e9.26.1776772415404;
        Tue, 21 Apr 2026 04:53:35 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489e124f6c7sm34968855e9.29.2026.04.21.04.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:53:34 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:53:31 +0200
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
Message-ID: <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5awly0d504.fsf@kernel.org>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59213-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,resnulli.us:email]
X-Rspamd-Queue-Id: 2E55243A5EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tue, Apr 21, 2026 at 11:42:03AM +0200, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Mon, Apr 20, 2026 at 08:34:06AM +0200, aneesh.kumar@kernel.org wrote:
>>>Jiri Pirko <jiri@resnulli.us> writes:
>>>
>>>> From: Jiri Pirko <jiri@nvidia.com>
>>>>
>>>> Current CC designs don't place a vIOMMU in front of untrusted devices.
>>>> Instead, the DMA API forces all untrusted device DMA through swiotlb
>>>> bounce buffers (is_swiotlb_force_bounce()) which copies data into
>>>> shared memory on behalf of the device.
>>>>
>>>> When a caller has already arranged for the memory to be shared
>>>> via set_memory_decrypted(), the DMA API needs to know so it can map
>>>> directly using the unencrypted physical address rather than bounce
>>>> buffering. Following the pattern of DMA_ATTR_MMIO, add
>>>> DMA_ATTR_CC_SHARED for this purpose. Like the MMIO case, only the
>>>> caller knows what kind of memory it has and must inform the DMA API
>>>> for it to work correctly.
>>>>
>>>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>>>> ---
>>>> v4->v5:
>>>> - rebased on top od dma-mapping-for-next
>>>> - s/decrypted/shared/
>>>> v3->v4:
>>>> - added some sanity checks to dma_map_phys and dma_unmap_phys
>>>> - enhanced documentation of DMA_ATTR_CC_DECRYPTED attr
>>>> v1->v2:
>>>> - rebased on top of recent dma-mapping-fixes
>>>> ---
>>>>  include/linux/dma-mapping.h | 10 ++++++++++
>>>>  include/trace/events/dma.h  |  3 ++-
>>>>  kernel/dma/direct.h         | 14 +++++++++++---
>>>>  kernel/dma/mapping.c        | 13 +++++++++++--
>>>>  4 files changed, 34 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>>>> index 677c51ab7510..db8ab24a54f4 100644
>>>> --- a/include/linux/dma-mapping.h
>>>> +++ b/include/linux/dma-mapping.h
>>>> @@ -92,6 +92,16 @@
>>>>   * flushing.
>>>>   */
>>>>  #define DMA_ATTR_REQUIRE_COHERENT	(1UL << 12)
>>>> +/*
>>>> + * DMA_ATTR_CC_SHARED: Indicates the DMA mapping is shared (decrypted) for
>>>> + * confidential computing guests. For normal system memory the caller must have
>>>> + * called set_memory_decrypted(), and pgprot_decrypted must be used when
>>>> + * creating CPU PTEs for the mapping. The same shared semantic may be passed
>>>> + * to the vIOMMU when it sets up the IOPTE. For MMIO use together with
>>>> + * DMA_ATTR_MMIO to indicate shared MMIO. Unless DMA_ATTR_MMIO is provided
>>>> + * a struct page is required.
>>>> + */
>>>> +#define DMA_ATTR_CC_SHARED	(1UL << 13)
>>>>  
>>>>  /*
>>>>   * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
>>>> diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
>>>> index 63597b004424..31c9ddf72c9d 100644
>>>> --- a/include/trace/events/dma.h
>>>> +++ b/include/trace/events/dma.h
>>>> @@ -34,7 +34,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
>>>>  		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
>>>>  		{ DMA_ATTR_MMIO, "MMIO" }, \
>>>>  		{ DMA_ATTR_DEBUGGING_IGNORE_CACHELINES, "CACHELINES_OVERLAP" }, \
>>>> -		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" })
>>>> +		{ DMA_ATTR_REQUIRE_COHERENT, "REQUIRE_COHERENT" }, \
>>>> +		{ DMA_ATTR_CC_SHARED, "CC_SHARED" })
>>>>  
>>>>  DECLARE_EVENT_CLASS(dma_map,
>>>>  	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
>>>> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
>>>> index b86ff65496fc..7140c208c123 100644
>>>> --- a/kernel/dma/direct.h
>>>> +++ b/kernel/dma/direct.h
>>>> @@ -89,16 +89,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>>>>  	dma_addr_t dma_addr;
>>>>  
>>>>  	if (is_swiotlb_force_bounce(dev)) {
>>>> -		if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>>>> -			return DMA_MAPPING_ERROR;
>>>> +		if (!(attrs & DMA_ATTR_CC_SHARED)) {
>>>> +			if (attrs & (DMA_ATTR_MMIO | DMA_ATTR_REQUIRE_COHERENT))
>>>> +				return DMA_MAPPING_ERROR;
>>>>  
>>>> -		return swiotlb_map(dev, phys, size, dir, attrs);
>>>> +			return swiotlb_map(dev, phys, size, dir, attrs);
>>>> +		}
>>>> +	} else if (attrs & DMA_ATTR_CC_SHARED) {
>>>> +		return DMA_MAPPING_ERROR;
>>>>  	}
>>>>
>>>
>>>What is this check for? If we are requesting a DMA mapping with
>>>DMA_ATTR_CC_SHARED, shouldn’t it be allowed? If not, how would we reach
>>
>> This is defensive. Only allows to map with DMA_ATTR_CC_SHARED set to
>> dev dev that does not support CC natively. This can be of course lifted,
>> if you have a case.
>>
>>
>>>the conditional below where we convert the physical address to a DMA
>>>address using phys_to_dma_unencrypted()?. Also, how is this supposed to
>>>interact with is_swiotlb_force_bounce()?”
>>
>> You reach there when is_swiotlb_force_bounce(dev) is true and
>> DMA_ATTR_CC_SHARED is set. What am I missing?
>>
>
>So a swiotlb_force_bounce will not use swiotlb bouncing if
>DMA_ATTR_CC_SHARED is set ? 

Correct. Bouncing does not make sense in this case, as shared memory is
already being mapped.


>
>>
>>
>>>
>>>>  
>>>>  	if (attrs & DMA_ATTR_MMIO) {
>>>>  		dma_addr = phys;
>>>>  		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>>>>  			goto err_overflow;
>>>> +	} else if (attrs & DMA_ATTR_CC_SHARED) {
>>>> +		dma_addr = phys_to_dma_unencrypted(dev, phys);
>>>> +		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
>>>> +			goto err_overflow;
>>>>  	} else {
>>>>  		dma_addr = phys_to_dma(dev, phys);
>>>>  		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
>>>
>
>-aneesh

