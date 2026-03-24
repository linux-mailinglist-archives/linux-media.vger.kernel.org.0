Return-Path: <linux-media+bounces-56887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLYbOy+zwmmRkwQAu9opvQ
	(envelope-from <linux-media+bounces-56887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 16:52:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE479318665
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 16:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3631D3083018
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 15:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375CC372EE3;
	Tue, 24 Mar 2026 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPJOwUL/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A723E320;
	Tue, 24 Mar 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367187; cv=none; b=SVtAeTLyVHbWwUTSdqhhNc22xdOVxuj5FdoCBDe2Hz+u7wHewjMcLNw6wflOY/lH58rO9Zf45Mwzha8ORBR9gZkMy1sO1vDjFpzn5ETURhsumdVmWO0RIvCef2JKdZEYJxk802hfUzl0E6kHY8U5BXFxBYMu48TImgwG+N+PFDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367187; c=relaxed/simple;
	bh=FYUbLS4x6Nc+I7HqaW/Crr9Gva6T47bDev7ITRWYHvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBphmh3JzIXroyOGftSBTLr+lXNqXfdkljPFrZ+dBUePggX17OKUp7vhoHpgl4V4Doiihva1YDHoZcjttht1A/W0pG08+ZAp92XQBhFkwm2fitJzZRmIlDfohgNRV3ncIemBxkANktZqqrmJjU80UI1YsSiX5OSaPduigpJiIYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPJOwUL/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3123FC19424;
	Tue, 24 Mar 2026 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774367187;
	bh=FYUbLS4x6Nc+I7HqaW/Crr9Gva6T47bDev7ITRWYHvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPJOwUL/O2nlpD5r3r3Wgk6C5YAnuJ0uxdQRtF4wYqnSZMGYFF7fC8JL7GG2oWXN0
	 ehBMJyrWX67MCLCBOBGh4cOw2PyJ8hxoikPIA0zex39PWC/jI6AQq7yjPd8AzlxlwG
	 TXlLEwA7KiV9vZB7xJ6sCjO60unz078JzHduvzahYYmuSMN1XPJcrVNJdPCYfaa+SB
	 p+wfDsg1PIM9AmYCdVHbnU5dBTXsoqxqyxAMR7iztZOI3uXGWLTtBO6RSZAXQKM9K1
	 WtvngY8dmI3P5TtK8lkos5o0xHfsUGO4QuptZ6Or3d1Gy/CTHLFnKOnMB4f4PY25Ig
	 V6sgthkh5OVIw==
Date: Tue, 24 Mar 2026 15:46:20 +0000
From: Will Deacon <will@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v13 3/6] iommu: Add verisilicon IOMMU driver
Message-ID: <acKxzGk1Z541yoZ4@willie-the-truck>
References: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
 <20260216095144.107356-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216095144.107356-4-benjamin.gaignard@collabora.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56887-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: CE479318665
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Feb 16, 2026 at 10:51:35AM +0100, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> If both decoder and this iommu driver are compiled has modules
> there is undefined symboles issues so this iommu driver could
> only be compiled has built-in.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  MAINTAINERS               |   8 +
>  drivers/iommu/Kconfig     |  11 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 794 ++++++++++++++++++++++++++++++++++++++
>  include/linux/vsi-iommu.h |  21 +
>  5 files changed, 835 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>  create mode 100644 include/linux/vsi-iommu.h

[...]

> +static size_t vsi_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
> +			      size_t size, size_t count, struct iommu_iotlb_gather *gather)
> +{
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	dma_addr_t pte_dma, iova = (dma_addr_t)_iova;
> +	unsigned long flags;
> +	phys_addr_t pt_phys;
> +	u32 dte;
> +	u32 *pte_addr;
> +	size_t unmap_size = 0;
> +
> +	spin_lock_irqsave(&vsi_domain->lock, flags);
> +
> +	dte = vsi_domain->dt[vsi_iova_dte_index(iova)];
> +	/* Just return 0 if iova is unmapped */
> +	if (!vsi_dte_is_pt_valid(dte))
> +		goto unlock;
> +
> +	pt_phys = vsi_dte_pt_address(dte);
> +	pte_addr = (u32 *)phys_to_virt(pt_phys) + vsi_iova_pte_index(iova);
> +	pte_dma = pt_phys + vsi_iova_pte_index(iova) * sizeof(u32);
> +	unmap_size = vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma, size);
> +
> +unlock:
> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
> +
> +	return unmap_size;
> +}

I still think you need TLB invalidation here.

I looked at the downstream code that you linked to and it litters the
invalidation in the callers via mpp_iommu_flush_tlb(), which tend to
invalidate _before_ starting an operation. That's very likely buggy and
certainly not something we want upstream.

The unmap routine should do the invalidation so that, when it returns,
the pages really are unmapped from the device (assuming strict mode).

I know you said that you tried to add invalidation here and it "didn't
work", but that's not something I can really help you with.

Will

