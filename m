Return-Path: <linux-media+bounces-67101-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c9xfK7E4T2pzcQIAu9opvQ
	(envelope-from <linux-media+bounces-67101-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 07:59:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9072CEFC
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 07:59:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=YG6NrUKP;
	dmarc=pass (policy=none) header.from=samsung.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67101-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67101-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D0223028012
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 05:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8193AE194;
	Thu,  9 Jul 2026 05:56:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39C3ACA54;
	Thu,  9 Jul 2026 05:56:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576614; cv=none; b=Ki7/+p3vvspbtXnh8490HMz7P68X2CSGBpeFeHOzR9BwrLnz+8c56fw3Q3136GN6B9Hew7TILu6s15W10qXMVtIOltO9Y1MS5x1qeW0y7rc1GnMl90Ky42qbMsC8sihDFubtdllKmq8fDSAXpf4cYqdB3VcN0bkgP8eLtnJgPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576614; c=relaxed/simple;
	bh=yWBPkKzs783mUEzWAbniSemwEzrqyPrMZEl2J3lxHyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Yru9V1C52Tfet91wXBslqbjtXU9EhftfVa3Et2X0SWxU88WkRIYuN23Eagt/eIBt6NzpbXV1Jqnj/apoUGjGIZpwhQyoFKFd/RI8f+Q8ZdYL4sN6EvpCLbInZWXk+OP3hfM0Y/mW425HBcl1Pd2BL4Q1xX+6LvfWnOhJGlzZt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YG6NrUKP; arc=none smtp.client-ip=210.118.77.12
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260709055650euoutp025a12a0c6f53f1597c081fde8840d680e~AiXozFXMg0222702227euoutp02U;
	Thu,  9 Jul 2026 05:56:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260709055650euoutp025a12a0c6f53f1597c081fde8840d680e~AiXozFXMg0222702227euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783576610;
	bh=0zn1dtIX1zk4qdGW1lihLluLd2XJtl/1EEzMzw8sXVc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YG6NrUKPsBwqBvMGbjU5xWHF+nu3KR5nOX3x74qWn9o7ulsLODQrO0+6rPDBK/gpN
	 1aWd1EwavrpW47dURG/rZPG1Z8lkEaDbZyuKetZ8FW+4NfqXLobtjcACnZ9jgKwdIK
	 6ZKTeq786aUMJpm83Q1TIX+j/ImTlbLRjVWgi5yM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260709055650eucas1p215ba97832f0fed53c1c322ecf192ff45~AiXoi0Jv90198801988eucas1p2U;
	Thu,  9 Jul 2026 05:56:50 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260709055646eusmtip2b9b69a8f7af4b283ece88d085252d254~AiXlAfqwT0885208852eusmtip2U;
	Thu,  9 Jul 2026 05:56:46 +0000 (GMT)
Message-ID: <83e5e74d-7106-4e14-9d10-56438372f6a3@samsung.com>
Date: Thu, 9 Jul 2026 07:56:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 06/11] mm/cma: Allow dynamically creating CMA areas
To: "David Hildenbrand (Arm)" <david@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan
	Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Yury
	Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Lorenzo
	Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
	Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
	Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Robin
	Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
	<Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T.J. Mercier"
	<tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, Masami
	Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org, iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org, linux-trace-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <e212caac-6c30-448a-9e10-32fff8b842f6@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260709055650eucas1p215ba97832f0fed53c1c322ecf192ff45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c
X-EPHeader: CA
X-CMS-RootMailID: 20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
	<CGME20260701160902eucas1p1214af933ba0f54b85630a3a4e5a4689c@eucas1p1.samsung.com>
	<20260701-tegra-vpr-v3-6-d80f7b871bb4@nvidia.com>
	<3f47aeab-33b1-4966-a5ce-5d6d5261e0e2@samsung.com>
	<e212caac-6c30-448a-9e10-32fff8b842f6@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67101-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com,rasmusvillemoes.dk,armlinux.org.uk,linux.ibm.com,linux-foundation.org,infradead.org,google.com,suse.com,arm.com,linaro.org,collabora.com,amd.com,goodmis.org,efficios.com];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:thierry.reding@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonathanh@nvidia.com,m:mperttunen@nvidia.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux@armlinux.org.uk,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:robin.murphy@arm.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:
 linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-trace-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BE9072CEFC

On 08.07.2026 10:35, David Hildenbrand (Arm) wrote:
> On 7/7/26 12:02, Marek Szyprowski wrote:
>> On 01.07.2026 18:08, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> There is no technical reason why there should be a limited number of CMA
>>> regions, so extract some code into helpers and use them to create extra
>>> functions (cma_create() and cma_free()) that allow creating and freeing,
>>> respectively, CMA regions dynamically at runtime.
>>
>> Well, the technical reason for not creating cma regions dynamically at
>> runtime is that on some architectures (like 32bit ARM) the early fixup
>> for the region is needed to make it functional for DMA.
> Can you point me at the code that does that? Thanks!
Check dma_contiguous_early_fixup() and dma_contiguous_remap() in 
arch/arm/mm/dma-mapping.c. Those functions ensures that the CPU mappings for
the CMA reserved region in linear map are remapped with 4k pages instead
of the 1M sections, so later, it will be possible to alter the mappings and
change them to coherent when needed (altering 1M sections is not possible,
because each process has it's own level-1 array even for the kernel linear
mapping).



However, in the use case in this patchset the reserved region is only shared
with buddy allocator by using the CMA infrastructure, not registered to the
regular DMA-mapping API, so it would work fine. I'm not convinced that this
is the right API to use for this though.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


