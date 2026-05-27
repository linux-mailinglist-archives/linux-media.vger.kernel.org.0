Return-Path: <linux-media+bounces-62935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLGFHYNyF2o7FggAu9opvQ
	(envelope-from <linux-media+bounces-62935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 00:38:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7ED5EAB50
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 00:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40456301FC00
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 22:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A263BB13D;
	Wed, 27 May 2026 22:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="hj0Xnh2l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hwzCJGs9"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13837C929;
	Wed, 27 May 2026 22:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779921525; cv=none; b=JMk/BWswy1MyQsrvWSz66D2eRSZUfzEAOa4oZPO/AmZMSvMv6wp/hre+nXFnkt/bNKdZ44zHRkJvro1HsiM3NM9ZRI9x9ieGDf3kC8kPgwMhLDkoxQ11BzMbJTpbKvQqUKgs24etsmVkqNO/iG6FRalW26w961JIZQBTdKRuAP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779921525; c=relaxed/simple;
	bh=+fgVPPV2OOkhwHIm2WuqC/uyxVtaCxOSWZNCUJrmO40=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZVKOoiwLk35Fse4E6RgCaL955+eIILVeFJnASSw2kDak1AZaFTpNyTEB0cGtQv1dsDQow0HYmfknRjJ/1zKst57j1MRxTDoMIqqLfAbL5pmCV/A3RHh1HzV2kCM3TRHYShALIrJWE0BuyGRxPQkjI9UkGQH/MIl9bUWlEJXRV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=hj0Xnh2l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hwzCJGs9; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 26AA9EC013A;
	Wed, 27 May 2026 18:38:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 27 May 2026 18:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779921521;
	 x=1780007921; bh=8MmDbyDdyfeL+yHv+zdd4HPvUYer2VEbvbP3UaA28IA=; b=
	hj0Xnh2lXS/+Dchf2E7c73LTAYb+mATBswtmkQX6nFdx6by6DzdYG9Ss2u0Lr0kq
	oWqH6CtArjzhzcp5ytS/IWg0OvgHqS3MozfdAMcgdrTjEMB4sHcKCq6YYEV8OuNA
	R6IhFeMyqptMqv/1Y8Ut/M4eOia8XKDBR3YDEeEq8AeotfI3T/fQTwuPunRXU7LL
	G8fZFIgKpyrjX6Ze7f0tvqMzJuwO64xwJwdzb/EtPixzbBV7x7Ssb7xLhMedpJN5
	ubvTzye/SVLb47QjrR7kn9aL4O/4u0ECC5W3S1KGcSbTEvBzjca2pB3u04yooxKi
	JtBg44DkVqWushZlvoan6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779921521; x=
	1780007921; bh=8MmDbyDdyfeL+yHv+zdd4HPvUYer2VEbvbP3UaA28IA=; b=h
	wzCJGs9I3ndDcL+I7MTrQqe2Olkz/BmWFv1ZVr52SajhpLa3SrcrC8NVf5559l/5
	3u+/PlU86TI1bBk3AF7Y46jzIdIuOuUXITIgpLOZ/b7dQvCRAPgwedxAInH5ADnL
	3i/BfCZxWpfw7yAaaVM0fQoVY9tgxbEuc5Xw6qH53DOzepjGUAF5CNSvOusHHQva
	B5eHqzsIE8KQzDGvsXuTOXHTPEybIP7tbL0jSjJxXO6bCRMw12VJuNz17cW+Y5lK
	Lp1sZR3aVJ/4eTMSNkWDVtba2eIYrJ4T47zZ3rznqVG6MJoB/aOCjISnPWkyQqc9
	6087omd2wnNZXCrZj7Jsg==
X-ME-Sender: <xms:cHIXaqKqW5EJbsPTL_HE4HsIEIIzTESSEIoGfYhWj6W3iSBIQa-i5g>
    <xme:cHIXat0CUBX0jRLxN8SAeHW10XwYi1avGvNUPwa-zn6zq38TIq_j0aL7Lo00NRQwx
    -tO3_F6rc5d3dpMvFc3r-_gVWg8GtZfftOGxmlipcGsPjkUOJqGle0>
X-ME-Received: <xmr:cHIXalYfqNt3WHyeJsv5SEym3HruHkfmbU8IqXwxxjNiXRKGGsqymE89d7o>
X-ME-Proxy-Cause: dmFkZTGdNJ0uUGeVj1NBRJYBU9K38RfrCWXFG3XsTl9AIKrXguYdj+fE8TS337IWHDmk4w
    Fw4pZ7j35TAr2g7k5qM5+cHD9E6RMkCpZpL3ZEmxZM9aVfup+gzJ8MrH+cJw1exb19Fawg
    H7CXFcuv9gqT2u8c9tn4fLEc6vgDbfFDMVLtsfWXGKu6yaB8NKMnaCUkqj2Ds3ldpTPKYs
    7eh8scgMDK74Fuutv7IhevaZn7Cc/XneKsRgnKBb4N/rS96y7t0sYlhtKo9qiq1ZyUa2t1
    en/3InleJyTXeIftwyZKJVQHnxfmF5GQCsl1blUOVzzpXpaIdCERGOuHp7jueXVgOOeMss
    q9358a7YxijCU4Da8hX/2XEvc5B1JDkLHU9gF9qVFpMpNzQ8/yaJqgT4h40Qtxxjytakhn
    KMbKNNw+9VeqMdrVw5yb/7e1r3WkTGkg6n6hhhk+i3JdU3IPepPSn6rkNvligaaIaJGHNq
    AcgLTqCiv0wcvcvwYR+h2gf2C8XkqZqxTJuz7InvAA6QcsJv9YOn6lFAJONEj+24/AT/p8
    jX83mhqW+ws+htPgJpvA44oAgy2mJUWhLkbL/fkfB6sDWbtnd1bVCd0z9ALX887x0HiP4b
    XLslRQM2Fn0lYQ06gxSrEQiJIhjG7uc6azmhqQVvXtGntg69UmGeMzH/AUxw
X-ME-Proxy: <xmx:cHIXagXjLthIGvuAlANuJ6ZfQk2OHJqVfyFHeR3PbPFEQfv0u4DBYg>
    <xmx:cHIXagdnRhOEKIJLhTEarxw4sGjhGfgTBQfD-JAJK8oamHFY4jEPIQ>
    <xmx:cHIXatM42vPxwXTOCBSe1xt5FtwHNF4emS-VeKJDGMnzAJraB9kI2A>
    <xmx:cHIXaoIWRA6exdE95Y5I9pQfEKvYYNVuG7GU0JsQFdOCfoUSoMC4aw>
    <xmx:cXIXaoO4-vhWBctvcH0KGgDRcrsmYHGmK2czPpgelQYBKMYg24I9yUg1>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 May 2026 18:38:38 -0400 (EDT)
Date: Wed, 27 May 2026 16:38:37 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <mattev@meta.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Logan
 Gunthorpe <logang@deltatee.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Pranjal
 Shrivastava <praan@google.com>, Alistair Popple <apopple@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, alex@shazbot.org
Subject: Re: [PATCH v2 2/9] vfio/pci: Add a helper to look up PFNs for
 DMABUFs
Message-ID: <20260527163837.02be1e7c@shazbot.org>
In-Reply-To: <20260527102319.100128-3-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-3-mattev@meta.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-62935-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,shazbot.org:mid,shazbot.org:dkim]
X-Rspamd-Queue-Id: 7B7ED5EAB50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 03:23:05 -0700
Matt Evans <mattev@meta.com> wrote:

