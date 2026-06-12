Return-Path: <linux-media+bounces-64708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TOGxNjokLGqdMAQAu9opvQ
	(envelope-from <linux-media+bounces-64708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:22:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E48B67A801
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=S9vZR5sU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64708-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64708-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CDD7300A303
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F327F36E48D;
	Fri, 12 Jun 2026 15:22:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE892F83A2;
	Fri, 12 Jun 2026 15:22:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781277746; cv=none; b=TKOO80ux4rrSLNplknUnPX/Sy74DyDyFlF1tnWApISuh3+436wWova4rdq7nIZ4q5SGiUcRQMK18RRQMOUs4xvEaaXKwPRxqSjLkrpjal10Z7NLORutlH1UnBTZGsKLcm3H9BGvL6nDigITxqwkxbjPUpK3565PpTRHu6xLaYVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781277746; c=relaxed/simple;
	bh=OLGGW/mO4NyqpOFwo5FddLlmOWWrbusRslyiE80EXi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9Vn1P77AW/trqaV1cXGbvOTRyM+xaj64oMJ7WCZ+9A2CNRdqqe5WEVNLS6fZuJt009hwWqOBQCNaRPWEIGXZzAXVhQJraPTA4iQtmxQ+wU1cb4tdjknN9HhDX7Mt09qdgDstvyGaSigqitXJiahc90w0gT1/oLs6LqLywGLWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=S9vZR5sU; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781277742;
	bh=Od++dpGQk45pUkopK+ZR30rQE6eOhAjb1TsY2NEMy5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S9vZR5sUkuLB9FEC8KRRIoqeN59IfE/XLJ4wsiGT0ob84ltCuLVL/5VCR4GkxjsA9
	 AZ7Qm3ed8W07n6LTQnUawPb2WBDh9qruLj1R9yvNjUnyHicBso/Eg6sOgX8jLjcDoF
	 WaJ/2LSRwLtX9QEr7TCt/MWGNql4/2d9kzUZ4gjqxnN4SeV7O5sxCjYEXosWCSzM/J
	 YvAXTaQxZwv7nGq9F+aHO9KeJDtNG+jAGdVUpkSWkW0bZFa7REtQaWrKTUyOEukesu
	 UesARyHOzLEiT7mbIYtKp4Cga+XLMzOPNpBmprhVOqR4SPs/DGci1Qup6z3iA9i6Qs
	 Su+eg8UsvZAPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gcNY35cPWz4xGp;
	Sat, 13 Jun 2026 01:22:14 +1000 (AEST)
Message-ID: <42cf4ad9-f094-4f94-88e6-6d2cb6eb6437@ozlabs.org>
Date: Fri, 12 Jun 2026 16:22:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
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
 <20260610154327.37758-5-matt@ozlabs.org> <aiviYEi17tewEQg0@google.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <aiviYEi17tewEQg0@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-64708-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E48B67A801

Hi Pranjal,

On 12/06/2026 11:41, Pranjal Shrivastava wrote:
> On Wed, Jun 10, 2026 at 04:43:18PM +0100, Matt Evans wrote:
>> Convert the VFIO device fd fops->mmap to create a DMABUF representing
>> the BAR mapping, and make the VMA fault handler look up PFNs from the
>> corresponding DMABUF.  This supports future code mmap()ing BAR
>> DMABUFs, and iommufd work to support Type1 P2P.
>>
>> First, vfio_pci_core_mmap() uses the new
>> vfio_pci_core_mmap_prep_dmabuf() helper to export a DMABUF
>> representing a single BAR range.  Then, the vfio_pci_mmap_huge_fault()
>> callback is updated to understand revoked buffers, and uses the new
>> vfio_pci_dma_buf_find_pfn() helper to determine the PFN for a given
>> fault address.
>>
>> Now that the VFIO DMABUFs can be mmap()ed, vfio_pci_dma_buf_move()
>> zaps PTEs (used on the revocation and cleanup paths).
>>
>> CONFIG_VFIO_PCI_CORE now unconditionally depends on
>> CONFIG_DMA_SHARED_BUFFER and CONFIG_PCI_P2PDMA_CORE.  The
>> CONFIG_VFIO_PCI_DMABUF feature conditionally includes support for
>> VFIO_DEVICE_FEATURE_DMA_BUF, depending on the availability of
>> CONFIG_PCI_P2PDMA.
>>
>> Signed-off-by: Matt Evans <matt@ozlabs.org>
>> ---
>>  drivers/vfio/pci/Kconfig           |  5 +-
>>  drivers/vfio/pci/Makefile          |  3 +-
>>  drivers/vfio/pci/vfio_pci_core.c   | 75 +++++++++++++++++++-----------
>>  drivers/vfio/pci/vfio_pci_dmabuf.c | 12 +++++
>>  drivers/vfio/pci/vfio_pci_priv.h   | 11 +----
>>  5 files changed, 67 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
>> index 296bf01e185e..67a2ae1fbc04 100644
>> --- a/drivers/vfio/pci/Kconfig
>> +++ b/drivers/vfio/pci/Kconfig
>> @@ -6,6 +6,8 @@ config VFIO_PCI_CORE
>>  	tristate
>>  	select VFIO_VIRQFD
>>  	select IRQ_BYPASS_MANAGER
>> +	select PCI_P2PDMA_CORE
>> +	select DMA_SHARED_BUFFER
>>  
>>  config VFIO_PCI_INTX
>>  	def_bool y if !S390
>> @@ -56,7 +58,8 @@ config VFIO_PCI_ZDEV_KVM
>>  	  To enable s390x KVM vfio-pci extensions, say Y.
>>  
>>  config VFIO_PCI_DMABUF
>> -	def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
>> +	def_bool y if PCI_P2PDMA
>> +	depends on VFIO_PCI_CORE
>>  
>>  source "drivers/vfio/pci/mlx5/Kconfig"
>>  
> [...]  
>>  int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
>>  				   struct vm_area_struct *vma,
>> @@ -532,6 +538,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>>  	struct vfio_pci_dma_buf *tmp;
>>  
>>  	lockdep_assert_held_write(&vdev->memory_lock);
>> +	/*
>> +	 * Holding memory_lock ensures a racing VMA fault observes
>> +	 * priv->revoked properly.
>> +	 */
> 
> Nit: This comment should appear before the lockdep_assert_held_write()
> Also, it is slightly verbose.. (not against it though).

Right, I'll move it.  Agree it's wordy but if anyone changes that I want
them to "think faulthandler".

>>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>>  		if (!get_file_active(&priv->dmabuf->file))
>> @@ -549,6 +559,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>>  			if (revoked) {
>>  				kref_put(&priv->kref, vfio_pci_dma_buf_done);
>>  				wait_for_completion(&priv->comp);
>> +				unmap_mapping_range(priv->dmabuf->file->f_mapping,
>> +						    0, priv->size, 1);
> 
> Have we run this series with lockdep enabled?
> I guess it'd be nice to check with lockdep once..

I've (generally) always run testing of this series with lockdep.  (No
issues (anymore).)

> Apart from these, 
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>


Thanks!


Matt


