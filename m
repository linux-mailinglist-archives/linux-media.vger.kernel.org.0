Return-Path: <linux-media+bounces-51228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDlRNy3PcGkOaAAAu9opvQ
	(envelope-from <linux-media+bounces-51228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:05:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C1574E5
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F7355EB223
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 12:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D6B48BD26;
	Wed, 21 Jan 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DL94ys3M"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E018306D36;
	Wed, 21 Jan 2026 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999903; cv=none; b=lGS2PWjieAslmT9VBmBhkpXQXKFIubqXAOiMtt+Vwt7fpiImeWTgXxJDNST2cM4lOtCpt9T8fmuENJoXlRz1cRihS2WUu7z0X7cFc5cfjGqMKlMqkTA4CUJ7sD9XkIuZOrlRxx5Mf+7zjuQ8QlPFbOchEQn9gmFJIL0tZGAbslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999903; c=relaxed/simple;
	bh=brbeUf/uHaUwIvWYg3FBssw/lRpSOlGRll71yV5ZVq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBhAjubDXSDEmWCRWaWmDujTjzKUyp04nDP+BKdDeOPWSvR2iAx/4BPa4FwlDYZY9/halqI3++aSczO7eE3OW3ARYr8UIbwR6ayOMyK2B//PvRzngMLzRA5Ey8q3fqCMrP7iU5aPg94mqnaf5jYoiyE2+VlkrGkaLhahH50oN5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DL94ys3M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC07C19421;
	Wed, 21 Jan 2026 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768999903;
	bh=brbeUf/uHaUwIvWYg3FBssw/lRpSOlGRll71yV5ZVq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DL94ys3MfP15mHhCxt/gWnaL3hYzfGSS458Wm3B3oFfMNSwhEvzoMizLJCYhS7Dt+
	 sAyLDZEAoC8kFGwSXZbp4a4bAQBgBC7Uc7yy47ONTEn/ZMJvlnrcloLsfKZ0f0ijDx
	 62ABgJ6K0ymEb72d0BjWPwEfKI1bxfQX0Kt1H50UqicrqokcexIze+E9nLMoIAU9yP
	 VpmwA5Wt4lt5q+m79eyJRYkUE4cQGVIPxgm61liIll3OtfqjM+Z8UrkdvUo8MsnQXh
	 /uym0TGMQOG4u9zMoCH0OpjLN7mkG/6VtNK0T4r1Il7nNyJXY3NQpn4P0Y1CUoRVGW
	 vA+kHJKGdBE8g==
Date: Wed, 21 Jan 2026 12:51:36 +0000
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
Message-ID: <aXDL2JH_4RCDmAJv@willie-the-truck>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
 <aWeTQ50DOtntcniN@willie-the-truck>
 <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
 <aW4kb5EbxbrhTOxK@willie-the-truck>
 <b8f43fe8-3e07-4d98-a50d-817c31370710@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8f43fe8-3e07-4d98-a50d-817c31370710@collabora.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51228-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 892C1574E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 03:03:44PM +0100, Benjamin Gaignard wrote:
> > > > > > > +static const struct iommu_ops vsi_iommu_ops = {
> > > > > > > +	.identity_domain = &vsi_identity_domain,
> > > > > > > +	.release_domain = &vsi_identity_domain,
> > > > > > > +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> > > > > > > +	.of_xlate = vsi_iommu_of_xlate,
> > > > > > > +	.probe_device = vsi_iommu_probe_device,
> > > > > > > +	.release_device = vsi_iommu_release_device,
> > > > > > > +	.device_group = generic_single_device_group,
> > > > > > > +	.owner = THIS_MODULE,
> > > > > > > +	.default_domain_ops = &(const struct iommu_domain_ops) {
> > > > > > > +		.attach_dev		= vsi_iommu_attach_device,
> > > > > > > +		.map_pages		= vsi_iommu_map,
> > > > > > > +		.unmap_pages		= vsi_iommu_unmap,
> > > > > > > +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
> > > > > > This has no callers and so your unmap routine appears to be broken.
> > > > > It is a leftover of previous attempt to allow video decoder to clean/flush
> > > > > the iommu by using a function from the API.
> > > > > Now it is using vsi_iommu_restore_ctx().
> > > > > I while remove it in version 12.
> > > > Don't you still need some invalidation on the unmap path?
> > > In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().
> > But that just writes an invalid descriptor and doesn't appear to invalidate
> > the TLB at all.
> > 
> > > That clear BIT(0) so the hardware knows the page is invalid.
> > > Do I have miss something here ?
> > Yes, the TLB structure needs to be invalidated so that the page-table
> > walker sees the new value that you have written in memory.
> > 
> > The rockchip driver gets this correct...
> 
> Rockchip hardware have a ZAP_ONE_LINE register which didn't exist on Verisilicon
> hardware.

Presumably you have some sort of Verisilicon datasheet or downstream driver
from which you can infer the TLB invalidation runes?

> I have tried to use VSI_MMU_BIT_FLUSH on VSI driver after unmapping iova
> but it doesn't work.

What do you mean by "doesn't work"? If it works without doing any
invalidation at all, then it's very peculiar that adding the invalidation
would introduce issues.

> So far calling dma_sync_single_for_device() seems to be enough to make iommu
> and video decoder work together.

I don't think we should settle for "seems to enough"! If we can reason
about the operation of the hardware then the driver will be undebuggable
when it eventually goes wrong.

Will

