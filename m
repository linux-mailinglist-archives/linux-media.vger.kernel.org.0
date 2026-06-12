Return-Path: <linux-media+bounces-64743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cuEfH7dtLGooQwQAu9opvQ
	(envelope-from <linux-media+bounces-64743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 22:36:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E271667C5A2
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 22:36:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Bf1IRcem;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64743-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64743-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90DBF3139CF4
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35898352F85;
	Fri, 12 Jun 2026 20:35:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AEB345740
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 20:35:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296514; cv=none; b=kUsiYxZm6qgUERo7U/+1ipdkaKATl+u4KqxiT+6fVJO3uleXlERDfrA0AlB+fpnLpBHk7+CeAyFo4XfbrRAW/JFqlq71AdfDRMOFRzV+W1ZXihK37De13RGLu6xrZ+NXTgk0lJOMp+tAyVQWOJnC+bPmKFh8SEPzAIG4IU5iA/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296514; c=relaxed/simple;
	bh=d/H3YUSb7Xb1BXZue09+f2TQu7Z0YTKfeZLnWE2Bm04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIy+RYlFZ/G8BGBxIgvlVskMDCca1Qn9s2/br67n7sSqznVILmRwTmL4xNh3dCyz/e34ghFHdfAx27tXukmEc0l6IaNdzywHrYVh88ouALVIBQQKV/QUE7o5iyxRuGQZPButcY7FrVTNlw9EGnGjSicPnmVqAOZNmMk7NY2WlZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bf1IRcem; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf22c18ad3so25355ad.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781296512; x=1781901312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ddJRP/HCOdDtAL2h34nFkdEDW/TddVVb74Su299sjvc=;
        b=Bf1IRcemp1hYaNxcUVtYW68sDRnZYEcsCQDryryZ9/e4OLKXXuQd0C4AFEJVIBhnnC
         YYz3n5YyE2cwCL673BHHZdAmMMCV2rJh30K5/ELnWMXMW5p4mw+EEVuHihPso8cX4zO+
         owPDJZj7quli1+SufjuW5pqt7p2UxLtCPO53fZ0fHtJFiGvUyU2h3h3zg++rMFIxkk+l
         A53pyBpKBlitemTBsxliPHlzIjlt6Dyvv0Ho1NyUOclPmz6FOt1aRzssDoXjXzVixe2b
         ppz9ecpt+S6foWA1jF8kjqVh90KfzFEanra1VssYH3CHb1Upc5xYIPKnz7B1kSOr64AJ
         1rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296512; x=1781901312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddJRP/HCOdDtAL2h34nFkdEDW/TddVVb74Su299sjvc=;
        b=dMsnTxst/Cy2EsGPFbSYrTAN890QuvNOUFSpjh8wSpq01aKziwFreq3qlxIBDsBMV5
         5IsqBm2ZxIm5ZK+MDyfbz663GxexXzUs/9uKcJDt5TK9TR68mWZfTYLuqTikkYsSi8Zd
         WtJc/Q4f3An0FGUR1ki92hQlxsUzpgNPp5if0bhSNCJVvZ5FBYWj4WJ5Ktl9FmIoT6aM
         hl+6hQR169I9fOIiDT/yrL8CquSUzEBavzcJ2cR9ewyjnEGM2e9D/iyagA8VPbsKeamK
         pt+N7ZGuyo7iJYeeUHlaqLOacnuVPMIW7HlamiBbkMuz0uLNGAgp3Ja0SdIkXfJIADf7
         Zb2w==
X-Forwarded-Encrypted: i=1; AFNElJ/c7aDQI7d/1ATURqyCaf3qT58H5PkQ34W90LBxHX57UII3iJs3aKV8suDfyrf0/HPeITgoNqrRK7QVxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuKFkrm7jRJwOHq8jUcrlN7cGjhjUSjPPBcTKQkhnNeWGBP1o
	iiB3zRtWT8nVeM1WzVfW6GbGULymhs4fheE8YoZEdsSwPpENrpGJ6f9jXo/xtbSlrQ==
X-Gm-Gg: Acq92OGyaklqtJDiNRKefwzyIBSutRCdRapk4Cl9jmPDIWumLSBq6DdvIpl6DpowayN
	8jlk/LojcRNKhFkuZyfpaUO3nWk1Unx1gXpUDrlWkk/OAsTSeK1lhowaQ96y5cl9Y+PpYXnA5V6
	WgwbAorPRKbXu/xoDZBeNjB8q+HfEwnDY98JQCSUVCYOIiVwdc+MErMdxzGTBPx63E36TqtSKbw
	wAs9tCMGyYJwXgm6PbZzKMqt9u38Ro6JXoJvRiUtaPvvaF/1IGonHWffZmjJFc+jXwH109972vX
	n/BHef1zQt8GVuBD5IWwlMj2yau6D/AEDfCHXOXt6S4A1ovFfHUQDn6Egm+YAYQMZI0J6EO91VP
	X8q/LsjeQQYt1AF0q2UJjXhmiIKG/Ncmc0dE4eUKb0Oh5AJZmf/+/9SbWPf8mHeV0eE/URmSUBL
	gz+7TuSIosWnusSAxLz0Cg8eZGi9FkNo+OUF6HldpFPDSeYeEMeyrhhsxtNjz1
X-Received: by 2002:a17:902:e743:b0:2c1:ee6e:4e4d with SMTP id d9443c01a7336-2c665142269mr504685ad.30.1781296511981;
        Fri, 12 Jun 2026 13:35:11 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm28160925ad.10.2026.06.12.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:35:11 -0700 (PDT)
Date: Fri, 12 Jun 2026 20:35:03 +0000
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
Subject: Re: [PATCH v3 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Message-ID: <aixtd_7gDhf2kisJ@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-8-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-8-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64743-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: E271667C5A2

On Wed, Jun 10, 2026 at 04:43:21PM +0100, Matt Evans wrote:

Hi Matt,

[...]

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
> +
> +	if (priv->revoked) {
> +		pr_debug_ratelimited("%s VA 0x%lx, pgoff 0x%lx: DMABUF revoked/cleaned up\n",
> +				     __func__, vmf->address, vma->vm_pgoff);
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		return VM_FAULT_SIGBUS;
> +	}
> +
> +	/* If the buffer isn't revoked, vdev is valid */
>  	vdev = priv->vdev;
>  
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

Wait, I noticed that the is_aligned_for_order() check from mainline was 
removed here. Was that intentional? 

For hugepage faults (order > 0), we must ensure the PFN and address are
properly aligned before calling vfio_pci_vmf_insert_pfn().

In the current upstream code, we have:
  if (is_aligned_for_order(vma, addr, pfn, order))

Should we restore that check here?

> @@ -1766,6 +1827,7 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>  			    __func__, order, pfn, vmf->address,
>  			    vma->vm_pgoff, (unsigned int)ret);
>  
> +	vfio_device_put_registration(&vdev->vdev);
>  	return ret;
>  }
>  
> @@ -1774,7 +1836,7 @@ static vm_fault_t vfio_pci_mmap_page_fault(struct vm_fault *vmf)
>  	return vfio_pci_mmap_huge_fault(vmf, 0);
>  }
>  
> -static const struct vm_operations_struct vfio_pci_mmap_ops = {
> +const struct vm_operations_struct vfio_pci_mmap_ops = {
>  	.fault = vfio_pci_mmap_page_fault,

Nit: Instead of making this global, should we add a helper? E.g.:

void vfio_pci_set_vma_ops(struct vm_area_struct *vma)
{
     vma->vm_ops = &vfio_pci_mmap_ops;
}

[...]

> +
> +static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	/*
> +	 * If we observe that the buffer is revoked now then refuse
> +	 * the mmap().  This is a belt-and-braces early failure to
> +	 * ease debugging a revoked buffer being used.  Userspace
> +	 * might also race an mmap() against an explicit revocation,
> +	 * or an action doing a temporary revoke; race scenarios are
> +	 * still safe because the fault handler ultimately prevents
> +	 * access to a revoked buffer if it isn't caught here.
> +	 */
> +	if (READ_ONCE(priv->revoked))
> +		return -ENODEV;
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

Thanks,
Praan

