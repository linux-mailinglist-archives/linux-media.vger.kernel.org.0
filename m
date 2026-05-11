Return-Path: <linux-media+bounces-61165-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBktInMXAmoVnwEAu9opvQ
	(envelope-from <linux-media+bounces-61165-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:52:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 015EF513DB4
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B312304003F
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561FA472766;
	Mon, 11 May 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uaQBsmfc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB200426D0A;
	Mon, 11 May 2026 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521873; cv=none; b=AdhdXsFcOcZBwDFTgJ2PSf99nvddO8OMg+IipWtoUEypYUlHvnX6OKeRusm8AS01UhriHY3jreRDOxDQVNDYLcAZeZ+uCcR2dB3okVNx+mF0uXXPVC0xB4VMIDI4eCphHn2iQdWBzehn7OlTbmb2dtI7dlIE1rNgbateCvmiycY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521873; c=relaxed/simple;
	bh=9Yp/CVYMqyPHBsVwAYn1sN99dUm//BD19OnBzFRd58k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POUJo3IhSc/5P5r+XGv+789JzGUEM62LrzHWOYy80VnQVlLNdyvq8iQLWEnqRU2FXlEWzVBerNn/L+Q5QVU+3JWgbVAcHU6OWh+Crf4T895vXpVxDBUaW/vgaZ8m5q4SLBEmqgL1AyDl55QX7a2IWV0+X20krqz28/jpTcUDenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uaQBsmfc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2E2C2BCB0;
	Mon, 11 May 2026 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778521873;
	bh=9Yp/CVYMqyPHBsVwAYn1sN99dUm//BD19OnBzFRd58k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uaQBsmfcDLzI0oyLMmScwlkSABsNwECIqpR0/h+xKOpexzgzViP8Og/wmqTD4O1eF
	 o7gjnRHu4CqassvmmeodKtlh3NbW4GDg8HjzPph7s4ZyElHEpfdeEKBIMRR550nSU+
	 6IQNVmepFF0Cj19pqwB85nSgqqLBZfjop0NwAW8oEedE4O7mcdUnSjFXQtijvqFqO6
	 09u6sQ/bFDGkIwo0v0C+Fm0ixRP9QjtN/Crkynr3upIr8pySL+lfbwNPcOaTRMW31g
	 dTOJo/LYuCWyLbQASOoAfbmZAN5UpOnWve8uBiN0EqY1P4htfvnY4BJaNcfp2e8l7D
	 lgE6+FEb0QoXw==
Date: Mon, 11 May 2026 20:51:03 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Matt Evans <mattev@meta.com>
Cc: Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: Re: [PATCH 9/9] vfio/pci: Add mmap() attributes to DMABUF feature
Message-ID: <20260511175103.GK15586@unreal>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-10-mattev@meta.com>
 <20260424183153.GJ3444440@nvidia.com>
 <20260426105215.GA440345@unreal>
 <20260427083644.4ee174cd@shazbot.org>
 <25a4fc45-1b4d-426b-954a-60bf21e9040f@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25a4fc45-1b4d-426b-954a-60bf21e9040f@meta.com>
X-Rspamd-Queue-Id: 015EF513DB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61165-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,meta.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 04:30:39PM +0100, Matt Evans wrote:
> Hi Alex, Leon,
> 
> On 27/04/2026 15:36, Alex Williamson wrote:
> > 
> > On Sun, 26 Apr 2026 13:52:15 +0300
> > Leon Romanovsky <leon@kernel.org> wrote:
> > 
> > > On Fri, Apr 24, 2026 at 03:31:53PM -0300, Jason Gunthorpe wrote:
> > > > On Thu, Apr 16, 2026 at 06:17:52AM -0700, Matt Evans wrote:
> > > > > A new field is reserved in vfio_device_feature_dma_buf.flags to
> > > > > request CPU-facing memory type attributes for mmap()s of the buffer.
> > > > > Add a flag VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC, which results in WC
> > > > > PTEs for the DMABUF's BAR region.
> > > > > 
> > > > > Signed-off-by: Matt Evans <mattev@meta.com>
> > > > > ---
> > > > >   drivers/vfio/pci/vfio_pci_dmabuf.c | 15 +++++++++++++--
> > > > >   drivers/vfio/pci/vfio_pci_priv.h   |  1 +
> > > > >   include/uapi/linux/vfio.h          | 12 +++++++++---
> > > > >   3 files changed, 23 insertions(+), 5 deletions(-)
> > > > 
> > > > Nice and simple
> > > > 
> > > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > > > @@ -1549,8 +1551,12 @@ struct vfio_region_dma_range {
> > > > >   struct vfio_device_feature_dma_buf {
> > > > >   	__u32	region_index;
> > > > >   	__u32	open_flags;
> > > > > -	__u32   flags;
> > > > > -	__u32   nr_ranges;
> > > > > +	__u32	flags;
> > > > > +	/* Flags sub-field reserved for attribute enum */
> > > > > +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_MASK		(0xfU << 28)
> > > > > +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_UC		(0 << 28)
> > > > > +#define VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC		(1 << 28)
> > > > > +	__u32	nr_ranges;
> > > 
> > > Alex,
> > > 
> > > The TPH proposal extends the flags field in a similar way, but I suggested
> > > a different approach to conserve bits. At the moment, we spend three bits
> > > on a single feature, which feels wasteful.
> > > 
> > > What do you think?
> > > https://lore.kernel.org/all/20260409120415.GF86584@unreal/
> > 
> > I already proposed a very different interface for TPH that decouples
> > the dma-buf creation from setting the TPH values:
> > 
> > https://lore.kernel.org/all/20260423132016.4a25e074@shazbot.org/
> > 
> > This is overall less intrusive than the TPH change proposed, but it
> > could still make sense to align this as an operation on the dma-buf,
> > that can be probed as a separate feature.  Thanks,
> 
> I'll add a VFIO_DEVICE_FEATURE_DMA_BUF_ATTRS in a v2 instead to get in line
> with the TPH work, no worries.
> 
> For the benefit of future hackers, how would you describe the criteria for
> adding flags to this existing field?  

One bit per-feature.

> What hypothetical feature characteristics would be appropriate?  (Maybe it's that these attrs & TPH
> add scalar fields in several bits rather than a simple boolean.) Two of us
> have independently added something that's turned out to be inapproriate so
> some guidance would be good.

Both of you intertwined the signaling bit with the actual data, and that is
what led me to prefer a different approach.

Thanks

> 
> Thanks!
> 
> 
> Matt

