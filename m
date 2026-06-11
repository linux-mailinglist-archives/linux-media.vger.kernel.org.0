Return-Path: <linux-media+bounces-64609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8hoRDiX0KmrmzwMAu9opvQ
	(envelope-from <linux-media+bounces-64609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:45:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDACA6741E3
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:45:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=Os9kV2Gx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64609-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64609-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B741303A0B9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 17:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D96B41C2EF;
	Thu, 11 Jun 2026 17:45:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D975D33D6FC;
	Thu, 11 Jun 2026 17:44:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199900; cv=none; b=hd4gsqYRqme6NhDCORrfUXOLDJaxOL4kA6Z09ELdQF5qC/N52LAHs8MqlXqzQ2skaQvA4bpQDswyJeHgccwOPDEKBXIDnz50asW1oeAWGSloWGMnBDRw7RxZkHAgDUShpK0Kq8Fh0PbbyVk8QMGj6PXK+9MGy4x8OrXfDp6REPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199900; c=relaxed/simple;
	bh=a4zP1H08HlKwxMbq5tqKW/OsMFBlssC+9ij1PX3xlh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMrvx2fitUgJoGXZDWn6uybODdXifRKKvdmL/bCGJfiLKvz0W88RWtzgpDmZW+3Cvkctn7twseLNd2xaaYkV1KP4K593GoWUz33bAYmsPwhvZahpI2Wh4pKRhFhAEosvfh0jKhdCJV8f7ILEiFq5tH9bAo9brjnKG/h6NktsqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=Os9kV2Gx; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781199888;
	bh=bgyx4tuoR1VujLGJebtgmRpeK21Ky1z7/2zTZbfFLxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Os9kV2GxCX6cgBB+jfIbx4Jk5aYyWKQ5X/ZXH+VDun8JRkKYtFv/ieIvA9GjW9BEP
	 oCbiUOIm0Juecvy1as3nTJYV673czVuKakUU/AnOzg1YsHLcYDcCT6wfnXjOb4o5EF
	 gGsD9u+TtAD6sXt5Fps0rxVzebnry3bpHhfB/x6aKrUvYTzMNZCxodqLKN4BSGZnoy
	 7qlwpEUgQ//8IfsVc+0INo/af9xSHJs4pcUtFr/egZjryoz4iw5WPTWSpoUclLkJ9x
	 MLyh0LmyKHrhyNGTv+5AcdgmuuA1QN8TdwwUbruNIB224zwt1Y0N8Pmt5FJFGTti/K
	 pXV0X5964ySzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gbqlp6VBVz4wJk;
	Fri, 12 Jun 2026 03:44:38 +1000 (AEST)
Message-ID: <d38fc0ed-4e89-4eeb-b32d-06afba3157f6@ozlabs.org>
Date: Thu, 11 Jun 2026 18:44:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Content-Language: en-GB
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260611160749.GA469670@bhelgaas>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <20260611160749.GA469670@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64609-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDACA6741E3

Hi Bjorn,

On 11/06/2026 17:07, Bjorn Helgaas wrote:
> On Wed, Jun 10, 2026 at 04:43:15PM +0100, Matt Evans wrote:
>> The P2PDMA code currently provides two features under the same
>> CONFIG_PCI_P2PDMA option:
>>
>>  1.  Locate providers via pcim_p2pdma_provider()
>>  2.  Manage actual P2P DMA
>>
>> Some drivers (such as vfio-pci) depend on 1, without having a hard
>> dependency on 2.
>>
>> A future commit expands the use of DMABUF in vfio-pci for non-P2P
>> scenarios, relying on pcim_p2pdma_provider() always being present.  If
>> that depended on CONFIG_PCI_P2PDMA, it would make vfio-pci only
>> available if CONFIG_ZONE_DEVICE is present (e.g. 64-bit systems), even
>> when P2P is not needed.
>>
>> To resolve this, introduce CONFIG_PCI_P2PDMA_CORE and refactor the
>> basic provider functionality into a new p2pdma_core.c file.  This is
>> available even if the CONFIG_PCI_P2PDMA feature is disabled (or
>> unavailable due to !CONFIG_ZONE_DEVICE).  Then, drivers can enable any
>> additional P2P features with the original CONFIG_PCI_P2PDMA (available
>> when CONFIG_ZONE_DEVICE is set).
>>
>> Signed-off-by: Matt Evans <matt@ozlabs.org>
> 
> I thought this was going to be just a code move and new Kconfig
> option, but it involves a little more than that, e.g., adding
> pci_p2pdma_release_pool() and tweaking the RCU synchronization.
> 
> If possible, it would be nice to do that refactoring in a smaller
> preliminary patch so it's easier to review/bisect/etc and make this
> one a pure code move.

pci_p2pdma_release_pool() is really part of the split, not a functional
change, i.e. factoring the (P2P-only) pool handling out from the rest of
the pci_p2pdma_release() actions still needed for the _CORE case.

I guess .._release() could be split in place in a small patch, and then
moved alongside the rest in a second.

> I guess CONFIG_PCI_P2PDMA_CORE selects just part 1 ("Locate providers
> via pcim_p2pdma_provider()"), right?

Yes, I can reword that last paragraph of the commit message to make this
clearer.

>> +++ b/drivers/pci/p2pdma.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * PCI Peer 2 Peer DMA support.
>> + */
>> +
>> +#ifndef _PCI_P2PDMA_H
>> +#define _PCI_P2PDMA_H
>> +
>> +#include <linux/genalloc.h>
>> +#include <linux/pci-p2pdma.h>
>> +#include <linux/xarray.h>
>> +
>> +struct pci_p2pdma {
>> +	struct gen_pool *pool;
>> +	bool p2pmem_published;
>> +	struct xarray map_types;
>> +	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
>> +};
>> +
>> +#ifdef CONFIG_PCI_P2PDMA
>> +void pci_p2pdma_release_pool(struct pci_dev *pdev, struct pci_p2pdma *p2pdma);
>> +#else
>> +static inline void pci_p2pdma_release_pool(struct pci_dev *pdev, struct pci_p2pdma *p2pdma)
> 
> Wrap to fit in 80 columns like the rest of drivers/pci/

Fixed.

>> +{
>> +}
>> +#endif
>> +
>> +#endif
>> +
> 
> Spurious blank line at end.

Doh, fixed.

>> +++ b/drivers/pci/p2pdma_core.c
>> @@ -0,0 +1,118 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * PCI Peer 2 Peer DMA support core, providing a bare-bones
> 
> In this English text, I think I would spell out "Peer to Peer" instead
> of relying on the "2" homophone.  Same in p2pdma.h.

I would've preferred that too, it isn't correct; I was seeking to keep
the blurb here (and in p2pdma.h) as close to the original p2pdma.c as
possible.  I'll correct it in the new files (hyphenated "peer-to-peer"
in PCI-SIG language).


Thanks,


Matt


