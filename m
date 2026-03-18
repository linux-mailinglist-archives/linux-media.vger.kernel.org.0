Return-Path: <linux-media+bounces-56241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FjnJ4wFu2kgeQIAu9opvQ
	(envelope-from <linux-media+bounces-56241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:05:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FFD2C2540
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17828301EBD5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F1A3EFD00;
	Wed, 18 Mar 2026 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="ADomunYZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fC6Zr9Md"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9883F87F4;
	Wed, 18 Mar 2026 20:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773864255; cv=none; b=tOYtFaPFQuZ1TMb29fcC9x4hy5h/jLLOKcBHPh6Ca1JMaeHPbrGDilxlGnUdy3DAGvj2glHNcHTRhaHdhMZVqZRQPJnmZdMJ7fDuq66OkYuRrf+/EmO9U/FcCDSBwMn0AXX8MbhhE5GZuXfGrf9hRezZ/2o5PZpIeYhNAd6DwJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773864255; c=relaxed/simple;
	bh=drqV/4IZlBYwX835DaodXvymvewzfPxjJ8nsV8Y11PM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FoiRaPR5+89M+zjLxUFxvVCKVeAanLvYRCrLoNeVotiu+5PM1GGKreA84UwzmzdExHfDFcu0IiaKQ/nBnVdGTdr1TqIpH0LYMD6UinnvG4YHVljrEHhxAq/SBhwa8vX0QcQfM/IOEA3KWVGuBzMQwcsNk0kWqDaFQ6tpgssqQms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=ADomunYZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fC6Zr9Md; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1608C140002C;
	Wed, 18 Mar 2026 16:04:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 18 Mar 2026 16:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773864251;
	 x=1773950651; bh=vcUo1ZMp4oFsagVvv3uz/l3ncy9TFqhSMUOAmV8B+wY=; b=
	ADomunYZ7kTL1VvnMbiUtPVoM8wAcN7vHVfDef9TOou5UNg7yb2rx+Wk8blN2M9T
	N9GceHk7LlF2UebAX9E+gIZL+O0aLJjtrxEe/Ca8DJUN0B6m2h1hnRugVHhIklJS
	nwtNV32JxzgOgidIHl8p5eq2tNA/yeFlVwl/9aT3JtymhXumRWKLw0NjDNE2yjZa
	sc9qlC6L5/wmraeoYM96aKKSzsNm4TQ6Djmp1HvKYDNUiQaNbIlUKaJJVGcOQXkn
	UL2H2NV7vGffiXN/r6rcpJoNeUzOBijcViFm77sYu3GfiahIN83a/JXggTVLPOZo
	A8hWK/NgDJ3yBjnvtryXhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773864251; x=
	1773950651; bh=vcUo1ZMp4oFsagVvv3uz/l3ncy9TFqhSMUOAmV8B+wY=; b=f
	C6Zr9MdLWduEGTK6FwNybsRMHhYcsa8HUNM62fWGhzNRz9uM28V0s9sGW7e7fJY5
	lofIpHWDENXLB9kOGMDCwM5NiouZmi5HFRHI0hu5P4sBK/x/KA+GKbhqigXs5eOB
	Tm4GxA3ub2UdQPNJvLw/Y+TkbRXwMbtpPHAkQHKVLAew2r9uimu8apcSHn1zXGfv
	XzPLh7gAAiISRgDqhTrc6Wn7nSjplszUP52DGHdrOIrlVasckniZECqYgFxU9LL2
	0gvYmVmBw4JDeLEC7csD9CA3pZ7TzRJoD8/PE7v4mqLhOuwDiHnodz2Uyj9xsBn5
	IspWp35wpvwXBqsFy+WXw==
X-ME-Sender: <xms:OgW7aUfeg6UvzkGKtIOGJTt27ztIeemNSvT37WJ_v4PQZvWuTlVUsg>
    <xme:OgW7aT4nuenjpKd4j3Y1VXZ6EEh6xv7sti1lwOLR4dg6J1Rvn2B6IV2etkwnQ49Lm
    TTEMNoqGFGpXB3_99xrCPvloaKO37T5JAnYu5Zf0U65CZSoDaGd>
X-ME-Received: <xmr:OgW7af__mo6rtsp0o3KczMBC_sXEMV_lestW9V8SU8ZcFgzOjExv7D5Wt80>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdehtdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpeetlhgvgicu
    hghilhhlihgrmhhsohhnuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvkeefjeekvdduhfduhfetkedugfduieettedvueekvdehtedvkefgudeg
    veeuueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grlhgvgiesshhhrgiisghothdrohhrghdpnhgspghrtghpthhtohepvddtpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehmrghtthgvvhesmhgvthgrrdgtohhmpdhrtghpth
    htoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjghhgsehnvhhiughi
    rgdrtghomhdprhgtphhtthhopegrmhgrshhtrhhosehfsgdrtghomhdprhgtphhtthhope
    hmnhhghigruggrmhesrghmrgiiohhnrdguvgdprhgtphhtthhopegumhgrthhlrggtkhes
    ghhoohhglhgvrdgtohhmpdhrtghpthhtohepsghjohhrnheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphht
    thhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomh
X-ME-Proxy: <xmx:OgW7aSI73CTO08RyUJKUTdubyyQgmlkEk4puDfo__A_1XVuYHSQT7A>
    <xmx:OgW7aahtTFjR_GzD4dyDLzRSUgvKLdKpVbShMcROrIaACCfEoL_IIA>
    <xmx:OgW7aT2uqYgJIpVJsK-XHQaQZFtJwanBnAqK0Yrn1pK02A-hgaItig>
    <xmx:OgW7aTav18azqWdsN31N3Kjj3f3_rjREyLfgvbmCBPuQsfcLQfgPKA>
    <xmx:OwW7aUc1vmlfyLnnVi2EgNk9kAPuTgcc7o3SgA1Hc4lYpdFoKmehYbdq>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 16:04:09 -0400 (EDT)
Date: Wed, 18 Mar 2026 14:04:08 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <mattev@meta.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Pranjal
 Shrivastava <praan@google.com>, Alistair Popple <apopple@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>, alex@shazbot.org
Subject: Re: [RFC v2 PATCH 04/10] vfio/pci: Add a helper to create a DMABUF
 for a BAR-map VMA
Message-ID: <20260318140408.4677fff5@shazbot.org>
In-Reply-To: <20260312184613.3710705-5-mattev@meta.com>
References: <20260312184613.3710705-1-mattev@meta.com>
	<20260312184613.3710705-5-mattev@meta.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
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
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-56241-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim,shazbot.org:dkim,shazbot.org:mid]
X-Rspamd-Queue-Id: 99FFD2C2540
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 11:46:02 -0700
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
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 131 +++++++++++++++++++++--------
>  drivers/vfio/pci/vfio_pci_priv.h   |   4 +
>  2 files changed, 102 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 63140528dbea..76db340ba592 100644
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
> @@ -182,6 +184,41 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
>  	return -EFAULT;
>  }
>  
> +static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
> +				  struct vfio_pci_dma_buf *priv, uint32_t flags,
> +				  size_t size, bool status_ok)
> +{
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +
> +	if (!vfio_device_try_get_registration(&vdev->vdev))
> +		return -ENODEV;
> +
> +	exp_info.ops = &vfio_pci_dmabuf_ops;
> +	exp_info.size = size;
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
> +	priv->revoked = !status_ok;

Testing __vfio_pci_memory_enabled() outside of memory_lock() is
invalid, so passing it as a parameter outside of the semaphore is
invalid.  @status_ok is stale here.

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
> @@ -300,7 +337,6 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  {
>  	struct vfio_device_feature_dma_buf get_dma_buf = {};
>  	struct vfio_region_dma_range *dma_ranges;
> -	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>  	struct vfio_pci_dma_buf *priv;
>  	size_t length;
>  	int ret;
> @@ -369,46 +405,20 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  	kfree(dma_ranges);
>  	dma_ranges = NULL;
>  
> -	if (!vfio_device_try_get_registration(&vdev->vdev)) {
> -		ret = -ENODEV;
> +	ret = vfio_pci_dmabuf_export(vdev, priv, get_dma_buf.open_flags,
> +				     priv->size,
> +				     __vfio_pci_memory_enabled(vdev));
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

Tested under memory_lock.  It was correct previously.

> -	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> -	dma_resv_unlock(priv->dmabuf->resv);
> -	up_write(&vdev->memory_lock);
> -
>  	/*
>  	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
>  	 * will be released.
>  	 */
>  	ret = dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
> -	if (ret < 0)
> -		goto err_dma_buf;
> -	return ret;
> +	if (ret >= 0)
> +		return ret;
>  
> -err_dma_buf:
>  	dma_buf_put(priv->dmabuf);
> -err_dev_put:
>  	vfio_device_put_registration(&vdev->vdev);
>  err_free_phys:
>  	kfree(priv->phys_vec);
> @@ -419,6 +429,61 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  	return ret;
>  }
>  
> +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
> +				   struct vm_area_struct *vma,
> +				   u64 phys_start,
> +				   u64 pgoff,
> +				   u64 req_len)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	const unsigned int nr_ranges = 1;
> +	int ret;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->phys_vec = kcalloc(nr_ranges, sizeof(*priv->phys_vec),
> +				 GFP_KERNEL);
> +	if (!priv->phys_vec) {
> +		ret = -ENOMEM;
> +		goto err_free_priv;
> +	}
> +
> +	priv->vdev = vdev;
> +	priv->nr_ranges = nr_ranges;
> +	priv->size = req_len;
> +	priv->phys_vec[0].paddr = phys_start + (pgoff << PAGE_SHIFT);
> +	priv->phys_vec[0].len = req_len;
> +
> +	/*
> +	 * Creates a DMABUF, adds it to vdev->dmabufs list for
> +	 * tracking (meaning cleanup or revocation will zap them), and
> +	 * registers with vfio_device:
> +	 */
> +	ret = vfio_pci_dmabuf_export(vdev, priv, O_CLOEXEC, priv->size, true);
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

AIUI, this affects what the user sees in /proc/<pid>/maps, right?
Previously a memory range could be clearly associated with a specific
vfio device, now, only for vfio-pci devices, I think the range is
associated to a nondescript dmabuf.  If so, is that an acceptable, user
visible, debugging friendly change (ex. lsof)?  Thanks,

Alex

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
> index 5cc8c85a2153..5fd3a6e00a0e 100644
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
> @@ -128,6 +129,9 @@ int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
>  			      unsigned long address,
>  			      unsigned int order,
>  			      unsigned long *out_pfn);
> +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
> +				   struct vm_area_struct *vma,
> +				   u64 phys_start, u64 pgoff, u64 req_len);
>  
>  #ifdef CONFIG_VFIO_PCI_DMABUF
>  int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,


