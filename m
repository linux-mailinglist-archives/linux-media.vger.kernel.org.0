Return-Path: <linux-media+bounces-64917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ONKANOsMMGoiMgUAu9opvQ
	(envelope-from <linux-media+bounces-64917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 16:32:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC16687337
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 16:32:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=vLTCBs1A;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64917-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64917-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B388E31858D4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 14:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7652A3F8EA7;
	Mon, 15 Jun 2026 14:27:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E303F8233;
	Mon, 15 Jun 2026 14:27:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533646; cv=none; b=o0lRg7DV+HEhUVPqAae8x6HM1W7kTZQys12t1G+LJa6w6Zu/MO68exdVfWGDxVBfqglk7HToRP4TgumibLky+/EzRjHMGsmHDxtQJzfEcauayrisRc6T75eL6DuyPPBDKmH1WMgbf+ZZ4NdAyG5M4eRDndIEf2DDoLHpER9PL8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533646; c=relaxed/simple;
	bh=gcp7XAnbFXskpUDCCb4mXWihCPCwa0zHCLLciyV1SV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRPCxPFLMR5lqmiuVdWWIlyYMolLXRu4CANDfbNncVZ0RWZtJ3quMp0BYSkw1Ni63GmcWDsVc/KP0Ay68IgmPMCcYCgOKeggNApSqO5XU4yxVLwII7XDj8oMtUQxPQSAZ2j2MaszV7C7kwGHjDWnqcMimS0+QXN7/beXbIrqr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=vLTCBs1A; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781533634;
	bh=6jSl3qMQC5F8uJQ2tc3Ri1DM6ZH1vRToZvC6bK+3uyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vLTCBs1AA27S7AGaN2EZ6+R5z8czyhkJAuMVeYXLTgy5s+e4n0JX5GXN1i2hb4BfY
	 v8AVmx03QZvwdWHXqIm4QEX+UrLcc3T9RYM20GphO2maTxqwNiBRQ9/j69nVAyLzp0
	 cbozK72UMHakDLmek1PbTVJS8BqDWUe95RVD424ox5QsEu+7IQteug2rt6IsqFz3DC
	 gF9CZN9YMkN3LMtwRBAKsmokbHEJLeDEuSboTtj6g4dD6BXIYNUTMTpdmPXvy+fCle
	 wLLoH/1RHGcZKWpbvsoTJYe+z7bZSCLm9eDVm/tHo2Zb5C2iJk2TKh7ASmMg4ihgSf
	 8RQst37ruXluA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gfCB25n8Wz4w02;
	Tue, 16 Jun 2026 00:27:06 +1000 (AEST)
Message-ID: <effb66ee-764b-4823-b6e4-c932a1f60f8d@ozlabs.org>
Date: Mon, 15 Jun 2026 15:27:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Content-Language: en-GB
To: Pranjal Shrivastava <praan@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-3-matt@ozlabs.org> <aisa6H-a-176MXhC@google.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <aisa6H-a-176MXhC@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-64917-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EC16687337

Hi Praan,

On 11/06/2026 21:30, Pranjal Shrivastava wrote:
> On Wed, Jun 10, 2026 at 04:43:16PM +0100, Matt Evans wrote:
>> Add vfio_pci_dma_buf_find_pfn(), which a VMA fault handler can use to
>> find a PFN.
>>
>> This supports multi-range DMABUFs, which typically would be used to
>> represent scattered spans but might even represent overlapping or
>> aliasing spans of PFNs.
>>
>> Because this is intended to be used in vfio_pci_core.c, we also need
>> to expose the struct vfio_pci_dma_buf in the vfio_pci_priv.h header.
>>
>> Signed-off-by: Matt Evans <matt@ozlabs.org>
>> ---
>>  drivers/vfio/pci/vfio_pci_dmabuf.c | 137 ++++++++++++++++++++++++++---
>>  drivers/vfio/pci/vfio_pci_priv.h   |  20 +++++
>>  2 files changed, 144 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index c16f460c01d6..9e5e865f6fb6 100644
>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> @@ -9,19 +9,6 @@
>>  
>>  MODULE_IMPORT_NS("DMA_BUF");
>>  
>> -struct vfio_pci_dma_buf {
>> -	struct dma_buf *dmabuf;
>> -	struct vfio_pci_core_device *vdev;
>> -	struct list_head dmabufs_elm;
>> -	size_t size;
>> -	struct phys_vec *phys_vec;
>> -	struct p2pdma_provider *provider;
>> -	u32 nr_ranges;
>> -	struct kref kref;
>> -	struct completion comp;
>> -	u8 revoked : 1;
>> -};
>> -
>>  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>>  				   struct dma_buf_attachment *attachment)
>>  {
>> @@ -106,6 +93,130 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>>  	.release = vfio_pci_dma_buf_release,
>>  };
>>  
>> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *priv,
>> +			      struct vm_area_struct *vma,
>> +			      unsigned long address,
> 
> Nit: s/address/fault_addr ?

