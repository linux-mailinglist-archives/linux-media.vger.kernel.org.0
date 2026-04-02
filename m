Return-Path: <linux-media+bounces-57956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJM5A/tozmmpngYAu9opvQ
	(envelope-from <linux-media+bounces-57956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:02:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 620AF3895AA
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E63A30862E1
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5D83C13F1;
	Thu,  2 Apr 2026 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="mUd7BbuC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C563D34A0
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134572; cv=none; b=Epuws9fRLmqD6FvNLHiH0gh2HBvM0ICbHNKNGJmTC8+wh5jUTfylkmDs1UnPudSD0bTqqAZrE1lBMKq7MUgHpJbZ44wltqZMZ+jgqgi2J7CJuKApd4TMTEGZXU+mNIJU+Fptk4lDoPG38Bm7seaPK/XkoJ8IotpflZEiOMZZLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134572; c=relaxed/simple;
	bh=2p+a85skg1xtIimTdmJjZJySYA2FlAdgDf3eby1isD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnyq5eKf0JjLX6HzEnr7Dah6TK7t0I9h5HZGLehUo5yyJQH+i98l38ecDUV0nv4Csua/BaUnQkCxUEtC0s0hhMnT1Wm++2m1BmY1gdH0HE8LYQ0IWuOz0s5PKWh+x8WDW8ZaT88rutzJWbGZyt40jIFz5Vtjo5OiZ3FNmUNi3Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=mUd7BbuC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486ff201041so8220725e9.1
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1775134563; x=1775739363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sdBGEtOVUOrqsu+m2DU0Xpq65+UG7RkCtVPt0Shx5yg=;
        b=mUd7BbuCoeJqm2nPr9AJfEe7p9aPySbUbNGAW0JSICQ/AdYlxHsbTizJ7wfRk8s7t/
         X11XpNFTzHjMPmIW98FmEc//h29+jO3A8Iw2NE0jUwrG6rt1UoWNEfiUP/Q0XZVxZRzY
         WTN4Om4/skS5+Isgt8jBhF/3pDMKkYpKmV94fucs1B6VLuNsi8r28V3nQ6wkDI+G050U
         LGhZeOjoUO7Kmhz6UTT1Xwmgk/Z0JbmB4IcYdS/VxQ7TK0/S3+j2FQoNk0R2PFcXUC8g
         0icsOlOpN/WdI7CrGfoh+lQk0vTrwRSsEiyFPDBbn4sqadqPme+v8kpe17tZns5TymZ5
         97AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134563; x=1775739363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdBGEtOVUOrqsu+m2DU0Xpq65+UG7RkCtVPt0Shx5yg=;
        b=KzPdMygea0Iri81s1ZhDlePvKMVFbRz9n9csGLcerg5EUnDC12NjQI9nFRiKQg7bG0
         8yi0HplIyhvrG6X3iMYdyzNu1EBO5rG5FWZHbKvIpZlMqnk++58TBlZQLUETivrDo5ZT
         rDpatSblYl5H500UuqQfpVt3lRM0XmRWH6jYeCacHMzBe4sPBfeIMzwtw10ma+a6K13t
         P3fLaSYiK8Xuq91ZGFYISQ3amOEAuUapIMr7qiJTWaDNs/29wQywLd/8WTQZvoQsvdLl
         QXxeF0MXFHszS0U/68lrXeMqWpQb54ilPk1xaZjOwk8IYThxjB/jZsWWeiDgHO+r/hgh
         kw5g==
X-Forwarded-Encrypted: i=1; AJvYcCW8qOXs39Lp1TF53C5F5SRWP0joH1ct2KbVpPU/iCz8T7akdGbWHZu4ER5Nwi2We2Ppcb7sa2fe7XD+qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFpvWGwEPANDwhSwyMIVybrKIsweqUEwaRicDXewCTr6erbaPc
	B5oIpozfIXIFSsGsaSmpsCz7B6G50Apt5fku8Skz0DN/rqIRfsYp5y9kJRNZFicaTV8=
X-Gm-Gg: ATEYQzx3YYru+LXW2wTC4SB3IShVht1z+uaAPkhavAHNqjRZrD7qUIRXc85V8LTDNli
	zw4zmRY/mlYJqaVsClPOPsEI6OGkWJS1dyqyljrP12QqManyCHc6KNprbbZsjsTdxwDUbBsaUF9
	qzBPXDTJQBBAJxg1Ode5b2fyk4V3whRXEAqASjyDW8BGIIiLBuLzv+bYGh1K7hGTOtL4ZoeDsIT
	7rm0jfu8pUkYIJdk6zoRX296BR9L7ADOgf7w8mY+7Bl/Nl22LVQzRJBnRmoRHXKrDA0XKG1DjwV
	GgOnadJg74zvQF45kPJ8Bj0HeOn2PlwJpPiD4dh6OLg+5X57O4euAvF8keaNtzGAb5dCmEy8arQ
	5nAufsER/uhq+B+MSim32odNW1VKyxK7SkskB/EpKKOXlI3ncbvIl5+ECRqmnOAZAzozcwUpba+
	Q5YOAqL45LG9r5Ale4FZNvr7dN2n4epNc=
X-Received: by 2002:a05:600c:a31c:b0:487:338:b4eb with SMTP id 5b1f17b1804b1-4888b7b89a1mr36557135e9.28.1775134563095;
        Thu, 02 Apr 2026 05:56:03 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm7943310f8f.27.2026.04.02.05.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:56:02 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:56:00 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Maxime Ripard <mripard@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: system: add system_cc_shared heap
 for explicitly shared memory
Message-ID: <qvp2zepvwnlgcw36bcx47xouskuqk3tzjuomnhnwwg5ahiswt3@zbseau5arjho>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-3-jiri@resnulli.us>
 <20260402-discreet-glossy-perch-bda4f9@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-discreet-glossy-perch-bda4f9@houat>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57956-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 620AF3895AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thu, Apr 02, 2026 at 02:23:12PM +0200, mripard@redhat.com wrote:
>Hi Jiri,
>
>On Wed, Mar 25, 2026 at 08:23:52PM +0100, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Add a new "system_cc_shared" dma-buf heap to allow userspace to
>> allocate shared (decrypted) memory for confidential computing (CoCo)
>> VMs.
>> 
>> On CoCo VMs, guest memory is private by default. The hardware uses an
>> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
>> Intel TDX) to control whether a given memory access is private or
>> shared. The kernel's direct map is set up as private,
>> so pages returned by alloc_pages() are private in the direct map
>> by default. To make this memory usable for devices that do not support
>> DMA to private memory (no TDISP support), it has to be explicitly
>> shared. A couple of things are needed to properly handle
>> shared memory for the dma-buf use case:
>> 
>> - set_memory_decrypted() on the direct map after allocation:
>>   Besides clearing the encryption bit in the direct map PTEs, this
>>   also notifies the hypervisor about the page state change. On free,
>>   the inverse set_memory_encrypted() must be called before returning
>>   pages to the allocator. If re-encryption fails, pages
>>   are intentionally leaked to prevent shared memory from being
>>   reused as private.
>> 
>> - pgprot_decrypted() for userspace and kernel virtual mappings:
>>   Any new mapping of the shared pages, be it to userspace via
>>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>>   of the direct map. These must also have the encryption bit cleared,
>>   otherwise accesses through them would see encrypted (garbage) data.
>> 
>> - DMA_ATTR_CC_SHARED for DMA mapping:
>>   Since the pages are already shared, the DMA API needs to be
>>   informed via DMA_ATTR_CC_SHARED so it can map them correctly
>>   as unencrypted for device access.
>> 
>> On non-CoCo VMs, the system_cc_shared heap is not registered
>> to prevent misuse by userspace that does not understand
>> the security implications of explicitly shared memory.
>> 
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>I'm a bit late to the party, sorry.
>
>This new heap must be documented in
>Documentation/userspace-api/dma-buf-heaps.rst, but (and especially since
>it seems like it was merged already) it can be done as a follow-up
>patch.

Okay, will send a follow-up. Thanks!

>
>Maxime



