Return-Path: <linux-media+bounces-57910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNY4IZfzzWlLjgYAu9opvQ
	(envelope-from <linux-media+bounces-57910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 06:41:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0850383B19
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 06:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78D9B3033E4B
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 04:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11FE365A1B;
	Thu,  2 Apr 2026 04:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BO1FXlKb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D943659F9
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 04:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775104904; cv=pass; b=K6SKzw7enI3XCXzuNnBNwCQuVbiOg+dEaaPuRDomiiUQdXgA6/DfbygDjBV6ORJ9b5LYX561dZKlAy9s97rOhCqZF9p/pu8FrgfI4jE9O/axVOVKFWgiW3OZMgtL1E4yFhH2W9hralUmO2Tv467L0Buj4/Ju5AKgd6/gyLt/5OU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775104904; c=relaxed/simple;
	bh=8M0uK/dY9UfmR0xcTfEk17ugbKg+8eIoSDrEidIpkIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMAx5Oo9YZ2EOQWYr0vWvb/2hKu2yak71lwtaXlsbjF3A/cALNPnulg+3CdCcb+aPu5Y816Nv+YxtlpiavOlP6iJL2/zgzauTtMdIoihWbXpvpZvN5B5xKkAmdJGT7jADBXvs06NSs072TUsvKkWrIdbxSeFnGKS5JCKrCOu4eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BO1FXlKb; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b980b35534eso275405866b.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 21:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775104901; cv=none;
        d=google.com; s=arc-20240605;
        b=WDBKeS8WUTud8YCaNZ6wnYcnhWfXZUFcUDPnDDcM2Afwho0kBncDRLyhOq/0TdVzNg
         gM0n7T5/Z2hh6NI8y1Yk6kGm3PryG4VQagnEn76IymBCOP4feaZF2FluHDspmmK9v5Tu
         pAC4qgLg/dKyM/vPUnfn9WOe8Zn9wcDCmpU3dsqew7JS8fvvX8+VYmxwJgcgXe0dt4TU
         zQA1PpHxuzktlw3fOS7HYxmBaZGBKsAO+4VFz/D0I2aE9xow15NQHOLgyRhXOmXABo83
         pq0DBKs1p6uxdPwxcqUmJYIFD2FfD510aujJ7gFlN3qgtv4NSkkbt79sWDZ6aCiiRdTb
         wOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MsqizXttng34qJSYG1+nQy1RthHCf+vtWgekNCi7+qE=;
        fh=wHYObGwCyXNDXyZhWo4USpqueFpF/2HzPi68WLJn/wU=;
        b=JOtliXGZ7TKRSg4rOnDm4/yhkuiidMXO/a6sdijFjWvfaS9rD7MbqEGXZag75BmyB7
         EWwDyRpadhm5XMhMC5AlAnWh5yz2tEZnNRGbE28FNX9IZf8vdE+ZzkV8e43VDsILJ1YK
         tpxzoQW6hRVIC8sj7IFX34GY1qDuojLti8IN2AohZ6TC3RPGaRpTh/gCI8LnbNTCLTtm
         3D5RJjXFQH3op+VGJG4JkSCRau4PQ2aulEbvYrqX3pA4qPaOQS3JH5Fk7lJBoTy9vZBN
         0gyrypmsk1pXEutaY7cidr2G8IutbyPKFXWsy6bpflrL/2tWoMb2sydUnjIYzLsdCiB4
         Ahgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775104901; x=1775709701; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MsqizXttng34qJSYG1+nQy1RthHCf+vtWgekNCi7+qE=;
        b=BO1FXlKbFnLsywCUNjNDxalmf/H81ktx/teEEQOxjSzDk9hyfHXqjOpoghb2MEjCk6
         ouqpEWEkSTCwKWCskGgrYFo2kT2TmtD+VaDc44PSD5qoUZKZ397clW5RoLoKDE5DftYK
         fdm0mFeWKA+2IsEph/tBQ99xAqzzjs7BEbNvMayDxhRkMbX3+oWJhay/LpSuWZINmWDv
         FjU1yCIc6jSUQ0axecP+4EA2X1d5+cI0WKG6z9RQUJCg+yV/IhSzJlFTQOQHfbRktItd
         y1AYkpCaK8sNOzVLsO3XtA8LafPCvTowB3uP1s5/XO8buw4UzT7rD4tiZ6o9NAQbk1uY
         IIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775104901; x=1775709701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsqizXttng34qJSYG1+nQy1RthHCf+vtWgekNCi7+qE=;
        b=s0QIGg/rQP6MgTBstigKIl1o6YCpTJgb4lomm/pIADr9ud6wfFjRT8WEjlMWJRYxtJ
         RwAzPCw9sa+DgzT0lZB6uZkzJaXvzmg+VwgYHdFkf2mbeIJYHNrU5anyZ5qkQ8b1MNtO
         HqRdpiP4CyR3C1RXvgoroMpiiA6EC0OaY+pgn0J6CcRLT/zfz2vK4acwXGaGFGLWT6QR
         Cs7dbd9GeMLvniCz57M+uHoPF9IDQ6xbvtGTsGQvEppErp/m13bIBYIXaxXpYtoliL13
         idCU95BIMPiCYHdGsiwRutmvI5MudRNlGvviPIMbOeT3QjrIUJOLfdF2yll91JYoDwOl
         9BIg==
X-Forwarded-Encrypted: i=1; AJvYcCV75GMmtPsqQOsUNXoSDR0NzNvqgzFgACsPXAdsRgsp1zTO0iy8665dXjJfAgsDqmKaxSN3hpo5umjXyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1TxggMqLomT+Zp9Xfw0epd9pAk07uDd1s1+7Rf4u2CY6tO8W
	C1yWpUEz4MUYdKezgmtNgtC13hGx9EZYPn0TxA4LJG+RpXwRqV4CBRdGGImw71waMlnn7NbcYW2
	8sei2nmPfEo2bgCXqSILEpebl8a03zXaFI+9dA1SayQ==
X-Gm-Gg: ATEYQzw9SGdHfayWXULCfBZzlQlQa0sS/rNjrXSHQyvrh2vCF8MIc6mzEiI87IQBLhb
	UOGGsxhIFhxL9N55U0DT3FnhyGx8JS81PNcBWzo3Al72yHhB+PRCsb3peAqcc33A8jOJvmM/0Uz
	725y6hdk+KxF683SaFtDZTalVrtnA8T+EyXHduudQcT0WIC8dSdx+Z0aQKDjhHQVX1gzlVGjiN3
	YeB8Pdr3SNY1Qkse6CkFDG0fu6mKYGZ5ZZWe1d1FWQlt+tDiP3XU4V5r/AxvdCQ2Qo5qNWrU6ci
	OErVKqnLBnesZQ5GRvDu5myzcUo7iesTxE4yyg0=
X-Received: by 2002:a17:907:8694:b0:b93:8275:795a with SMTP id
 a640c23a62f3a-b9c46fedc2cmr44691666b.15.1775104901064; Wed, 01 Apr 2026
 21:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325192352.437608-1-jiri@resnulli.us>
In-Reply-To: <20260325192352.437608-1-jiri@resnulli.us>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 2 Apr 2026 10:11:29 +0530
X-Gm-Features: AQROBzCoqOVd8w8IT8q-wzhadg7W4rdnhn-HGLlu-Tm0fuk9WqMGP5WDrs9ZghY
Message-ID: <CAO_48GEUXpcFBiyJAMgTcGPSq56-mZ0qnO3FrFRM2LoGd8W6HA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, 
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
	suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
	john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57910-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,resnulli.us:email,mail.gmail.com:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: F0850383B19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jiri,

On Thu, 26 Mar 2026 at 00:53, Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
> run with private/encrypted memory which creates a challenge
> for devices that do not support DMA to it (no TDISP support).
>
> For kernel-only DMA operations, swiotlb bounce buffering provides a
> transparent solution by copying data through shared memory.
> However, the only way to get this memory into userspace is via the DMA
> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> the use of the memory to a single DMA device, and is incompatible with
> pin_user_pages().
>
> These limitations are particularly problematic for the RDMA subsystem
> which makes heavy use of pin_user_pages() and expects flexible memory
> usage between many different DMA devices.
>
> This patch series enables userspace to explicitly request shared
> (decrypted) memory allocations from new dma-buf system_cc_shared heap.
> Userspace can mmap this memory and pass the dma-buf fd to other
> existing importers such as RDMA or DRM devices to access the
> memory. The DMA API is improved to allow the dma heap exporter to DMA
> map the shared memory to each importing device.

Thank you for the patch series, it looks good to me.

Marek, if you are ok, please could you take it through your tree, with my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Best,
Sumit.
>
> Based on dma-mapping-for-next e7442a68cd1ee797b585f045d348781e9c0dde0d
>
> Jiri Pirko (2):
>   dma-mapping: introduce DMA_ATTR_CC_SHARED for shared memory
>   dma-buf: heaps: system: add system_cc_shared heap for explicitly
>     shared memory
>
>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>  include/linux/dma-mapping.h         |  10 +++
>  include/trace/events/dma.h          |   3 +-
>  kernel/dma/direct.h                 |  14 +++-
>  kernel/dma/mapping.c                |  13 +++-
>  5 files changed, 132 insertions(+), 11 deletions(-)
>
> --
> 2.51.1
>

