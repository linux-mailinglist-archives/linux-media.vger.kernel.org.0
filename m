Return-Path: <linux-media+bounces-64918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9G4fBlwVMGqmNAUAu9opvQ
	(envelope-from <linux-media+bounces-64918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 17:08:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B166877B9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 17:08:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="lpIHM/Uo";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64918-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64918-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93807302FEA2
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DD9400E0C;
	Mon, 15 Jun 2026 15:08:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEB2400DED
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 15:08:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536087; cv=none; b=kICHKG/9CcpLC7eaATJVpvDAHPataCxC3MaCDxEHvYTpqk03Qu3KtoFmCqK9aErDP8x0QfRjXhGCHNCKupl1T5YaU0cWiPC9OdjIVGN0SNkXFTbkTlVi8jTsGCcDR+Csd9Uc1wQOHesEf34L/tRd/5teg/WQtuEbCkEGbPi5r00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536087; c=relaxed/simple;
	bh=iR2hSSDkL1kRTIBYK/+5XFgbHaciT/TvyEr2mqoFFwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qt7zTxdFksyfhNH+z4uEGsA2ZwRcCTTDvuDqHoKSsOVQ/DWhVq1TCLoKs4ZkMJXHz5Ulkr4M7KTEr8ngbrxHtITcxHpxyc7moF7EIGM6SdYc57ZpGxazOVcFRr8NMwSFGXKvsEb2RVJEM0KWO28AyD6BY5wEgXXLPKsqlXveubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lpIHM/Uo; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0b1a48855so177615ad.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781536085; x=1782140885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EeLNOUGcyQ4NWkfW/DAB6S96aMOzAOJTH9w4j6T6BeY=;
        b=lpIHM/UoPWhGGre6xBoqJOnXuAYe2NumKKsbVHJo9tbHk/Qkxc66vU82Z86UzTGpSQ
         0TA21fb26QKQkmxva7RTFoJOq7oMP0hwcPXMnIMxWCRTq1kt7PUE9CCyIinikPkgddQ9
         z5od++B4s6DkRsrWGKsyoAf0j1veM0C0yy2AvNBhJf2c3Jlr6Pl/tv58Z2KRkr5BNwHE
         5T9EddCE+8Eb00f0L6uykk7hGjS14McCnvUSDwqDBfuLmgdEN1YSKY4ugCH3EZL5dhq1
         9o7tIAN/j+FuX7UHYXZ1wscdJffSL10qumawN6xmRM89tBIFMCTFzij4xXBmsK3Rdkg/
         dx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536085; x=1782140885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeLNOUGcyQ4NWkfW/DAB6S96aMOzAOJTH9w4j6T6BeY=;
        b=Wafpj7xOJVWiO1KFN2QiSjDELJDMhWJKfKX+bEX8Ow/PkYQI08PVIfE9oRwS6wLgTI
         rqQpJp8bsS0H0+qxWnhg4LB/vizP33QBTmOYooEMDG/Pni5iY3cDwL7rl2jFzkAx8C8X
         NEizYd00bli99BzbNACVn8X+dXbBCrmixDXEu/8BTRlEO8wqjquIFQQi/FK5H3FkwlS1
         WhbXStdtrYzF5K8i3kK1T0m0e8bs8pMEowDtwUQdiU3kwV3OaP6qL24ApCC+f3RNLkps
         4ijvLoP1+gZHZLzt8PQ8mbi6PywXnC9MTwDbuEE8HYaPaQXcpr8yZyDwqqSa2Fx+7+eh
         gkzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9d16+leX24mvYtBWSMhgQC2+1jwx/48979wjLjUP4UIRZBsbrEYu24Tm8znpCz/5JY/kAQC3weYRPVKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9OOzSowlD3MG+Q3J6I2SfKRQPHbuvU6CgaxcKZfT6F0EojHpa
	oHydvEiHDwDUYGiap3Cuc5oCjqGIZSGN0OMpX+mvYaL0fgeKxgoZja1nV8zyz7BLhLIgVn+4sB2
	Xa+RGPQ==
X-Gm-Gg: Acq92OGEillfxiDZEF4REQdpX3OMCe/glWRK33VLQn0cJlwKdFfKVCkfShrCLmAZO+N
	3v9BlP42pCvoIjc3iCO+WuJbCZn+wuNWCcE32zFEcsC24tHvEFETqyYB6uYd2SWHqcnYp0bSMVD
	JO/MZUwamfIaueCFIs/tVA8KTtuD/Af83O3gXJXRRw2PzQ6RIH25kyPB4JNmCqCQVzBHM8qz4H9
	Ib1LBtNokxZf9YlMiy+ZTlyih+5f2Zw9tGJKzUpvUetfA92YlT7oTZnnVuHmiPKDRl9mChgzIJ3
	O/pgv00ttVsbLFazXbZzLtwuTlsuMNdCvPuwmkaa+6eEmycaB9284oCfRVIqNr9T6nkw42MQTrA
	xOrUdiT4GUh6QOunpDZWVcw8McWDaUtSTOJzX/DMdzTsiW7KfY34vdTpHMulcJoBNKz36yvYLUZ
	cu3h7AtGNSCM/QSQlAFTeqP9X2q2RAUs/4JPOHarLGsgvHocOgRM0Wc2eetmW/
X-Received: by 2002:a17:903:320b:b0:2c0:c3ac:fdf9 with SMTP id d9443c01a7336-2c69689a4aamr525115ad.14.1781536084472;
        Mon, 15 Jun 2026 08:08:04 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm102831385ad.21.2026.06.15.08.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:08:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:07:55 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Matt Evans <matt@ozlabs.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Message-ID: <ajAVSx9gPz1KkIbF@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-3-matt@ozlabs.org>
 <aisa6H-a-176MXhC@google.com>
 <effb66ee-764b-4823-b6e4-c932a1f60f8d@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <effb66ee-764b-4823-b6e4-c932a1f60f8d@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64918-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80B166877B9

On Mon, Jun 15, 2026 at 03:27:01PM +0100, Matt Evans wrote:

Hi Matt,
> 
> On 11/06/2026 21:30, Pranjal Shrivastava wrote:
> > On Wed, Jun 10, 2026 at 04:43:16PM +0100, Matt Evans wrote:
> >> Add vfio_pci_dma_buf_find_pfn(), which a VMA fault handler can use to
> >> find a PFN.
> >>
> >> This supports multi-range DMABUFs, which typically would be used to
> >> represent scattered spans but might even represent overlapping or
> >> aliasing spans of PFNs.
> >>
> >> Because this is intended to be used in vfio_pci_core.c, we also need
> >> to expose the struct vfio_pci_dma_buf in the vfio_pci_priv.h header.
> >>
> >> Signed-off-by: Matt Evans <matt@ozlabs.org>

[...]

> >> +
> >> +	const unsigned long pagesize = PAGE_SIZE << order;
> >> +	unsigned long vma_off = ((vma->vm_pgoff - priv->vma_pgoff_adjust) <<
> >> +				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
> >> +	unsigned long rounded_page_addr = ALIGN_DOWN(address, pagesize);
> >> +	unsigned long rounded_page_end = rounded_page_addr + pagesize;
> >> +	unsigned long page_buf_offset;
> >> +	unsigned long page_buf_offset_end;
> >> +	unsigned long range_buf_offset = 0;
> >> +	unsigned int i;
> >> +
> >> +	if (rounded_page_addr < vma->vm_start || rounded_page_end > vma->vm_end) {
> >> +		if (order > 0)
> >> +			return -EAGAIN;
> >> +
> >> +		/* A fault address outside of the VMA is absurd. */
> >> +		WARN(1, "Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
> >> +		     address, vma->vm_start, vma->vm_end);
> > 
> > This could flood dmesg if triggered repeatedly by userspace :( 
> > Since a fault outside the VMA is an invalid access that already results
> > in a SIGBUS, we could probably avoid the WARN here?
> > Perhaps pr_warn_ratelimited() should suffice?
> 
> I'm OK moving to a pr_warn_ratelimited().  Note though that this case is
> "genuinely impossible" currently and the check exists in case something
> changes elsewhere.  (Re your flood comment, am I missing a way for
> userspace to trigger this?  The scenario is a faulthandler for a VMA
> getting a VA outside the bounds of that VMA; such a fault address
> wouldn't match that VMA.)

I should've been explicit, I guess I worded it wrong, my bad.
I didn't mean that a user-space could hit this on it's own. However,
I meant to say if there's a bug in core mm during some future work,
dmesg being flooded by stackdumps gets messy (especially during dev) as
the underlying reason might get missed in the flood. Hence, I prefer
moving to pr_warn_ratelimited.

> 
> >> +		return -EFAULT;
> >> +	}
> >> +
> >> +	/*
> >> +	 * page_buff_offset[_end] is the span of DMABUF offsets
> >> +	 * corresponding to the faulting page:
> >> +	 */
> >> +	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
> >> +					vma_off, &page_buf_offset) ||
> >> +		     check_add_overflow(page_buf_offset, pagesize,
> >> +					&page_buf_offset_end)))
> >> +		return -EFAULT;
> >> +
> >> +	for (i = 0; i < priv->nr_ranges; i++) {
> >> +		size_t range_len = priv->phys_vec[i].len;
> >> +		phys_addr_t range_start = priv->phys_vec[i].paddr;
> >> +
> >> +		/*
> >> +		 * If the current range starts after the page's span,
> >> +		 * this and any future range won't match.  Bail early.
> >> +		 */
> >> +		if (page_buf_offset_end <= range_buf_offset)
> >> +			break;
> >> +
> >> +		if (page_buf_offset >= range_buf_offset &&
> >> +		    page_buf_offset_end <= range_buf_offset + range_len) {
> >> +			/*
> >> +			 * The faulting page is wholly contained
> >> +			 * within the span represented by the range.
> >> +			 * Validate PFN alignment for the order:
> >> +			 */
> >> +			unsigned long pfn = (range_start + page_buf_offset -
> >> +					     range_buf_offset) / PAGE_SIZE;
> > 
> > Minor nit: I'm aware that decent compilers convert pow(2) divides to >> 
> > However, we seem to be using `>> PAGE_SHIFT` across vfio-pci. E.g.:
> > 
> > return (pci_resource_start(vdev->pdev, index) >> PAGE_SHIFT) + pgoff;
> > unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
> > 
> > Let's consider using the same pattern?
> 
> (Do you know of a compiler that both builds the kernel and does NOT
> perform this transformation?  I am confident that resulting object code
> will be OK here.)
> 

I guess most of the modern compiler do, I was just referring to the
style across the file. I don't have any strong opinion.

> In an earlier revision I was using shifts but they were fairly messy
> compared to this expression, which arises from a request by Jason.
> 

Yea, looking back at Jason's comment [1], I think he was mainly pointing out
that the common factor (PAGE_SIZE) could be grouped together. But again,
no strong feeling about this, just picked up a pattern across the file. 
If it breaks on some compiler we can fix it later..

> >> +
> >> +			if (IS_ALIGNED(pfn, 1 << order)) {
> >> +				*out_pfn = pfn;
> >> +				return 0;
> >> +			}
> >> +			/* Retry with smaller order */
> >> +			return -EAGAIN;
> >> +		}
> >> +		range_buf_offset += range_len;
> >> +	}
> >> +
> >> +	/*
> >> +	 * A hugepage straddling a range boundary will fail to match a
> >> +	 * range, but the address will (eventually) match when retried
> >> +	 * with a smaller page.
> >> +	 */
> >> +	if (order > 0)
> >> +		return -EAGAIN;
> >> +
> >> +	/*
> >> +	 * If we get here, the address fell outside of the span
> >> +	 * represented by the (concatenated) ranges.  Setup of a
> > 
> > Nit: double space before "Setup" and "But" below.
> 
> I liked Alex's response :-)  This is common practice for monospaced text
> since increasing inter-sentence spacing helps readability in paragraph
> blocks (see Documentation/ for many examples ...).
> 

Ack. :)

> >> +	 * mapping must ensure that the VMA is <= the total size of
> >> +	 * the ranges, so this should never happen.  But, if it does,
> >> +	 * force SIGBUS for the access and warn.
> >> +	 */
> >> +	WARN_ONCE(1, "No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %u ranges, size 0x%zx\n",
> >> +		  address, order, vma->vm_start, vma->vm_end, vma->vm_pgoff,
> >> +		  priv->nr_ranges, priv->size);
> >> +
> >> +	return -EFAULT;
> > 
> > The fall-through logic at the end feels a bit redundant.
> > 
> > If we've exhausted the phys_vec list without finding a match, returning
> > -EAGAIN for order > 0 seems like the correct fallback behavior.
> 
> This path can happen (for order > 0) e.g. mis-alignment of VA versus the
> PFN, i.e. is likely...
> 
> > However, the subsequent WARN_ONCE for the order == 0 seems unnecessary?
> > An out-of-bounds access is an error that should simply return -EFAULT 
> > (converting to SIGBUS) without polluting the kernel log with stackdumps?
> 
> ...but the only way this can happen, for order == 0, is if the VMA
> extends beyond the underlying resource.  For example, if the VMA is
> larger than the DMABUF size (the total length of phys ranges set up
> inside the DMABUF).  Both VFIO BAR mmap() and a DMABUF mmap() disallow
> mapping off the end of the underlying resource.  That is, this also
> "cannot happen" but if logic changes elsewhere then we will really want
> to know about hitting this case -- the check is not redundant.

I didn't mean to imply that the path itself is impossible or won't 
happen.. I just meant that the logic / structure felt a bit redundant at
the end of the function..

Instead of having the separate `if (order > 0)` block falling through to
the base case, I suggest it could be cleaner as:

	ret = order ? -EAGAIN : -EFAULT;

	if (ret == -EFAULT)
		pr_warn_ratelimited(...);

	return ret;

But again, that's a preference. I'd leave that to your judgement.

> 
> Still, it doesn't need a regdump/backtrace (at least while this is only
> called from one spot), so a pr_warn_* is better.
> 

Ack.

Thanks,
Praan

