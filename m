Return-Path: <linux-media+bounces-67194-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TNkDIMnJT2qNoQIAu9opvQ
	(envelope-from <linux-media+bounces-67194-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:18:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF3C733616
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=tWglgtXm;
	dmarc=pass (policy=none) header.from=ozlabs.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67194-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67194-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 455D7303B6B9
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 16:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAEB54343FE;
	Thu,  9 Jul 2026 16:18:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229E40E8EA;
	Thu,  9 Jul 2026 16:18:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613890; cv=none; b=W78ZXQp0srKH33xuSooc7NGKRzjMQ8LhduOF5xkygixXUbcAsFI/bQ/m+4zvlmxA8bO8QY6rShAqnfLpcIL5Eu+QXFAgxtinPM2qsY9dzl1M7AdR6hKDYE6d/fyLwVfE+ugET5cRpd29Rulm7isoPDK3Ltngh3rM+NJ7l2WY/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613890; c=relaxed/simple;
	bh=26QO1saLv8ZoRnBa78PUqXxlwIBVXIp54cOe7XNelCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTN12LfCNCm5CpXvU45BCsj8GrzZVDhb50kKWEzR8En1RImV9GepXj62qBvPIxOVLgqAAaPeK6+XgHXbi/sbb/iQ5XtXZQLuXnoaUzrqH60c9gHl1W6nsjkagxOrW60oYJ2fJoERr0ncUBCmbY/rFCe1639+/qwpjPACV0OfHNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=tWglgtXm; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1783613884;
	bh=OArR/KeoVpNI247WLRI2TAI/hbwe5M9v3yfS72f/EYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tWglgtXml7pWfbHECxp6rv6+pl7o+Z6pl8u4VKyh8ZZ2F8rVizDEv5FLgaz1ZsN7Z
	 rxppfO+k24cGHc1gPzlsY3LGNqJoFRKoYox17ybUVU+RhbrrjwQCEO/xSNnNeeTcPK
	 XYU4vK05nZCRVvkpoWsPQd93LGdruEmDya+3aTut0o82rCsaIi7YWNeZODo4qFSWcU
	 5/Hk3Un9hUHlxhmvNDUjMYjAIDBICgHjy0Tea/lIvsoB1DrREnpx0nGmgQ7JvSvoMl
	 LiZSCSDCanrPhDrI6JqUArQm72BlLoJIH2OZ5fo9nok0p9/2Ft7cQjuQcQWe0ozzuS
	 9lEMaOemERv9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gx0Vs2Qmmz58fn;
	Fri, 10 Jul 2026 02:17:56 +1000 (AEST)
Message-ID: <e0ccdfd7-2379-44ae-b579-a0da045d7f1b@ozlabs.org>
Date: Thu, 9 Jul 2026 17:17:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Content-Language: en-GB
To: Logan Gunthorpe <logang@deltatee.com>, Alex Williamson
 <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Kevin Tian <kevin.tian@intel.com>,
 Pranjal Shrivastava <praan@google.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260701171245.90111-1-matt@ozlabs.org>
 <20260701171245.90111-3-matt@ozlabs.org>
 <26f74cf0-8892-4672-b0e1-1f1a385c42bb@deltatee.com>
 <aecbbc66-c154-4439-a6ae-84dc012b0f8d@ozlabs.org>
 <1cd1b832-082c-4f9c-ab68-706110ddcb25@deltatee.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <1cd1b832-082c-4f9c-ab68-706110ddcb25@deltatee.com>
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
	FORGED_RECIPIENTS(0.00)[m:logang@deltatee.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:kevin.tian@intel.com,m:praan@google.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-67194-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ozlabs.org:from_mime,ozlabs.org:dkim,ozlabs.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EF3C733616

Hi Logan,

On 02/07/2026 21:34, Logan Gunthorpe wrote:
> 
> 
> On 2026-07-02 10:44 a.m., Matt Evans wrote:
>>> So maybe at this point it's fine to enable this on 32bit systems and we
>>> can remove this requirement. However, I think we should do that
>>> explicitly in its own patch, not hide it in this refactoring patch.
>>
>> Your question does prove it's too stealthy as-is. :)  PCI_P2PDMA still
>> can't be enabled on 32-bit systems because of its ZONE_DEVICE -> 
>> MEMORY_HOTPLUG -> 64BIT dependency.  So we're not enabling 32-bit 
>> support for PCI_P2PDMA here, but it's not obvious and so I'll re-add the 
>> `depends on 64BIT`.  At least then it won't be enabled without intention 
>> if someone enables ZONE_DEVICE on 32-bit systems...
> 
> Ok, that all makes sense to me. I would be good with removing the 64BIT
> dependency (as it is is a bit confusing as is) but I think adding
> another patch would be appropriate with some of the commit message notes
> you mentioned in your emails.
> 
> Besides that, I think you can add to this patch:
> 
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thanks for that.  On second reading, just want to check with you:

I'm intending to repost _retaining_ the 64BIT dependency (i.e. revert
its removal) for simplicity's sake.  Then we can follow up separatey
(outside this series) with a cleanup patch to remove 64BIT, explain,
examine other dependencies etc. as you suggest.  Works for you?

(I want to reduce the diff in this series, and revert since this isn't
truly necessary && wasn't entirely obvious.)

Cheers,


Matt


