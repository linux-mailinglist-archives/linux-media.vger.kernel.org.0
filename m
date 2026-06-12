Return-Path: <linux-media+bounces-64704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tt/kByoiLGr5LwQAu9opvQ
	(envelope-from <linux-media+bounces-64704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:13:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E667A708
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 17:13:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=ZYW3AYN2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64704-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64704-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 018F63204668
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C1832938D;
	Fri, 12 Jun 2026 15:12:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAC3655F8;
	Fri, 12 Jun 2026 15:12:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781277123; cv=none; b=QM3kMzwjc4u4mpae8x2DNXW/tSZTAQc4kqVRpd8FWAPR0YIzReYAHB6rk/lr3qLkf9ti4DQocyY992mINI3BenWNKwNdhur0OGjIUdKqY79LNpk42ARjB5/RuEVolQtZcs1gf8p+CwuZcmOpMKwOJ9QV8876EWpTeA16f7mKFPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781277123; c=relaxed/simple;
	bh=o4KcHRNvaIyu1tEyQ6IRhWCABIHtasjqpYY7jt9/K6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMWM3LfT5qB2ikrdfj1BP3ibrY7GHFvxTWrMK9r967oNT4L8+1OPfN3h5ff7Dzx4L2V4CBLW4xI0VV7+Z5i7Xnsw7mPcXxByLe4DFbblsWs1Rw4m+r/+iNWoTQpWH+i4FKMJspDb5Ja5bm80z959ZsrC1CdkGg4r7vw+NU+cRPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=ZYW3AYN2; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781277119;
	bh=LGhEStMN1twSMyySBf4VeZi6kVB0lNhii41/7Nxgj/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZYW3AYN2lt0C4fdn5658+N+D5H4ZMpvntD3tZcbQEQ1G1COmkwUF0bYZ/2Ch/N5GA
	 btIJVKOyRJuZI95bEHMsLm3BDQDiWnrTiwYJ1slrBLhFqv0X5u0ASOM2VjrU6tNvDD
	 77qSt3c+ldoLWD1PJzc4aiyTB3OXRtWxcqNYuRTtaaBVm6eGBFDjs1Of0qNtOqT8Et
	 Xq2d6uDzfUf7ZT857fqdvMYnnVsdwi2ACxBnLpiybGowDBvlYUIcBf/O17+TxsCa+l
	 dser9fVVvhuSttx+faBPPLtTv5hgYgE1gs14upSe07vZa5kGsr5APAv6Ugh6mSe0So
	 1BMC3+miyrxPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gcNK46vZgz4x6q;
	Sat, 13 Jun 2026 01:11:52 +1000 (AEST)
Message-ID: <9812ae0f-8f22-4d62-a706-4c7232a5656b@ozlabs.org>
Date: Fri, 12 Jun 2026 16:11:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] vfio/pci: Add mmap() for DMABUFs
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
 <DM6PR11MB3690A65EA9D8A9B77AF93E198C182@DM6PR11MB3690.namprd11.prod.outlook.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <DM6PR11MB3690A65EA9D8A9B77AF93E198C182@DM6PR11MB3690.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64704-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B4E667A708

Hi Kevin,

On 12/06/2026 09:27, Tian, Kevin wrote:
>> From: Matt Evans <matt@ozlabs.org>
>> Sent: Wednesday, June 10, 2026 11:43 PM
>>
> [...]
>>
>>  vfio/pci: Support mmap() of a VFIO DMABUF
>>
>>    Adds mmap() for a DMABUF fd exported from vfio-pci.
>>
>>    It was a goal to keep the VFIO device fd lifetime behaviour
>>    unchanged with respect to the DMABUFs.  An application can close
>>    all device fds, and this will revoke/clean up all DMABUFs; no
>>    mappings or other access can be performed now.  When enabling
>>    mmap() of the DMABUFs, this means access through the VMA is also
>>    revoked.  This complicates the fault handler because whilst the
>>    DMABUF exists, it has no guarantee that the corresponding VFIO
>>    device is still alive.  Adds synchronisation ensuring the vdev is
>>    available before vdev->memory_lock is touched; this holds the
>>    device registration so that even if the buffer has been cleaned up,
>>    vdev hasn't been freed and so the lock can be safely taken.
>>
>>    This commit makes VFIO_PCI_CORE depend on PCI_P2PDMA_CORE
>> (commit
>>    1) to bring in (only) the P2PDMA provider code.
> 
> the last sentence is stale as the dependency is now added in patch4.

Right, will fix.

>>
>> End
>> ===
>>
>> This is based on VFIO next (e.g. at b9285405c5f6).
>>
> 
> Sashiko failed to apply this series. Is there dependent work in vfio-next?
> 
> otherwise getting a Sashiko review is helpful here.

It _did_ depend on (at least the context of) some fixes in vfio-next.
Looks like it'll rebase on master now those are merged.  I should've
re-checked this for v3, oops. :|

(FWIW, I had Robot Claude Opus 4.8 to review several times up to v3.
But I agree, Sashiko would be interesting too.  Can it be manually
triggered with branch guidance?)


Thanks,


Matt



