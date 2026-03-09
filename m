Return-Path: <linux-media+bounces-54925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDIQGneLrmnNFwIAu9opvQ
	(envelope-from <linux-media+bounces-54925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 09:57:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A36235BCE
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 09:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BBA13011CB2
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 08:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47FA36E49F;
	Mon,  9 Mar 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="oAaRRQfX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555FF36EA9A
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046641; cv=none; b=IU/ie0VNiIx29Yo7PU4ka824flQdd+F/vDvVre7TnDuEiH9ODfy8AdDF2Cp+g3e6t0oZdHLQS9P/K75f1qTsirUbyFkWSTWVATBlBoBo5LJBEhhSi6mGEwyUFwgwxSEaAZNWOlc6V2uHPXi5PoozZFHkUEsFEaGSj7Dv11tQlKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046641; c=relaxed/simple;
	bh=Bsp3xDyhNd/OtxX1x//qg/lW3UkI2Sz7MvDdxTNpXX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hvm7Q/D1s5ajHoF7MMoVFQJT3b/PHQBXPmxaxRqcyVkoS9twIcq/1VphZ/ktpSh5VlN/NLApI7fGS8jkIWWaVnzDiHJs78ngliz1/bX8e+/ZnqPvnY4zVf72uNH27HoZgy+BMh/F/cIc5asv3n35T/ZF66WOmg7FlCe/n3O8gB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=oAaRRQfX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852ff06541so16584645e9.2
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773046634; x=1773651434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QhSAyhARBfFioIzUhuKz22/Ga41Sv7/6kPpVPO+u0Ts=;
        b=oAaRRQfXXnwW9YKUsE/jYA24ZGNkvvWw0DBa8F6gRdh0xSEpDxp556QJV6f8NnTM7d
         RBBtAHc1aEThggi1p4rziMHWpy6Fv4o5nE5Rmx8v2QwBRwKjX4lFLi+Rj7bb8/hXPfw9
         x0PVRU0XIeFbu/KOxz95HOC09pYW2fsmJ2L32DeRy/HUf0VHghfdgj+cBu4ph0XN3CHq
         gHIFczlCklVbc8HYL5w+gqL7K0OegIfJWx723xR/rK7JrExQ5qoFzZY7WAvJT8OfSKYM
         ZskHFF8UOETXYQ8c+VXRXTDhH+INOCgRiR3IrfqOPpx8T0+FcOgn3bHBv0XZuKuLCz0a
         6XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046634; x=1773651434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhSAyhARBfFioIzUhuKz22/Ga41Sv7/6kPpVPO+u0Ts=;
        b=NXs3UMc5GbJQEl9lo1giTrG4GnzSAwsmuz+Qez/HOiun0BRpP10K+Tzv9E23ul2IN9
         d8J6imMZKquLED/r8tunZyHiQSoPBoj9dz3Bddor1g5tqWMVMizWO1yLuZ5sGknuUXXJ
         0FR8si/gqwb83/1at9OC20EWw5U/Yv1Hthd+kZ9gklWgFMIVSr2LSlMV42LWA8WFn8Vy
         6AJ5LLMpuvoFm8y55uzFfmmB67OalZZG3r9YNtJnrlJHfnEDHxH5dvUGkJw8LPEhH8TB
         pqE+qnmyLYbs77bjdHVspHRoRNtn7fHa+y3xXWVvJHQz3qcy99GOh9apDdXBWiydkEYL
         RF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIonK/A2swmxKEuhagTocgnhfY/0pW4E50eBPFWdyq58/Sxd0FK/6CejX7mf19/lSzrj0ukk/C98Bd5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQ/AbpL9xc6Y1Dz8V5b7o1XlHgeh2EpxUZ8INzievuHV7mojF
	+hFakSH5rlxqlJDTkP0jZH8tPzOrhJNL/ToF6Lg4IRd/WjHju5BRIj6BuLokkBcvwF8=
X-Gm-Gg: ATEYQzw4s4iMU0HwMmquRZzTEycy+nhfPjfUXJeRQ/3CkuHwowQ/uyG295uPCW5C8+S
	85T+KIw0PKZWarT7GVZHcb6EqajNtyoncsGYtvxk246nIxMHnoZcVSkBV8fmZeJitbMgwZOUgwD
	/Zu8yCL4fseWMPYiNhs9fUU4SmmyfgbYbA5pmUevdrbXuATVK8M4BF7Q3nKh98XO5N3dpX/pMS5
	i/U2HsSztk99xs90SGoPy/deqI1xh+/0mZ0d1B0ew2WVxeggdEZAAablex0lLKDC+RvdqzVtZzk
	FxuoFFovLYRspEbYHyh7hTyaBQ3kUwYYKYJ19HhTJOpKMcPedlq7EoVg0i1c7xvgboYxVHvZqdU
	I50eKLqHbA26dVyb3JpLDHVlXW7Iu+/j48ap/BKntPg0iiOBAMXC6BVksPv9IvBCKyLwo6z9faq
	U/fzOZssBXKBepxysGey4uvJPcGU+TI/E=
X-Received: by 2002:a05:600c:8714:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-48526957d50mr167626995e9.22.1773046634085;
        Mon, 09 Mar 2026 01:57:14 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b7547sm260786625e9.12.2026.03.09.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:57:13 -0700 (PDT)
Date: Mon, 9 Mar 2026 09:57:09 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Leon Romanovsky <leon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <dnb4khhvpmwzxkp3vuihukfaztjvy5oxsjunbgixyebwonfeyi@goxt6ahopcwi>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308101948.GO12611@unreal>
X-Rspamd-Queue-Id: 09A36235BCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54925-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.932];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli-us.20230601.gappssmtp.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Sun, Mar 08, 2026 at 11:19:48AM +0100, leon@kernel.org wrote:
>On Thu, Mar 05, 2026 at 01:36:40PM +0100, Jiri Pirko wrote:
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
>> 
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>> v1->v2:
>> - rebased on top of recent dma-mapping-fixes
>> ---
>>  include/linux/dma-mapping.h |  6 ++++++
>>  include/trace/events/dma.h  |  3 ++-
>>  kernel/dma/direct.h         | 14 +++++++++++---
>>  3 files changed, 19 insertions(+), 4 deletions(-)
>> 
>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>> index 29973baa0581..ae3d85e494ec 100644
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -85,6 +85,12 @@
>>   * a cacheline must have this attribute for this to be considered safe.
>>   */
>>  #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
>> +/*
>> + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
>> + * (shared) for confidential computing guests. The caller must have
>> + * called set_memory_decrypted(). A struct page is required.
>> + */
>> +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>
>While adding the new attribute is fine, I would expect additional checks in
>dma_map_phys() to ensure the attribute cannot be misused. For example,
>WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
>that we are taking the direct path only.

Okay, I will add the check.

