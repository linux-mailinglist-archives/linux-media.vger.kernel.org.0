Return-Path: <linux-media+bounces-64616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B55WKQEbK2oR2wMAu9opvQ
	(envelope-from <linux-media+bounces-64616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:30:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F29576752BC
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:30:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=nWfOpwZx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64616-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64616-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 896B832ECBF4
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A486B46AF15;
	Thu, 11 Jun 2026 20:30:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3A54418D7
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 20:30:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209843; cv=none; b=CCwFh+BZ8MUxjx5krDkNCmwpC8FAmrd2a9GS4xdBjOg5tefxDIqSFmK6f9Ee80+vO90kJ5Xj1hO/etOhzcnpw+GpvwIzvaB+sXsyQvG/tKDFoX3MoVXBDMOWT5CveCvhzDJ+kWJUVzHDVJW/XwXgX0moSoUbRVMYKU8FcmgzggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209843; c=relaxed/simple;
	bh=lV0APC2Q40R0+8rJBHhGtOzbEJq9+wSP+YtjJIHFsGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjKCqqIPY2dGtL3niSwbcmYC+JzCRtblOhqcOtt3ZrrrxzPW2339SASnSHUbE1HbXhU26A4cCjAFCl9lpZWj/7fBr416F8Go9tzRqN43+3/OPDAI1q/ZnLt2TfXb9U5rbFkCLyAtMqGjI+7jEJqkzpWpAaYSvSwVNaANP7oFcBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nWfOpwZx; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf2911f93cso6115ad.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781209841; x=1781814641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O89fLhwmUexwr334yt/hIAtfe9wNMTELN1E0wgrm87U=;
        b=nWfOpwZxIUP99J4xNrGGATsknuIG+E02zwK+w+bq+MJtsqMF2UGogyB34tOsmJD8/i
         OAv2hs5WzCrtLXTMZK4RGFDcCJgfkrftDF5AJwVvPiJ6hCYCRuFajsvfFRNafi3pzSdH
         xfyDAFk7PUQ/mEgrnZwq+Ql754Bk+WDP7SUoC445MThEGzXqkTxwahGxSZopnIerGBK3
         Fe9InJSk/jWL+5t9QVO/lSyzpdszcBLgXgYWHnuPceXhNym1eOJoyxbBa6bqBLiCK9+9
         NiaA3D19TwVDN3Ty61inltkca+ojcSI+YacqYf85wX0E7sL022UIxEwlcD4NzirwFoIA
         uH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209841; x=1781814641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O89fLhwmUexwr334yt/hIAtfe9wNMTELN1E0wgrm87U=;
        b=EhGkWOOUdGoo5AZT7TRcBv8POcea+K8YfAOiasX1pv0Ui6yYRSIXoJymLJOedp1Zpv
         3UqxRUAOETl7ybTwuYaCAs3hYVO8qAu/cXnhso0orgn8eVplEjjZoE+ZXSj+YjTOBvDh
         UYhFUGcIJFFp9nXv+xHZBQXFlat9aLLWR64K3QUhT/ZuPSpcOE3xALyUxbkOS9BRV32E
         Xwj+enjzy1HKlVaqfvhflf1NvbG3XaUICIwyrRAfudmqYrY2X/S9XBIZ/YU2kDSeFUMe
         Q3UUAFfKMFbQhbl84nTbNpM81iJ+jKw+TUNrhZcyD9bg5iWKqHO5TayZtyqM54m+ktWA
         zvaA==
X-Forwarded-Encrypted: i=1; AFNElJ/Rn45YZfewuYnqy5E0f42kGKFoTVHtWQGiD0xvEDKLMEpfxYRvw6sEd/4R6bm6v71gw6tXGnNZSXhytg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOscKuqpt0VyGVCH8KJl8bPqDJFMX8YWibtkB/2GGDPggN6WBO
	P31f7dSsIwS3vERr5bze2uYxdH/x+adN1SaHtJwy87HsSY9zGauHsyGlETdtyKLdXg==
X-Gm-Gg: Acq92OE60/Qhw0Tl5Vb1TcJbT0B1DT/a5vN0Tp1J/AFvGlDR5NOOO53qXCByXrU/TzJ
	vKVIe9RTRwXr0Z+1XuVR1D0gSgRqsJ2pUCLXPTrO2kGMC5JyjlTred+47a5uepv9rhI3GkDiJub
	/lLoHMEviMeFw83eMWkdNRQKDavf37aYU7c+1/3WuwUiZbmmxOf0y6DtOQinFQNdLYF5m+hf2eK
	tQPUz1JLaLPcWX3jTRyTnBpJF5iJobts8G7GL7qGeUeJYS9hHQ5k3K0QCUH/rw0Vm/k9ZlkAJd5
	K+2NTPbj6gcEBbzm79+1Aa9ulUM7L/HKa/MWgLcriwX8sdvKtdEj2w2kTmb9pCn3RGA/GtFyvF5
	+LYV6Evp5EF1n17ADPsIOnvxqV1QQY6cAff71mHvyYhJB2LmshzWDaZdFicMxaBzL3hfCAhROgl
	U7iV/GtygsFrBgb6MWNqYbFrTfteZjgW7Ae2SlRZipyiqDAapvokIxLhXUqWr5
X-Received: by 2002:a17:902:ef47:b0:2b4:641a:6b7c with SMTP id d9443c01a7336-2c405c8b1bcmr130535ad.13.1781209840425;
        Thu, 11 Jun 2026 13:30:40 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df6esm311256825ad.48.2026.06.11.13.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:30:39 -0700 (PDT)
Date: Thu, 11 Jun 2026 20:30:32 +0000
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
Message-ID: <aisa6H-a-176MXhC@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-3-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-3-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64616-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ozlabs.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F29576752BC

On Wed, Jun 10, 2026 at 04:43:16PM +0100, Matt Evans wrote:
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
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 137 ++++++++++++++++++++++++++---
>  drivers/vfio/pci/vfio_pci_priv.h   |  20 +++++
>  2 files changed, 144 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index c16f460c01d6..9e5e865f6fb6 100644
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
> @@ -106,6 +93,130 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>  	.release = vfio_pci_dma_buf_release,
>  };
>  
> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *priv,
> +			      struct vm_area_struct *vma,
> +			      unsigned long address,