Sure.

>> +			      unsigned int order,
>> +			      unsigned long *out_pfn)
>> +{
>> +	/*
>> +	 * Given a VMA (start, end, pgoffs) and a fault address,
>> +	 * search the corresponding DMABUF's phys_vec[] to find the
>> +	 * range representing the address's offset into the VMA, and
>> +	 * its PFN.
>> +	 *
>> +	 * The phys_vec[] ranges represent contiguous spans of VAs
>> +	 * upwards from the buffer offset 0; the actual PFNs might be
>> +	 * in any order, overlap/alias, etc.  Calculate an offset of
>> +	 * the desired page given VMA start/pgoff and address, then
>> +	 * search upwards from 0 to find which span contains it.
>> +	 *
>> +	 * On success, a valid PFN for a page sized by 'order' is
>> +	 * returned into out_pfn.
>> +	 *
>> +	 * Failure occurs if:
>> +	 * - The page would cross the edge of the VMA
>> +	 * - The page isn't entirely contained within a range
>> +	 * - We find a range, but the final PFN isn't aligned to the
>> +	 *   requested order.
>> +	 *
>> +	 * (Upon failure, the caller is expected to try again with a
>> +	 * smaller order; the tests above will always succeed for
>> +	 * order=0 as the limit case.)
>> +	 *
>> +	 * It's suboptimal if DMABUFs are created with neigbouring
>> +	 * ranges that are physically contiguous, since hugepages
>> +	 * can't straddle range boundaries.  (The construction of the
>> +	 * ranges vector should merge such ranges.)
>> +	 *
>> +	 * Finally, vma_pgoff_adjust is used for a DMABUF representing
>> +	 * a VFIO BAR mmap, which is created from the start of the
>> +	 * offset region.
>> +	 */
>> +
>> +	const unsigned long pagesize = PAGE_SIZE << order;
>> +	unsigned long vma_off = ((vma->vm_pgoff - priv->vma_pgoff_adjust) <<
>> +				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
>> +	unsigned long rounded_page_addr = ALIGN_DOWN(address, pagesize);
>> +	unsigned long rounded_page_end = rounded_page_addr + pagesize;
>> +	unsigned long page_buf_offset;
>> +	unsigned long page_buf_offset_end;
>> +	unsigned long range_buf_offset = 0;
>> +	unsigned int i;
>> +
>> +	if (rounded_page_addr < vma->vm_start || rounded_page_end > vma->vm_end) {
>> +		if (order > 0)
>> +			return -EAGAIN;
>> +
>> +		/* A fault address outside of the VMA is absurd. */
>> +		WARN(1, "Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
>> +		     address, vma->vm_start, vma->vm_end);
> 
> This could flood dmesg if triggered repeatedly by userspace :( 
> Since a fault outside the VMA is an invalid access that already results
> in a SIGBUS, we could probably avoid the WARN here?
> Perhaps pr_warn_ratelimited() should suffice?

I'm OK moving to a pr_warn_ratelimited().  Note though that this case is
"genuinely impossible" currently and the check exists in case something
changes elsewhere.  (Re your flood comment, am I missing a way for
userspace to trigger this?  The scenario is a faulthandler for a VMA
getting a VA outside the bounds of that VMA; such a fault address
wouldn't match that VMA.)

>> +		return -EFAULT;
>> +	}
>> +
>> +	/*
>> +	 * page_buff_offset[_end] is the span of DMABUF offsets
>> +	 * corresponding to the faulting page:
>> +	 */
>> +	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
>> +					vma_off, &page_buf_offset) ||
>> +		     check_add_overflow(page_buf_offset, pagesize,
>> +					&page_buf_offset_end)))
>> +		return -EFAULT;
>> +
>> +	for (i = 0; i < priv->nr_ranges; i++) {
>> +		size_t range_len = priv->phys_vec[i].len;
>> +		phys_addr_t range_start = priv->phys_vec[i].paddr;
>> +
>> +		/*
>> +		 * If the current range starts after the page's span,
>> +		 * this and any future range won't match.  Bail early.
>> +		 */
>> +		if (page_buf_offset_end <= range_buf_offset)
>> +			break;
>> +
>> +		if (page_buf_offset >= range_buf_offset &&
>> +		    page_buf_offset_end <= range_buf_offset + range_len) {
>> +			/*
>> +			 * The faulting page is wholly contained
>> +			 * within the span represented by the range.
>> +			 * Validate PFN alignment for the order:
>> +			 */
>> +			unsigned long pfn = (range_start + page_buf_offset -
>> +					     range_buf_offset) / PAGE_SIZE;
> 
> Minor nit: I'm aware that decent compilers convert pow(2) divides to >> 
> However, we seem to be using `>> PAGE_SHIFT` across vfio-pci. E.g.:
> 
> return (pci_resource_start(vdev->pdev, index) >> PAGE_SHIFT) + pgoff;
> unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
> 
> Let's consider using the same pattern?

(Do you know of a compiler that both builds the kernel and does NOT
perform this transformation?  I am confident that resulting object code
will be OK here.)

In an earlier revision I was using shifts but they were fairly messy
compared to this expression, which arises from a request by Jason.

>> +
>> +			if (IS_ALIGNED(pfn, 1 << order)) {
>> +				*out_pfn = pfn;
>> +				return 0;
>> +			}
>> +			/* Retry with smaller order */
>> +			return -EAGAIN;
>> +		}
>> +		range_buf_offset += range_len;
>> +	}
>> +
>> +	/*
>> +	 * A hugepage straddling a range boundary will fail to match a
>> +	 * range, but the address will (eventually) match when retried
>> +	 * with a smaller page.
>> +	 */
>> +	if (order > 0)
>> +		return -EAGAIN;
>> +
>> +	/*
>> +	 * If we get here, the address fell outside of the span
>> +	 * represented by the (concatenated) ranges.  Setup of a
> 
> Nit: double space before "Setup" and "But" below.

I liked Alex's response :-)  This is common practice for monospaced text
since increasing inter-sentence spacing helps readability in paragraph
blocks (see Documentation/ for many examples ...).

>> +	 * mapping must ensure that the VMA is <= the total size of
>> +	 * the ranges, so this should never happen.  But, if it does,
>> +	 * force SIGBUS for the access and warn.
>> +	 */
>> +	WARN_ONCE(1, "No range for addr 0x%lx, order %d: VMA 0x%lx-0x%lx pgoff 0x%lx, %u ranges, size 0x%zx\n",
>> +		  address, order, vma->vm_start, vma->vm_end, vma->vm_pgoff,
>> +		  priv->nr_ranges, priv->size);
>> +
>> +	return -EFAULT;
> 
> The fall-through logic at the end feels a bit redundant.
> 
> If we've exhausted the phys_vec list without finding a match, returning
> -EAGAIN for order > 0 seems like the correct fallback behavior.

This path can happen (for order > 0) e.g. mis-alignment of VA versus the
PFN, i.e. is likely...

> However, the subsequent WARN_ONCE for the order == 0 seems unnecessary?
> An out-of-bounds access is an error that should simply return -EFAULT 
> (converting to SIGBUS) without polluting the kernel log with stackdumps?

...but the only way this can happen, for order == 0, is if the VMA
extends beyond the underlying resource.  For example, if the VMA is
larger than the DMABUF size (the total length of phys ranges set up
inside the DMABUF).  Both VFIO BAR mmap() and a DMABUF mmap() disallow
mapping off the end of the underlying resource.  That is, this also
"cannot happen" but if logic changes elsewhere then we will really want
to know about hitting this case -- the check is not redundant.

Still, it doesn't need a regdump/backtrace (at least while this is only
called from one spot), so a pr_warn_* is better.

Thanks,


Matt


> Can we instead convert this to a pr_warn or something? Something like:
> 
> 	ret = order ? -EAGAIN : -EFAULT;
> 
> 	if (ret == -EFAULT)
> 		pr_warn_ratelimited("No range for addr 0x%lx...\n", address);
> 
> 	return ret;
> 
> (with appropriate comments)
> 
> Thanks,
> Praan


