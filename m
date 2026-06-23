Return-Path: <linux-media+bounces-65463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A3TkAV9pOmrE8QcAu9opvQ
	(envelope-from <linux-media+bounces-65463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:09:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4956B68FE
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:09:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=cMqCQd61;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65463-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65463-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C6D307E6B0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F212F3D3CF0;
	Tue, 23 Jun 2026 11:08:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8CE26AE5;
	Tue, 23 Jun 2026 11:08:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212936; cv=none; b=gB57dAoZ0kJfpJMSPY2Gtfyb0NRYx5nSbsRNXTZwfqtPXxaz0VgzybMHxZ0nAFJMVjBVIyUwJEHWo3U78FZm1pp+3v5fhyYj080GkIPc9RljqtYl+vD0zk/d9U2f0pBTFHs5ovLo6N+4IVEkfaB1e3e3etZRGqbiJmLQhOEEhb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212936; c=relaxed/simple;
	bh=q+Epg0ImzR9Bi5UQ+cuzeaeWabiHBPkRgrmaxy17Wug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqzQmnvYTS9STO9sX7PLOEDPnk9aH5SG2EffC9GWbp2h4OymxJCMCDJMj830blwc3yGaKoFtvGPiqYqfMIGE4Cnyx0QbfYsdnqj7hKzyN8wbMsLWhL0Sxpmc/S9cKbFaNfJHrQ6y3+wJjFMYeGRGlHaVBInKJRKpvpCHbv61N8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=cMqCQd61; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1782212926;
	bh=oRLUVj38EuP2J4LoI+n0itLP4n8PZdzZFqOvvhcE7RM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cMqCQd61to2RMTd50gLHX4EQRg3EY1Ev62PA5OfCA0InlQQm+x4R3uC7ywQPH7iUv
	 803WdO3/IU3lp8pwyDKc+okPSmbv0MCJLy7CVJqjujc/JG4fdo09YAH9D8KFz30RdZ
	 flm1600i9mpfJRzgHwtZ9RI3mQTVnq/jH/dhsUIaVpH9ywYwCjchyZCeVu+o5zgf8i
	 do24J3BlR6G4shCvdxS0WOcZH4ac3Ww9YZpZ97O66TTqfP+KYBfgExQzAstlDwsbYy
	 eihexuWI6xPt68gtW3rUA1ucdenrQ95aDce/5r0blkPKmwFVzJlx3zKj/KZ6S0mILM
	 r/DO6cqLEjvqg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gl2PJ2QFPz4wCJ;
	Tue, 23 Jun 2026 21:08:35 +1000 (AEST)
Message-ID: <fbb2b1a6-594f-48eb-887f-7cf0cdd4c336@ozlabs.org>
Date: Tue, 23 Jun 2026 12:08:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Content-Language: en-GB
To: Alex Williamson <alex@shazbot.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Pranjal Shrivastava <praan@google.com>, Leon Romanovsky <leon@kernel.org>,
 Alex Mastro <amastro@fb.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Mahmoud Adam <mngyadam@amazon.de>,
 David Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Ankit Agrawal <ankita@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org> <aixgZQiBQKgS7yIM@google.com>
 <DM6PR11MB3690489DB5FA611413BF60558CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
 <ajGbRE3WWJxNxcrg@google.com>
 <BYAPR11MB3687AE280241C9E00B46FCF98CE42@BYAPR11MB3687.namprd11.prod.outlook.com>
 <24f34e59-7c3b-4b56-83bf-cb07e3f369a6@ozlabs.org>
 <20260619133116.GB278945@nvidia.com>
 <55ea7422-08d8-4c92-aa59-8ff6f9e9d781@ozlabs.org>
 <20260622171336.7d13f548@shazbot.org>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <20260622171336.7d13f548@shazbot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-65463-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:jgg@nvidia.com,m:kevin.tian@intel.com,m:praan@google.com,m:leon@kernel.org,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A4956B68FE

Hi Alex,

On 23/06/2026 00:13, Alex Williamson wrote:
> On Fri, 19 Jun 2026 16:13:17 +0100
> Matt Evans <matt@ozlabs.org> wrote:
> 
>> Hi Jason,
>>
>> On 19/06/2026 14:31, Jason Gunthorpe wrote:
>>> On Thu, Jun 18, 2026 at 05:02:58PM +0100, Matt Evans wrote:
>>>   
>>>> My understanding is that the sequences above wake a device that happens
>>>> to have previously been put into D3, and AFAICT it could only have got
>>>> there because of a previous vfio_pci_set_power_state().  Seems its only
>>>> caller is from the emulation of PCI_PM_CTRL using
>>>> vfio_lock_and_set_power_state(), and this zaps/revokes BAR access before
>>>> a transition to D3.  Similarly, an attempt to access a BAR via an
>>>> ioctl/through vfio_pci_core_do_io_rw() fails the D3 check in
>>>> __vfio_pci_memory_enabled(), and besides will try to take the memory_lock.  
>>>
>>> I thought the general design was the bars were made inaccessible
>>> before going to a low power state, and remain inaccessible while it is
>>> in low power?
>>>
>>> So the order of D0 doesn't matter. If it is not in D0 then there is no
>>> mappings and zap/revoke is a NOP.
>>>
>>> If is it in D0 then it doesn't matter because D0 is a nop.  
>> Yes, that's what I'm getting at. :)  If it's in D3 then BARs are
>> inaccessible, so as long as we go into D0 before the DMABUF move, the
>> order of the zap relative to the "go to D0" doesn't matter.
> 
> I believe this is correct as well, but importantly we cannot assume
> that a stray read or write just returns -1 or gets dropped.  This is
> exactly why we have such hard protections against the user accessing
> the device while it's disabled.  Not all platforms, even within
> architectures that might otherwise be considered lenient of such
> accesses, consider this benign and might escalate to system level
> faults.

We are in enthusiastic agreement here.

> Let's be careful not to frame this as "the access doesn't matter
> anyway", the answer is instead that non-D0 devices already lack any
> mappings to access the device.  Thanks,

I agree that is not the right thing to say, for exactly that reason.
(For avoidance of any doubt, I didn't say that :) )

Thanks for confirming the behaviour.  I hope Praan and Kevin are
satisfied that this patch doesn't cause the issues they first worried
about (the changed order of the zap relative to the D0 transition
doesn't have a detrimental effect because of the existing inaccessibility).

Alex, I'll post v4 soon, but if you have any comments in the pipeline
please shout and I'll hold off awhile.


Thanks,


Matt


