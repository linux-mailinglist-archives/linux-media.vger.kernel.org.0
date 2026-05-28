Return-Path: <linux-media+bounces-62991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHSsAHDNGGpjnggAu9opvQ
	(envelope-from <linux-media+bounces-62991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:19:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432C5FB565
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D533A30B13DC
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4299536920D;
	Thu, 28 May 2026 23:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="ULExHR24";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cLW9CrQf"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F7B36F411;
	Thu, 28 May 2026 23:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780010168; cv=none; b=Rgw6rfPkRS5SfKzU3Unccssb3RUNq5ZNRIG8mb4qldXOrchMWrR+UAgZuGfUBaNgfN3ia4RfA8E7X1+2ssogwKhDqrRhLxs1fCy65rNTCBvySdfuhaf8kSUamChu6idy4aYa/a9MFtF7J6MnEfvFHtgBuZeoSDTqmvgPwpBWSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780010168; c=relaxed/simple;
	bh=2wo48nfwqvz1WxMzUBkcw2TC9fwWvlhXZzoFLkOb/Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nd8uaurZE1M9US07KDcSC/TBCbml5Fm6GCgZ2xTJcWi0d5pFJ9DMoO44L+mvI6s/WKDPzeks4EDZ1smRFqi6g2MrYzxc+fZzFstYWgfE25Z0wuANve5bvQikUAKdgnftINiGQXj6ZliauwC7R/6zCmfTVqqlb1EkQ+eWnkIoX/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=ULExHR24; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cLW9CrQf; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 898077A00C3;
	Thu, 28 May 2026 19:16:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 28 May 2026 19:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780010163;
	 x=1780096563; bh=0avyLy7kwCyKk2DtNAHb/3Ps4004TQje4fLolyCctqA=; b=
	ULExHR24Uo1+eLcaXpEDEhSYKPGYJtI8zstS7G16DaKn8FGyDJTZ61uCwc5Gcg2X
	9Sgs0nXVfuvdfxwaQ0L/pbFcUcXlfi3er7tDaLT/S2B0TXdzW7PJSm4ybyBMyPf4
	qo23trcTtxkr4LRDgZy8nU746isteTf/qXBWxA31nZ7QSoxM4f7Vs9Tn6Mx9wiM+
	By32cs8v1q2O0to3F4uawFk4gwQjwuiXfmuMXpfxLWUOlBKhU8VaCO22QLQ7xZDh
	9pm5AsfBrn2PbUwvw+kbq4LDk8xYg88ajwNMhq2TZGKidXBFJ2rHYqGbB7OuWFat
	QozxoWiTW30CewrlBx2UUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780010163; x=
	1780096563; bh=0avyLy7kwCyKk2DtNAHb/3Ps4004TQje4fLolyCctqA=; b=c
	LW9CrQf9/xOwg5gssJRLoXEHIjTueQaI0GztV1k+SVFTKWB9XQ9XFKu7H5blA6+k
	kZwJPliM2c4xOfWzeQMYsmDMEJwRXyq7Y1oMZTYidttnSNmy7rbWqI8Dh2XOXLVg
	y67SlhoVrBkvEdIacTehh0PleO6pC+FMuSz/48cRzsdRzM7b+nUULnPIUnUY6czv
	H5fDr6ATMoI+AxJwHiEvvNh2GFJO8UfrpclmCAdA1wchf4sNAZV5zvqo+ohBMnkm
	qyxQSAV1C1y3gtiyPMMn8MCtmf27RNjAPDxw4xLOTxo1lbxeobtbstlaHd9BMGtw
	fOxZCLaG8hW0+UMLyPCig==
X-ME-Sender: <xms:s8wYahSSaf2xeyubfDiIAlafa-7UQ46TixbSlebSuGlv7MfDIWM0hg>
    <xme:s8wYamf6Q85qDuOsdZwm5618zk1U3THmL7KKezUlOVnn6tW9eYnztwWRZ0Gh5qUXe
    qD7f4Dj9dMnbqv6oDADi1YUutt6PkNjEsBSEEgP3ekHte8KmGw->
X-ME-Received: <xmr:s8wYahiBJquXovM2MwTwsz7Y_dqpabVTYUca3qUDpQqVM9KGlMb5_-GSPjk>
X-ME-Proxy-Cause: dmFkZTGz+mBxqcdcSaiyBeR8rvmck9bXPGtwV5plDToDIpYQf9qQyGC2YiXS4ygunX+Nmn
    FHaUbaUe6oG6Xhvtslza91zdB0vTV9sYjwwG7ioFYWSqdRy5UFCOtOnKGCpAf8Xiq+C8jl
    MCfAUKm4YFJheQ6KX/FU7wcXo8/7WG+eGoNGYM3lxed1EA9MZLGde5nABFZKc8PpnDuCjK
    8yRUcyr9f5WETtyMmyLHKi9h3s72aD9DKLi8sd9HlkiXHGl5zZDwko6aPUCz5E9SWNPjqM
    9uV7U86V8/u+dy/2CwCe9rkuZW8diOnv7DZhXA6UtTZNR/xZ6iXLlvo9tamquTmQd1rXm3
    hLIZ2crgdGf7YUYn4LgNjw9HiZQ/kEEew/rhFzIGPQcp3QwRpxeOzhxu/1bsyG+CMVo3JH
    UrE+g+ZoV8w53c7YPtoxgpDU+onZIBfoFyn2oW68Gb6W19Z9k9Q2Gkmz06DTOGltE3+RvQ
    TJPJ90kOZpKuQ3gX5m3WMp9TMiDnLBWvtPLM/nvERk2egL/DG5R8K8C8X46Y5PpblRtXrE
    eo2a/UQtpJa1HmsibdXVeOHfJIgyIckxgXjUEE7Hxt/vaP0TnqaPzH1xi3ORBo9bTm+1ll
    +j0Y/o0/YUT/u8j56GF62gcKj9hp2MMI41t3WhD/oCeZZaZKWfJKcwy43Thw
X-ME-Proxy: <xmx:s8wYap_OqhccregYVSDsebss7xlkgbvw3L7RjA0iIZS5CuWXzeAjaQ>
    <xmx:s8wYapkTri4R7s3GsmDvg4oBK4xixSYdYxjFB0pD-bDNO0k8Hg4gfg>
    <xmx:s8wYav3eoXaNKuWuxcXTGbOD3rtU1L4QTnSLCdeIMRRwPtyVIelwfQ>
    <xmx:s8wYamSSR7dVo2_OWpSko4wtYCokmfhH1X8U0WAcGvOPIl-CQnqGVw>
    <xmx:s8wYalUL8Y5V767RSNIpfjQe_txv8YCWusHL1qnVKE1f-9kTOPZqgZ64>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 19:16:01 -0400 (EDT)
Date: Thu, 28 May 2026 17:15:44 -0600
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
Subject: Re: [PATCH v2 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Message-ID: <20260528171544.3d8db4a2@shazbot.org>
In-Reply-To: <20260527102319.100128-5-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-5-mattev@meta.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-62991-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shazbot.org:mid,shazbot.org:dkim,meta.com:email,messagingengine.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7432C5FB565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 03:23:07 -0700
Matt Evans <mattev@meta.com> wrote:

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
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/Kconfig           |  4 +-
>  drivers/vfio/pci/Makefile          |  3 +-
>  drivers/vfio/pci/vfio_pci_core.c   | 79 +++++++++++++++++++-----------
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 12 +++++
>  drivers/vfio/pci/vfio_pci_priv.h   | 11 +----
>  5 files changed, 68 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 296bf01e185e..9197343a7301 100644
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
> @@ -56,7 +58,7 @@ config VFIO_PCI_ZDEV_KVM
>  	  To enable s390x KVM vfio-pci extensions, say Y.
>  
>  config VFIO_PCI_DMABUF
> -	def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
> +	def_bool y if PCI_P2PDMA

This largely only breaks consistency, but should VFIO_PCI_CORE become a
'depends on' rather than dropped entirely?

>  
>  source "drivers/vfio/pci/mlx5/Kconfig"
>  
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index 6138f1bf241d..881452ea89be 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -1,8 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
> +vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o vfio_pci_dmabuf.o
>  vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
> -vfio-pci-core-$(CONFIG_VFIO_PCI_DMABUF) += vfio_pci_dmabuf.o
>  obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
>  
>  vfio-pci-y := vfio_pci.o
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 041243a84d81..c5f934905ce0 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1683,18 +1683,6 @@ void vfio_pci_memory_unlock_and_restore(struct vfio_pci_core_device *vdev, u16 c
>  	up_write(&vdev->memory_lock);
>  }
>  
> -static unsigned long vma_to_pfn(struct vm_area_struct *vma)
> -{
> -	struct vfio_pci_core_device *vdev = vma->vm_private_data;
> -	int index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
> -	u64 pgoff;
> -
> -	pgoff = vma->vm_pgoff &
> -		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
> -
> -	return (pci_resource_start(vdev->pdev, index) >> PAGE_SHIFT) + pgoff;
> -}
> -
>  vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
>  				   struct vm_fault *vmf,
>  				   unsigned long pfn,
> @@ -1722,23 +1710,42 @@ static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
>  					   unsigned int order)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
> -	struct vfio_pci_core_device *vdev = vma->vm_private_data;
> -	unsigned long addr = vmf->address & ~((PAGE_SIZE << order) - 1);
> -	unsigned long pgoff = (addr - vma->vm_start) >> PAGE_SHIFT;
> -	unsigned long pfn = vma_to_pfn(vma) + pgoff;
> -	vm_fault_t ret = VM_FAULT_FALLBACK;
> -
> -	if (is_aligned_for_order(vma, addr, pfn, order)) {
> -		scoped_guard(rwsem_read, &vdev->memory_lock)
> -			ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
> -	}
> +	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
> +	struct vfio_pci_core_device *vdev;
> +	unsigned long pfn = 0;
> +	vm_fault_t ret = VM_FAULT_SIGBUS;
>  
> -	dev_dbg_ratelimited(&vdev->pdev->dev,
> -			   "%s(,order = %d) BAR %ld page offset 0x%lx: 0x%x\n",
> -			    __func__, order,
> -			    vma->vm_pgoff >>
> -				(VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT),
> -			    pgoff, (unsigned int)ret);
> +	/*
> +	 * We can rely on the existence of both a DMABUF (priv) and
> +	 * the VFIO device it was exported from (vdev).  This fault's
> +	 * VMA was established using vfio_pci_core_mmap_prep_dmabuf()
> +	 * which transfers ownership of the VFIO device fd to the
> +	 * DMABUF, and so the VFIO device is held open because the
> +	 * VMA's vm_file (DMABUF) is open.
> +	 *
> +	 * Since vfio_pci_dma_buf_cleanup() cannot have happened,
> +	 * vdev must be valid; we can take memory_lock.
> +	 */
> +	vdev = READ_ONCE(priv->vdev);

The above comment argues that vdev is stable, so why do we need to
access it with READ_ONCE()?

> +
> +	scoped_guard(rwsem_read, &vdev->memory_lock) {
> +		if (!priv->revoked) {
> +			int pres = vfio_pci_dma_buf_find_pfn(priv, vma,
> +							     vmf->address,
> +							     order, &pfn);
> +
> +			if (pres == 0)
> +				ret = vfio_pci_vmf_insert_pfn(vdev, vmf,
> +							      pfn, order);
> +			else if (pres == -EAGAIN)
> +				ret = VM_FAULT_FALLBACK;
> +		}
> +
> +		dev_dbg_ratelimited(&vdev->pdev->dev,
> +				    "%s(order = %d) PFN 0x%lx, VA 0x%lx, pgoff 0x%lx: 0x%x\n",
> +				    __func__, order, pfn, vmf->address,
> +				    vma->vm_pgoff, (unsigned int)ret);

Looks like this should still be outside the scope of the memory_lock.
Thanks,

Alex

> +	}
>  
>  	return ret;
>  }
> @@ -1763,6 +1770,7 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
>  	unsigned int index;
>  	u64 phys_len, req_len, pgoff, req_start;
>  	void __iomem *bar_io;
> +	int ret;
>  
>  	index = vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
>  
> @@ -1802,7 +1810,20 @@ int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma
>  	if (IS_ERR(bar_io))
>  		return PTR_ERR(bar_io);
>  
> -	vma->vm_private_data = vdev;
> +	/*
> +	 * Create a DMABUF with a single range corresponding to this
> +	 * mapping, and wire it into vma->vm_private_data.  The VMA's
> +	 * vm_file becomes that of the DMABUF, and the DMABUF takes
> +	 * ownership of the VFIO device file (put upon DMABUF
> +	 * release).  This maintains the behaviour of a live VMA
> +	 * mapping holding the VFIO device file open.
> +	 */
> +	ret = vfio_pci_core_mmap_prep_dmabuf(vdev, vma,
> +					     pci_resource_start(pdev, index),
> +					     req_len, index);
> +	if (ret)
> +		return ret;
> +
>  	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>  
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 782408c08a5e..f7797f58d44b 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -9,6 +9,7 @@
>  
>  MODULE_IMPORT_NS("DMA_BUF");
>  
> +#ifdef CONFIG_VFIO_PCI_DMABUF
>  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  				   struct dma_buf_attachment *attachment)
>  {
> @@ -25,6 +26,7 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  
>  	return 0;
>  }
> +#endif /* CONFIG_VFIO_PCI_DMABUF */
>  
>  static void vfio_pci_dma_buf_done(struct kref *kref)
>  {
> @@ -89,7 +91,9 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>  }
>  
>  static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> +#ifdef CONFIG_VFIO_PCI_DMABUF
>  	.attach = vfio_pci_dma_buf_attach,
> +#endif
>  	.map_dma_buf = vfio_pci_dma_buf_map,
>  	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
>  	.release = vfio_pci_dma_buf_release,
> @@ -263,6 +267,7 @@ static int vfio_pci_dmabuf_export(struct vfio_pci_core_device *vdev,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_VFIO_PCI_DMABUF
>  /*
>   * This is a temporary "private interconnect" between VFIO DMABUF and iommufd.
>   * It allows the two co-operating drivers to exchange the physical address of
> @@ -461,6 +466,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  	kfree(dma_ranges);
>  	return ret;
>  }
> +#endif /* CONFIG_VFIO_PCI_DMABUF */
>  
>  int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  				   struct vm_area_struct *vma,
> @@ -535,6 +541,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  	struct vfio_pci_dma_buf *tmp;
>  
>  	lockdep_assert_held_write(&vdev->memory_lock);
> +	/*
> +	 * Holding memory_lock ensures a racing VMA fault observes
> +	 * priv->revoked properly.
> +	 */
>  
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>  		if (!get_file_active(&priv->dmabuf->file))
> @@ -552,6 +562,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>  			if (revoked) {
>  				kref_put(&priv->kref, vfio_pci_dma_buf_done);
>  				wait_for_completion(&priv->comp);
> +				unmap_mapping_range(priv->dmabuf->file->f_mapping,
> +						    0, priv->size, 1);
>  				/*
>  				 * Re-arm the registered kref reference and the
>  				 * completion so the post-revoke state matches the
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index 06dc0fd3e230..d38e1b98b2e9 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -138,13 +138,13 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>  				   struct vm_area_struct *vma,
>  				   u64 phys_start, u64 req_len,
>  				   unsigned int res_index);
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
>  
>  #ifdef CONFIG_VFIO_PCI_DMABUF
>  int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  				  struct vfio_device_feature_dma_buf __user *arg,
>  				  size_t argsz);
> -void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
> -void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
>  #else
>  static inline int
>  vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> @@ -153,13 +153,6 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
>  {
>  	return -ENOTTY;
>  }
> -static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> -{
> -}
> -static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
> -					 bool revoked)
> -{
> -}
>  #endif
>  
>  #endif


