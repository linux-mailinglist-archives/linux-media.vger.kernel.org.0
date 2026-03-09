Return-Path: <linux-media+bounces-54952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A/3Os/Ermn2IgIAu9opvQ
	(envelope-from <linux-media+bounces-54952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:02:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 63452239597
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD2E0300809F
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 13:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E7836E49E;
	Mon,  9 Mar 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="uaeuQQr3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355743BED05
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773061300; cv=none; b=sJYiiZImMfCIB1tfKp6ESIyFKcDBaY7mvSwaEGoSRoUKWSjb8TM+UPIw7ZI6uHUsygZGFcMNINgemHyJ//1L665hVeuV8sSXjMwl+pt/xuYe+Xs6EEs3fSb6ryWOPJPgipUWMj55zEqJj/MxirAyHOqdXs27vTCv1T/OH0PNZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773061300; c=relaxed/simple;
	bh=PkTbINFVaFCLBX8INx4Y8qGhkNCUftkmgaPAZo5ZF/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQAYdokq9PIgKfN1tlONaQW6qqxPTPEXjM1p1YzlYhp1LyvkER/u8bU5WFvcf61Fe/dugG+nn9WyLHd+wQfbhLdOFDFCQbGyzNWxR8lppU5N11aQ80ljOf7iG2MmjPIbKEvPuJA9GZZJaCZW972s4gm1meILbFheWhSziooxcRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=uaeuQQr3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853fd7b59aso3213845e9.2
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773061291; x=1773666091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1uSgKALRT8QjmGeRtwIR5Sg9BvduvH1KsXj/bwOWs0=;
        b=uaeuQQr3J2CqCaD1+4a9FoLfWQ+fF9MZDaWSpj2oVDf0q67teCuspTAPSnRXGC9Ar0
         zCtAcnbuzpd2eLD5H+pqm9+vNvz+B2aDevjxyHojoy+da9TX996xPTJcCdQ9Kk3g6Rh4
         0O6psE+IbYg8xLYBtwHLeC4CGD1zK88Bq5geYncmz7pCBT1Ak/5SOOATIWEi8CqyOdts
         KglkoLhbO94vCH51DgYe/4Pw37yzjALVgxTEA5DBskYrhNCdMEgxlr1ouYxgMJBN2PYT
         pId5nFe9gcYxi52TekOZMPs3WB4JQYxuJwSwvv/VNowiE1BaQp6swV+6bZWcBLkbcEmR
         TAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773061291; x=1773666091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1uSgKALRT8QjmGeRtwIR5Sg9BvduvH1KsXj/bwOWs0=;
        b=Rw2u1CWsG7qRKeY7BGeyb3GzSGGHzfhex5MNHA1OpyZApNqpYkTsaM9SzXNOemwOu3
         xbldAeuhp33W6gaq9kNtm3wn0M75Vz0uy3sbGNeLvwHdarC1WDgutJoKFVfzPHgMT9Cx
         GGzdIBuMca3D4/umpHqiTrNyCOGXswoV0ffhXmoRUbKdY/nmmvVIXAIz2QvUDzLaLcEU
         xT3DI6RU0X1yU0hWzUmHTy6OTVM/c1muz+guICEImideG1UJy2OhZhzJPKfDZOtHR8fg
         +PiaqmB3GtHMvGA61GSDsxIOZhZpQ6jHhXkzaKdgGVLWVKLNx0/nAXUQBgCaEe2awuJ9
         z0KA==
X-Forwarded-Encrypted: i=1; AJvYcCXDdm3VJotXSsQdshUaQkLCYVIyUIi3rm1ToDMBlL8flbPzv/p3b7draKE2bCwi88SU1pzDbM8qVVbRBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHkqmacAbCmtC0tf0UgypceUuFcXTBEBlkJsyXylXK+YDq+LeA
	3CCth5uf9meUdgA1wPqBWnwEkQ4PUdao0moNn4tDMr/Jh5wYH74/1Irg5g6OwOsQV/M=
X-Gm-Gg: ATEYQzwEFnMv9wwlrc8uU/fEcjVc6EBZxo/9a8GpilTAiYdXQgT7OVk3sNdTMbijgpD
	fG1NehoCySaWjJ0GohZfS4rdHdGts9A6ngUw5z/Uf0inMTZHqOA4C0cMkJkGIeMsg2THPrnlAPO
	RRJdbe3vXxjOsybZcmw8kL95VXYUXsh2R+CDxno751i5pWpyMoiKza50PCI3scmARMcSnqxfRWh
	FvT5gR/vHtUoKJmB0MpPeSzmM2CoZv7YvaqCHQGXGDwOpt76VipaQUDw5q+Kf1GN3W+B6arLjyF
	NsdfPIlA4oz+Erxdx2u3Jb92nLUJoc9HrFISJSDHGs1o0qOVGVXVuqzOO8r5qoCpSejA1M8WFFS
	wOTutd1IFBoKDbfio3ktRr27VFDoKQwUj+yPUM8WdXWkZ1OVR+PhdRbQTJJPdXQVwWc7GvTmQMT
	IwFPOPZE0tTGbJ245SZChvGiDLHEmSOS8nA2SL/BkcjA==
X-Received: by 2002:a05:600c:8218:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-4853692eaf6mr73833215e9.25.1773061290855;
        Mon, 09 Mar 2026 06:01:30 -0700 (PDT)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a498afbsm64496685e9.0.2026.03.09.06.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:01:30 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:01:26 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Petr Tesarik <ptesarik@suse.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, catalin.marinas@arm.com, 
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, steven.price@arm.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com, 
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <byfhwrnq76ylztrjc67ia5tlzgpihh3ycv53je3jekkbqltcad@sslumibsz23v>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260309135610.1f81d2df@mordecai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309135610.1f81d2df@mordecai>
X-Rspamd-Queue-Id: 63452239597
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54952-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.930];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,suse.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Mon, Mar 09, 2026 at 01:56:10PM +0100, ptesarik@suse.com wrote:
>On Thu,  5 Mar 2026 13:36:40 +0100
>Jiri Pirko <jiri@resnulli.us> wrote:
>
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
>I don't want to start a bikeshedding discussion, so if everyone else
>likes this name, let's keep it. But maybe the "_CC" (meaning
>Confidential Comptuing) is not necessary. IIUC it's the same concept as
>set_page_encrypted(), set_page_decrypted(), which does not refer to
>CoCo either.

Do I understand that correctly that you suggest DMA_ATTR_DECRYPTED ?
It's not uapi, so this is flexible for possible future renames.

