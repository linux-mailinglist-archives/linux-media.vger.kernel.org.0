Return-Path: <linux-media+bounces-64919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BFYyJnIXMGpiNQUAu9opvQ
	(envelope-from <linux-media+bounces-64919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 17:17:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F21306878E7
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 17:17:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=iU1Q3Hi0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64919-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64919-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 146723121D2A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA0D401A23;
	Mon, 15 Jun 2026 15:13:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A23F485C;
	Mon, 15 Jun 2026 15:13:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536404; cv=none; b=N9wf9ZOpvvaXlwG2fBthgt7gT5rYWYvs9ofOILiXll2ltmGSaISPMrBfcVkoT6eA8bxUIHd8FR8swSRgPkjtGlTbEXn0MXqclqJpqNnKYzTB0K4LNx/pVsQIKCahvlurEfk1oE4S42KLU9ibJOeJRELhIJxdKbfWO34Vazq867E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536404; c=relaxed/simple;
	bh=IVDA14JID5GrsuPIRkb4UA19ZqrIEPlqSvGSkW3WVn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJXR55ZhnXLSmJ4nT4+lNfnuGQqnDJi0OB1x7JrrjUvBlONFQGy/mTBUM094O1nkBYXYGFaS7dfPiFBvkXcDjQcdcnnJ06ukT8fGCCVUjN53h9ttcBqHL+s6o/+0XaMGIXMDi9eJwbBrLqEupfmZBTEvMoFC3VS28POllh96Fgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=iU1Q3Hi0; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781536399;
	bh=sB+OirG5KrhR2vR3t+VdFJVo3h/KuAa/PUjv1+O/LKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iU1Q3Hi0D8Yqvdgog9QLLV8iEJIoAkKxZncuYUgr/CTC+BQe0cJt74hwThg1i0E5z
	 6eSbBJjX14mo4EP9301/4Tt6UHOjMwQK05CQca4E1cm946RnMD7YQyT2Zb50KFUk0a
	 3bEjmXEQjxBYICBhTYl38x9i0Fh4+lOiKMKGMwIE9PlygWeKhBJX5JdJ+ItHR9Q2jN
	 Zqi61Fo/pEI439x4KpyZsKj5EMucXCG55bt9o10F1l4LJLS6OK+89AUNOdndNPQe/X
	 ZJclrEjF36TPcPNWCeHSbB3YJ7KmXoHYuhXghoUvMxwuFBRakfKxYSP5YAJI4/aBZH
	 z6eGeR1/TELcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gfDCD1Z8Vz4wTb;
	Tue, 16 Jun 2026 01:13:11 +1000 (AEST)
Message-ID: <de0557aa-d38c-4666-b810-0d555fded8e7@ozlabs.org>
Date: Mon, 15 Jun 2026 16:13:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] vfio/pci: Provide a user-facing name for BAR
 mappings
Content-Language: en-GB
To: Pranjal Shrivastava <praan@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-6-matt@ozlabs.org> <aiwSVk4n9mCQEln2@google.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <aiwSVk4n9mCQEln2@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-64919-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F21306878E7

Hi Praan,

On 12/06/2026 15:06, Pranjal Shrivastava wrote:
> On Wed, Jun 10, 2026 at 04:43:19PM +0100, Matt Evans wrote:
>> Since converting BAR mmap()s to using DMABUFs, we lose the original
>> device path in /proc/<pid>/maps, lsof, etc.  Generate a debug-oriented
>> synthetic 'filename' based on the cdev, plus BDF, plus resource index.
>>
>> This applies only to BAR mappings via the VFIO device fd, as
>> explicitly-exported DMABUFs are named by userspace via the
>> DMA_BUF_SET_NAME ioctl.
>>
>> Signed-off-by: Matt Evans <matt@ozlabs.org>
>> ---
>>  drivers/vfio/pci/vfio_pci_dmabuf.c | 27 +++++++++++++++++++++++++--
>>  1 file changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index 2fd3629789bf..8f7f1b909b94 100644
>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> @@ -4,6 +4,7 @@
>>  #include <linux/dma-buf-mapping.h>
>>  #include <linux/pci-p2pdma.h>
>>  #include <linux/dma-resv.h>
>> +#include <uapi/linux/dma-buf.h>
>>  
>>  #include "vfio_pci_priv.h"
>>  
>> @@ -470,6 +471,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>  {
>>  	struct vfio_pci_dma_buf *priv;
>>  	unsigned long vma_pgoff = vma->vm_pgoff & (VFIO_PCI_OFFSET_MASK >> PAGE_SHIFT);
>> +	char *bufname;
>>  	int ret;
>>  
>>  	priv = kzalloc_obj(*priv);
>> @@ -482,6 +484,20 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>  		goto err_free_priv;
>>  	}
>>  
>> +	bufname = kzalloc(DMA_BUF_NAME_LEN, GFP_KERNEL);
>> +	if (!bufname) {
>> +		ret = -ENOMEM;
>> +		goto err_free_phys;
>> +	}
>> +
>> +	/*
>> +	 * Maximum size of the friendly debug name is
>> +	 * vfio1234567890:ffff:ff:3f.7/5 = 30, which fits within
>> +	 * DMA_BUF_NAME_LEN.
>> +	 */
>> +	snprintf(bufname, DMA_BUF_NAME_LEN, "%s:%s/%x",
>> +		 dev_name(&vdev->vdev.device), pci_name(vdev->pdev), res_index);
>> +
> 
> Nit: Could we instead use:
> 
> 	bufname = kasprintf(GFP_KERNEL, "%s:%s/%x",
> 	                    dev_name(&vdev->vdev.device), pci_name(vdev->pdev), res_index);
> 	if (!bufname)
> 	    ret = -ENOMEM;
> 	    [...]

That's a great suggestion, thank you.  Done.

>>  	/*
>>  	 * The DMABUF begins from the mmap()'s BAR offset, i.e. the
>>  	 * start of the VMA corresponds to byte 0 of the DMABUF and
>> @@ -500,7 +516,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>  	priv->provider = pcim_p2pdma_provider(vdev->pdev, res_index);
>>  	if (!priv->provider) {
>>  		ret = -EINVAL;
>> -		goto err_free_phys;
>> +		goto err_free_name;
>>  	}
>>  
>>  	priv->phys_vec[0].paddr = phys_start + ((u64)vma_pgoff << PAGE_SHIFT);
>> @@ -508,7 +524,7 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>  
>>  	ret = vfio_pci_dmabuf_export(vdev, priv, O_CLOEXEC | O_RDWR);
>>  	if (ret)
>> -		goto err_free_phys;
>> +		goto err_free_name;
>>  
>>  	/*
>>  	 * Ownership of the DMABUF file transfers to the VMA so that
>> @@ -523,8 +539,15 @@ int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>  	vma->vm_file = priv->dmabuf->file;
>>  	vma->vm_private_data = priv;
>>  
>> +	spin_lock(&priv->dmabuf->name_lock);
>> +	kfree(priv->dmabuf->name);
>> +	priv->dmabuf->name = bufname;
>> +	spin_unlock(&priv->dmabuf->name_lock);
>> +
>>  	return 0;
>>  
>> +err_free_name:
>> +	kfree(bufname);
>>  err_free_phys:
>>  	kfree(priv->phys_vec);
>>  err_free_priv:
> 
> Apart from that,
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks!

Matt

