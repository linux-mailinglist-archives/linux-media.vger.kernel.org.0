Return-Path: <linux-media+bounces-62990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLIDJBPNGGpjnggAu9opvQ
	(envelope-from <linux-media+bounces-62990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:17:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAED5FB50A
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B792305697B
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4357536A36D;
	Thu, 28 May 2026 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="bp1NFgN3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f5NiDdMB"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD777364E9E;
	Thu, 28 May 2026 23:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780010163; cv=none; b=aNAMu5MDw3kozpeAcprMWvmsaRTAnddIshz1H3Dd7VKo79OJpvxDE76MCp/xzaMin2lIiLBI4SLRSCbt1Iukz7EgPQBS0CdSv+c7RAleMcqRZVPwItAo86bArj4CSJ8Z9Nt+K3vsOo8spcHD3MnJnKsBfCF3aK1PRQ5Endv59Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780010163; c=relaxed/simple;
	bh=cKWeA59gTwy1XTxT114CqXl8y62YaDy9YGBS3kmXVgs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M3of+3LFJvgAwVszfIJhvNrRLbLHbafYNmWHMRTe5Ui0ditKMw6rRRTdvqFElU1sgUpaOpRom6XoRdCmzASm9QpnRdw2MRjvO6RYSaMLHtobpA5no9enwWNHnknCJZ6MUx/iejvVQ1zzWYffq8wGa7DHD+ocGMIvv8GyvRDSD40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=bp1NFgN3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f5NiDdMB; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id A85AE1D0010C;
	Thu, 28 May 2026 19:16:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 28 May 2026 19:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780010160;
	 x=1780096560; bh=VUQz9z11nSA8JeS2Gp/TsoVI45ibq8iD39qTR+isYuw=; b=
	bp1NFgN3m9AGNyYTwANHkx0G5zfGz6Yl8uDufhezhQj2JTeTp4k1XM0fSwcIa2X+
	TJyhB1dLFdPXq/RXuOh9BnognaeOM/KGwsRsNF1h9euNLE87ubgUhPWCF/L+8/x8
	K3HZXEdAvpFZiZp0LLtAlwFvmvXwr/RbC9yOMBwY1G6KRD38l6tA1uzJefaEqDZr
	YMAIXge4TJgF81XdfEmCGDIOmN+c4f0jsgLGHoDuw8bEDt8oOamjT86epTZSPDpi
	g1bkncByeToeIw7MHQmyXRifaWpAHacxxIB73HuZLhAM4YYN8+VRgW11ROw8Uj3C
	QsPBXWxFNXWiF3ZLde3YrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780010160; x=
	1780096560; bh=VUQz9z11nSA8JeS2Gp/TsoVI45ibq8iD39qTR+isYuw=; b=f
	5NiDdMB3HGknqVlAnPiwBm72lOXZkLO40ECCwyHI7SSNwOqx0ezZDfkI2wKt23P6
	g2xZMwnwyVknEWbFOHIi5fxxF/5s3rFNksq5exlLuA0w+g+7MjfivVnhihBMTuP2
	hoh9BsnzBwO1QMxHCL6SjsSMRKHQM6U9AuJPJbHfm7XwKoY0DT/9nbm6BVr08JB8
	6sXbY0MOdAD+5qgcM7vQpj1L/rrmdbgVKNOqZB2D4ACDM4DRHg9/wth3zqnAdWKb
	AZUthl8aeRhZVhJJhcAGggtC2UOb3+shaHx2gUTROYCpkdgkmE2Pe37D78poC7/X
	dDX7RE0P3Aa5eKM8uYwoQ==
X-ME-Sender: <xms:sMwYai8JR5MVVuV1hcW0N1fFR3XHa-cpBzM5u-eK_4hD60uTU-8Zjg>
    <xme:sMwYaubydc1LcBEVvO31ccGhFQ9YJTqMOr6cpsv1ezzdY0fNPyJVx6Kt6IJvFvliI
    omw-dAuBwJ6MncTfeP26uOfMXw7HT08FUP-xWPEOvLNfgf5Pmf6>
X-ME-Received: <xmr:sMwYaitpw2_9d_yzKA50B8v9A-zws90h4Q5rWXKRN75bbL6JxkikSfX1NWs>
X-ME-Proxy-Cause: dmFkZTGpuni7Iwmge9in4oL3HNpJXf/bghBLtq+y1JMAw6GDtf+6/k74a2CMWaghGJKSfS
    ruUd4WngnB8zuti5WNWuIW4JxSBL9nQWimF95LuO6jK+qQtutweKy8jrESW2NQN7VDhWWF
    IJgcufqjOXjoiSjtX9erfHFnDPCw2lcuU9j8E504c7ohK8jgTHZ0PxGz+tjXbTF/bvK4dH
    +Vb1XLIPU/BjUFOnz9nTAq/tFIZzYA8oFNhJRBM8BA5A/EKnXt/Z6qyPP1Y9pPSxcKc/Fp
    GzwriZmvEBduw9AKU3sVywmDXR9E9LvLV96dX5RPTlS8c3AP9GQu9z4WPBIwnHVaWJvOG+
    zrDtHJvQK8VTw0Z82QyNHiKGki23yeKV4tPJ7tNjYZ1zpcStUK/D/fg/VBlHrvw/Sbzpoj
    BtfNeWHQT9t9gMTTTUUBy86a3We5FQT3M8FwVDcPxdxtt/hylWgfKjyIWBiVU7+ktbbgkl
    JZCBuuNPMnM14AV+d6cjTcU5NXzu5XPsLdloIp+X3nZr6mDpsEHC1mI/QOLrF6zpx7oRD6
    S7HyLgs3BA9flYU8ESufthQvUjJ+ZbGyUhlvj6JS58/+ro/X2tVdWHowJ0sAPabcF9BiyD
    2xIsWmJbnzsOQZf8A8X5RYWqUlqIY7w0oaXfb7DN4lo9NnIUAW31M7oHTdIA
X-ME-Proxy: <xmx:sMwYarawfjKX5DZPw_BBasqOe2P5j-CKXMlObaJvEyb22yTEI6lzZQ>
    <xmx:sMwYamQBOlc2SckEIbfMBDxyD7_wcayhE5en14R5AKq1Rsn-Aj3KgA>
    <xmx:sMwYamyA_rLtNEU_7sAeBqo2V4SW5d4nibKM8lab-HW5zUOEZUVlxA>
    <xmx:sMwYaqcIFrh1Fyx6EUXa3fZVL4D7-0qHe2mm9Rg7pvJDetEaX-ilAw>
    <xmx:sMwYagL2f-hLSHZ8hfacSUnJ9aZprP5pXPbn_l5aNf5HL5h1IjRYKRDf>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 19:15:58 -0400 (EDT)
Date: Thu, 28 May 2026 17:15:27 -0600
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
Subject: Re: [PATCH v2 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Message-ID: <20260528171527.46d0c21a@shazbot.org>
In-Reply-To: <20260527102319.100128-8-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-8-mattev@meta.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-62990-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shazbot.org:mid,shazbot.org:dkim,meta.com:email,messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4CAED5FB50A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 03:23:10 -0700
Matt Evans <mattev@meta.com> wrote:

> A VFIO DMABUF can export a subset of a BAR to userspace by fd; add
> support for mmap() of this fd.  This provides another route for a
> process to map BARs, except one where the process can only map a specific
> subset of a BAR represented by the exported DMABUF.
> 
> mmap() support enables userspace driver designs that safely delegate
> access to BAR sub-ranges to other client processes by sharing a DMABUF
> fd, without having to share the (omnipotent) VFIO device fd with them.
> 
> Since the main VFIO BAR mmap() is now DMABUF-aware, this path reuses
> the existing vm_ops.  But, since the lifecycle of an exported DMABUF
> is still decoupled from that of the device fd it came from, the device
> fd might now be closed concurrent with a VMA fault.
> 
> Extra synchronisation is added to deal with the possibility of a fault
> racing with the DMABUF cleanup path.  (Note that this differs to a
> DMABUF implicitly created on the mmap() path, which holds ownership of
> the device fd and so prevents close-during-fault scenarios in order to
> maintain the same user-facing behaviour on close.)  It does this by
> temporarily taking a VFIO device registration to ensure vdev remains
> valid, then vdev->memory_lock can be taken.

Suggest some general rewording of the commit log here, quite confusing.
 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c   | 79 ++++++++++++++++++++++++++----
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 27 ++++++++++
>  drivers/vfio/pci/vfio_pci_priv.h   |  2 +
>  3 files changed, 99 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index cfea59806a4f..41e049fa9a8a 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -12,6 +12,8 @@
>  
>  #include <linux/aperture.h>
>  #include <linux/device.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
>  #include <linux/eventfd.h>
>  #include <linux/file.h>
>  #include <linux/interrupt.h>
> @@ -1742,19 +1744,77 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>  	vm_fault_t ret = VM_FAULT_SIGBUS;
>  
>  	/*
> -	 * We can rely on the existence of both a DMABUF (priv) and
> -	 * the VFIO device it was exported from (vdev).  This fault's
> -	 * VMA was established using vfio_pci_core_mmap_prep_dmabuf()
> -	 * which transfers ownership of the VFIO device fd to the
> -	 * DMABUF, and so the VFIO device is held open because the
> -	 * VMA's vm_file (DMABUF) is open.
> +	 * The only thing this can rely on is that the DMABUF relating
> +	 * to the VMA's vm_file exists (priv).
>  	 *
> -	 * Since vfio_pci_dma_buf_cleanup() cannot have happened,
> -	 * vdev must be valid; we can take memory_lock.
> +	 * A DMABUF for a VFIO device fd mmap() holds a reference to
> +	 * the original VFIO device fd, but an explicitly-exported
> +	 * DMABUF does not.  The original fd might have closed,
> +	 * meaning this fault can race with
> +	 * vfio_pci_dma_buf_cleanup(), meaning priv->vdev might be
> +	 * NULL, and the VFIO device registration might have been
> +	 * dropped.
> +	 *
> +	 * With the goal of taking vdev->memory_lock in a world where
> +	 * vdev might not still exist:
> +	 *
> +	 * 1. Take the resv lock on the DMABUF:
> +	 *  - If racing cleanup got in first, the buffer is revoked;
> +	 *    stop/exit if so.
> +	 *  - If we got in first, the buffer is not revoked so vdev is
> +	 *    non-NULL, accessible, and cleanup _has not yet put the
> +	 *    VFIO device registration_.  So, the device refcount must
> +	 *    be >0.
> +	 *
> +	 * 2. Take vfio_device registration (refcount guaranteed >0
> +	 *    hereafter).
> +	 *
> +	 * 3. Unlock the DMABUF's resv lock:
> +	 *  - A racing cleanup can now complete.
> +	 *  - But, the device refcount >0, meaning the vfio_device
> +	 *    (and vfio_pcie_core device vdev) have not yet been
> +	 *    freed.  vdev is accessible, even if the DMABUF has been
> +	 *    revoked or cleanup has happened, because
> +	 *    vfio_unregister_group_dev() can't complete.
> +	 *
> +	 * 4. Take the vdev->memory_lock
> +	 *  - Either the DMABUF is usable, or has been cleaned up.
> +	 *    Whichever, it can no longer change under us.
> +	 *  - Test the DMABUF revocation status again: if it was
> +	 *    revoked between 1 and 4 return a SIGBUS. Otherwise,
> +	 *    return a PFN.
> +	 *  - It's not necessary to also take the resv lock, because
> +	 *    the status/vdev can't change while memory_lock is held.
> +	 *
> +	 * 5. Unlock, done.
>  	 */
> +
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
>  	vdev = READ_ONCE(priv->vdev);

I think you've again avoided the need for the READ_ONCE() by getting it
under dma_resv_lock(), so it's still unnecessary.

>  
> +	if (priv->revoked || !vdev) {
> +		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
> +				     __func__, vmf->address, vma->vm_pgoff);
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		return VM_FAULT_SIGBUS;
> +	}
> +	/* vdev is usable */
> +
> +	if (!vfio_device_try_get_registration(&vdev->vdev)) {
> +		/*
> +		 * If vdev != NULL (above), the registration should
> +		 * already be >0 and so this try_get should never
> +		 * fail.
> +		 */
> +		dev_warn(&vdev->pdev->dev, "%s: Unexpected registration failure\n",
> +			 __func__);
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		return VM_FAULT_SIGBUS;
> +	}
> +	dma_resv_unlock(priv->dmabuf->resv);
> +
>  	scoped_guard(rwsem_read, &vdev->memory_lock) {
> +		/* Revocation status must be re-read, under memory_lock */
>  		if (!priv->revoked) {
>  			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
>  							     vmf->address,
> @@ -1773,6 +1833,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>  				    vma->vm_pgoff, (unsigned int)ret);
>  	}
>  
> +	vfio_device_put_registration(&vdev->vdev);
>  	return ret;
>  }
>  
> @@ -1781,7 +1842,7 @@ static vm_fault_t vfio_pci_mmap_page_fault(struct vm_fault *vmf)
>  	return vfio_pci_mmap_huge_fault(vmf, 0);
>  }
>  
> -static const struct vm_operations_struct vfio_pci_mmap_ops = {
> +const struct vm_operations_struct vfio_pci_mmap_ops = {
>  	.fault = vfio_pci_mmap_page_fault,
>  #ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
>  	.huge_fault = vfio_pci_mmap_huge_fault,
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 733607371082..4b3b15655f1d 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -27,6 +27,32 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  
>  	return 0;
>  }
> +
> +static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	if (priv->revoked)
> +		return -ENODEV;

Questionable validity to testing revoked without a lock, but doesn't
this also fail to follow the "map regardless, sort it out on fault"
paradigm used elsewhere in vfio-pci?  Thanks,

Alex

> +	if ((vma->vm_flags & VM_SHARED) == 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * dma_buf_mmap_internal() has asserted that the VMA is
> +	 * contained within the DMABUF size before calling this.
> +	 */
> +
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> +
> +	/* See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED. */
> +	vm_flags_set(vma, VM_ALLOW_ANY_UNCACHED | VM_IO | VM_PFNMAP |
> +		     VM_DONTEXPAND | VM_DONTDUMP);
> +	vma->vm_private_data = priv;
> +	vma->vm_ops = &vfio_pci_mmap_ops;
> +
> +	return 0;
> +}
>  #endif /* CONFIG_VFIO_PCI_DMABUF */
>  
>  static void vfio_pci_dma_buf_done(struct kref *kref)
> @@ -94,6 +120,7 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>  static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>  #ifdef CONFIG_VFIO_PCI_DMABUF
>  	.attach = vfio_pci_dma_buf_attach,
> +	.mmap = vfio_pci_dma_buf_mmap,
>  #endif
>  	.map_dma_buf = vfio_pci_dma_buf_map,
>  	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index 10833aabd7fb..db2e2aeae88f 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -38,6 +38,8 @@ struct vfio_pci_dma_buf {
>  	u8 revoked : 1;
>  };
>  
> +extern const struct vm_operations_struct vfio_pci_mmap_ops;
> +
>  bool vfio_pci_intx_mask(struct vfio_pci_core_device *vdev);
>  void vfio_pci_intx_unmask(struct vfio_pci_core_device *vdev);
>  


