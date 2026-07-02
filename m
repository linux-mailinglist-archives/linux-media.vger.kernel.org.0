Return-Path: <linux-media+bounces-66413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zo36DzfMRmoHdwsAu9opvQ
	(envelope-from <linux-media+bounces-66413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 22:38:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C226FCC68
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 22:38:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=deltatee.com header.s=20200525 header.b=cU4+yxkJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66413-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66413-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=deltatee.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A24E30948E6
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 20:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48884393DCA;
	Thu,  2 Jul 2026 20:35:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77052304BA3;
	Thu,  2 Jul 2026 20:35:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024552; cv=none; b=q+rs02vNoncvh9l22HEGJ40QLkWJnhHoysZBzfZCgBQaWywdN4/1tZp1qL+Dck9VdUHTkbwz7Eny7Olqow+SJssss+cAe0s3702Ve7/Xjd4PHkNsoyPXY/jHsubsjuzSuyQ2C/LXBfdG2qGijbnA7+xgaXH6JuxejPMu1gW1oBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024552; c=relaxed/simple;
	bh=Zm7m3tTldkvWq7EZaaaCIvCle11wRvS3oBxXy9ODNcc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:In-Reply-To:
	 Content-Type:Subject; b=JMB6JvltdJTWkj6uzTk+/dsRE7pYFISWmiaTM1fbR5gA6JuV1jYoeY/jodibTOJkn2nb1vuEB6Lz6SRYNOXlKsxwCVdwY1rH80rPvvsGJRQrEyrfPDr0WAprVmneC8fDSqdutiy4pkotH8bmhFAMuAUyEBBl9aasLM92YOGpiNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=cU4+yxkJ; arc=none smtp.client-ip=204.191.154.188
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=JzUSZhPWqNWNKTHl/0jMtxGhpz8F8LscUgrhOQUpk4Y=; b=cU4+yxkJdxAeS4yui7R8BmYTUJ
	DRYWdLNFmn4IzYyA8GI4JMvn5I+ao4YCJoKHqHlZBXELhVQOR7+rbnR5az5v/BkfQgJToWwrgHqdK
	bkyzMrds8fKOwiAy9eQt43KyjnGykPEVoAe3We6O105RJ3FqGfgbPe2c3N//eYM+RF2KlpkmplnRX
	ZyFUAT2Yl+gEox2QjrPI7AH2qNf8wELNWJcyEDHIcdGl009phubiaMKzFVqgmjyy33HlREsTWdv3X
	6RaWLz4M8MAKVnPl1dKbctoJ3kYc+JvbGJAMeQtwUQhSvSUPSEtpYv4AZtpLxXiHnJMSl2eirkvTa
	pSPZ8pZQ==;
Received: from [104.157.31.28] (helo=[192.168.1.251])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1wfO8O-000000071tG-1qho;
	Thu, 02 Jul 2026 14:35:45 -0600
Message-ID: <1cd1b832-082c-4f9c-ab68-706110ddcb25@deltatee.com>
Date: Thu, 2 Jul 2026 14:34:25 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matt Evans <matt@ozlabs.org>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kevin Tian <kevin.tian@intel.com>, Pranjal Shrivastava <praan@google.com>
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
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <aecbbc66-c154-4439-a6ae-84dc012b0f8d@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 104.157.31.28
X-SA-Exim-Rcpt-To: matt@ozlabs.org, alex@shazbot.org, leon@kernel.org, jgg@nvidia.com, amastro@fb.com, christian.koenig@amd.com, bhelgaas@google.com, kevin.tian@intel.com, praan@google.com, mngyadam@amazon.de, dmatlack@google.com, bjorn@kernel.org, sumit.semwal@linaro.org, ankita@nvidia.com, apopple@nvidia.com, vivek.kasireddy@intel.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, linux-pci@vger.kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v4 02/10] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[deltatee.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[deltatee.com:s=20200525];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:kevin.tian@intel.com,m:praan@google.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[logang@deltatee.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-66413-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[logang@deltatee.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[deltatee.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,deltatee.com:dkim,deltatee.com:email,deltatee.com:mid,deltatee.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66C226FCC68



On 2026-07-02 10:44 a.m., Matt Evans wrote:
>> So maybe at this point it's fine to enable this on 32bit systems and we
>> can remove this requirement. However, I think we should do that
>> explicitly in its own patch, not hide it in this refactoring patch.
> 
> Your question does prove it's too stealthy as-is. :)  PCI_P2PDMA still
> can't be enabled on 32-bit systems because of its ZONE_DEVICE -> 
> MEMORY_HOTPLUG -> 64BIT dependency.  So we're not enabling 32-bit 
> support for PCI_P2PDMA here, but it's not obvious and so I'll re-add the 
> `depends on 64BIT`.  At least then it won't be enabled without intention 
> if someone enables ZONE_DEVICE on 32-bit systems...

Ok, that all makes sense to me. I would be good with removing the 64BIT
dependency (as it is is a bit confusing as is) but I think adding
another patch would be appropriate with some of the commit message notes
you mentioned in your emails.

Besides that, I think you can add to this patch:

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thanks,

Logan

