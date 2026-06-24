Return-Path: <linux-media+bounces-65540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yEFtCLPCO2qScQgAu9opvQ
	(envelope-from <linux-media+bounces-65540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:42:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAD36BDBE5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:42:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b="Vfw1P4/4";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65540-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65540-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 130763025A57
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DB5396D15;
	Wed, 24 Jun 2026 11:42:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E538364953;
	Wed, 24 Jun 2026 11:42:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301345; cv=none; b=fmZ/HDHkZaooaK51DKDVwTmzjOnr566iygv9anZCo3GHdLcw3IlyM5WVHgNICdnQp6vcI5VLvtQzxAfRrTA6iN+QcF6nniCPsOc6JHVotB407r99X+CT1WqrcbOoSMmaf8bN3XsXufWcD5iWZzFk1sQhUJsbVFxu7LZwJMyUXC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301345; c=relaxed/simple;
	bh=riMPr912UFIPMnkd77dj4O/2qenW/y+bhggkPiDqP2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFu3olmiXFaChTHCJr3xmY5hgt1RyqrC0uyN8+Sq4XhHKKl3Ee4ya4hIdSMwPSmtHgl11e3ACAjVpYsjNND2lF2PwRo4yNfC+pRPAuobLnBZa9gT6/ZCqtG35fMJl6SpMCdZbfyCSH1FxuiWVwkn3w1hCsRw/cgNYBFUkp1mg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Vfw1P4/4; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9855215A1;
	Wed, 24 Jun 2026 04:42:17 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 263A93F632;
	Wed, 24 Jun 2026 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782301342; bh=riMPr912UFIPMnkd77dj4O/2qenW/y+bhggkPiDqP2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vfw1P4/4IoI5cqXw4yBJZNOTaVkYRmMS6+C6sbeyrmmGnGWWzzWff8oMzVCkvRHpG
	 /WfA6cZgcjrIZBg4la2twn3GyGmuyUH3yH5HcauiNCm7UhB5ttO+fuGOsQ/50nUI2x
	 XbN64JsbCSXXQ+WSm4c6Fyy4/VKP2cHszV2Zyuew=
Message-ID: <b49a3107-68be-4f7f-8c66-0f78206c7359@arm.com>
Date: Wed, 24 Jun 2026 12:42:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
To: Matt Evans <matt@ozlabs.org>, "Tian, Kevin" <kevin.tian@intel.com>,
 Pranjal Shrivastava <praan@google.com>
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
 <feaefa41-9f67-4d4f-a3e0-282dca41f3eb@ozlabs.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <feaefa41-9f67-4d4f-a3e0-282dca41f3eb@ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65540-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:kevin.tian@intel.com,m:praan@google.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arm.com:dkim,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFAD36BDBE5

On 23/06/2026 6:47 pm, Matt Evans wrote:
> Hi Robin, me,
> 
> On 23/06/2026 16:59, Matt Evans wrote:
>> Heya Robin,
>>
>> On 23/06/2026 16:48, Robin Murphy wrote:
>>> On 12/06/2026 3:31 pm, Matt Evans wrote:
>>>> Hi Kevin, Pranjal, (+Robin, hi!)
>>>
>>> Oh hey there! :)
>>>
>>>> On 12/06/2026 04:39, Tian, Kevin wrote:
>>>>>> From: Pranjal Shrivastava <praan@google.com>
>>>>>> Sent: Friday, June 12, 2026 2:38 AM
>>>>>>
>>>>>> On Wed, Jun 10, 2026 at 04:43:15PM +0100, Matt Evans wrote:
>>>>>>> --- a/drivers/pci/Kconfig
>>>>>>> +++ b/drivers/pci/Kconfig
>>>>>>> @@ -206,11 +206,7 @@ config PCIE_TPH
>>>>>>>    config PCI_P2PDMA
>>>>>>>        bool "PCI peer-to-peer transfer support"
>>>>>>>        depends on ZONE_DEVICE
>>>>>>> -    #
>>>>>>> -    # The need for the scatterlist DMA bus address flag means PCI
>>>>>> P2PDMA
>>>>>>> -    # requires 64bit
>>>>>>> -    #
>>>>>>> -    depends on 64BIT
>>>>>>> +    select PCI_P2PDMA_CORE
>>>>>>>        select GENERIC_ALLOCATOR
>>>>>>>        select NEED_SG_DMA_FLAGS
>>>>>>>        help
>>>>>>
>>>>>> Nit: Did we drop depends on 64BIT intentionally here? I guess the full
>>>>>> PCI_P2PDMA stack still selects NEED_SG_DMA_FLAGS? IIRC,
>>>>>> NEED_SG_DMA_FLAGS doesn't select 64BIT?
>>>>>
>>>>> seems that comment is stale. According to the commit msg:
>>>>>
>>>>> " it would make vfio-pci only available if CONFIG_ZONE_DEVICE is
>>>>> present (e.g. 64-bit systems), "
>>>>>
>>>>> so it sounds a redundant dependency hence is removed.
>>>>
>>>> This was intentional.  In practice there is still a dependency on 64BIT
>>>> for PCI_P2PDMA, but it is because of ZONE_DEVICE (and mem hotplug).  The
>>>> key need is PCI_P2PDMA_CORE is available on !64BIT for VFIO, but I
>>>> didn't see a requirement from PCI_P2PDMA itself (as opposed to its
>>>> dependencies).  If I've missed one, I can put it back...
>>>>
>>>> But NEED_SG_DMA_FLAGS doesn't smell quite right; I see from comments in
>>>>
>>>>     af2880ec44021 ("scatterlist: add dedicated config for DMA flags")
>>>>
>>>> that it assumes 64BIT, but it seems to be missing a "depends on 64BIT".
>>>>
>>>> Robin -- should that depend on 64BIT?
>>>
>>> Indeed, looking at the history it seems like that was overlooked, but it
>>> worked out at the time since the only selector of NEED_SG_DMA_FLAGS was
>>> PCI_P2PDMA as you say. If we're now generalising then moving the
>>> explicit 64BIT dependency to NEED_SG_DMA_FLAGS itself sounds like the
>>> right thing to do.
>>
>> Cheers for confirming.  I'll send a patch separate to this series (since
>> the deps work out OK for PCI_P2PDMA for the reasons mentioned).
> 
> I think we were wrong, NEED_SG_DMA_FLAGS doesn't _need_ 64BIT.
> 
> Other than P2PDMA, the other consumer of NEED_SG_DMA_FLAGS is IOMMU_DMA,
> and turns out if one builds an i386 kernel with INTEL_IOMMU (or some
> other configs, like Xen) then NEED_SG_DMA_FLAGS is enabled on 32-bit
> builds too.
> 
> The scatterlist.h comments af2880ec44021 touched are just saying that
> _since_ P2PDMA depends on 64BIT, there _is_ circumstantial padding so
> let's use it for flags.  It doesn't require 64BIT.
> 
> For example struct scatterlist isn't pushed over some special (e.g.
> power-of-two) size when NEED_SG_DMA_FLAGS is enabled on 32-bit; I can't
> find a reason it should be prevented on 32-bit builds (and found cases
> above in which it is already enabled in them).
> 
> So I won't change the NEED_SG_DMA_FLAGS dependencies after all.  Sorry
> for the noise -- as ever if I've missed something do please explain.

Ah, I was also taking the comments at face value, plus conflating the 
memory of the original series which did stash the P2P flag in bit 2 of 
the page_link pointer - in my defence, it's far too hot for my brain to 
work properly :)

Doing a bit more archaeology, the separate dma_flags field was a late 
suggestion just before the series was merged, so I guess it's actually 
just that the comments never got updated accordingly. Sorry for 
perpetuating the confusion!

Cheers,
Robin.

> (I'll continue with removing the P2PDMA dependency on 64BIT because it
> seems P2PDMA's dependencies rely on 64BIT, though P2PDMA itself doesn't.)
> 
> Thanks,
> 
> 
> Matt


