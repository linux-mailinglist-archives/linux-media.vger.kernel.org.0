Return-Path: <linux-media+bounces-54950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAWaBcjErmn2IgIAu9opvQ
	(envelope-from <linux-media+bounces-54950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:02:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D58B239589
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 14:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDC5230A87A2
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 12:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230CD3BD62D;
	Mon,  9 Mar 2026 12:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EeromH5H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98B3AEF39
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060982; cv=none; b=FaaA0gKg23fhkYdZtHGdMiQr3NvHPiGpva4t4u2ssjflAjIFaUuxo54mhLPLG7iHsL+lPddDnmzbrQPG3Z0FSED7GikGfxZWVQxYlYdJE1D5cRvK7g6T/UQZRyS67J9PHwVCIJg5uK7audZ53DSOsvRX+XqjRjVA2vO48jCH2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060982; c=relaxed/simple;
	bh=QNehHtcV/U+882/EtROWCyMzcCT5AwE/vkXUl7ZCaNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aU/gWwmWrM8SrI4iT/Ku3ojT77eW+JRgWWprgL/4VGmmDSJWZOL+s5qd22eucsNTr99phcB7vFMUDRV3LKxPwtBGQvSzwtI8YVzkw7qp/HEQG772wM9cb4Jtx9lpmaLXTzvH5Bmvix/Xno0+WglUfkYHTgihMbrjM6gmGoQC9SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EeromH5H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so9673555e9.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773060979; x=1773665779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j31KcT6diRW6n3JlpG0W6j7VdcBs25Hbct73pL8cVGw=;
        b=EeromH5HM7rgGbrTv32AduetEAqoUK7wDBuDvo3KgP2crJEI1Oou6ksmKbN6NLv2eZ
         JgBbbSc2x8Q/TsK62x3dmldus9Z4KBvnz+hhMlSnpUUAL8ot6rMtzZggLeGT7bEzRUuH
         eeiaq7d+CG6DGxTo8DaGINHc8bWL/tJIpqierinP9/z4agKrq4a8O1aHw54dHHYi7TPw
         LHILfVcrMfHBDFLw0iigMKdPGmBXLr06+ZGgCzguJS5WYnoRcG/HXA4Cq6GEuQK1HXGn
         cMOhfi46fEP/lJ1RHJzTELIrW+GvPcxrBgsIGGIPALzWK9aIgli3iiaQS2ifcwHrP7bb
         p13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060979; x=1773665779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j31KcT6diRW6n3JlpG0W6j7VdcBs25Hbct73pL8cVGw=;
        b=hMK4KArzYyKtA0awfW5a+dpstbPz3xcbtMoVcrLNzrgoCW6QYap0/DzhPJDv9JXaPF
         DjXmAKjPthM7wjmhJQBHO+N7aTzFNo9AN13caQ09HQaZin7zVTl9a4CkkHKlpC/Ir/b5
         9/+Axohu3cOq1IJhs4zqxeUTZCPqUtn2eXp3GvKyvfQABXkOO3QI3YHy83s2Imd0Gt3D
         y2l1KCmtMobBXh6rFoj8GV1A5eRuvbvwpUVMMFRYWlW3Vm2B5Z6mp+P2I5S/hYgekWLi
         fKCypVcjWVC+Ts5hZBBFxy91/Od9LQwayG+ZZr1dkDh22jojjICYq9LQLru3imsvsvRW
         cDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtSPtALICWpB3Oz6YeVu2HP0Ke9l8Q6qhezHLmt5zDKmzj47OKheLYEcx5IE/Vs4/ha45BuUHRgXuHSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpR28APsCLfCEj7GrSSJ7veIy2qDpucbyS8sQG8TiSKG5M/x0W
	bGA6GUkkcMEktENocJMVQji/n87auVL8PRclfgDCBsctOPAVkBrJWyUYryVUi5KlUbo=
X-Gm-Gg: ATEYQzx0+c5mkackvCA8xJIlg7z0ctxFyKrZB/XZVN2bhVG1QjYznfpkoTiVv1EUH0O
	wWmfPqpocylODJc7mS3Fi+ybUP8UiQIu9IvfGxQKqvMZ9PGQIucWCP7WtUrzvIkpToE1oco+qLU
	T43buDJWltjJyZJQz1aFsB+mBg3q3i1FCLuRjETRSV5/QqG+hIh07C/o5V+ZQXukUSQ4rqOeDLd
	ux6VWiUlvRdf4LOocS3J0AXxiPGCdDt9/fF6OK+Zz/LZOQ760OE9P/loLTYQp1bfe/sK5P6Mrmg
	HOupuusXfuFSm7AkZgqp+n809SxWry23aE7j551hn3p2vax0Rbtj0xwZwOtGnZVu1xjFscJ8o6o
	Lboe/yh26XGMQXxGcqPlctVjwJyW8EPs3G2jPzcgNToBpXOdqyATeujKjxQR9WyhWZBFdROIqX2
	EtlxGRLAiwNgSDF4D0sfCKeICSdtPU12H257LFuBNLO6Xv3Ju06xumVwF4AsXhI7P2YUGjMtntO
	+sZ83ZgvkjGl91vlSX2P9A/Jgg=
X-Received: by 2002:a05:600c:871a:b0:485:3bc7:a224 with SMTP id 5b1f17b1804b1-4853bc7b582mr27768635e9.6.1773060979410;
        Mon, 09 Mar 2026 05:56:19 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3a20fsm26118577f8f.28.2026.03.09.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:56:19 -0700 (PDT)
Date: Mon, 9 Mar 2026 13:56:10 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev,
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260309135610.1f81d2df@mordecai>
In-Reply-To: <20260305123641.164164-2-jiri@resnulli.us>
References: <20260305123641.164164-1-jiri@resnulli.us>
	<20260305123641.164164-2-jiri@resnulli.us>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6D58B239589
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54950-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ptesarik@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.940];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:dkim,nvidia.com:email,resnulli.us:email]
X-Rspamd-Action: no action

