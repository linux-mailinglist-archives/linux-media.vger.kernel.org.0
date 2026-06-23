Return-Path: <linux-media+bounces-65479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CZHdD8zGOmqOGggAu9opvQ
	(envelope-from <linux-media+bounces-65479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 19:47:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 972CC6B939C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 19:47:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=Kki45cJZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65479-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65479-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CDBE305A45F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 17:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB52038E5E9;
	Tue, 23 Jun 2026 17:47:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D9438D3F6;
	Tue, 23 Jun 2026 17:47:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236854; cv=none; b=Mql/xogMEZvg80dqYB6iO/5eqNj0pZ55e+HQL6J+PWe5k5Yn5G9y9VeSVW7jJ2XuVtCZx9hs50GKJAFwj2miixfrJBjZW8jgAp1matlg7zDCcMcr7tudq0UN5xrxJqsNH8kStd52iFxs1ixSfIOlpsjJN4CxdQfdegL8Eaie5vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236854; c=relaxed/simple;
	bh=RFfYMFzKrlyKUMDniBl2wYGeZ+3FxaPK1tLanhTUZ9k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=D1kM2Pb7Swhn7XI398XhWkpIZJU0n48bP5f0IwJUspsRWwOiIgHLXFJom9MGDRtROse99I2FNGx+/R+hlOaEvdIRo3jKIARR+aBV0JTWO5Ylao23oL9UyY7vZFyfvXkHc6AW3Ujl5EGXa042Uu3uXen1AnVqBiHv20sq24JpufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=Kki45cJZ; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1782236848;
	bh=YnpLj85EVGFLS082aT9C1I8KDlkyXpsPGbTho/uxSLo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Kki45cJZWsx9YAZgIjFlNXBh4gxmehNd4vPdhDGqbXNckYAUWcNK5NrOjxPnNhA0I
	 QtvyyFV0Eoh8ZNWJ7aIXyTto6helylau76gRUqZWbHqMWu67oqEojo8vwKq+EsHq6N
	 qCqcCGyNAYXq6mJLW+VOFY+Z41U9sdcsKlCkoZYyHf6ZwhMlYFnVbTEvkDeIp8eWCU
	 l96EoKWxeFlRbsj1l3UQV2fwAJuTACjiUyG5IG6lkYNHFMY9/TH/nv4V27mR0Ii/oD
	 g4Jpo55fotZNFVbkMuFlvwAb3414y7QDk/0X40yG4cgrli+myDrMBQmXrhUoGuIT0C
	 y7iLzj3Cuv5fA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4glCFN67bcz4wB7;
	Wed, 24 Jun 2026 03:47:20 +1000 (AEST)
Message-ID: <feaefa41-9f67-4d4f-a3e0-282dca41f3eb@ozlabs.org>
Date: Tue, 23 Jun 2026 18:47:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Content-Language: en-GB
From: Matt Evans <matt@ozlabs.org>
To: Robin Murphy <robin.murphy@arm.com>, "Tian, Kevin"
 <kevin.tian@intel.com>, Pranjal Shrivastava <praan@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-2-matt@ozlabs.org> <aisAc1HRn2Wa4F9p@google.com>
 <DM6PR11MB36904ED2E1D2C646644F67668C182@DM6PR11MB3690.namprd11.prod.outlook.com>
 <0dfadf98-a904-4e6a-b078-5caf27bc7922@ozlabs.org>
 <81a9d212-996e-42e1-aabf-b120a13e94c3@arm.com>
 <88a9ebaa-8637-4290-b299-acae0e3065f8@ozlabs.org>
In-Reply-To: <88a9ebaa-8637-4290-b299-acae0e3065f8@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65479-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:robin.murphy@arm.com,m:kevin.tian@intel.com,m:praan@google.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:dkim,ozlabs.org:mid,ozlabs.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 972CC6B939C

Hi Robin, me,

On 23/06/2026 16:59, Matt Evans wrote:
> Heya Robin,
> 
> On 23/06/2026 16:48, Robin Murphy wrote:
>> On 12/06/2026 3:31 pm, Matt Evans wrote:
>>> Hi Kevin, Pranjal, (+Robin, hi!)
>>
>> Oh hey there! :)
>>
>>> On 12/06/2026 04:39, Tian, Kevin wrote:
>>>>> From: Pranjal Shrivastava <praan@google.com>
>>>>> Sent: Friday, June 12, 2026 2:38 AM
>>>>>
>>>>> On Wed, Jun 10, 2026 at 04:43:15PM +0100, Matt Evans wrote:
>>>>>> --- a/drivers/pci/Kconfig
>>>>>> +++ b/drivers/pci/Kconfig
>>>>>> @@ -206,11 +206,7 @@ config PCIE_TPH
>>>>>>   config PCI_P2PDMA
>>>>>>       bool "PCI peer-to-peer transfer support"
>>>>>>       depends on ZONE_DEVICE
>>>>>> -    #
>>>>>> -    # The need for the scatterlist DMA bus address flag means PCI
>>>>> P2PDMA
>>>>>> -    # requires 64bit
>>>>>> -    #
>>>>>> -    depends on 64BIT
>>>>>> +    select PCI_P2PDMA_CORE
>>>>>>       select GENERIC_ALLOCATOR
>>>>>>       select NEED_SG_DMA_FLAGS
>>>>>>       help
>>>>>
>>>>> Nit: Did we drop depends on 64BIT intentionally here? I guess the full
>>>>> PCI_P2PDMA stack still selects NEED_SG_DMA_FLAGS? IIRC,
>>>>> NEED_SG_DMA_FLAGS doesn't select 64BIT?
>>>>
>>>> seems that comment is stale. According to the commit msg:
>>>>
>>>> " it would make vfio-pci only available if CONFIG_ZONE_DEVICE is
>>>> present (e.g. 64-bit systems), "
>>>>
>>>> so it sounds a redundant dependency hence is removed.
>>>
>>> This was intentional.  In practice there is still a dependency on 64BIT
>>> for PCI_P2PDMA, but it is because of ZONE_DEVICE (and mem hotplug).  The
>>> key need is PCI_P2PDMA_CORE is available on !64BIT for VFIO, but I
>>> didn't see a requirement from PCI_P2PDMA itself (as opposed to its
>>> dependencies).  If I've missed one, I can put it back...
>>>
>>> But NEED_SG_DMA_FLAGS doesn't smell quite right; I see from comments in
>>>
>>>    af2880ec44021 ("scatterlist: add dedicated config for DMA flags")
>>>
>>> that it assumes 64BIT, but it seems to be missing a "depends on 64BIT".
>>>
>>> Robin -- should that depend on 64BIT?
>>
>> Indeed, looking at the history it seems like that was overlooked, but it
>> worked out at the time since the only selector of NEED_SG_DMA_FLAGS was
>> PCI_P2PDMA as you say. If we're now generalising then moving the
>> explicit 64BIT dependency to NEED_SG_DMA_FLAGS itself sounds like the
>> right thing to do.
> 
> Cheers for confirming.  I'll send a patch separate to this series (since
> the deps work out OK for PCI_P2PDMA for the reasons mentioned).

I think we were wrong, NEED_SG_DMA_FLAGS doesn't _need_ 64BIT.

Other than P2PDMA, the other consumer of NEED_SG_DMA_FLAGS is IOMMU_DMA,
and turns out if one builds an i386 kernel with INTEL_IOMMU (or some
other configs, like Xen) then NEED_SG_DMA_FLAGS is enabled on 32-bit
builds too.

The scatterlist.h comments af2880ec44021 touched are just saying that
_since_ P2PDMA depends on 64BIT, there _is_ circumstantial padding so
let's use it for flags.  It doesn't require 64BIT.

For example struct scatterlist isn't pushed over some special (e.g.
power-of-two) size when NEED_SG_DMA_FLAGS is enabled on 32-bit; I can't
find a reason it should be prevented on 32-bit builds (and found cases
above in which it is already enabled in them).

So I won't change the NEED_SG_DMA_FLAGS dependencies after all.  Sorry
for the noise -- as ever if I've missed something do please explain.

(I'll continue with removing the P2PDMA dependency on 64BIT because it
seems P2PDMA's dependencies rely on 64BIT, though P2PDMA itself doesn't.)

Thanks,


Matt

