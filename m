Return-Path: <linux-media+bounces-35079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 200DEADCCF6
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 15:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03C6016C785
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B023E199E9D;
	Tue, 17 Jun 2025 13:17:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513152E7164;
	Tue, 17 Jun 2025 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166236; cv=none; b=rG/cJWgR0QFnzCZm/AV89oSz+DTts4eFEbXX72qhbQ4Uv4NPDZJ6/sbAFdIpA2ZpHRhfjSL/H995GN+eXorSZ3fj26y20KFy0tI3Zy2kei4OJYo11HYhcTtxMMP1Y8nzsWy004hrRsfz0/c5pgHLWZcMCEMBu3f3U1TPVFjLLWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166236; c=relaxed/simple;
	bh=mHgkg+/EtK2Xz1jzkkuzvzMcm3VXMCBo3F+Y8Mnttr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnnjaBzoujjXQHgYxLLgMN8lpSEb9a0m32BCRG8/0rAIZCjFq9nyJmlPT316plzT81e8cUjy9AuHMmWQAMuaDNgHxtWgyvehqHSP/hcjX6PkGkbE0Yq04eDygj+x6gkkUYE2lAOsLBJRmH3xTvAd8XKsIcqvBf1ssxoxbcpFPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443A5C4CEE3;
	Tue, 17 Jun 2025 13:17:14 +0000 (UTC)
Date: Tue, 17 Jun 2025 14:17:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christian Meissl <meissl.christian@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Christoph Hellwig <hch@lst.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] ARM/dma-mapping: invalidate caches on
 arch_dma_prep_coherent
Message-ID: <aFFq19W0D5JeOyeI@arm.com>
References: <43a834c8f871f8719368b3f3239f27ee4f6c6286.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43a834c8f871f8719368b3f3239f27ee4f6c6286.camel@gmail.com>

On Tue, Jun 17, 2025 at 09:54:46AM +0200, Christian Meissl wrote:
> since switching to dma-direct, memory using DMA_ATTR_NO_KERNEL_MAPPING
> is no longer allocated using the arch specific handlers and instead
> will use dma_direct_alloc_no_mapping. While the arm specific allocation
> handlers implicitly clear the allocated dma buffers and will flush any caches
> dma-direct relies on ARCH_HAS_DMA_PREP_COHERENT to flush the caches.
> 
> Without this flush video frame corruption can occur in drivers
> like the coda v4l2 driver which explicitly sets the DMA_ATTR_NO_KERNEL_MAPPING flag.
> 
> Fixes: ae626eb97376 ("ARM/dma-mapping: use dma-direct unconditionally")
> Signed-off-by: Christian Meissl <meissl.christian@gmail.com>
[...]
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 88c2d68a69c9..bde7ae4ba31a 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -1821,3 +1821,11 @@ void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
>  {
>         __arm_dma_free(dev, size, cpu_addr, dma_handle, attrs, false);
>  }
> +
> +void arch_dma_prep_coherent(struct page *page, size_t size)
> +{
> +       void *ptr = page_address(page);
> +
> +       dmac_flush_range(ptr, ptr + size);
> +       outer_flush_range(__pa(ptr), __pa(ptr) + size);
> +}

It probably doesn't make any difference in practice, FWIW arm64 only
does a clean rather than flush (clean+invalidate) here.

What I noticed is that arch_dma_prep_coherent() is only called for
lowmem pages, so doing page_address() is safe. However, I don't think we
have anything to flush the caches for highmem pages.

-- 
Catalin