On Thu,  5 Mar 2026 13:36:40 +0100
Jiri Pirko <jiri@resnulli.us> wrote:

> From: Jiri Pirko <jiri@nvidia.com>
> 
> Current CC designs don't place a vIOMMU in front of untrusted devices.
> Instead, the DMA API forces all untrusted device DMA through swiotlb
> bounce buffers (is_swiotlb_force_bounce()) which copies data into
> decrypted memory on behalf of the device.
> 
> When a caller has already arranged for the memory to be decrypted
> via set_memory_decrypted(), the DMA API needs to know so it can map
> directly using the unencrypted physical address rather than bounce
> buffering. Following the pattern of DMA_ATTR_MMIO, add
> DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
> caller knows what kind of memory it has and must inform the DMA API
> for it to work correctly.
> 
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
> v1->v2:
> - rebased on top of recent dma-mapping-fixes
> ---
>  include/linux/dma-mapping.h |  6 ++++++
>  include/trace/events/dma.h  |  3 ++-
>  kernel/dma/direct.h         | 14 +++++++++++---
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 29973baa0581..ae3d85e494ec 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -85,6 +85,12 @@
>   * a cacheline must have this attribute for this to be considered safe.
>   */
>  #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
> +/*
> + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
> + * (shared) for confidential computing guests. The caller must have
> + * called set_memory_decrypted(). A struct page is required.
> + */
> +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)

I don't want to start a bikeshedding discussion, so if everyone else
likes this name, let's keep it. But maybe the "_CC" (meaning
Confidential Comptuing) is not necessary. IIUC it's the same concept as
set_page_encrypted(), set_page_decrypted(), which does not refer to
CoCo either.

Just my two cents
Petr T

