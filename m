Return-Path: <linux-media+bounces-57081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNi1OiYRxGnuvwQAu9opvQ
	(envelope-from <linux-media+bounces-57081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 17:45:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 856BC329454
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 17:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28B8832397A8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D3F3F0742;
	Wed, 25 Mar 2026 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzux6vwX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794D2E612E;
	Wed, 25 Mar 2026 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456599; cv=none; b=mbFaTOckV6PxZqbwzySQk9/sOV5WPrQEgJ8XPwtivhrjslbqbM1TkYS7XlnXhbms+9vWZJhw6e/ir+nHgQ5yym+A4FeLs51o0Fkp/p25upM5OOkmB6ZUWpif6hXG5DhbXE4uYpoXW2aSVPHkfzscJsKO6XrCdxqPTbgfFTw0g0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456599; c=relaxed/simple;
	bh=VhIL6fLjtPzkfyMXrdTOmbzI3y+jzhOEWYMQaJHnKwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyFSjvy7kLmwqdLWSOS+o8w9X6wCrJkdaPlCjxwfuV5PS9efrBtXhUOV8/vOds3WtQzH2LhE9upuS760KI1DJZvKTyeaDBp+gLFvs+KjjxONCnY8+kpJ6VeqwS70e4WDqRt5+m3fKtHDJ0+Uix/F7LLmpHcMfAjO3Zj70MaEg+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzux6vwX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BF4C4CEF7;
	Wed, 25 Mar 2026 16:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456598;
	bh=VhIL6fLjtPzkfyMXrdTOmbzI3y+jzhOEWYMQaJHnKwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzux6vwXHaR7V7neOoTISKQBA9WjUFg4+kBM+feyhHy1v+yuYN5KFjg/2GNiFlhSP
	 AaRmAAC+/iA8V+IEwsULaogCp1gUs/03o0hmrCBYyh4R3UTN8uQ4MFCM8FdGrAsFFz
	 qs0KEYkRvuokQghLH2NFYzschFfHJ23Rp1UlJT2rSboD9oYrebRFLk/FwiQq4bCEbl
	 uBvVPQcc3CkWkKgGlKl1rE+cQu+vMXsTnusbKeqEb/c6H4je5yM9yZ4Bs+a22M/Ztt
	 wlYGRT8oOUxqMyydZ8l00FrsV694meBoOJ9pjwb78wvLVTmxWE9sNHJMT+P+6S1DN2
	 FHAkmOh4Fxslw==
Date: Wed, 25 Mar 2026 16:36:32 +0000
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
Message-ID: <acQPEEd0hQrghGbw@willie-the-truck>
References: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
 <20260216095144.107356-4-benjamin.gaignard@collabora.com>
 <acKxzGk1Z541yoZ4@willie-the-truck>
 <e083e933-2746-4b26-ac33-3b32d362b28e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e083e933-2746-4b26-ac33-3b32d362b28e@collabora.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57081-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 856BC329454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 05:28:44PM +0100, Benjamin Gaignard wrote:
> 
> Le 24/03/2026 à 16:46, Will Deacon a écrit :
> > On Mon, Feb 16, 2026 at 10:51:35AM +0100, Benjamin Gaignard wrote:
> > > The Verisilicon IOMMU hardware block can be found in combination
> > > with Verisilicon hardware video codecs (encoders or decoders) on
> > > different SoCs.
> > > Enable it will allow us to use non contiguous memory allocators
> > > for Verisilicon video codecs.
> > > If both decoder and this iommu driver are compiled has modules
> > > there is undefined symboles issues so this iommu driver could
> > > only be compiled has built-in.
> > > 
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > >   MAINTAINERS               |   8 +
> > >   drivers/iommu/Kconfig     |  11 +
> > >   drivers/iommu/Makefile    |   1 +
> > >   drivers/iommu/vsi-iommu.c | 794 ++++++++++++++++++++++++++++++++++++++
> > >   include/linux/vsi-iommu.h |  21 +
> > >   5 files changed, 835 insertions(+)
> > >   create mode 100644 drivers/iommu/vsi-iommu.c
> > >   create mode 100644 include/linux/vsi-iommu.h
> > [...]
> > 
> > > +static size_t vsi_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
> > > +			      size_t size, size_t count, struct iommu_iotlb_gather *gather)
> > > +{
> > > +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> > > +	dma_addr_t pte_dma, iova = (dma_addr_t)_iova;
> > > +	unsigned long flags;
> > > +	phys_addr_t pt_phys;
> > > +	u32 dte;
> > > +	u32 *pte_addr;
> > > +	size_t unmap_size = 0;
> > > +
> > > +	spin_lock_irqsave(&vsi_domain->lock, flags);
> > > +
> > > +	dte = vsi_domain->dt[vsi_iova_dte_index(iova)];
> > > +	/* Just return 0 if iova is unmapped */
> > > +	if (!vsi_dte_is_pt_valid(dte))
> > > +		goto unlock;
> > > +
> > > +	pt_phys = vsi_dte_pt_address(dte);
> > > +	pte_addr = (u32 *)phys_to_virt(pt_phys) + vsi_iova_pte_index(iova);
> > > +	pte_dma = pt_phys + vsi_iova_pte_index(iova) * sizeof(u32);
> > > +	unmap_size = vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma, size);
> > > +
> > > +unlock:
> > > +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
> > > +
> > > +	return unmap_size;
> > > +}
> > I still think you need TLB invalidation here.
> > 
> > I looked at the downstream code that you linked to and it litters the
> > invalidation in the callers via mpp_iommu_flush_tlb(), which tend to
> > invalidate _before_ starting an operation. That's very likely buggy and
> > certainly not something we want upstream.
> > 
> > The unmap routine should do the invalidation so that, when it returns,
> > the pages really are unmapped from the device (assuming strict mode).
> > 
> > I know you said that you tried to add invalidation here and it "didn't
> > work", but that's not something I can really help you with.
> 
> I know you expect the hardware to work like that but that isn't not the
> case.

The hardware appears to have a register to invalidate the entire TLB.
We can use that if there's nothing else.

> I spend quite long to try to found hidden bit(s) or an other way to do like
> you want but I can't find any solution.

Then we can invalidate the entire TLB.

> As you mention the downstream code suggest that the iommu can't invalidate
> TLB in unmap routine so I don't see how to progress.

The downstream code is a tangled mess; I don't think it suggests anything
about what the IOMMU hardware is capable of.

> Maybe we should just admit that is how the hardware work.

No.

The upstream kernel isn't a dumping ground for vendor crap. The hardware
has TLB invalidation functionality and so we should use it. If we don't,
then we're not giving the IOMMU API what it expects and any callers
outside of the video codecs will be landed with problems when unmap
doesn't work as expected.

> This v13 has fixed the documentation so I don't plan to spend more time on this driver.

That's a shame, I'm really not asking for much.

Will