> Add vfio_pci_dma_buf_find_pfn(), which a VMA fault handler can use to
> find a PFN.
> 
> This supports multi-range DMABUFs, which typically would be used to
> represent scattered spans but might even represent overlapping or
> aliasing spans of PFNs.
> 
> Because this is intended to be used in vfio_pci_core.c, we also need
> to expose the struct vfio_pci_dma_buf in the vfio_pci_priv.h header.
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 142 ++++++++++++++++++++++++++---
>  drivers/vfio/pci/vfio_pci_priv.h   |  20 ++++
>  2 files changed, 149 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index c16f460c01d6..0d132c4ca95f 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -9,19 +9,6 @@
>  
>  MODULE_IMPORT_NS("DMA_BUF");
>  
> -struct vfio_pci_dma_buf {
> -	struct dma_buf *dmabuf;
> -	struct vfio_pci_core_device *vdev;
> -	struct list_head dmabufs_elm;
> -	size_t size;
> -	struct phys_vec *phys_vec;
> -	struct p2pdma_provider *provider;
> -	u32 nr_ranges;
> -	struct kref kref;
> -	struct completion comp;
> -	u8 revoked : 1;
> -};
> -
>  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  				   struct dma_buf_attachment *attachment)
>  {
> @@ -106,6 +93,135 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>  	.release = vfio_pci_dma_buf_release,
>  };
>  
> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,

