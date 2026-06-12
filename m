Return-Path: <linux-media+bounces-64730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rOsbDaRgLGqaQAQAu9opvQ
	(envelope-from <linux-media+bounces-64730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:40:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C0467C1B1
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:40:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=JWDzio3i;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64730-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64730-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3DB632F442A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420E8375F96;
	Fri, 12 Jun 2026 19:39:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C65368D5B
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:39:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293168; cv=none; b=PMIQ3p78wM7+nY7ZF8A3nmnyQgHIBh+RpIeYDK/2fTPMchwjfDYLm8TtcIoaHYwFvH1GZDfEll6BN2e43Qty0aN3P9hBsL1DFVMJXMPyJa5hhDPel5UxMb7eaS42q6u1MBwjxSuZo3gbX2qtAa29zxA/ShiFg37rqWXkYV+hUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293168; c=relaxed/simple;
	bh=rSgh5DEmzOlsxgEt+jpYxiGLFfp04B5K+fyf1Dp3QZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2g32xFcQFOJ4Kspub1zZ+XFRtfvDXHFKwDn4by418PshVd8QLEF34viYAgv+pv4kGnS5glbm6K8ZvMoHNLmWPN5EMReUkWVyCRiUhNB8xl75vLon9lb7TqOVTm+uITkTd331q4tz7sXBqEvodcXGNbpctLFwQ0eL3PXtRF15cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JWDzio3i; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0b1a48855so17825ad.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 12:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781293166; x=1781897966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7hmvmA/ZOPAMkxJPFMHlsykhA7hRG+rHWgxmIiSF5c=;
        b=JWDzio3iEhujEIlwxW3FOjAZbnAi+cJyvoynRaZHvR2+4pTd8/4mjW88FyOn9l7rBw
         IEjE+ok8nCBmokUeNGnj3ue/LGDbVl29/ySU/ru3BCZMBL29bhhorqjHyAkJQaUFlONJ
         pufxkCYUHEUAfaL0ojzr8Fj3JmC9rjcPClR0djP6YJh0qRpMt7s7UmmU/pbM2wWz5fP+
         u611Acmrl05N0i9RhdldTBoFMss0ovkIunXnazvjzDwnULuhjsTpQ9mJPXBJdOVolsxn
         MlVQc/OgqnUYYQltqdtOH14RlC0HHKEjd8GaPpt7DmKQTsSccPrl8pCt1by4kGn6oZ6t
         4OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293166; x=1781897966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7hmvmA/ZOPAMkxJPFMHlsykhA7hRG+rHWgxmIiSF5c=;
        b=jMXq2sTAgGU1VTbQ0KfpAF2tgiBzVVlkFzjG74Y4xQ620k1DmmUqDmywMvaxn2nzMt
         Sd1JOHXpLIDhicbF38l0OQGqDMoi6AmsjtukgVpOrj+fdA9IGwi75UGJWkzgYvpEjArM
         d5IpxT2MpLp4kE7o2v5Tc0Pgci7tyLL7wAIFFd7F3CEmLw0snc1LrgIHwEMmbjIxSz9/
         clwCQKyjMK6EUg2K3uQeS6g6s+gfE6GEOBbHDdTiDsP1gJgbw/CLd9yx5Yh+uE2PAoG2
         j+9Rht1yuQojhlwsOfphRdqtJ7qGNQbQkSXI/e9natvds8HPY8ACXZVGL6GjlUHnI6IB
         g0Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/BphgZIDcu6G5onRJlQUBwM5RrVD6BPvumiP9KI9Iv18W96y6/n+6IPnWonEcCs/5y/LaO2LyzlnwHSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wqKWZN8IKJ1xU98kiAJ8YVL747GbjUTyLFHfSXiEDbwkabxC
	1IP7l58nmCUFGud3MK+aR5hTcE50iKDU9cdbgIU0fUaBL7yyoUKVKYo+zcymvwQpZA==
X-Gm-Gg: Acq92OHcSypDNw4PN51x+AlSIUP+j5TJgNbnaQvGB33ygCKRkYBxdzpVqPr0jKCiVgK
	hclvgxnmSdXspHDi3IWGfa42YHCMdGtXyfxVUNeTaSbAs0ksUWhmnb/ASZnCtQlmQBkqBbT7dux
	6MyKBBThnMQSkvrv9i8odH2cKvfzODTztdxyH08oVDI80dNiYoy0C/8XTWzG+4Gx7HnFQ0q6jBc
	cpaqosi9ACWteYNRF5vpzaeRIC/iGIiHFnalP8GszqgIMijwKTMplOvjgEK7BCZtyO7lrhjEUYo
	W6pMswoULiZjcIcpMStDeq4D3CnwBP8p121ssjoHyyymVg6BGPMCvodSX6Oozyz8gOSuUruePu5
	sjIigZgaoGBpXXwFobWHN3Ootv0fq/N09bIup96NF+eY4ixpnTKlgMjun137K7Fqw2VyPZjBUwF
	g+i9W5vMKg+4pudEsvHzFAbV88jlq8zQWmJrBbLzj6fcL4OmR118xj9Gn1IS65
X-Received: by 2002:a17:903:2d0:b0:2c1:ee6e:be1d with SMTP id d9443c01a7336-2c665ec6cc3mr4015ad.27.1781293165632;
        Fri, 12 Jun 2026 12:39:25 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd66fsm3628185a91.12.2026.06.12.12.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:39:24 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:39:17 +0000
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
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <aixgZQiBQKgS7yIM@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-7-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64730-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ozlabs.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81C0467C1B1

On Wed, Jun 10, 2026 at 04:43:20PM +0100, Matt Evans wrote:
> Previously, vfio_pci_zap_bars() (and the wrapper
> vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
> calls to vfio_pci_dma_buf_move().
> 
> This commit replaces them with a unified new function,
> vfio_pci_zap_revoke_bars() containing both the vfio_pci_dma_buf_move()
> and the unmap_mapping_range(), making it harder for callers to omit
> one.  It adds a wrapper, vfio_pci_lock_zap_revoke_bars(), which takes
> the write memory_lock before zapping, and adds a new
> vfio_pci_unrevoke_bars() for the re-enable path.
> 
> As of "vfio/pci: Convert BAR mmap() to use a DMABUF", the
> unmap_mapping_range() to zap is no longer performed for vfio-pci since
> the DMABUFs used for BAR mappings already zap PTEs when the
> vfio_pci_dma_buf_move() occurs.
> 
> However, it must be assumed that VFIO drivers which override the .mmap
> op could create mappings _not_ backed by DMABUFs.  So, the zap is
> still performed on revoke if .mmap is overridden, using a new
> zap_bars_on_revoke flag.  A driver can explicitly opt out; the flag is
> cleared by the hisi_acc_vfio_pci driver, since its .mmap just wraps
> vfio_pci_core_mmap() and so still uses DMABUFs.
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  8 +++
>  drivers/vfio/pci/vfio_pci_config.c            | 30 ++++----
>  drivers/vfio/pci/vfio_pci_core.c              | 70 +++++++++++++------
>  drivers/vfio/pci/vfio_pci_priv.h              |  3 +-
>  include/linux/vfio_pci_core.h                 |  1 +
>  5 files changed, 73 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> index 86362ec424a5..51990f6d66d5 100644
> --- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> +++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> @@ -1692,6 +1692,14 @@ static int hisi_acc_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device
>  	if (ret)
>  		goto out_put_vdev;
>  
> +	/*
> +	 * hisi_acc_vfio_pci_mmap() calls down to
> +	 * vfio_pci_core_mmap(), so BAR mappings are still
> +	 * DMABUF-backed.  They don't require a zap on revoke, so opt
> +	 * out:
> +	 */
> +	hisi_acc_vdev->core_device.zap_bars_on_revoke = false;
> +

This seems to be happening after we vfio_pci_core_register_device, which
could be slightly problematic if another device in the same group races 
to trigger a hot reset before we can set this to false. Could we 
initialize this flag before registration instead?

>  	hisi_acc_vfio_debug_init(hisi_acc_vdev);
>  	return 0;
>  
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
> index f9636d8f9e2a..5ea0bd4e7876 100644
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

I'm wondering if this change in behavior is correct?
BEFORE this patch the sequence was:

1. zap vma mappings
2. Enter D0

After this patch the sequence becomes

1. Take the lock
2. Enter D0
3. zap vma mappings

My worry is if user-space accesses a BAR *during* the transition to D0,
it could crash since the mappings still exist during the transition?

The old code is immune to it because it removed user-mappings first.

Following the discussion from v1 regarding the ordering of 
vfio_pci_dma_buf_move() and the D0 transition.. while it makes sense to
perform the DMABUF revocation/move after the hardware is in D0.. I'm not
too confident about moving zap after D0 :/ 

I mean, sure, the user would just see all Fs on a read and writes will
be dropped silently until we are in D0.. but the behaviour before this
change was that the user access will fault and hang on the memory_lock 
instead which ensures that the user observes a consistent dev state..

> +
>  	ret = pci_try_reset_function(vdev->pdev);
>  	if (__vfio_pci_memory_enabled(vdev))
> -		vfio_pci_dma_buf_move(vdev, false);
> +		vfio_pci_unrevoke_bars(vdev);
>  	up_write(&vdev->memory_lock);
>  
>  	return ret;
> @@ -1648,20 +1650,37 @@ ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *bu
>  }

Thanks,
Praan

