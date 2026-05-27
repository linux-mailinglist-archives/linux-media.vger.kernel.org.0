Return-Path: <linux-media+bounces-62913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NEvOB0ZF2pR4QcAu9opvQ
	(envelope-from <linux-media+bounces-62913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 18:17:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA9C5E79C7
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 18:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31BC03088742
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5BB423161;
	Wed, 27 May 2026 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="hKKQDdIr"
X-Original-To: linux-media@vger.kernel.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8723815FB;
	Wed, 27 May 2026 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898061; cv=none; b=Jclq9EhH36VUVFMa7YmU+zTF0gd3mDhQGHjRTOLVBVtr4VZd2hwMs+uhnI+HkfRSpChV1jI0EMwLAC+yE6Ob2w/WZ3LbBLqx7TMcVNVNKne8+yqZ93L8p5VRI30pL/5FaIlnouBaUK8Z/XBVDjed/26MWARZtkm2FdeGITamURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898061; c=relaxed/simple;
	bh=vldW0y+z4LN7l1LrKmQGTYsiBU6VTtN37aU9t23LL0Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=Gl/yMyD+mqsCHsKFbGE3l1AhQcIblUE1ZcEyXzWMrS4L57ICzDkZ4cwxVR7llFlS7TZSdqMdzAVoInfIWDTvJm1KE74M3tXq6Qpan8vE3ERor3FUUVoTHkK3P0eUU0WNMbz5p0WIcNK+Ucl/EP08ElVegoJwIQky3Jgphi7cqEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=hKKQDdIr; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=qGgbZA7gj3eEje/Kt3h0lR6kJ8rSI8Qm0mNt/KdiiAg=; b=hKKQDdIrR+jWwnj24G+ln2wtbI
	dqLuifKrJ1IXNelOU+BQve3+wXU3dNpcHAqIpwfFWbRuzpdMBbEoZEURfIlX3FyOZbDB0V6U2zy0F
	tGJiCdbanctZEtuWZEc6Ctk4z8ZY/m6I58gtn1PuvZolrRTGKRZm57hzhNjrGR5XyHwNAXbmyhjQc
	YxQdPm9C0dkk+aNXmXyJi1bGuIT5XS/9RVo5R5qwEiNZf12fPWzrOUCArdpSJYEDRGqxHeVyHTzla
	fSY3zJeaAzjwNg+t29KhK1Npb/Oa6Yl5CyzWl7nGKurmy3jhZ8GrWFQuMN9hWfvqoM+9p8sc85bSp
	gztv1aSA==;
Received: from d142-179-236-232.abhsia.telus.net ([142.179.236.232] helo=[192.168.11.155])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1wSGn0-00000001YTC-0svZ;
	Wed, 27 May 2026 10:07:26 -0600
Message-ID: <843e8525-5927-45b5-a3e2-a5ec16234398@deltatee.com>
Date: Wed, 27 May 2026 10:07:22 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matt Evans <mattev@meta.com>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260527102319.100128-1-mattev@meta.com>
 <20260527102319.100128-2-mattev@meta.com>
Content-Language: en-US
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20260527102319.100128-2-mattev@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 142.179.236.232
X-SA-Exim-Rcpt-To: mattev@meta.com, alex@shazbot.org, leon@kernel.org, jgg@nvidia.com, amastro@fb.com, christian.koenig@amd.com, bhelgaas@google.com, mngyadam@amazon.de, dmatlack@google.com, bjorn@kernel.org, sumit.semwal@linaro.org, kevin.tian@intel.com, ankita@nvidia.com, praan@google.com, apopple@nvidia.com, vivek.kasireddy@intel.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v2 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[deltatee.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[deltatee.com:s=20200525];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62913-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[deltatee.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[logang@deltatee.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[deltatee.com:email,deltatee.com:mid,deltatee.com:dkim,meta.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EDA9C5E79C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026-05-27 04:23, Matt Evans wrote:
> The P2PDMA code currently provides two features under the same
> CONFIG_PCI_P2PDMA option:
> 
>  1.  Locate providers via pcim_p2pdma_provider()
>  2.  Manage actual P2P DMA
> 
> Other code (such as vfio-pci) depends on 1, without having a hard
> dependency on 2.
> 
> A future commit expands the use of DMABUF in vfio-pci for non-P2P
> scenarios, relying on pcim_p2pdma_provider() always being present.  If
> that depended on CONFIG_PCI_P2PDMA, it would make vfio-pci only
> available if CONFIG_ZONE_DEVICE is present (e.g. 64-bit systems), even
> when P2P is not needed.
> 
> To resolve this, introduce CONFIG_PCI_P2PDMA_CORE which contains the
> basic provider functionality to make it available even if the
> CONFIG_PCI_P2PDMA feature is disabled or unavailable due to
> !CONFIG_ZONE_DEVICE.  Users such as vfio-pci can enable their own P2P
> features based off the original CONFIG_PCI_P2PDMA (available when
> CONFIG_ZONE_DEVICE is set).
> 
> Signed-off-by: Matt Evans <mattev@meta.com>

Largely this looks good to me. I have one minor nit below that you can
apply or not. Either way, feel free to add:

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>


>  static void pci_p2pdma_release(void *data)
>  {
>  	struct pci_dev *pdev = data;
> @@ -241,11 +251,13 @@ static void pci_p2pdma_release(void *data)
>  		synchronize_rcu();
>  	xa_destroy(&p2pdma->map_types);
>  
> +#ifdef CONFIG_PCI_P2PDMA
>  	if (!p2pdma->pool)
>  		return;
>  
>  	gen_pool_destroy(p2pdma->pool);
>  	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
> +#endif
>  }

I'm personally not a fan of adding #ifdefs inside functions like this.
This instance is small and easy to understand, but it can quickly become
a bit of a mess if we start adding more features. I probably would have
created a pci_p2pdma_release_pool() helper which does the inverse of
pci_p2pdma_setup_pool(), it would be called in pci_p2pdma_release() and
an empty implementation would be provided in the case where
CONFIG_PCI_P2PDMA is not set.

Logan

