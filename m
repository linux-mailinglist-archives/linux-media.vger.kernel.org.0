Return-Path: <linux-media+bounces-53274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NxzMg5inWksPQQAu9opvQ
	(envelope-from <linux-media+bounces-53274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:32:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 697EF183B83
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20358301463F
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45358366839;
	Tue, 24 Feb 2026 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="jNIdh28I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CA366813
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921931; cv=none; b=pVREsEhsf4lHa4aAx6u/SafEukDAn7JBxjJjelmfN9EA2SUVHy8hKJ/QCAwgolKqvmoSrrCkzuVvNqfdfmJ1FNxnLX9gJjuP5l0IQ+2H+poKJfLKWA41H7zxT9W4NjtePnY4Nds0NzVKRAygvF18SI6qFPZRT0S33mVTa0Ouh0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921931; c=relaxed/simple;
	bh=avykNOyv/u+V3QY9hr2O0Q36L/u7PrqaV597fmOI+CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsXWJsrT1cz76tXHLBSBRTeoy28Pg14aKhFW75bNMljX833CXJU/2lbkL4RivCxrpBmoUW5qjXQqjz7QSPungIALL2cDdBNOcaQM/QsC8rm2kxx2iTMuJm8Sz+80rwc0lTzSW5NNO+3cRSWkfyQ3NZUFet2IPXkL0PJuh3sOpT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=jNIdh28I; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483a2338616so33279245e9.0
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 00:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1771921926; x=1772526726; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/EquV0ZhBp1KMAQWMVyF7t2k8W3NQOG5g8XyiQs2v3s=;
        b=jNIdh28IXGqv+kQzDLifxTUDsWqn17938bL9gosaSay8tW6dEA8I3jbt1PNovMrwfN
         43/CKBVRTh8mtlnhZRWbPgawt4nXCC6k/7bgtKmw20ytOx+kNJ6hTUePrlFpwuRuAwaV
         +WLXHhlQVPn1GOYqzeqmrOLf+Inub7FotrMho66ecch2acZFwnN5irW4gnA2b5DvxDBC
         qeVko6MVTJ+WwtwFXOTNMhrmXVQXV1UbB6p1s2R6jnJZF1StRjjznP+K8SOCy8cKcyRO
         EmXu3aEfAXtylsf1bdIaD4HzwsIgGGoORp5VgHvbnOhJYwj2HiXBjedE0/ec1oSekTIc
         1CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771921926; x=1772526726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EquV0ZhBp1KMAQWMVyF7t2k8W3NQOG5g8XyiQs2v3s=;
        b=YKC/ea+Sc/HwwtShjKWTOJRJlvYJDhMLAl3SeztTUIo6PX5y82YYqFdwlfvO5k+itX
         ttxMmKyLxG78EBAG70TqwwxrQN5z6WG/jIiNA4MK9Dav2OTBOzV5OuhOcEuQ5Gv8SFAt
         VBIuD/ltjcatyD4SvaQfm8Dr2EfUtyP/pNOHVhHIH2f7ynwfbBcRtS9K4HcdSCssZpKb
         lKTxUyWB5qfoAn50xmeaEsOz8+qjRsnteBGTgXe7LmqyAT5pz+OyK22yrMXDiCXccLIf
         /+W1YxPLaL7WscFTe45Nqpzw/BpZOvShgCQ0uHPDhZT7PiO5MCwd1Ix+vp81pY4MQfUA
         9A+g==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZHbBQ9oujb2Lolg3fxzalgXHP5xsaoE21lTolN15niiCF53otWyU8AlHF4YpjWwnWrrQ288dv7sgjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2PavfVeAtcTPomy6PI/+zz2qr1AMcBb/uDp5KHUPzAd4gjwOx
	1J5CjMj8EaoIBO8IV/MWjrc8/nQcm7lZaAyz/Qr+6enqNW1UeVP+4gHS95swYCuVx54=
X-Gm-Gg: AZuq6aKkMit/5fwvp4Ejp7nSXVwUrN7kHt6d5iSxvnFM9FKjmpE4YtkvnoxehT5D/I5
	5Bay6pkSgDwCD/4fmfh3IzSQJ2WNa13xHAFQmcprrsF6nZzPVhsyiJTpFMC0j6GPZ8MilzQCHoD
	VPEBEpbhNIfCBoV1gfuHyQwJQm98C06Kv1mgESGsJ1s+Tq+NjfJKi44omhyV5OJsC8H5OH288IV
	Qsk6vXGFcNM30sp1F1rePfVgL4WZkGJhm2hGJjXqUdBVlAzzsZWpC0NavNFH4YelW+rLY/mXxve
	fVoeAMBTvtfz4KeCQ/eB2edQjS7BjsRFV9mbluIfn0o8WdKjWWWBiLK6xKDMOxpWAqlwlrcGthr
	YqLJamATlmlszaNj8xTCZpnlwwXv/+yRbhrEk+4rB+hvN1wt1EQruxP+pVYQf1e9K8o29Z00Xyq
	YJ1DPt+lrt3EPFDYV99jyo5zZdOZ+Hx4c=
X-Received: by 2002:a05:600c:1386:b0:483:887:59b0 with SMTP id 5b1f17b1804b1-483a960c879mr236583495e9.35.1771921925134;
        Tue, 24 Feb 2026 00:32:05 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b820f718sm14689075e9.5.2026.02.24.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:32:04 -0800 (PST)
Date: Tue, 24 Feb 2026 09:32:01 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
Message-ID: <5z6d2etfr24oscoxhk3samf2bbhtcz6hymf65cow76omagsplf@6gdaev2perkk>
References: <20260223095136.225277-1-jiri@resnulli.us>
 <20260223095136.225277-3-jiri@resnulli.us>
 <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53274-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli-us.20230601.gappssmtp.com:dkim,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 697EF183B83
X-Rspamd-Action: no action

Mon, Feb 23, 2026 at 07:33:07PM +0100, jstultz@google.com wrote:
>On Mon, Feb 23, 2026 at 1:51 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
>> allocate decrypted (shared) memory for confidential computing (CoCo)
>> VMs.
>>
>> On CoCo VMs, guest memory is encrypted by default. The hardware uses an
>> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
>> Intel TDX) to control whether a given memory access is encrypted or
>> decrypted. The kernel's direct map is set up with encryption enabled,
>> so pages returned by alloc_pages() are encrypted in the direct map
>> by default. To make this memory usable for devices that do not support
>> DMA to encrypted memory (no TDISP support), it has to be explicitly
>> decrypted. A couple of things are needed to properly handle
>> decrypted memory for the dma-buf use case:
>>
>> - set_memory_decrypted() on the direct map after allocation:
>>   Besides clearing the encryption bit in the direct map PTEs, this
>>   also notifies the hypervisor about the page state change. On free,
>>   the inverse set_memory_encrypted() must be called before returning
>>   pages to the allocator. If re-encryption fails, pages
>>   are intentionally leaked to prevent decrypted memory from being
>>   reused as private.
>>
>> - pgprot_decrypted() for userspace and kernel virtual mappings:
>>   Any new mapping of the decrypted pages, be it to userspace via
>>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>>   of the direct map. These must also have the encryption bit cleared,
>>   otherwise accesses through them would see encrypted (garbage) data.
>>
>> - DMA_ATTR_CC_DECRYPTED for DMA mapping:
>>   Since the pages are already decrypted, the DMA API needs to be
>>   informed via DMA_ATTR_CC_DECRYPTED so it can map them correctly
>>   as unencrypted for device access.
>>
>> On non-CoCo VMs, the system_cc_decrypted heap is not registered
>> to prevent misuse by userspace that does not understand
>> the security implications of explicitly decrypted memory.
>>
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>Thanks for reworking this! I've not reviewed it super closely, but I
>believe it resolves my objection on your first version.
>
>Few nits/questions below.
>
>> @@ -296,6 +345,14 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>>         for_each_sgtable_sg(table, sg, i) {
>>                 struct page *page = sg_page(sg);
>>
>> +               /*
>> +                * Intentionally leak pages that cannot be re-encrypted
>> +                * to prevent decrypted memory from being reused.
>> +                */
>> +               if (buffer->decrypted &&
>> +                   system_heap_set_page_encrypted(page))
>> +                       continue;
>> +
>
>What are the conditions where this would fail? How much of an edge
>case is this? I fret this opens a DoS vector if one is able to
>allocate from this heap and then stress the system when doing the
>free.

From what I can see, the failure of set_memory_encrypted() is quite
rare. Don't see any real DoS scenario for this. All the failures seems
to be either theoretical (sanity checks, malicious VMM) or concurrent
kexec execution in case of x86/pat.


>
>Should there be some global list of leaked decrypted pages such that
>the mm subsystem could try again later to recover these?

swiotlb does the same non-recovery leakage. I belive is it not worth
implementing this at this time,


>
>> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
>> index 648328a64b27..d97b668413c1 100644
>> --- a/include/linux/dma-heap.h
>> +++ b/include/linux/dma-heap.h
>> @@ -10,6 +10,7 @@
>>  #define _DMA_HEAPS_H
>>
>>  #include <linux/types.h>
>> +#include <uapi/linux/dma-heap.h>
>>
>>  struct dma_heap;
>>
>> diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
>> index a4cf716a49fa..ab95bb355ed5 100644
>> --- a/include/uapi/linux/dma-heap.h
>> +++ b/include/uapi/linux/dma-heap.h
>> @@ -18,8 +18,7 @@
>>  /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
>>  #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
>>
>> -/* Currently no heap flags */
>> -#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
>> +#define DMA_HEAP_VALID_HEAP_FLAGS (0)
>>
>>  /**
>>   * struct dma_heap_allocation_data - metadata passed from userspace for
>
>Are these header changes still necessary?

Oops, leftovers. Will remove.

Thanks!

>
>thanks
>-john

