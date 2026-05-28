Return-Path: <linux-media+bounces-62988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKIvK7XMGGpjnggAu9opvQ
	(envelope-from <linux-media+bounces-62988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:16:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B435FB48C
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 01:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFC72301B1DB
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 23:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04E736BCC0;
	Thu, 28 May 2026 23:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="CD9S5p6R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BVDUI4wN"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19A30F924;
	Thu, 28 May 2026 23:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780010159; cv=none; b=iZmQWLzyrjiYPEIUcgOCogcy8NR5Hcw0rQrlgvdAy0dIDa2SJB6PgE6ev8Jn3wTfwkjI58AgDihSFfZjX0N4pMz5eSHODN8ApgHKPijSx1CaU+v2U8qkjTCS4T4lZuHYYd7/Wk3nGvQqEJ3fLUwFfuEBsrqMFy7sUR0h8tFJWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780010159; c=relaxed/simple;
	bh=fipbHEG23gB3z/Y9GcZ5ZOAWv1owL60PM8s4BS2Qohc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMTHMBjggCZ5BzGaQnvlw+ayAe4IZoqyWs2zm+WQRBfvtcA4OrZA7MmGna1nMVgssDjhgKS+6V0Da2BJkr6zpKlRsuqfqNKaEukW33JPTtixDM9mr0tCLazt0II/bvAIIa3nSSstLeKDmK4HRYkAXWHqk7V1h/DAuqOFiu++/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=CD9S5p6R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BVDUI4wN; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 8F0221D00116;
	Thu, 28 May 2026 19:15:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 28 May 2026 19:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780010154;
	 x=1780096554; bh=RBuQ+Y/Vd1jIVotoLPK7ZFW6yqihen5cll4yqbILIR0=; b=
	CD9S5p6RW24fiDddpeOUn52XwFe/fL/AKs0RU2jU1QPxL7zsePs8W7LDHg1++i1e
	HmmZAnY0+qE0uPvyFQhJ1WmqBdmFNs4MdlrcLyMfMTmnysI/BoMQjv+2Pgd0VRkB
	vYFOeEOqTDnCLQOfeEQCVDLzWUv2ixs4lzpZ/RmfnWKrb/i1P2WVBGI6vweeFSgr
	gPue2QYF33P1cfRbZ4rS3LjMbuBIQWQSsRSvqYIZstxPoIKNTmgDQYRxfyHYYmTU
	RgFmy3KuEgFlDOvzJz4kpB14FFkhKEEcrA+IOo1DC6x7krXmuNyW2BCtpZ5lrAR7
	gXUSLV38n+CdFZtqoCUPtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780010154; x=
	1780096554; bh=RBuQ+Y/Vd1jIVotoLPK7ZFW6yqihen5cll4yqbILIR0=; b=B
	VDUI4wNZMupjrSXlEY6kHYUQasMYFnelYurkDaNY7HjZNIIRr1lIi9n8c6eVOsRU
	tOtHgpgOOkDUa5iQooS0ONa0ryysLyXr/faUPI3ihXWRixcJp42GLnojEt3UecIQ
	899zVr4Krv/XQ7piqZHEq1bpHQOmKEgZXdI/qA9bYiPP3IRG+JxBQi5FdprDafFZ
	KNhACi37eFOtZp7MzURHTL+YCz07aTqvJ5h+APO+8SOTJ3tQsZYT75OdMDeGl/uF
	b7+uYKXu7eRPLltBlskuL1e+afovAYPXya4KHL6qpDQRiJvuhUCrSWPa9IQZlc8g
	C4Sb1NNSAb4dwkeWL6G9g==
X-ME-Sender: <xms:qcwYauPi5nPNiYT9dDY2WVXfEIWQ4rIIL5p8NEEakM9lPzgNfucNzQ>
    <xme:qcwYaopcDdko-H-rwFWO_42jb0Zu-7K6-e0jzVsT463SpnjOaZZEcC1geF94xCU1Z
    Yl6Bbuh1tRCrIqlvCJU1wJFKR7GJcRbiGFlhgzX_qrQ8vYwpZlhLAg>
X-ME-Received: <xmr:qcwYav-7VAOcnqV0Ng76sTFPNqe6g5EFKNTJRJFt3I1QdHPdp0MCeKwOFQI>
X-ME-Proxy-Cause: dmFkZTGz+mBxqcdcSaiyBeR8rvmck9bXPGtwV5plDToDIpYQf9qQyGC2YiXS4ygunX+Nmn
    FHaUbaUe6oG6Xhvtslza91zdB0vTV9sYjwwG7ioFYWSqdRy5UFCOtOnKGCpAf8Xiq+C8jl
    MCfAUKm4YFJheQ6KX/FU7wcXo8/7WG+eGoNGYM3lxed1EA9MZLGde5nABFZKc8PpnDuCjK
    8yRUcyr9f5WETtyMmyLHKi9h3s72aD9DKLi8sd9HlkiXHGl5zZDwko6aPUCz5E9SWNPjqM
    9uV7U86V8/u+dy/2CwCe9rkuZW8diOnv7DZhXA6UtTZNR/xZ6iXLlvo9tamquTmQd1rXek
    gMnIUXMr3XfCrG/pnwAoeAFcCMIiKASTJJtXaHBChLhXCRvESi39oMJo085QEzsZ3XDiAg
    EtizKUoYqwyrygY31XrE9gp8M/sdKSmiwF0XXe46D0kIDxFKC4Gf9NcsfdKPNaJWdA7WmV
    YFwWgk205ftiKu0rMHbTDjxEoQJ6zXrE0H4qqM9o5NAKh113L3/WcLHcyO9SzZFMo2Bqpf
    zt+fFAKb76ntNEc74GRQVHLo1GtLDbcfMQKZZotv2BPW3kNS5na+rSSDbSXmPgbelCZOVB
    RaYt7PqsoFW8vJ1KxejR2la3sqOCy4+YFE2nHBMJ6Kphea8+U1GuM6OjYeDA
X-ME-Proxy: <xmx:qcwYavpsOctdS0sPX6TiE-awxYjasDb86M7czOVathUw7uR-Auek4Q>
    <xmx:qcwYalhCkaoiiNu1nQROGrN6rehv0FuiJgOFfWq7quSr7XWhSYwzaQ>
    <xmx:qcwYalBgcAzEDQbGvEc9KSvTBbJjRX9fyQVf5cpt7wxVkSwHIyIWDg>
    <xmx:qcwYars06TrO_2c8z3YKP6cuIOcOLN-xfPURQWPo-wROJozChybm4Q>
    <xmx:qswYavRXkSlviFgMuq9U1tev_zOuuSyab6y-6bR0bOYHeF17Lc_0ZPyX>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 19:15:52 -0400 (EDT)
Date: Thu, 28 May 2026 17:15:33 -0600
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
Subject: Re: [PATCH v2 6/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <20260528171533.38f02054@shazbot.org>
In-Reply-To: <20260527102319.100128-7-mattev@meta.com>
References: <20260527102319.100128-1-mattev@meta.com>
	<20260527102319.100128-7-mattev@meta.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-62988-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,shazbot.org:mid,shazbot.org:dkim]
X-Rspamd-Queue-Id: B1B435FB48C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 03:23:09 -0700
Matt Evans <mattev@meta.com> wrote:

> Previously, vfio_pci_zap_bars() (and the wrapper
> vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
> calls of vfio_pci_dma_buf_move().
> 
> This commit replaces them a unified new function,
> vfio_pci_zap_revoke_bars() containing both the vfio_pci_dma_buf_move()
> and the unmap_mapping_range(), making it harder for callers to omit
> one.  It adds a wrapper, vfio_pci_lock_zap_revoke_bars(), which takes
> the write memory_lock before zapping, and adds a new
> vfio_pci_unrevoke_bars() for the re-enable path.
> 
> However, as of "vfio/pci: Convert BAR mmap() to use a DMABUF" the
> unmap_mapping_range() to zap is entirely redundant for plain vfio-pci,
> since the DMABUFs used for BAR mappings already zap PTEs when the
> vfio_pci_dma_buf_move() occurs.
> 
> One exception remains as a FIXME: in nvgrace-gpu, some BAR VMAs
> conditionally use custom vm_ops, which have not moved to be backed by
> DMABUFs.  If these BARs are mmap()ed, the vdev enables the existing
> behaviour of unmap_mapping_range() for the device fd address space.
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/nvgrace-gpu/main.c |  5 +++
>  drivers/vfio/pci/vfio_pci_config.c  | 30 ++++++-------
>  drivers/vfio/pci/vfio_pci_core.c    | 66 ++++++++++++++++++++---------
>  drivers/vfio/pci/vfio_pci_priv.h    |  3 +-
>  include/linux/vfio_pci_core.h       |  1 +
>  5 files changed, 66 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
> index 15e2f03c6cd4..cfa649200a7f 100644
> --- a/drivers/vfio/pci/nvgrace-gpu/main.c
> +++ b/drivers/vfio/pci/nvgrace-gpu/main.c
> @@ -364,6 +364,8 @@ static int nvgrace_gpu_mmap(struct vfio_device *core_vdev,
>  	struct nvgrace_gpu_pci_core_device *nvdev =
>  		container_of(core_vdev, struct nvgrace_gpu_pci_core_device,
>  			     core_device.vdev);
> +	struct vfio_pci_core_device *vdev =
> +		container_of(core_vdev, struct vfio_pci_core_device, vdev);
>  	struct mem_region *memregion;
>  	u64 req_len, pgoff, end;
>  	unsigned int index;
> @@ -374,6 +376,9 @@ static int nvgrace_gpu_mmap(struct vfio_device *core_vdev,
>  	if (!memregion)
>  		return vfio_pci_core_mmap(core_vdev, vma);
>  
> +	/* Non-DMABUF BAR mappings need an extra zap */
> +	vdev->bar_needs_zap = true;
> +

This works, but it's subtle, and failing to opt-in is dangerous.  The
name, to me, also suggests some transient state of the device rather
than an ongoing property.  What if we used "zap_bars_on_revoke" and
made vfio_pci_core_register_device() set this to true when:

	if (vdev->vdev.ops->mmap != vfio_pci_core_mmap)
		vdev->zap_bars_on_revoke = true;

That gives us automatic opt-in to the safe default.  The hisi_acc
driver .mmap is just a wrapper to vfio_pci_core_mmap(), so it could
manually opt-out:

	ret = vfio_pci_core_register_device(&hisi_acc_vdev->core_device);
	if (ret)
		return ret;

	/* mmaps are to the dmabuf, not the region */
	hisi_acc_vdev->core_device.zap_bars_on_revoke = false;

We can't have the opt-out in vfio_pci_core_mmap() as drivers like
nvgrace-gpu can use the core function for some BARs and their own
handling for others.  Thanks,

Alex

>  	/*
>  	 * Request to mmap the BAR. Map to the CPU accessible memory on the
>  	 * GPU using the memory information gathered from the system ACPI
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index a10ed733f0e3..8bfab0da481c 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -590,12 +590,10 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
>  		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
>  
> -		if (!new_mem) {
> -			vfio_pci_zap_and_down_write_memory_lock(vdev);
> -			vfio_pci_dma_buf_move(vdev, true);
> -		} else {
> +		if (!new_mem)
> +			vfio_pci_lock_zap_revoke_bars(vdev);
> +		else
>  			down_write(&vdev->memory_lock);
> -		}
>  
>  		/*
>  		 * If the user is writing mem/io enable (new_mem/io) and we
> @@ -631,7 +629,7 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>  		*virt_cmd |= cpu_to_le16(new_cmd & mask);
>  
>  		if (__vfio_pci_memory_enabled(vdev))
> -			vfio_pci_dma_buf_move(vdev, false);
> +			vfio_pci_unrevoke_bars(vdev);
>  		up_write(&vdev->memory_lock);
>  	}
>  
> @@ -712,16 +710,14 @@ static int __init init_pci_cap_basic_perm(struct perm_bits *perm)
>  static void vfio_lock_and_set_power_state(struct vfio_pci_core_device *vdev,
>  					  pci_power_t state)
>  {
> -	if (state >= PCI_D3hot) {
> -		vfio_pci_zap_and_down_write_memory_lock(vdev);
> -		vfio_pci_dma_buf_move(vdev, true);
> -	} else {
> +	if (state >= PCI_D3hot)
> +		vfio_pci_lock_zap_revoke_bars(vdev);
> +	else
>  		down_write(&vdev->memory_lock);
> -	}
>  
>  	vfio_pci_set_power_state(vdev, state);
>  	if (__vfio_pci_memory_enabled(vdev))
> -		vfio_pci_dma_buf_move(vdev, false);
> +		vfio_pci_unrevoke_bars(vdev);
>  	up_write(&vdev->memory_lock);
>  }
>  
> @@ -908,11 +904,10 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
>  						 &cap);
>  
>  		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
> -			vfio_pci_zap_and_down_write_memory_lock(vdev);
> -			vfio_pci_dma_buf_move(vdev, true);
> +			vfio_pci_lock_zap_revoke_bars(vdev);
>  			pci_try_reset_function(vdev->pdev);
>  			if (__vfio_pci_memory_enabled(vdev))
> -				vfio_pci_dma_buf_move(vdev, false);
> +				vfio_pci_unrevoke_bars(vdev);
>  			up_write(&vdev->memory_lock);
>  		}
>  	}
> @@ -993,11 +988,10 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
>  						&cap);
>  
>  		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
> -			vfio_pci_zap_and_down_write_memory_lock(vdev);
> -			vfio_pci_dma_buf_move(vdev, true);
> +			vfio_pci_lock_zap_revoke_bars(vdev);
>  			pci_try_reset_function(vdev->pdev);
>  			if (__vfio_pci_memory_enabled(vdev))
> -				vfio_pci_dma_buf_move(vdev, false);
> +				vfio_pci_unrevoke_bars(vdev);
>  			up_write(&vdev->memory_lock);
>  		}
>  	}
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index c5f934905ce0..cfea59806a4f 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -319,8 +319,7 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
>  	 * The vdev power related flags are protected with 'memory_lock'
>  	 * semaphore.
>  	 */
> -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> -	vfio_pci_dma_buf_move(vdev, true);
> +	vfio_pci_lock_zap_revoke_bars(vdev);
>  
>  	if (vdev->pm_runtime_engaged) {
>  		up_write(&vdev->memory_lock);
> @@ -406,7 +405,7 @@ static void vfio_pci_runtime_pm_exit(struct vfio_pci_core_device *vdev)
>  	down_write(&vdev->memory_lock);
>  	__vfio_pci_runtime_pm_exit(vdev);
>  	if (__vfio_pci_memory_enabled(vdev))
> -		vfio_pci_dma_buf_move(vdev, false);
> +		vfio_pci_unrevoke_bars(vdev);
>  	up_write(&vdev->memory_lock);
>  }
>  
> @@ -1256,6 +1255,8 @@ static int vfio_pci_ioctl_set_irqs(struct vfio_pci_core_device *vdev,
>  	return ret;
>  }
>  
> +static void vfio_pci_zap_revoke_bars(struct vfio_pci_core_device *vdev);
> +
>  static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>  				void __user *arg)
>  {
> @@ -1264,7 +1265,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>  	if (!vdev->reset_works)
>  		return -EINVAL;
>  
> -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> +	down_write(&vdev->memory_lock);
>  
>  	/*
>  	 * This function can be invoked while the power state is non-D0. If
> @@ -1277,10 +1278,11 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>  	 */
>  	vfio_pci_set_power_state(vdev, PCI_D0);
>  
> -	vfio_pci_dma_buf_move(vdev, true);
> +	vfio_pci_zap_revoke_bars(vdev);
> +
>  	ret = pci_try_reset_function(vdev->pdev);
>  	if (__vfio_pci_memory_enabled(vdev))
> -		vfio_pci_dma_buf_move(vdev, false);
> +		vfio_pci_unrevoke_bars(vdev);
>  	up_write(&vdev->memory_lock);
>  
>  	return ret;
> @@ -1648,20 +1650,44 @@ ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *bu
>  }
>  EXPORT_SYMBOL_GPL(vfio_pci_core_write);
>  
> -static void vfio_pci_zap_bars(struct vfio_pci_core_device *vdev)
> +static void vfio_pci_zap_revoke_bars(struct vfio_pci_core_device *vdev)
>  {
> -	struct vfio_device *core_vdev = &vdev->vdev;
> -	loff_t start = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_BAR0_REGION_INDEX);
> -	loff_t end = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_ROM_REGION_INDEX);
> -	loff_t len = end - start;
> +	lockdep_assert_held_write(&vdev->memory_lock);
> +	vfio_pci_dma_buf_move(vdev, true);
>  
> -	unmap_mapping_range(core_vdev->inode->i_mapping, start, len, true);
> +	/*
> +	 * All VFIO PCI BARs are backed by DMABUFs, with the current
> +	 * exception of the nvgrace-gpu device which uses its own
> +	 * vm_ops for a subset of BARs.  For this, BAR mappings are
> +	 * still made in the vdev's address_space, and a zap is
> +	 * required.  The tracking is crude, and will (harmlessly)
> +	 * continue to zap if the special BAR is unmapped, but that
> +	 * behaviour isn't the common case.
> +	 *
> +	 * FIXME: This can go away if the special nvgrace-gpu mapping
> +	 * is converted to use DMABUF.
> +	 */
> +	if (vdev->bar_needs_zap) {
> +		struct vfio_device *core_vdev = &vdev->vdev;
> +		loff_t start = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_BAR0_REGION_INDEX);
> +		loff_t end = VFIO_PCI_INDEX_TO_OFFSET(VFIO_PCI_ROM_REGION_INDEX);
> +		loff_t len = end - start;
> +
> +		unmap_mapping_range(core_vdev->inode->i_mapping,
> +				    start, len, true);
> +	}
>  }
>  
> -void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev)
> +void vfio_pci_lock_zap_revoke_bars(struct vfio_pci_core_device *vdev)
>  {
>  	down_write(&vdev->memory_lock);
> -	vfio_pci_zap_bars(vdev);
> +	vfio_pci_zap_revoke_bars(vdev);
> +}
> +
> +void vfio_pci_unrevoke_bars(struct vfio_pci_core_device *vdev)
> +{
> +	lockdep_assert_held_write(&vdev->memory_lock);
> +	vfio_pci_dma_buf_move(vdev, false);
>  }
>  
>  u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev)
> @@ -2517,9 +2543,10 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  		}
>  
>  		/*
> -		 * Take the memory write lock for each device and zap BAR
> -		 * mappings to prevent the user accessing the device while in
> -		 * reset.  Locking multiple devices is prone to deadlock,
> +		 * Take the memory write lock for each device and
> +		 * zap/revoke BAR mappings to prevent the user (or
> +		 * peers) accessing the device while in reset.
> +		 * Locking multiple devices is prone to deadlock,
>  		 * runaway and unwind if we hit contention.
>  		 */
>  		if (!down_write_trylock(&vdev->memory_lock)) {
> @@ -2527,8 +2554,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  			break;
>  		}
>  
> -		vfio_pci_dma_buf_move(vdev, true);
> -		vfio_pci_zap_bars(vdev);
> +		vfio_pci_zap_revoke_bars(vdev);
>  	}
>  
>  	if (!list_entry_is_head(vdev,
> @@ -2558,7 +2584,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  	list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
>  					 vdev.dev_set_list) {
>  		if (vdev->vdev.open_count && __vfio_pci_memory_enabled(vdev))
> -			vfio_pci_dma_buf_move(vdev, false);
> +			vfio_pci_unrevoke_bars(vdev);
>  		up_write(&vdev->memory_lock);
>  	}
>  
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index d38e1b98b2e9..10833aabd7fb 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -83,7 +83,8 @@ void vfio_config_free(struct vfio_pci_core_device *vdev);
>  int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev,
>  			     pci_power_t state);
>  
> -void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev);
> +void vfio_pci_lock_zap_revoke_bars(struct vfio_pci_core_device *vdev);
> +void vfio_pci_unrevoke_bars(struct vfio_pci_core_device *vdev);
>  u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev);
>  void vfio_pci_memory_unlock_and_restore(struct vfio_pci_core_device *vdev,
>  					u16 cmd);
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index 7accd0eac457..e35e82c24c8c 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -127,6 +127,7 @@ struct vfio_pci_core_device {
>  	bool			needs_pm_restore:1;
>  	bool			pm_intx_masked:1;
>  	bool			pm_runtime_engaged:1;
> +	bool			bar_needs_zap:1;
>  	struct pci_saved_state	*pci_saved_state;
>  	struct pci_saved_state	*pm_save;
>  	int			ioeventfds_nr;


