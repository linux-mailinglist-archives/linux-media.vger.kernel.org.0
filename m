Return-Path: <linux-media+bounces-64697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id StLtNNkSLGqkKwQAu9opvQ
	(envelope-from <linux-media+bounces-64697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:08:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3704D67A0FD
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:08:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=m7MvQXrP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64697-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64697-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FE1B3186309
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 14:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3FF383C65;
	Fri, 12 Jun 2026 14:06:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6EA383313
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 14:06:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781273185; cv=none; b=Ef8Smq+ILv3t6ExeLfuEAZEzwK64E1wur9xG+ZEm0T3rAdAITG1ca6LBz2QQehtVme41V5K4ojN6uwGQgtB8y/mdNR/7xP4fv7qpOyLGg1qslmd8hEYL4mqH4KSM5tWJE+kUYzFG8q5aKwrX0HS2Gi1A9L+SvE9A/RhK5s3lxSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781273185; c=relaxed/simple;
	bh=8nGRcelhCMsBP5e+Ti6pgha8vZKPOQWb1Xzagxo6dR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlHbsFt1BebYKUQuC0gG0fQUTBDEn+m31udl9vIy6C4gh86lvbvRzVz5MsLCoCogdiTqMBiVPk54OIuV7sLU3QdT6g4nen85sNGKR+tkTRMDa115M6tjxGpwpcvxp2qKMDscI1X4YEcfhWDeyqmQecLaRSDzPe1G6Yqp8mHf7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m7MvQXrP; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf2911f93cso80335ad.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781273184; x=1781877984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gWNes2hHFmdqgzisSBTrBhiO7t0Lprwi8AqbjigE24=;
        b=m7MvQXrP5FFeGc1nXMIYk+a4X8itmrWVegIOWowNV9rAshzHeltu3Bed8cXCOPVc+q
         8qidSDuQhAIJOHwCIx4jRnzrDHORHEhizuJ+UgUNx8XV0FkP5yKsvRAlsSQ5TIO1E8lC
         KpQsX1DPsDhJvf/sy5nTzM/OMZ83w8OvRyaFXda5P7Ra0RGL2aHqaBU7LFG8k4snI1bQ
         eiiJZ7yrEHbsXb5yvCHQGz994pSiRo/Pdhh4J2Sse1gcY0D8AXEKesTggOZ3H2jSyXSO
         PpEH7xWuVwh1HzA3tob7KDuuQvXSZnPDRHa1Ooh3Q7zb5DoXaR9K/gSaBEe+HcEshp8/
         cyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781273184; x=1781877984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gWNes2hHFmdqgzisSBTrBhiO7t0Lprwi8AqbjigE24=;
        b=mSUbvapOOEywuDttbESkQcstzvOTqlCcVTqSdDNHYXNEwsFO0kcxwjRyBnUPlNfqJa
         zDB3VSJJCJQLnb2vw7icZ9sESGK2RlRBhDxef5tWSYRpcOYRkoCRMaXF2E/+dGE25wT8
         799OyE3Et67K+YG2sZ1r5YLr0HurO00Jh2g92TjdOjRZPfovjtLPa2E9OOGcopMzklMb
         aYrRXppbHR2S2E49CL5DdicCKzGr2VvGjBORUemjISQUv3EMlcfEyoSMQn9NvZDH89U9
         LrnTCPlPRkk+52gI2UR+LK4J7hXuRVAoXs/Yzsat0ptM4kyCHH9qYRZRA66NscJ7uP/g
         ACnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3ksiDBAJ+0CxWAOEs6rHAuiM/86792S8xYN0ZnfmYSpsAKM7CmA4HNcGU0NzKynkLfAoJEiLTxXIwNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww26n4MSiAcaHNQ2Uh77Yu8k1wM9C9O2/oCaRhlM8PkWcTF+Tp
	bQDKEdGlpLyue7Tm8+p1WdzbXuCbP237vkWUriK7BvOSITJts5kFfBzd/KrxrCC/OA==
X-Gm-Gg: Acq92OF0ennY03SzDP+JZN8JRhQRfxjnkwW9cvZt3YEdEnfideg+zVJp+LS4VMlnYtX
	/kXTOXewpzlQxL6xM6j6rkvtEXSVA6uwDeNa5dPAMrc9/dwDY9lCIVOla+bxN3MTuV7DfXKZWxn
	h73qy1huqDk1CrBCJcFvOEKlMj3ES8/FFIkw/i+qnxAKR1w2K23gl/QJAAvjojoaERtco5H+ds1
	UIXBY+tck0kclQSEqJbtJVGrPIVNL6OaIGucrzGAovsZtg5CYp89TAESWw+NF5VjcQ6xqsM7RYk
	5hHg7ORQfE0V6FocCEr6P2wdszA6/L8hI/QLbmrTvfp5GBKCAGeQZe0gGukHZwiOO5UUk1kWpUR
	09wgvXPWiFFTFzis3z11xKE0wX0jchCDGtfkkIpOiIi6IzNGiOENgrhiCLxjKIo7+tZB/0G1oDF
	SPgsLPVvRG9umhsaP08GJKNT5xg88ClC6aqOznSU6qdjDwq4JyTKQOurPmFUHLsZd6c5uX9UQ=
X-Received: by 2002:a17:903:46c6:b0:2bd:6dad:3df9 with SMTP id d9443c01a7336-2c405f85829mr1700165ad.23.1781273183096;
        Fri, 12 Jun 2026 07:06:23 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd5dcsm2325236a91.9.2026.06.12.07.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:06:22 -0700 (PDT)
Date: Fri, 12 Jun 2026 14:06:14 +0000
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
Subject: Re: [PATCH v3 5/9] vfio/pci: Provide a user-facing name for BAR
 mappings
Message-ID: <aiwSVk4n9mCQEln2@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-6-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-6-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64697-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3704D67A0FD

On Wed, Jun 10, 2026 at 04:43:19PM +0100, Matt Evans wrote:
> Since converting BAR mmap()s to using DMABUFs, we lose the original
> device path in /proc/<pid>/maps, lsof, etc.  Generate a debug-oriented
> synthetic 'filename' based on the cdev, plus BDF, plus resource index.
> 
> This applies only to BAR mappings via the VFIO device fd, as
> explicitly-exported DMABUFs are named by userspace via the
> DMA_BUF_SET_NAME ioctl.
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 2fd3629789bf..8f7f1b909b94 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -4,6 +4,7 @@
>  #include <linux/dma-buf-mapping.h>
>  #include <linux/pci-p2pdma.h>
>  #include <linux/dma-resv.h>
> +#include <uapi/linux/dma-buf.h>
>  
>  #include "vfio_pci_priv.h"
>  
> @@ -470,6 +471,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  {
>  	struct vfio_pci_dma_buf *priv;
>  	unsigned long vma_pgoff = vma->vm_pgoff & (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT);
> +	char *bufname;
>  	int ret;
>  
>  	priv = kzalloc_obj(*priv);
> @@ -482,6 +484,20 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  		goto err_free_priv;
>  	}
>  
> +	bufname = kzalloc(DMA_BUF_NAME_LEN, GFP_KERNEL);
> +	if (!bufname) {
> +		ret = -ENOMEM;
> +		goto err_free_phys;
> +	}
> +
> +	/*
> +	 * Maximum size of the friendly debug name is
> +	 * vfio1234567890:ffff:ff:3f.7/5 = 30, which fits within
> +	 * DMA_BUF_NAME_LEN.
> +	 */
> +	snprintf(bufname, DMA_BUF_NAME_LEN, "%s:%s/%x",
> +		 dev_name(&vdev->vdev.device), pci_name(vdev->pdev), res_index);
> +

Nit: Could we instead use:

	bufname = kasprintf(GFP_KERNEL, "%s:%s/%x",
	                    dev_name(&vdev->vdev.device), pci_name(vdev->pdev), res_index);
	if (!bufname)
	    ret = -ENOMEM;
	    [...]

>  	/*
>  	 * The DMABUF begins from the mmap()'s BAR offset, i.e. the
>  	 * start of the VMA corresponds to byte 0 of the DMABUF and
> @@ -500,7 +516,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  	priv->provider = pcim_p2pdma_provider(vdev->pdev, res_index);
>  	if (!priv->provider) {
>  		ret = -EINVAL;
> -		goto err_free_phys;
> +		goto err_free_name;
>  	}
>  
>  	priv->phys_vec[0].paddr = phys_start + ((u64)vma_pgoff << PAGE_SHIFT);
> @@ -508,7 +524,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  
>  	ret = vfio_pci_dmabuf_export(vdev, priv, O_CLOEXEC | O_RDWR);
>  	if (ret)
> -		goto err_free_phys;
> +		goto err_free_name;
>  
>  	/*
>  	 * Ownership of the DMABUF file transfers to the VMA so that
> @@ -523,8 +539,15 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  	vma->vm_file = priv->dmabuf->file;
>  	vma->vm_private_data = priv;
>  
> +	spin_lock(&priv->dmabuf->name_lock);
> +	kfree(priv->dmabuf->name);
> +	priv->dmabuf->name = bufname;
> +	spin_unlock(&priv->dmabuf->name_lock);
> +
>  	return 0;
>  
> +err_free_name:
> +	kfree(bufname);
>  err_free_phys:
>  	kfree(priv->phys_vec);
>  err_free_priv:

Apart from that,

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

