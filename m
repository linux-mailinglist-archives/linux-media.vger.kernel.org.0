Return-Path: <linux-media+bounces-64683-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QVzCBX/iK2oXHAQAu9opvQ
	(envelope-from <linux-media+bounces-64683-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 12:42:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E7678BFB
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 12:42:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=e85phcXk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64683-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64683-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5165300699D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5932837F73E;
	Fri, 12 Jun 2026 10:41:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858933AB281
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 10:41:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260909; cv=none; b=VnAIQyDPdtMzCDbcfL5yCK6ziA/j1Or2VBKnGk/WbVbV3R9B7jVTXNozzahDjZCdT8NY5aWm6gJYFJ90Pn0hU4RzOCZaHjgHkZ4HNUDmjcFLBVkHZjEwhUJhMnYXwh2eFNxqnnp1A/za9chPbfiMjO2bE0ezesO430TmMEZ3rAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260909; c=relaxed/simple;
	bh=sny6gtCPTebe7+aMFk6HVm73mJrTLWc+vwahxxW30yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeQh3c/Egb/5r6f2arp39F76tRRghuAf17aU5detfp3CZdM92mwgyC1LqYWFBrOP+HJQbxdj7jH1bd9VF+VyDvkT6+ocKpYaj8SWWZn4S/p1zYgnhvQwNI+xc2KNBAALf+7Gqv8KgMchW88n8pwN2fEmNiappSgUn+qGNKWFYeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e85phcXk; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf22c18ad3so98075ad.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781260906; x=1781865706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kyKpUSmzhXA86dwYd5qyCKe1OI2XqC/1Gh0xGOzaDhE=;
        b=e85phcXk1K9leNPFo1wZEsC5nr3lko7DIgyyvSZRSPFdoEegnsrwaYm1Nw+U6cyIAv
         xw1/3Ze+EUm2P/h9YI7KH46n1g7Gyh9+ZOm7gBt1TzB7PtPb/RBKhstuxPYEtIKEEIiE
         edEIuXGHtPWbMLR6zhJAsNaH9himgVH+BZcPZ6BQTTUm774+PPYz3r+GQqBkmCrv0cWN
         gQHuKntSVzYprCBnRaIMVoeLpQ/DUOQn/e3C2zsGjPN/wfOLkLrQveb8FMmhAzq2j/ql
         HVk8RR/sdA8krZiSmLGValM51ij7dNKSaPevsG3pF7Mr82x/0un7HHJ1EeXXfC1REn8n
         zgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260906; x=1781865706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyKpUSmzhXA86dwYd5qyCKe1OI2XqC/1Gh0xGOzaDhE=;
        b=M9c4TTI9p//DQExyp70+m4+afqRHstFtp5HWYqGyqJrPP7EdjMtjhPkuhcbDrhikAy
         BRp4FS55BpFoEcsee5nzQ0ghOaiCYXk6d65IIN0x4eBVixh7XDNy2dOIZpIxZRJ4lLzD
         hDvvg0A6wImtgJ6od7vhXKIv+3F5k9hcC15Jznyt+QuB8nishzw3cVdp1wmem0LQ3FcR
         E3pM2RQJZmHfmZLV0omT42shbb6M/nwj2E3PF7yw1eU9CZchi4MEtEFzMDGw/rDBo/03
         KVsiyQu0HPK4K02S8/HDWnpUV6dAYidn7XGAyRDcphPUR/wr5iKhoKytIg1/r4pQARo9
         TVkg==
X-Forwarded-Encrypted: i=1; AFNElJ8YprwV8OoDp6CGVNiyuXk4QbfzO37wZHKdKbXROR+mepRKvT94d22E0wYafwfW7dPbIS+pkg+oh2oUCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5RneqKw1ncBDwKx26ZkRVUo3b+fVdj6UDWWaDTm5huJdNkMpR
	tHtLvY/SPR0S07QtwtwFKXe8vxUTeSNq1xadDMj38e6DBDAs3E/1AZsa+BDErpWvAw==
X-Gm-Gg: Acq92OHE4SJ7rvzHlA1OPIfkxrQthMK9fcz0DThv9OkYHCYMzi1+8xWtQveTDIph0YV
	17hHNB2oZwv5jwimyEtZLoQfM1V3lCqK3zejGjolGQ05ZtIhzL/KtZVgqhFihNH2freY1QFiZK0
	e0XSGcBan8VBYx7qNDOBum3dOiX6ZNVEDH/txSMrN0wu8Rmo2ECEVZVeTJyXhUwQLhADtTQBLYq
	bVWucVFj0spYJrT3nztkt0VCu1xL1Peq+A2a9Y0rnOa/fLjAM09GCryb05q7KoocT7uMHcB9HjM
	79cO0gPzVLHESoEIx5/ogfXdfnhTesLy5wN2NpgUP/W10/UEWWAkAOWsJfaCx3vzoPR9NdfqXXb
	qJBNlA3NOC1kC9zGD7XWg1uUjq63BuIU2hsgK3CiKeYET5PxA00jAvHE8IPMvGbDcNbqynfE1zO
	7zPSE+O/X0yvbDRWZ56TCRmTFqCwAFmr2PRhoee7izLvysk+sQZrJ7bBBbG2Ii
X-Received: by 2002:a17:902:da81:b0:2c0:c14c:bf37 with SMTP id d9443c01a7336-2c3e1919896mr2258415ad.16.1781260905357;
        Fri, 12 Jun 2026 03:41:45 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acae2sm15759755ad.52.2026.06.12.03.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:41:44 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:41:36 +0000
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
Subject: Re: [PATCH v3 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Message-ID: <aiviYEi17tewEQg0@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-5-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-5-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64683-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B2E7678BFB

On Wed, Jun 10, 2026 at 04:43:18PM +0100, Matt Evans wrote:
> Convert the VFIO device fd fops->mmap to create a DMABUF representing
> the BAR mapping, and make the VMA fault handler look up PFNs from the
> corresponding DMABUF.  This supports future code mmap()ing BAR
> DMABUFs, and iommufd work to support Type1 P2P.
> 
> First, vfio_pci_core_mmap() uses the new
> vfio_pci_core_mmap_prep_dmabuf() helper to export a DMABUF
> representing a single BAR range.  Then, the vfio_pci_mmap_huge_fault()
> callback is updated to understand revoked buffers, and uses the new
> vfio_pci_dma_buf_find_pfn() helper to determine the PFN for a given
> fault address.
> 
> Now that the VFIO DMABUFs can be mmap()ed, vfio_pci_dma_buf_move()
> zaps PTEs (used on the revocation and cleanup paths).
> 
> CONFIG_VFIO_PCI_CORE now unconditionally depends on
> CONFIG_DMA_SHARED_BUFFER and CONFIG_PCI_P2PDMA_CORE.  The
> CONFIG_VFIO_PCI_DMABUF feature conditionally includes support for
> VFIO_DEVICE_FEATURE_DMA_BUF, depending on the availability of
> CONFIG_PCI_P2PDMA.
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/vfio/pci/Kconfig           |  5 +-
>  drivers/vfio/pci/Makefile          |  3 +-
>  drivers/vfio/pci/vfio_pci_core.c   | 75 +++++++++++++++++++-----------
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 12 +++++
>  drivers/vfio/pci/vfio_pci_priv.h   | 11 +----
>  5 files changed, 67 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 296bf01e185e..67a2ae1fbc04 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -6,6 +6,8 @@ config VFIO_PCI_CORE
>  	tristate
>  	select VFIO_VIRQFD
>  	select IRQ_BYPASS_MANAGER
> +	select PCI_P2PDMA_CORE
> +	select DMA_SHARED_BUFFER
>  
>  config VFIO_PCI_INTX
>  	def_bool y if !S390
> @@ -56,7 +58,8 @@ config VFIO_PCI_ZDEV_KVM
>  	  To enable s390x KVM vfio-pci extensions, say Y.
>  
>  config VFIO_PCI_DMABUF
> -	def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
> +	def_bool y if PCI_P2PDMA
> +	depends on VFIO_PCI_CORE
>  
>  source "drivers/vfio/pci/mlx5/Kconfig"
>  
[...]  
>  int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  				   struct vm_area_struct *vma,
> @@ -532,6 +538,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  	struct vfio_pci_dma_buf *tmp;
>  
>  	lockdep_assert_held_write(&vdev->memory_lock);
> +	/*
> +	 * Holding memory_lock ensures a racing VMA fault observes
> +	 * priv->revoked properly.
> +	 */

Nit: This comment should appear before the lockdep_assert_held_write()
Also, it is slightly verbose.. (not against it though).

>  
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>  		if (!get_file_active(&priv->dmabuf->file))
> @@ -549,6 +559,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  			if (revoked) {
>  				kref_put(&priv->kref, vfio_pci_dma_buf_done);
>  				wait_for_completion(&priv->comp);
> +				unmap_mapping_range(priv->dmabuf->file->f_mapping,
> +						    0, priv->size, 1);

Have we run this series with lockdep enabled?
I guess it'd be nice to check with lockdep once..

Apart from these, 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

