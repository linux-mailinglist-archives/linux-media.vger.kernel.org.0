Return-Path: <linux-media+bounces-54867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH9gIFNNrWn/1AEAu9opvQ
	(envelope-from <linux-media+bounces-54867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 11:20:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366222F4E5
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 11:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 556603009F29
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 10:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB603644C3;
	Sun,  8 Mar 2026 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2DwgKES"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F891D5147;
	Sun,  8 Mar 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772965192; cv=none; b=Bb9PEFSNeWc4ozn/4fVSO1mp+Z+hQ7v+cZEq2anLXOlJU4vizq1AUfJmxuIRr3JTlQ6CTi9/R2URzyRthEAb08mhJRFIjv+DIFEXq0xsVsQFS5UFX9lN7t+kQVnd31DX+J1xKa0GV1QwFBshr+tossLIklagpsnd9FkTjcdHBKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772965192; c=relaxed/simple;
	bh=2rFD7sDu1Wtasy0MSqFkcujG/V06Q4133pzep9gFi5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1TvCuuLmsfooaVwNqlwz+l+HOTQgSdKMQz538ctYdHJrTQ7uSe+6FnPpaHh3zkkwluKCzXF2sW6bU0rnSJjDVdW79bvBNgXIl7S/d2RxWwHp0xBjwXbql1xTFhwD1AuKNg8bfDvoN/BPBESw72I9sCXl9aWD+PnBv01/otlwYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2DwgKES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B329DC116C6;
	Sun,  8 Mar 2026 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772965192;
	bh=2rFD7sDu1Wtasy0MSqFkcujG/V06Q4133pzep9gFi5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2DwgKESqYEHeq6xbQ9Y/4KnjfpT9egAUca/+6XgnSqcnIp+Laiy1Uwm+N8V9voBd
	 fxcBXtB0ojzfBqRoHjyYn+btN53hl1eP2g+Jl3kEAF3iW/kTPJAKlqcJdjkY40fWj3
	 BOVCrPGvleJYYxoXLHmOtzNbV7f0JY0Da4oaPUzLgTxfaDgwKlmmaF61Wrr9kkBIv/
	 +9eat2/GKxxXdtyHMLFC0ycpvww03vxshsMyR+WyUIwUJgGYDRlp3Fc/rw0s5sAkSm
	 +iRAx6RP4744nYEW727O46BGo4mqK33oWMhfaNBeKUFxhH4f8WJbCe/hP0cnU9rYOF
	 QhjHbo17LHl1w==
Date: Sun, 8 Mar 2026 12:19:48 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, jgg@ziepe.ca, sean.anderson@linux.dev,
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <20260308101948.GO12611@unreal>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305123641.164164-2-jiri@resnulli.us>
X-Rspamd-Queue-Id: 7366222F4E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54867-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.918];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:36:40PM +0100, Jiri Pirko wrote:
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

While adding the new attribute is fine, I would expect additional checks in
dma_map_phys() to ensure the attribute cannot be misused. For example,
WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
that we are taking the direct path only.

Thanks

