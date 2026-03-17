Return-Path: <linux-media+bounces-56090-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBdCEaJZuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56090-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:39:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E508E2AB0AB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E2FC30351FC
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFEA286410;
	Tue, 17 Mar 2026 13:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="OuESGAJ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30692874E0
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754628; cv=none; b=V9Q0/2j25Oh3vMTuqmvf5qM1v17YWJiZHZdAiO1eOMNMMjpZNqsTP9h7xAwSXYkJBqJOrOu2KSkDF25iqyUP6nMbBEsaQCVT44w6DtpG0ZpMK/LvOyVTh/nBlpfIA5ZUVzFn85OrQVcWYpHXrRNWxAcYYvabijcXsWTOd7XUFCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754628; c=relaxed/simple;
	bh=iibvvbujQ5RRNUoZhe+z5X7/JBkY5cB6lsi4Yp5e/zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XI5GvJmytzHLQfVHA3uizySkIvp/JMYt9uOMmI9zMS4QWmEDkDmCAPLqYIOKS5AX6WRNlW5/tDG4rDSqyjpnjOdJwESoqLjAQvo9L8F1msv3NaiOiQdPWMDTHnrBe+iMIFhuMd5G+QHlOV/U6kUi5r+ilIo2BBr6ewc+W60THV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=OuESGAJ+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so67324715e9.2
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773754625; x=1774359425; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bvyHox0ngaRcTYY5mmOslDzHoAOd+VMSoOGA/5ZJGB4=;
        b=OuESGAJ+eGX3PIWoMvI/AEPenqli+ZRO+HujrE1MjldymthA3sbMx/gxajCrFCm/i/
         OnmizuIrkhTyrzqQFjZWoqc+NRWikVtxb1R4NMi5c5BTyKUgqQXEI2f7FCTa42KPASzW
         zfUDEM2AZNRK014/ytSO0s3qwrvNs2GBXD1uaiwtx1fiw6ISSbjohdOclvJmB8FwHB5P
         EICHNT9eEpAroCqpmfm0ySwjTnUCvxELkXTxKU/QQLFN+riPgZz+cQSD3ozleaCA4V9F
         DrPzkt7B/w/hIrkYLAiFypBHA5tmRyp7CA44IuXQmvDUObzuRxeAuxXSpxMddDZEPGHD
         dcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754625; x=1774359425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvyHox0ngaRcTYY5mmOslDzHoAOd+VMSoOGA/5ZJGB4=;
        b=jFt92m5dAGc8WYjO2SH4Vd6p9hJ8P+Jhhf4TKOZPuJcsQJRc02AjMYH6lJI/kLafrY
         A78ifC43P/jLOZTmsscqr27hkO0tHfU14NLHtbxn7EItvJDM9DDGqKjmu7pgR1KV3v+M
         RqmyMiN3z1+Qa5PX2osJyQx19CroFJ/7BsN3ZixosCTRh3xj1Jz2TaOF4diPJ3/bGMhM
         sOIgZLBGBa6AHsm81Y68k6B/+hJwCRQ1fXMq22ts7vxtlV8U0S50Ayz1z6E+q28WKgl+
         ZavJuT/lBBtfIZJKtpL+fR2fAUmz6mn/Qgi9ZzxxJNxBObivSJMeLh4qj0x6bDF85wgk
         kHJg==
X-Forwarded-Encrypted: i=1; AJvYcCX6CafhUr36OvrA1vLN50Dr+zqXd8YDuiRuDlCtM2Th869GRF9pgWSlBX0zZfqo79TDZuzIbEyY9lZ9zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPqYgjBSp5E0G4MNRB/VduLUcafrFxJV88ixKHN+3eN21Ks9x9
	4TGKFiG36bMm7P3dRflyVLBtMhxMnaopKIcU7vNxPxwf0qRbofLhHhtAH2oene1Cs8Q=
