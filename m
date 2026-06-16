Return-Path: <linux-media+bounces-64994-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z7/DJhM4MWrueAUAu9opvQ
	(envelope-from <linux-media+bounces-64994-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:48:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 127FE68EE99
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:48:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=by1gU48a;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64994-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64994-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09FA03036089
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142C343C07D;
	Tue, 16 Jun 2026 11:48:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90D369211;
	Tue, 16 Jun 2026 11:48:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610498; cv=none; b=bZ3m3VcGI+0OEVEjycKZoxhho/K3NORw0ZlqK003wm89AiSxxngK7AcyY1RT0VZI2XuyqcawR7UgYJzWU3MrHSa8g2Vi3jBScO8AuHMimh/b34Ysae9HXSedSkTNoMp7uzHx4rEgSgUqpfKdc3s8gFVf+WDw+NogldMLRRWZig0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610498; c=relaxed/simple;
	bh=mPuh6XTA5AG48/J010nDvu7vjHJ11jsGIAtOb9dpwKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jmy0e96YALMmT2uYZRpIjSrDba+bN0Fb7dTU9AlcmDleR1pkShQ9oJBbriNH6+OFcIahvJIdu/xAfya8VEWGbq/btrdKmpm6A15r711QB0c2nDIy+yb7Auf/8/JGlO7ehHFY4vSEr8qy1JdMCTweYIb+lJolG0Pa1L3OorRCagk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=by1gU48a; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781610494;
	bh=qE69fQEJl9oZRRpURxmwt3lhJuiBveqs8mE/8tXoWvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=by1gU48aGo9nqyknUPasVL3O8zwdmOHSX+6iTukXhGM4QwwbgMcmcBwDlt9FVkriL
	 pauByJnAOozbCvQg3RBtEUD8n8RMBhTAKH8+sVOTJCrrI9VqYq52pvetzI+uTWTa2L
	 tBBCwIb4mNYaVXhyLp2YszevLUpBDgVVwkYjgK7FqckdGH7AYklacjsIcWZtN2b7ns
	 flSw3OZpkqy7dYIdGgPtzz8pT2RDWXIOG5Eu69Q6kKayjzEURagu2YcQjFLvLho/6r
	 G6QAty/jyShc/7rIKOrNlG5rh8h+XQw5aEdNk5CvO8zMdM2hCXoGoYJFLgUj9F41KM
	 kLYr4Gy13vzyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gflc75zjFz58bH;
	Tue, 16 Jun 2026 21:48:07 +1000 (AEST)
Message-ID: <20fb245b-2dc3-482a-8c2c-a3a6864a9005@ozlabs.org>
Date: Tue, 16 Jun 2026 12:48:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Content-Language: en-GB
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
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
 <20260610154327.37758-3-matt@ozlabs.org>
 <DM6PR11MB369091A6F1E32054A95AB6788C182@DM6PR11MB3690.namprd11.prod.outlook.com>
 <4d75b948-3b74-4970-97f2-72e54f9c9694@ozlabs.org>
 <DM6PR11MB36903B0203CFFF97197676138CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <DM6PR11MB36903B0203CFFF97197676138CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-64994-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,ozlabs.org:server fail,vger.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 127FE68EE99

Hi Kevin,

On 16/06/2026 10:28, Tian, Kevin wrote:
>> From: Matt Evans <matt@ozlabs.org>
>> Sent: Tuesday, June 16, 2026 2:04 AM
>>
>> On 12/06/2026 09:42, Tian, Kevin wrote:
>>>> From: Matt Evans <matt@ozlabs.org>
>>>> Sent: Wednesday, June 10, 2026 11:43 PM
>>>>
>>>> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *priv,
>>>> +			      struct vm_area_struct *vma,
>>>> +			      unsigned long address,
>>>> +			      unsigned int order,
>>>> +			      unsigned long *out_pfn)
>>>> +{
>>>> [...]
>>>> +	 *
>>>> +	 * It's suboptimal if DMABUFs are created with neigbouring
>>> s/neigbouring/neighboring/
>> Ah, not a typo. 🙂  That is en_GB and AFAIK is permitted.
> I guess you meant 'neighbouring' and 'neighboring' are both valid.
> 
> but here lacking a 'h' should be a typo? 🙂

:D Doh!  Sure enough, you're right and that very much _is_ a typo after
all. :)


Thanks,

Matt


