Return-Path: <linux-media+bounces-62936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI+PDLF3F2ruFggAu9opvQ
	(envelope-from <linux-media+bounces-62936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 01:01:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 812655EAD3B
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 01:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0D1B30E2DD9
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 22:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99823CA4B6;
	Wed, 27 May 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="jw1Z3Wso";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qD7SqQAQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24853264E6;
	Wed, 27 May 2026 22:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779922769; cv=none; b=qQwspwi0SfLjgM3Xb7cN5KjOOuA9yixnMXf7OucL3LJDBf9dYgKEjnN/1vpt4xHRLSFwzlMm4MVSWEWUZPXQv/qh73H2ZSjkq6zPr00hvZujcc91QzBhvONnRkl9ZKgeOqwKu+vKRukPBG+n2wiACOhNfx0ZZoLet8n/JdJTovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779922769; c=relaxed/simple;
	bh=LDOsyxvbL1Oihl1/xRDwjeBY9+Y/HZ5vlAhRzHSd7Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r6wVCjSX8KsrNwmugKU/0p2kTiFDHpCZSGIWCkp4GIYPJe04huLDtFKuFDEjtZsVr81ZmIrQXxisVmgYaMyRftPdO9qT1bTg5nY4GaIozlsBaCrNdqV+V3vqKS+AvF40RNrrxD7sFhsS7GVzG8Xmk/T/H5A1eEIiezkEOZublBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=jw1Z3Wso; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qD7SqQAQ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id CDAD4EC01B1;
	Wed, 27 May 2026 18:59:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 27 May 2026 18:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779922765;
	 x=1780009165; bh=+cyoWbepYz1OlWI1G5UXCeSSZUUQsm33CuIHdrOc9uM=; b=
	jw1Z3WsoRDbXxMkgF/H9GxAY9lIUV5NoWg/x7jkIrLRk0lDrPSlVl8vG/dj7/uys
	gYIoTFDPo8wqjOiG572scmHK7oocv0khLfYcEH8e/RWxI04LG4qczSFkpXNa54ne
	EqvLbAkQqe/BehwjAJHsiAssF485uvlEEUuC7ZS31+KlnzfmdcaypuWIBgWRIXFh
	FkfleTfymZ2RkZq+/Wk4/72Ih792b+R3Wrr95q4hO5Ky01oeG7a/pRCcI8Xhwd0h
	G0P828qRIbjjb/KmVVFXCUNnk9bkUbqMfWHMXZemVDEPHIeEcxXgATPT7dYFRLdJ
	nndOsrY7yqDeCjmOyY9+oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779922765; x=
	1780009165; bh=+cyoWbepYz1OlWI1G5UXCeSSZUUQsm33CuIHdrOc9uM=; b=q
	D7SqQAQzaRHnvW0gLYBRoY8ucG6NCUfVt+8kuGG5UwveFHHj4tXQNLZhqMrUaGHf
	2zffA8HZRcAn8V+0mdasOz9Ujhdj24JwPiNQiZgoC3jw8xvrXZ3/hq+lGpah7lsY
	qxkdqs+qRlz6/ZbYVyUomAzI71vOLX8PLlzwdsq9XJkHho6rK76N0N+u7/LPj8Gd
	S6I3M9PVty1pQniTs+KQMp5Ev6Bxutyo3K6rfaliPvJbYDHnQz/F/KzXg2CEJ0Dn
	D4EIe119R7CEFbT+Yep9ZzhnJb4XSlSOFCtr+19mdjIbuEiEuQZpB2OISMKVKLD+
	HXW3NdzVIzTNzg++q+j6g==
X-ME-Sender: <xms:TXcXajw7ezwBWnehmJjKKmcJVCUKwNOlp5ajCqyoL0_kP0lcA2WQsw>
    <xme:TXcXam_woic6c_M0rKUu-aPPkgb1zRPitB6BrnSgMuRGspKQ4R3QhgVoBe5EcNayc
    jBBT7eDWN2-Fw0Qz89Ma0Wo91dNLCBZUYXCOPeJOVMKsMvrjbKQEg>
X-ME-Received: <xmr:TXcXaoByAMnT4Wu0pNedgE4ZbnKcSNyuxbxLGYbd5PVqPUIinJTrqNT0Acw>
X-ME-Proxy-Cause: dmFkZTGTIjtt6KAvAWx6PdA4ZwxDcpEVsszq0Ny0U4F5ASiDNJCka27XDjxCzxYMkrLlSg
    mQTbZZ8A2UgqIHsaGTqYuuHxbQS/oSApZLxrRr/wntoPt3HC7b28rVBUEl/iyAWkIMimJJ
    YmHET+1XFrnYcyVROq+iWhPUXaUtgwWjY7YkhnoldPKzdPunlQQ8qOe7qgMGQEI7o/kn51
    336uvRJMmJEbgqLzc0g+ueVF4784XwOly+S19hqVAv/KBuSv92KP1YpGBoQoWe++cbFkqF
    xWdoIqL8IWnz2HPVt/q5NtfKPjpKorK1nenWyz09FumYwcG6O+E7S/ddFLTC0haFwhP9VS
    1nIZixcVT7UACGk9q3OxcJIdSnkjpvlPCjSICRR0mNwXCJDSXyLLNGjIGDt+HQvU4pEFjF
    1y9kbEnKI6QjPez2kMNcS76NjXXGR8FisM9xKCgbLYmumUlp/vxcDTe9IrPdyFBvmx6TqO
    cA5E9okZKUJTbwLiMYT/TKCMQp2zy8gsnLrLHctp5Ad6/1p7kGPuZvyr3ncHjL3L8+zIjN
    ZU+NWyoEfyIQ2xgvibN24njVe44oAzAmGH8MTlbbo7+oUjmlhyLWSXd+PTBn2s2D4+uE7P
    S1Nx3JvQOThQHX93frqYJMMiQgvHqz6wzRTcpjTs8lKcJ3NZr6z+Dhm4lnFw
X-ME-Proxy: <xmx:TXcXaucHOlgNmpyY4U0hC3wPQgrQAKOpYoTFmTVwVCBHG2bGqfao4A>
    <xmx:TXcXakEngJcT03jqcEyL2qgH6UoWg_P2Tdi9mp2Lzt904j2hzwQjbw>
    <xmx:TXcXaoUtnaSUp5959PlwGyF_mKRLuI04QGcO41jX5mIWRgSG6ftezQ>
    <xmx:TXcXakwyNmkE8cReKCVcMeY_nVQQy2A9UQML-ESIVem4P6UJVhCzXw>
    <xmx:TXcXav2jeYRFCTB-MujwYPFgCFIZWmAt1RnqIvUsfml0VNSW12Dh83LI>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 May 2026 18:59:23 -0400 (EDT)
Date: Wed, 27 May 2026 16:59:22 -0600
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
Subject: Re: [PATCH v2 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
Message-ID: <20260527165922.60a79fee@shazbot.org>
In-Reply-To: <20260527102319.100128-4-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-4-mattev@meta.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-62936-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,meta.com:email,messagingengine.com:dkim,shazbot.org:mid,shazbot.org:dkim]
X-Rspamd-Queue-Id: 812655EAD3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 03:23:06 -0700
Matt Evans <mattev@meta.com> wrote:

> This helper, vfio_pci_core_mmap_prep_dmabuf(), creates a single-range
> DMABUF for the purpose of mapping a PCI BAR.  This is used in a future
> commit by VFIO's ordinary mmap() path.
> 
> This function transfers ownership of the VFIO device fd to the
> DMABUF, which fput()s when it's released.
> 
> Refactor the existing vfio_pci_core_feature_dma_buf() to split out
> export code common to the two paths, VFIO_DEVICE_FEATURE_DMA_BUF and
> this new VFIO_BAR mmap().
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 140 ++++++++++++++++++++++-------
>  drivers/vfio/pci/vfio_pci_priv.h   |   5 ++
>  2 files changed, 115 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 0d132c4ca95f..782408c08a5e 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -82,6 +82,8 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>  		up_write(&priv->vdev->memory_lock);
>  		vfio_device_put_registration(&priv->vdev->vdev);
>  	}
> +	if (priv->vfile)
> +		fput(priv->vfile);
>  	kfree(priv->phys_vec);
>  	kfree(priv);
>  }
> @@ -222,6 +224,45 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
>  	return -EFAULT;
>  }
>  
> +/*
> + * Create a DMABUF corresponding to priv, add it to vdev->dmabufs list
> + * for tracking (meaning cleanup or revocation will zap it), and take
> + * a vfio_device registration.
> + */
> +static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
> +				  struct vfio_pci_dma_buf *priv, uint32_t flags)