X-Gm-Gg: ATEYQzwZ7Xup6K/MPWohaGyDfeT8hmfsoP28komftkf2xdXXsstgvZ45ObL/wHGg1yX
	fQwmN3ixEUbNGzwKACAxxyLtyw7f4Ee/aGtPDk+6T6saPR7Cs/rIvMS19wHLoLOadetU9d8wLBd
	YfOyydwAFdgmREaUeKql84ZyqLoMtFzP3m3s+8Fv9nKoJr4oN0E2l1RHuO5cSS1PHdKvhwctVCZ
	dGeb1y2larJuRMGg+wYOHwev1YjHA5+0BkjEwGez+6w9UfQgjIMOlRRO5TBf9+QZBzvPUsf8pFU
	J9aPmF/2a/0Qiq0I59eGds/HmdHI1iTpfgEi54+Nkg+vCdBCxLmXH4patfDntRCYHj9ciG9zzql
	uZkDW1BKzkMNtcQA9iz6TkGVIfjbdTDQeZnp+nME7cedtYD9YUpWzkYzkn7QOiaABPiikBfWBus
	EfsRKdhvCXR7eZ7/l/WsKnhmDBs6jgOLg=
X-Received: by 2002:a05:600c:a011:b0:485:6cd3:f7ac with SMTP id 5b1f17b1804b1-4856ce33d33mr90044845e9.20.1773754625122;
        Tue, 17 Mar 2026 06:37:05 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaa3b66sm76702495e9.11.2026.03.17.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:37:04 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:37:02 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Mostafa Saleh <smostafa@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <xdy5anped2koy47cuxbbqocyypisl7lagwvpuokpzpggohk2dp@yilc5ihictph>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ablV_f_l7wD2m63E@google.com>
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
	TAGGED_FROM(0.00)[bounces-56090-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: E508E2AB0AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tue, Mar 17, 2026 at 02:24:13PM +0100, smostafa@google.com wrote:
>Hi Jiri,
>
>On Thu, Mar 05, 2026 at 01:36:39PM +0100, Jiri Pirko wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
>> run with encrypted/protected memory which creates a challenge
>> for devices that do not support DMA to it (no TDISP support).
>> 
>> For kernel-only DMA operations, swiotlb bounce buffering provides a
>> transparent solution by copying data through decrypted memory.
>> However, the only way to get this memory into userspace is via the DMA
>> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
>> the use of the memory to a single DMA device, and is incompatible with
>> pin_user_pages().
>> 
>> These limitations are particularly problematic for the RDMA subsystem
>> which makes heavy use of pin_user_pages() and expects flexible memory
>> usage between many different DMA devices.
>> 
>> This patch series enables userspace to explicitly request decrypted
>> (shared) memory allocations from the dma-buf system heap.
>> Userspace can mmap this memory and pass the dma-buf fd to other
>> existing importers such as RDMA or DRM devices to access the
>> memory. The DMA API is improved to allow the dma heap exporter to DMA
>> map the shared memory to each importing device.
>
>I have been looking into a similar problem with restricted-dma[1] and
>the inability of the DMA API to recognize that a block of memory is
>already decrypted.
>
>However, in your case, adding a new attr “DMA_ATTR_CC_DECRYPTED” works
>well as dma-buf owns the memory, and is both responsible for the
>set_memory_decrypted() and passing the DMA attrs.
>
>On the other hand, for restricted-dma, the memory decryption is deep
>in the DMA direct memory allocation and the DMA API callers (for ex
>virtio drivers) are clueless about it and can’t pass any attrs.
>My proposal was specific to restricted-dma and won’t work for your case.
>
>I am wondering if the kernel should have a more solid, unified method
>for identifying already-decrypted memory instead. Perhaps we need a
>way for the DMA API to natively recognize the encryption state of a
>physical page (working alongside force_dma_unencrypted(dev)), rather
>than relying on caller-provided attributes?

I actually had it originally implemented probably in the similar way you
suggest. I had a bit in page/folio struct to indicate the
"shared/decrypted" state. However I was told that adding such bit is
basically a no-go. Isn't that right?


>
>[1] https://lore.kernel.org/all/20260305170335.963568-1-smostafa@google.com/
>
>Thanks,
>Mostafa
>
>
>> 
>> Jiri Pirko (2):
>>   dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
>>   dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
>>     decrypted memory
>> 
>>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>>  include/linux/dma-mapping.h         |   6 ++
>>  include/trace/events/dma.h          |   3 +-
>>  kernel/dma/direct.h                 |  14 +++-
>>  4 files changed, 117 insertions(+), 9 deletions(-)
>> 
>> -- 
>> 2.51.1
>> 

