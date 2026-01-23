Return-Path: <linux-media+bounces-51437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPHQMo2sc2nOxwAAu9opvQ
	(envelope-from <linux-media+bounces-51437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 18:14:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F378DDB
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 18:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E05CB3020E97
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 17:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3BC319852;
	Fri, 23 Jan 2026 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMyD5dIx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E9F2FFF89;
	Fri, 23 Jan 2026 17:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188477; cv=none; b=UhY7lgeer+he0Gi2K/7KujyhlAcpxY6Eg9e6Vl013yRK0Hxec/TlHsW6xDNDyqBpXJg538yvwLqrg9KEKfPB94luTPipKAr9YzswQZhVw0PENuC25BVEkbbOXLK3MtZEi7zWuqMImIbh3aEPlVAWOAttWSfMVIVM1XAtE9Zvn60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188477; c=relaxed/simple;
	bh=KuWTwQAvHKNEr7McYbtyjdsmHZtcDax2InXNF4vfUac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPTb1HuNyQS00xV+J4RPiZRO17asVi9v81R9mtf1hyR0b0JhyJ8R4416HESoCt4PER2QZae3dAfP+0wBW17oEjejUqMIJzp2uU0mrGy/OVnUKq/PBfvZjwNunSdJBG1vwy88bltx7+uOhscSZl3f3tbj5QQneih8RgrmA/kUidk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMyD5dIx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD58FC4CEF1;
	Fri, 23 Jan 2026 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188477;
	bh=KuWTwQAvHKNEr7McYbtyjdsmHZtcDax2InXNF4vfUac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMyD5dIxCP9zQnGyRwuErwnLguBZCDeZLKP9ED4GVP9KZvGImzrxVqvtkyTo5toDQ
	 twULnG+AnaQ6GicScONE10tSmaym03JPpQsUHGVJvzv25h2LAMeUzzkjONAAP6P2hu
	 7gvXSzaj81E/JAPy1X6owf7tXRdFCrZKuiw8lo6lpUd0q8y8mGfQ5LZ7vMQFI+jy8U
	 3m9bC5GwmBWqEov1tJ5Log4I3/fMjqcqZuo6jx7f+d1VpXTUiv6i7lRSyTdnAWMsr3
	 s9CYwi/cvbBFO43BsZlLQHcRutV7916+N3hEWgikOYnzt3SmMR4KR9SIwOVlE/PoFw
	 x9a72+MBAlgeA==
Date: Fri, 23 Jan 2026 17:14:30 +0000
From: Will Deacon <will@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <aXOsdlGMVzhHOrUr@willie-the-truck>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
 <aWeTQ50DOtntcniN@willie-the-truck>
 <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
 <aW4kb5EbxbrhTOxK@willie-the-truck>
 <b8f43fe8-3e07-4d98-a50d-817c31370710@collabora.com>
 <aXDL2JH_4RCDmAJv@willie-the-truck>
 <4b33b50f-f0c3-4db8-b394-dd2d4d6e3a55@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b33b50f-f0c3-4db8-b394-dd2d4d6e3a55@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51437-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A1F378DDB
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 02:50:18PM +0100, Benjamin Gaignard wrote:
> 
> Le 21/01/2026 à 13:51, Will Deacon a écrit :
> > On Mon, Jan 19, 2026 at 03:03:44PM +0100, Benjamin Gaignard wrote:
> > > > > > > > > +static const struct iommu_ops vsi_iommu_ops = {
> > > > > > > > > +	.identity_domain = &vsi_identity_domain,
> > > > > > > > > +	.release_domain = &vsi_identity_domain,
> > > > > > > > > +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> > > > > > > > > +	.of_xlate = vsi_iommu_of_xlate,
> > > > > > > > > +	.probe_device = vsi_iommu_probe_device,
> > > > > > > > > +	.release_device = vsi_iommu_release_device,
> > > > > > > > > +	.device_group = generic_single_device_group,
> > > > > > > > > +	.owner = THIS_MODULE,
> > > > > > > > > +	.default_domain_ops = &(const struct iommu_domain_ops) {
> > > > > > > > > +		.attach_dev		= vsi_iommu_attach_device,
> > > > > > > > > +		.map_pages		= vsi_iommu_map,
> > > > > > > > > +		.unmap_pages		= vsi_iommu_unmap,
> > > > > > > > > +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
> > > > > > > > This has no callers and so your unmap routine appears to be broken.
> > > > > > > It is a leftover of previous attempt to allow video decoder to clean/flush
> > > > > > > the iommu by using a function from the API.
> > > > > > > Now it is using vsi_iommu_restore_ctx().
> > > > > > > I while remove it in version 12.
> > > > > > Don't you still need some invalidation on the unmap path?
> > > > > In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().
> > > > But that just writes an invalid descriptor and doesn't appear to invalidate
> > > > the TLB at all.
> > > > 
> > > > > That clear BIT(0) so the hardware knows the page is invalid.
> > > > > Do I have miss something here ?
> > > > Yes, the TLB structure needs to be invalidated so that the page-table
> > > > walker sees the new value that you have written in memory.
> > > > 
> > > > The rockchip driver gets this correct...
> > > Rockchip hardware have a ZAP_ONE_LINE register which didn't exist on Verisilicon
> > > hardware.
> > Presumably you have some sort of Verisilicon datasheet or downstream driver
> > from which you can infer the TLB invalidation runes?
> 
> I have only this downstream driver:
> https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c
> No datasheet...
> 
> > 
> > > I have tried to use VSI_MMU_BIT_FLUSH on VSI driver after unmapping iova
> > > but it doesn't work.
> > What do you mean by "doesn't work"? If it works without doing any
> > invalidation at all, then it's very peculiar that adding the invalidation
> > would introduce issues.
> 
> I mean VSI_MMU_BIT_FLUSH register can't be used to invalid the TLB.
> I think the hardware iterates over the pages tables in memory and
> check the valid/invalid bit.

I bet it doesn't: that would be horrible for performance.

The hardware clearly has TLB invalidation support, as the downstream driver
that you linked above implements av1_iommu_flush_tlb_all() to poke it.
If the hardware has a TLB, then unmapping a page-table means you need to:

1. Clear the valid bit from the descriptor in memory
2. Have some sort of memory barrier
3. Invalidate the TLB
4. Wait for the invalidation to complete

All IOMMUs tend to work like that and I don't think this one is any
different.

Will

