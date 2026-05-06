Return-Path: <linux-media+bounces-60509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJdOLCXT+mmFTAMAu9opvQ
	(envelope-from <linux-media+bounces-60509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 07:35:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 597594D64DE
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 07:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 295673020D45
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 05:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5DE3019A6;
	Wed,  6 May 2026 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbw6StrJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0446E54B;
	Wed,  6 May 2026 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778045718; cv=none; b=qle/ektvt18NNVxWZoiMi5pBiP1HKIzh7rbnepudnSo2ehNni299LKv8nEtLt1lUHFPe/tp8X9M3k9KAr3kOLMuJfYC1JISoU6a7JE6lT66pQQsyhUr3UpzI3HuvglnZBuVK00nr7lp2caKSjaunetz3U+vkInW2jCkyJ+7jAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778045718; c=relaxed/simple;
	bh=68FaERwoP8OX0MneSqPhcOfZCZKy6fGPcZy0kqgTRIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RytOuuoH698QTXAHH+YT9z3N6QD9oFrJzwEueKvwh0G4mjU0g74m7rySmR8xZjeyQMwfFpJt/UqZJpHwOfSRhQwJEiB1MWQhmGdBoBtVplZVcE06oLdXRYEdc6uIC2vYdf7g1XM28hHyW32hOol8RU7hBdDifx/oQSm62CiWlrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbw6StrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FDAC2BCB8;
	Wed,  6 May 2026 05:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778045718;
	bh=68FaERwoP8OX0MneSqPhcOfZCZKy6fGPcZy0kqgTRIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbw6StrJozjSOh/RfsDaKDjrUqTTKMeviPsHMsE7yDJsMstAK0fltNMQcmTMCowIq
	 H9MWLt+zPLyCR3yu1Qfr/aMXgCOE/+5tqWJYaYijMS48bwDBpvn9rbDzCuCMO4wG9L
	 +kSI8A5+2Xd/kGcjBKDJaSeKHgkCgrmj3WfRNsack+a8mxm1EzMAZ35fPxaviGTyxd
	 E+ySw6OHqf1uDrjUMLOogK7cSTeMcnIWqk7jpco2ecg1/u8Hhg0QrAn3qd20xvqm5r
	 HOn914KYUKbtZP3hs5VmCcpSTACAgcH9vxpGbvnddotXCj9DxSAAFgnaAOiAEDN8LX
	 se7h+6gl7vrAg==
Date: Wed, 6 May 2026 08:35:11 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex@shazbot.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Matt Evans <mattev@meta.com>,
	Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Message-ID: <20260506053511.GG11063@unreal>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-5-mattev@meta.com>
 <20260501161915.75525c15@shazbot.org>
 <afhNeYS174EW7RYp@nvidia.com>
 <20260505104911.GB11063@unreal>
 <20260505085058.74c34290@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505085058.74c34290@shazbot.org>
X-Rspamd-Queue-Id: 597594D64DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60509-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 08:50:58AM -0600, Alex Williamson wrote:
> On Tue, 5 May 2026 13:49:11 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > On Mon, May 04, 2026 at 04:40:41AM -0300, Jason Gunthorpe wrote:
> > > On Fri, May 01, 2026 at 04:19:15PM -0600, Alex Williamson wrote:
> > >   
> > > > Exporting dma-bufs from vfio-pci is a feature, but mmap of MMIO BARs is
> > > > a legacy requirement.  That legacy requirement now depends on
> > > > PCI_P2PDMA, which depends on 64BIT and ZONE_DEVICE.  
> > > 
> > > That should be split up now, Leon missed it when he added the new
> > > APIs that didn't require ZONE_DEVICE..  
> > 
> > Sorry, what did I miss here?  
> > VFIO_DMABUF is an optional feature and is enabled only when P2P support is  
> > available. It does not affect legacy systems where P2P cannot be enabled.
> 
> If we look at the long term view of moving exclusively to cdev/iommufd,
> where VFIO_DMABUF becomes the mechanism for implementing P2P DMA
> mappings, VFIO_DMABUF may be optional, but it's highly desirable for
> legacy compatibility.  There's an argument though that providing P2P
> compatibility on platforms that support PCI_P2PDMA is probably
> sufficient.
> 
> However, in providing mmap of dmabufs as a feature, this series is
> wiring all mmaps through dmabufs and therefore that dependency becomes
> fundamental to the use of vfio-pci.  Thus the discussion whether the
> noted config requirements could be lifted.  Thanks,

Right, there was no need to remove ZONE_DEVICE when I added my code, and I
left the task of cleaning it out of is_pci_p2pdma_page() for another day.
Without ZONE_DEVICE, all pages are treated as non‑P2P.

> 
> Alex
> 
> PS - Please also weigh in on the dmabuf underflow[1]
> 
> [1]https://lore.kernel.org/all/20260501131236.278ac431@shazbot.org/

will do.

Thanks