Nit: s/address/fault_addr ?

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
> +	 * offset region.
> +	 */
> +
> +	const unsigned long pagesize = PAGE_SIZE << order;
> +	unsigned long vma_off = ((vma->vm_pgoff - priv->vma_pgoff_adjust) <<
> +				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
> +	unsigned long rounded_page_addr = ALIGN_DOWN(address, pagesize);
> +	unsigned long rounded_page_end = rounded_page_addr + pagesize;
> +	unsigned long page_buf_offset;
> +	unsigned long page_buf_offset_end;
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

This could flood dmesg if triggered repeatedly by userspace :( 
Since a fault outside the VMA is an invalid access that already results
in a SIGBUS, we could probably avoid the WARN here?
Perhaps pr_warn_ratelimited() should suffice?

> +		return -EFAULT;
> +	}
> +
> +	/*
> +	 * page_buff_offset[_end] is the span of DMABUF offsets
> +	 * corresponding to the faulting page:
> +	 */
> +	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
> +					vma_off, &page_buf_offset) ||
> +		     check_add_overflow(page_buf_offset, pagesize,
> +					&page_buf_offset_end)))
> +		return -EFAULT;
> +
> +	for (i = 0; i < priv->nr_ranges; i++) {
> +		size_t range_len = priv->phys_vec[i].len;
> +		phys_addr_t range_start = priv->phys_vec[i].paddr;
> +
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

Minor nit: I'm aware that decent compilers convert pow(2) divides to >> 
However, we seem to be using `>> PAGE_SHIFT` across vfio-pci. E.g.:

return (pci_resource_start(vdev->pdev, index) >> PAGE_SHIFT) + pgoff;
unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;

Let's consider using the same pattern?

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

Nit: double space before "Setup" and "But" below.

> +	 * mapping must ensure that the VMA is <= the total size of
> +	 * the ranges, so this should never happen.  But, if it does,
> +	 * force SIGBUS for the access and warn.
> +	 */
> +	WARN_ONCE(1, "No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %u ranges, size 0x%zx\n",
> +		  address, order, vma->vm_start, vma->vm_end, vma->vm_pgoff,
> +		  priv->nr_ranges, priv->size);
> +
> +	return -EFAULT;

The fall-through logic at the end feels a bit redundant.

If we've exhausted the phys_vec list without finding a match, returning
-EAGAIN for order > 0 seems like the correct fallback behavior.

However, the subsequent WARN_ONCE for the order == 0 seems unnecessary?
An out-of-bounds access is an error that should simply return -EFAULT 
(converting to SIGBUS) without polluting the kernel log with stackdumps?
Can we instead convert this to a pr_warn or something? Something like:

	ret = order ? -EAGAIN : -EFAULT;

	if (ret == -EFAULT)
		pr_warn_ratelimited("No range for addr 0x%lx...\n", address);

	return ret;

(with appropriate comments)

Thanks,
Praan

