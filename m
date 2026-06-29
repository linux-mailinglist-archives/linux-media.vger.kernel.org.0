Return-Path: <linux-media+bounces-66005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HX6FIwasQmoK/gkAu9opvQ
	(envelope-from <linux-media+bounces-66005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:31:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C1E6DDBEE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:31:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=DrnVVqD2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66005-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66005-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A87473066CEC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFEF47798B;
	Mon, 29 Jun 2026 17:26:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC60472789;
	Mon, 29 Jun 2026 17:26:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754017; cv=none; b=rJhMDyYC5bTzbjFxt8uzgW2xioJjimf1qLxFBelxwM0a6NAGQWrHWwQeqw54SKp64Pluf+8yGW/Z1esWBrcoGA+OVi5BlhJ6US2n1NeAJK3zxl6/hWf8rPBV1x9h4bbGSrpTWGJeUdLvV8Lxn6SeizvZURihFhcFDHYg+Jug3Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754017; c=relaxed/simple;
	bh=4/OzXg1kRwYcddjKntVN/+Mh8XEIs2dYDYalSRkf93E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9HV9H5Wo7ZGHfieVrm7P+vmFm2WvsFXmOASXHT90TK9nxyoIjmcw8TwQ0wT9b/I3HPImiWzbqsrjcnjE0eGB1UVrAJFmM8eBPG0dynwIAh7PDtFXorI5OROuv8mjLYax0xqqdmvKsb1ZTLMUIqUzhwEZ5B48xyTN9IfQuWh1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=DrnVVqD2; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1782754012;
	bh=y6eTx+9vg9xblvO487zhAd78ZW9yRyedKnZlH9n/Q1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DrnVVqD25H/vFxEfW5d4xHnG7Pc1MM3ub184VCpBbrQ08+Vf4/gSGAFi9Ztv5RPIp
	 +DPnMkZN0Rq1BNhf0To8wcmDt8naUQB/8DUZdLPKIhznKdibD3VFtLP4xlygASScPR
	 jsVI3JtM7hii5yp3iVe3S/QopyVb9AmjDxnbUO6kZpGnB12C8gZHGGf8mnv9GP31s1
	 jGj2WBAOwoUMmvyKZ0acx9Ot5s11nbcNxJo7i0ahlb/jltZ5HKISUIJeH/IQPiAlDQ
	 t1Iw8z5AmbdTwwik49LDPiro0BE7UDScxaB0rz4itKI4TL3Oha7z1PZvGdCOzBO/iz
	 D06sFOHWNMXaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gptVs3yzbz4w9j;
	Tue, 30 Jun 2026 03:26:45 +1000 (AEST)
Message-ID: <cc4e8b75-5b25-417c-898b-35b3fa41ccb2@ozlabs.org>
Date: Mon, 29 Jun 2026 18:26:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Content-Language: en-GB
To: "Tian, Kevin" <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>, Alistair Popple
 <apopple@nvidia.com>, "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org>
 <DM6PR11MB3690CA709415069FFA5121838CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <DM6PR11MB3690CA709415069FFA5121838CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66005-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67C1E6DDBEE

Hi Kevin,

On 16/06/2026 10:18, Tian, Kevin wrote:
>> From: Matt Evans <matt@ozlabs.org>
>> Sent: Wednesday, June 10, 2026 11:43 PM
>>
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
> 
> It's unusual to have three verbs (lock/zap/revoke) in one function name.
> 
> I wonder whether it's simpler to have:
> 	vfio_pci_zap_bars_locked() 	// caller already holds the lock
> 	vfio_pci_zap_bars()
> 
> 'revoke' is just a side-effect of 'zap', not necessarily to highlight it in
> the name.

(Just found this one unacknowledged, apologies.)  If you reckon it's a
handful, sure I can shorten them.

As it already has ..._unrevoke_bars(), it makes sense to use
..._revoke_bars() and ..._lock_revoke_bars().  IMHO the zap is a
secondary effect, and "revoke the BARs" means to make them inaccessible
from both DMA and CPU.

I don't want to go down the path of _locked() though right now; I just
want to tidy the current pattern without pulling new duties up to the
call sites.

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
> 
> the cost of unmap_mapping_range() is trivial when there is no mmap
> on the device fd.
> 
> so it could be simpler by always doing:
> 
> 	vfio_pci_dma_buf_move();
> 	unmap_mapping_range();
> 
> and remove the flag.

I did consider this.  I do agree it's cheap, but I still prefer to avoid
unnecessary activities (just to decouple and insulate against things
somehow changing in future).  From previous postings, others didn't seem
to mind the flag approach, at least.

Thanks,


Matt


