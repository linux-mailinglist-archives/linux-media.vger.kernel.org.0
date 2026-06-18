Return-Path: <linux-media+bounces-65224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ia89BgIZNGrMOQYAu9opvQ
	(envelope-from <linux-media+bounces-65224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:12:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A23EE6A1836
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:12:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=A2sOokYu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65224-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65224-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181D73051D5B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1F43438AF;
	Thu, 18 Jun 2026 16:06:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6EE340410;
	Thu, 18 Jun 2026 16:06:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798803; cv=none; b=Kd2AiZ6tJGXNtC7t/U+pE1MQCCql6um11ARCmubBgdeutIt6yDUbroQ27t+W3QWkKDKVe4kI6krcGNt2IKmVcBPBdqVgs0BI/mUjwEI97jEM/zRrhrbu5MRqHStvxnnQ9UnGjPakzilvqzl9pVGOeHzzaulCZYho8Ch87Ubd604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798803; c=relaxed/simple;
	bh=mC4DhHSmwvC8eoRNbt8eb72zfa466BLNOTCsh3ohXbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJIUwUN3bCmbrF8ii4yrzbtFVc7ebvLp+Mj06jZe6vfO5CFGWLenQrLnB5uuquknWd2q5o9VKPeauhM37IxzpkC4F4vzX9wfkE1KFbteQ39LkhoxUJhe1vCaoDyJqvAh5uu0bxBAQDeJrAUVwp7PSW1ZR4IuzGVPyoiCVRoLey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=A2sOokYu; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781798799;
	bh=nT0xci6xmaOOUm65thHxa9cEY6e60prHEPD/nsZss18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A2sOokYu0KAx3YqxmulMKI2EgCyBAa0qfekbD+vwpUYn4p0rrGiAHRX3n4nHIrmut
	 0Mtgi6mUrSIjr8tTnsQArEujPGNV6K3b4p4gCDjWRfEvglLfKvlJz1fXovM/EnftMZ
	 KDzO/3K86W7nMo6jPXyiY3eA3MV8YdKjU3b1oxvpQkxhdzw/SDO6lmXLngVd28iYlc
	 tuDQqc6hMqzA1IhK2vC0xTRb1seqmPwmEn4iYbVhV7AM1LagBoyCwHe+A0uimz5qBQ
	 A8aLKzuIF3iIA2qyeovzgWoB02LtNKximKmKa1pUgTmNcIQurI5KACIs0nHkopJRQw
	 txy7UV+RmsYQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gh5FN4FcVz4w0H;
	Fri, 19 Jun 2026 02:06:32 +1000 (AEST)
Message-ID: <62970f4b-e624-403f-9cdc-02438c820d23@ozlabs.org>
Date: Thu, 18 Jun 2026 17:06:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
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
 <20260610154327.37758-7-matt@ozlabs.org> <aixgZQiBQKgS7yIM@google.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <aixgZQiBQKgS7yIM@google.com>
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
	TAGGED_FROM(0.00)[bounces-65224-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A23EE6A1836

Hi Praan,

On 12/06/2026 20:39, Pranjal Shrivastava wrote:
> On Wed, Jun 10, 2026 at 04:43:20PM +0100, Matt Evans wrote:
>> Previously, vfio_pci_zap_bars() (and the wrapper
>> vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
>> calls to vfio_pci_dma_buf_move().
>>
>> This commit replaces them with a unified new function,
>> vfio_pci_zap_revoke_bars() containing both the vfio_pci_dma_buf_move()
>> and the unmap_mapping_range(), making it harder for callers to omit
>> one.  It adds a wrapper, vfio_pci_lock_zap_revoke_bars(), which takes
>> the write memory_lock before zapping, and adds a new
>> vfio_pci_unrevoke_bars() for the re-enable path.
>>
>> As of "vfio/pci: Convert BAR mmap() to use a DMABUF", the
>> unmap_mapping_range() to zap is no longer performed for vfio-pci since
>> the DMABUFs used for BAR mappings already zap PTEs when the
>> vfio_pci_dma_buf_move() occurs.
>>
>> However, it must be assumed that VFIO drivers which override the .mmap
>> op could create mappings _not_ backed by DMABUFs.  So, the zap is
>> still performed on revoke if .mmap is overridden, using a new
>> zap_bars_on_revoke flag.  A driver can explicitly opt out; the flag is
>> cleared by the hisi_acc_vfio_pci driver, since its .mmap just wraps
>> vfio_pci_core_mmap() and so still uses DMABUFs.
>>
>> Signed-off-by: Matt Evans <matt@ozlabs.org>
>> ---
>>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  8 +++
>>  drivers/vfio/pci/vfio_pci_config.c            | 30 ++++----
>>  drivers/vfio/pci/vfio_pci_core.c              | 70 +++++++++++++------
>>  drivers/vfio/pci/vfio_pci_priv.h              |  3 +-
>>  include/linux/vfio_pci_core.h                 |  1 +
>>  5 files changed, 73 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
>> index 86362ec424a5..51990f6d66d5 100644
>> --- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
>> +++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
>> @@ -1692,6 +1692,14 @@ static int hisi_acc_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device
>>  	if (ret)
>>  		goto out_put_vdev;
>>  
>> +	/*
>> +	 * hisi_acc_vfio_pci_mmap() calls down to
>> +	 * vfio_pci_core_mmap(), so BAR mappings are still
>> +	 * DMABUF-backed.  They don't require a zap on revoke, so opt
>> +	 * out:
>> +	 */
>> +	hisi_acc_vdev->core_device.zap_bars_on_revoke = false;
>> +
> 
> This seems to be happening after we vfio_pci_core_register_device, which
> could be slightly problematic if another device in the same group races 
> to trigger a hot reset before we can set this to false. Could we 
> initialize this flag before registration instead?

Remember it is a safe default, so in the event of a driver not managing
to opt-out before it's required then all that happens is a redundant
unmap_mapping_range().  The default-safe was a nice suggestion from Alex
on v2.


Matt