s/uint32_t/u32/?

> +{
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +
> +	if (!vfio_device_try_get_registration(&vdev->vdev))
> +		return -ENODEV;
> +
> +	exp_info.ops = &vfio_pci_dmabuf_ops;
> +	exp_info.size = priv->size;
> +	exp_info.flags = flags;
> +	exp_info.priv = priv;
> +
> +	priv->dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(priv->dmabuf)) {
> +		vfio_device_put_registration(&vdev->vdev);
> +		return PTR_ERR(priv->dmabuf);
> +	}
> +
> +	kref_init(&priv->kref);
> +	init_completion(&priv->comp);
> +
> +	/* dma_buf_put() now frees priv */
> +	INIT_LIST_HEAD(&priv->dmabufs_elm);
> +	down_write(&vdev->memory_lock);
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
> +	priv->revoked = !__vfio_pci_memory_enabled(vdev);
> +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> +	dma_resv_unlock(priv->dmabuf->resv);
> +	up_write(&vdev->memory_lock);
> +
> +	return 0;
> +}
> +
>  /*
>   * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
>   * It allows the two co-operating drivers to exchange the physical address of
> @@ -340,7 +381,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  {
>  	struct vfio_device_feature_dma_buf get_dma_buf = {};
>  	struct vfio_region_dma_range *dma_ranges;
> -	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>  	struct vfio_pci_dma_buf *priv;
>  	size_t length;
>  	int ret;
> @@ -400,34 +440,9 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  	kfree(dma_ranges);
>  	dma_ranges = NULL;
>  
> -	if (!vfio_device_try_get_registration(&vdev->vdev)) {
> -		ret = -ENODEV;
> +	ret = vfio_pci_dmabuf_export(vdev, priv, get_dma_buf.open_flags);
> +	if (ret)
>  		goto err_free_phys;
> -	}
> -
> -	exp_info.ops = &vfio_pci_dmabuf_ops;
> -	exp_info.size = priv->size;
> -	exp_info.flags = get_dma_buf.open_flags;
> -	exp_info.priv = priv;
> -
> -	priv->dmabuf = dma_buf_export(&exp_info);
> -	if (IS_ERR(priv->dmabuf)) {
> -		ret = PTR_ERR(priv->dmabuf);
> -		goto err_dev_put;
> -	}
> -
> -	kref_init(&priv->kref);
> -	init_completion(&priv->comp);
> -
> -	/* dma_buf_put() now frees priv */
> -	INIT_LIST_HEAD(&priv->dmabufs_elm);
> -	down_write(&vdev->memory_lock);
> -	dma_resv_lock(priv->dmabuf->resv, NULL);
> -	priv->revoked = !__vfio_pci_memory_enabled(vdev);
> -	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> -	dma_resv_unlock(priv->dmabuf->resv);
> -	up_write(&vdev->memory_lock);
> -
>  	/*
>  	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
>  	 * will be released.
> @@ -438,8 +453,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  
>  	return ret;
>  
> -err_dev_put:
> -	vfio_device_put_registration(&vdev->vdev);
>  err_free_phys:
>  	kfree(priv->phys_vec);
>  err_free_priv:
> @@ -449,6 +462,73 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  	return ret;
>  }
>  
> +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
> +				   struct vm_area_struct *vma,
> +				   u64 phys_start, u64 req_len,
> +				   unsigned int res_index)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	const unsigned int nr_ranges = 1;

Why, versus priv->nr_ranges = 1; below?  Thanks,

Alex

> +	unsigned long vma_pgoff = vma->vm_pgoff & (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT);
> +	int ret;
> +
> +	priv = kzalloc_obj(*priv);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->phys_vec = kzalloc_obj(*priv->phys_vec);
> +	if (!priv->phys_vec) {
> +		ret = -ENOMEM;
> +		goto err_free_priv;
> +	}
> +
> +	/*
> +	 * The DMABUF begins from the mmap()'s BAR offset, i.e. the
> +	 * start of the VMA corresponds to byte 0 of the DMABUF and
> +	 * byte (vma_pgoff << PAGE_SHIFT) of the BAR.
> +	 *
> +	 * vfio_pci_dma_buf_find_pfn() reverses this offset using
> +	 * vma_pgoff_adjust, so that ultimately a fault's offset from
> +	 * the start of the _VMA_ has a consistent usage whether the
> +	 * VMA originates from an mmap() of the VFIO device here or a
> +	 * direct DMABUF mmap().
> +	 */
> +	priv->vdev = vdev;
> +	priv->size = req_len;
> +	priv->nr_ranges = nr_ranges;
> +	priv->vma_pgoff_adjust = vma_pgoff;
> +	priv->provider = pcim_p2pdma_provider(vdev->pdev, res_index);
> +	if (!priv->provider) {
> +		ret = -EINVAL;
> +		goto err_free_phys;
> +	}
> +
> +	priv->phys_vec[0].paddr = phys_start + ((u64)vma_pgoff << PAGE_SHIFT);
> +	priv->phys_vec[0].len = priv->size;
> +
> +	ret = vfio_pci_dmabuf_export(vdev, priv, O_CLOEXEC | O_RDWR);
> +	if (ret)
> +		goto err_free_phys;
> +
> +	/*
> +	 * The VMA gets the DMABUF file so that other users can locate
> +	 * the DMABUF via a VA.  Ownership of the original VFIO device
> +	 * file being mmap()ed transfers to priv, and is put when the
> +	 * DMABUF is released.
> +	 */
> +	priv->vfile = vma->vm_file;
> +	vma->vm_file = priv->dmabuf->file;
> +	vma->vm_private_data = priv;
> +
> +	return 0;
> +
> +err_free_phys:
> +	kfree(priv->phys_vec);
> +err_free_priv:
> +	kfree(priv);
> +	return ret;
> +}
> +
>  void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  {
>  	struct vfio_pci_dma_buf *priv;
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index c8f6f959056a..06dc0fd3e230 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -30,6 +30,7 @@ struct vfio_pci_dma_buf {
>  	size_t size;
>  	struct phys_vec *phys_vec;
>  	struct p2pdma_provider *provider;
> +	struct file *vfile;
>  	u32 nr_ranges;
>  	struct kref kref;
>  	struct completion comp;
> @@ -133,6 +134,10 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
>  			      unsigned long address,
>  			      unsigned int order,
>  			      unsigned long *out_pfn);
> +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
> +				   struct vm_area_struct *vma,
> +				   u64 phys_start, u64 req_len,
> +				   unsigned int res_index);
>  
>  #ifdef CONFIG_VFIO_PCI_DMABUF
>  int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,


