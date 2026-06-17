Return-Path: <linux-media+bounces-65128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HyipJT/NMmqk5gUAu9opvQ
	(envelope-from <linux-media+bounces-65128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 18:37:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 004AA69B6CF
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 18:37:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=d3cmRLsr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65128-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65128-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE35530FD5A5
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 16:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287E849691C;
	Wed, 17 Jun 2026 16:22:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143B047ECDC;
	Wed, 17 Jun 2026 16:22:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713355; cv=none; b=qdYMsxJaaTwLDremQlNq+TnxdQzvAhPvTOCKIHCEJMeTXmghS2MObFtl6VzxrkVtsLVgc11IGLwwFKlEMzBSLxgHLm59r/Iua+Mulp3XzVrUgjmRg5uVca15Hp7soG3IZlpf/9Dy2Ot0PKUywdWXGqeOB0OQbGqp6hXgHS2cJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713355; c=relaxed/simple;
	bh=gsVJwrmacjSleUw7q9mc/Gofw4W8zPSQffhuEjtkhMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CeaD9ClmO59zBNZ29y2BeA9jQhWx+Ml4BVhkUkV2L979/C3cyLqebErm115oJbrjAUi/RUUy5Mcw27CeyI0YTUjU6sTuK/XuM64LDtsuSYBa9LKgOdywMi+lOZOSFAFwrF/3c/8lsTsfOpC6pSpPPHnTkl70spausIkhnzM8vZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=d3cmRLsr; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781713347;
	bh=VWZSWpCol9raRY120emry9mXxsYJnSg1XDkRzNJRvt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d3cmRLsruG7+XddsnXKfz/us2vQszmdPYD2jYLfOc8VRFAR6c2QRzLqH++tKeIN31
	 q+DBJ/WB4E9j+dyCRov31HiRDstyV+eo95cEnrb31wzDtnmKyKDw/k61nhYJj71V5E
	 rsjfhHlqqtC8s2doWOCpboeLeWPieWmryM8Q7E9hHV5K27NwxAiFDzXkmRnweWPvfm
	 IMSD3lfXA7iwVhPzrkqUIaiBIrnr1RGmaq53qqKE2mpSa4BxXee+o5L+TiDw8em7xC
	 l3JqpVOG7ZqsZlULdFtvJPXVKqHu8nwsFYHNhjRwsM0Jv7BOX4OBhHcaSrNUu6/POi
	 bEm119Xyrkc5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ggTf422vjz4wCm;
	Thu, 18 Jun 2026 02:22:19 +1000 (AEST)
Message-ID: <dc606df6-0e20-49f2-989d-da69813e9bd8@ozlabs.org>
Date: Wed, 17 Jun 2026 17:22:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] vfio/pci: Permanently revoke a DMABUF on request
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
 <20260610154327.37758-9-matt@ozlabs.org> <ajED1v846hZkyq9z@google.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <ajED1v846hZkyq9z@google.com>
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
	TAGGED_FROM(0.00)[bounces-65128-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 004AA69B6CF

Hi Praan,

On 16/06/2026 09:05, Pranjal Shrivastava wrote:
> On Wed, Jun 10, 2026 at 04:43:22PM +0100, Matt Evans wrote:
>> Expand the VFIO DMABUF revocation state to three states:
>> Not revoked, temporarily revoked, and permanently revoked.
>>
>> The first two are for existing transient revocation, e.g. across a
>> function reset, and the DMABUF is put into the last in response to a
>> new VFIO feature VFIO_DEVICE_FEATURE_DMA_BUF.
>>
>> VFIO_DEVICE_FEATURE_DMA_BUF passes a DMABUF by fd and requests that
>> the DMABUF is permanently revoked.  On success, it's guaranteed that
>> the buffer can never be imported/attached/mmap()ed in future, that
>> dynamic imports have been cleanly detached, and that all mappings have
>> been made inaccessible/PTEs zapped.
>>
>> This is useful for lifecycle management, to reclaim VFIO PCI BAR
>> ranges previously delegated to a subordinate client process: The
>> driver process can ensure that the loaned resources are revoked when
>> the client is deemed "done", and exported ranges can be safely re-used
>> elsewhere.
>>
>> Refactor the revocation code out of vfio_pci_dma_buf_move() to a
>> function common to move and the new feature request path.
>>
>> Signed-off-by: Matt Evans <matt@ozlabs.org>
>> ---
>>  drivers/vfio/pci/vfio_pci_core.c   |   6 +-
>>  drivers/vfio/pci/vfio_pci_dmabuf.c | 169 ++++++++++++++++++++++-------
>>  drivers/vfio/pci/vfio_pci_priv.h   |  19 +++-
>>  include/uapi/linux/vfio.h          |  20 ++++
>>  4 files changed, 173 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>> index 508a5eca910a..064906b25467 100644
> 
> [...]
> 
>>  
>> +/* Set the DMABUF's revocation status (OK or temporarily/permanently revoked) */
>> +static void vfio_pci_dma_buf_set_status(struct vfio_pci_dma_buf *priv,
>> +					enum vfio_pci_dma_buf_status new_status)
>> +{
>> +	bool was_revoked;
>> +
>> +	lockdep_assert_held_write(&priv->vdev->memory_lock);
>> +
>> +	if (priv->status == VFIO_PCI_DMABUF_PERM_REVOKED ||
>> +	    priv->status == new_status) {
>> +		return;
>> +	}
>> +
>> +	dma_resv_lock(priv->dmabuf->resv, NULL);
>> +	was_revoked = (priv->status == VFIO_PCI_DMABUF_TEMP_REVOKED);
>> +
>> +	if (new_status != VFIO_PCI_DMABUF_OK) {
>> +		priv->status = new_status; /* Temp or permanently revoked */
>> +
>> +		if (was_revoked) {
>> +			/*
>> +			 * TEMP_REVOKED is being upgraded to
>> +			 * PERM_REVOKED.  The buffer is already gone,
>> +			 * don't wait on it again.
>> +			 */
>> +			dma_resv_unlock(priv->dmabuf->resv);
>> +			return;
>> +		}
>> +	}
>> +
>> +	dma_buf_invalidate_mappings(priv->dmabuf);
> 
> Nit: We seem to be calling this even if new_status == OK, while it works
> as importers (like IOMMUFD and RDMA core) are immune to a double 
> invalidate / revoke. I'm wondering if we could move this within the 
> if (new_status != VFIO_PCI_DMABUF_OK) block? 
> 
> Since this is only needed to be called when we TEMP/PERM _REVOKE?
> 
> I'm just worried that this may overload the dma_buf_invalidate_mappings 
> to be a state-change notification instead of a revoke / invalidate
> notification.

(In case you didn't see my reply to Kevin who made a similar request: 
https://lore.kernel.org/all/31d1265b-e264-4dc6-a8c3-1b64dc9867a1@ozlabs.org/ )

Done, moved to a common `!= VFIO_PCI_DMABUF_OK` block.

Just to flag that since it's currently called for both revoke and 
un-revoke paths, someone could already rely on this as a state-change 
notification.  I don't see any current examples, but giving it a mention 
in case any readers know of any.

>> +	dma_resv_wait_timeout(priv->dmabuf->resv,
>> +			      DMA_RESV_USAGE_BOOKKEEP, false,
>> +			      MAX_SCHEDULE_TIMEOUT);
>> +	dma_resv_unlock(priv->dmabuf->resv);
>> +	if (new_status != VFIO_PCI_DMABUF_OK) {
>> +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
>> +		wait_for_completion(&priv->comp);
>> +		unmap_mapping_range(priv->dmabuf->file->f_mapping,
>> +				    0, priv->size, 1);
>> +		/*
>> +		 * Re-arm the registered kref reference and the
>> +		 * completion so the post-revoke state matches the
>> +		 * post-creation state.	 An un-revoke followed by a
>> +		 * new mapping needs the kref to be non-zero before
>> +		 * kref_get(), and vfio_pci_dma_buf_cleanup()
>> +		 * delegates its drain back through this revoke
>> +		 * path on a possibly-already-revoked dma-buf.
>> +		 */
>> +		kref_init(&priv->kref);
>> +		reinit_completion(&priv->comp);
>> +	} else {
>> +		dma_resv_lock(priv->dmabuf->resv, NULL);
>> +		priv->status = VFIO_PCI_DMABUF_OK;
>> +		dma_resv_unlock(priv->dmabuf->resv);
>> +	}
>> +}
>> +
> 
> Otherwise, 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> 
> Thanks,
> Praan

Thanks!


Matt