This private dmabuf object pointer is named priv pretty consistently
throughout the rest of the file.

> +			      struct vm_area_struct *vma,
> +			      unsigned long address,
> +			      unsigned int order,
> +			      unsigned long *out_pfn)
> +{
> +	/*
> +	 * Given a VMA (start, end, pgoffs) and a fault address,
> +	 * search the corresponding DMABUF's phys_vec[] to find the
> +	 * range representing the address's offset into the VMA, and
> +	 * its PFN.
> +	 *
> +	 * The phys_vec[] ranges represent contiguous spans of VAs
> +	 * upwards from the buffer offset 0; the actual PFNs might be
> +	 * in any order, overlap/alias, etc.  Calculate an offset of
> +	 * the desired page given VMA start/pgoff and address, then
> +	 * search upwards from 0 to find which span contains it.
> +	 *
> +	 * On success, a valid PFN for a page sized by 'order' is
> +	 * returned into out_pfn.
> +	 *
> +	 * Failure occurs if:
> +	 * - The page would cross the edge of the VMA
> +	 * - The page isn't entirely contained within a range
> +	 * - We find a range, but the final PFN isn't aligned to the
> +	 *   requested order.
> +	 *
> +	 * (Upon failure, the caller is expected to try again with a
> +	 * smaller order; the tests above will always succeed for
> +	 * order=0 as the limit case.)
> +	 *
> +	 * It's suboptimal if DMABUFs are created with neigbouring
> +	 * ranges that are physically contiguous, since hugepages
> +	 * can't straddle range boundaries.  (The construction of the
> +	 * ranges vector should merge such ranges.)
> +	 *
> +	 * Finally, vma_pgoff_adjust is used for a DMABUF representing
> +	 * a VFIO BAR mmap, which is created from the start of the
> +	 * offset region.  It should be zero, or equal vm_pgoff.
> +	 */
> +
> +	const unsigned long pagesize = PAGE_SIZE << order;
> +	unsigned long vma_off = ((vma->vm_pgoff - vpdmabuf->vma_pgoff_adjust) <<
> +				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
> +	unsigned long rounded_page_addr = ALIGN_DOWN(address, pagesize);
> +	unsigned long rounded_page_end = rounded_page_addr + pagesize;
> +	unsigned long page_buf_offset;
> +	unsigned long range_buf_offset = 0;
> +	unsigned int i;
> +
> +	if (rounded_page_addr < vma->vm_start || rounded_page_end > vma->vm_end) {
> +		if (order > 0)
> +			return -EAGAIN;
> +
> +		/* A fault address outside of the VMA is absurd. */
> +		WARN(1, "Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
> +		     address, vma->vm_start, vma->vm_end);
> +		return -EFAULT;
> +	}
> +
> +	if (vpdmabuf->vma_pgoff_adjust != 0 &&
> +	    vpdmabuf->vma_pgoff_adjust != (vma->vm_pgoff &
> +					   (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT))) {
> +		WARN(1, "Unexpected vma_pgoff_adjust 0x%lx (vm_pgoff 0x%lx)\n",
> +		     vpdmabuf->vma_pgoff_adjust, vma->vm_pgoff);
> +		return -EFAULT;
> +	}

This appears to be user trigger'able, by causing a vma to be split, and
also unnecessary as it seems the math works out correctly for the split
case.

> +
> +	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
> +					vma_off, &page_buf_offset)))
> +		return -EFAULT;
> +
> +	for (i = 0; i < vpdmabuf->nr_ranges; i++) {
> +		unsigned long page_buf_offset_end;
> +		size_t range_len = vpdmabuf->phys_vec[i].len;
> +		phys_addr_t range_start = vpdmabuf->phys_vec[i].paddr;
> +
> +		if (unlikely(check_add_overflow(page_buf_offset, pagesize,
> +						&page_buf_offset_end)))
> +			return -EFAULT;

Why is this inside the loop, the args are invariant of anything
modified in the loop.  Thanks,

Alex

> +		/*
> +		 * If the current range starts after the page's span,
> +		 * this and any future range won't match.  Bail early.
> +		 */
> +		if (page_buf_offset_end <= range_buf_offset)
> +			break;
> +
> +		if (page_buf_offset >= range_buf_offset &&
> +		    page_buf_offset_end <= range_buf_offset + range_len) {
> +			/*
> +			 * The faulting page is wholly contained
> +			 * within the span represented by the range.
> +			 * Validate PFN alignment for the order:
> +			 */
> +			unsigned long pfn = (range_start + page_buf_offset -
> +					     range_buf_offset) / PAGE_SIZE;
> +
> +			if (IS_ALIGNED(pfn, 1 << order)) {
> +				*out_pfn = pfn;
> +				return 0;
> +			}
> +			/* Retry with smaller order */
> +			return -EAGAIN;
> +		}
> +		range_buf_offset += range_len;
> +	}
> +
> +	/*
> +	 * A hugepage straddling a range boundary will fail to match a
> +	 * range, but the address will (eventually) match when retried
> +	 * with a smaller page.
> +	 */
> +	if (order > 0)
> +		return -EAGAIN;
> +
> +	/*
> +	 * If we get here, the address fell outside of the span
> +	 * represented by the (concatenated) ranges.  Setup of a
> +	 * mapping must ensure that the VMA is <= the total size of
> +	 * the ranges, so this should never happen.  But, if it does,
> +	 * force SIGBUS for the access and warn.
> +	 */
> +	WARN_ONCE(1, "No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %u ranges, size 0x%zx\n",
> +		  address, order, vma->vm_start, vma->vm_end, vma->vm_pgoff,
> +		  vpdmabuf->nr_ranges, vpdmabuf->size);
> +
> +	return -EFAULT;
> +}
> +
>  /*
>   * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
>   * It allows the two co-operating drivers to exchange the physical address of
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index fca9d0dfac90..c8f6f959056a 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -23,6 +23,20 @@ struct vfio_pci_ioeventfd {
>  	bool			test_mem;
>  };
>  
> +struct vfio_pci_dma_buf {
> +	struct dma_buf *dmabuf;
> +	struct vfio_pci_core_device *vdev;
> +	struct list_head dmabufs_elm;
> +	size_t size;
> +	struct phys_vec *phys_vec;
> +	struct p2pdma_provider *provider;
> +	u32 nr_ranges;
> +	struct kref kref;
> +	struct completion comp;
> +	unsigned long vma_pgoff_adjust;
> +	u8 revoked : 1;
> +};
> +
>  bool vfio_pci_intx_mask(struct vfio_pci_core_device *vdev);
>  void vfio_pci_intx_unmask(struct vfio_pci_core_device *vdev);
>  
> @@ -114,6 +128,12 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
>  	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
>  }
>  
> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
> +			      struct vm_area_struct *vma,
> +			      unsigned long address,
> +			      unsigned int order,
> +			      unsigned long *out_pfn);
> +
>  #ifdef CONFIG_VFIO_PCI_DMABUF
>  int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  				  struct vfio_device_feature_dma_buf __user *arg,


