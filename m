Return-Path: <linux-media+bounces-66848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZGk4E339TGp2tAEAu9opvQ
	(envelope-from <linux-media+bounces-66848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:22:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E626B71BD59
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:22:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=IDNSpqSx;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66848-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66848-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 418E7309D2A2
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 13:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE454189D2;
	Tue,  7 Jul 2026 13:17:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A014D29AB1A;
	Tue,  7 Jul 2026 13:17:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430262; cv=none; b=vBJbHSafsSBF1/06OXZco9kcRhXPRurW7106xf6cIRS8PzHvDPW8c4rp/9KZIYZ93MWp62+uQHtP595Cc7KJhrVzbVnI6rv4BIQ/l8U8GmCL5SyEs3VL4S5N2q9N+V/Ux4fgH93SV013e2i4l/bcC6PM5XsbfGtI98U0UXvdzsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430262; c=relaxed/simple;
	bh=c4sgJIlp41KnfkxKX5Y8adETb3Yp/G6tgwZ1bFzMLxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLfdbXVhWlqOg+ARHUd0tHKhI2cuDE17QRalXuNfMa904eauUAtMqR9cdGe8HnnF3rTm3fMcKdILkEA5C2iL0/K1q0tD411lVEm6hp9ew5yWdhLK/GfeXE5UpqO0OueeyN5CbQU2n/pqBhAkqqNvR9CdpbPhBYNFPRm6as6oaag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IDNSpqSx; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F2AF1BCA;
	Tue,  7 Jul 2026 06:17:35 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555EE3F85F;
	Tue,  7 Jul 2026 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783430259; bh=c4sgJIlp41KnfkxKX5Y8adETb3Yp/G6tgwZ1bFzMLxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IDNSpqSxtFtaWJyxD6ND7bhZDzkCBdR/qNZC+pDBu9MxOTbdwwuRp2qhdJjRMjzk3
	 YysGDLtP2ZnjwNvmBVMkMDiNbKNdfL4YoCvHcQ3PS8DF8iP9OT/GQsdjdnsUlDzODm
	 pVxQUIhnCsc/b3A1PQmyYi7EofZIIfYSBk4wEIKQ=
Message-ID: <b0a1bdd7-46ab-4025-8775-c9273892444e@arm.com>
Date: Tue, 7 Jul 2026 14:17:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] arm64/mm: Add set_memory_device() and
 set_memory_normal()
To: Will Deacon <will@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Russell King <linux@armlinux.org.uk>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-mm@kvack.org, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
 linux-trace-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 Chun Ng <chunn@nvidia.com>
References: <20260701-tegra-vpr-v3-0-d80f7b871bb4@nvidia.com>
 <20260701-tegra-vpr-v3-4-d80f7b871bb4@nvidia.com>
 <akYs91INHMXMTI-t@willie-the-truck> <akZkuwktaXFTrASP@orome>
 <akaSJ5D98w2cHqb6@orome> <akftuw9NyRy36fXA@willie-the-truck>
 <akuvyu1Pq0ZVMZV0@orome> <akzikTrmhMsvkNVY@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <akzikTrmhMsvkNVY@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,bootlin.com,rasmusvillemoes.dk,armlinux.org.uk,linux.ibm.com,linux-foundation.org,infradead.org,google.com,suse.com,samsung.com,linaro.org,collabora.com,arm.com,amd.com,goodmis.org,efficios.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66848-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[robin.murphy@arm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:thierry.reding@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonathanh@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mperttunen@nvidia.com,m:yury.norov@gmail.com,m:linux@rasmusvillemoes.dk,m:linux@armlinux.org.uk,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:m.szyprowski@samsung.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:catali
 n.marinas@arm.com,m:thierry.reding@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-trace-kernel@vger.kernel.org,m:treding@nvidia.com,m:chunn@nvidia.com,m:krzk@kernel.org,m:conor@kernel.org,m:yurynorov@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[56];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:dkim,arm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E626B71BD59

On 07/07/2026 12:27 pm, Will Deacon wrote:
> On Mon, Jul 06, 2026 at 03:49:24PM +0200, Thierry Reding wrote:
>> On Fri, Jul 03, 2026 at 06:13:31PM +0100, Will Deacon wrote:
>>> On Thu, Jul 02, 2026 at 06:41:23PM +0200, Thierry Reding wrote:
>>>> On Thu, Jul 02, 2026 at 03:46:44PM +0200, Thierry Reding wrote:
>>>>> On Thu, Jul 02, 2026 at 10:18:47AM +0100, Will Deacon wrote:
>>>>>> On Wed, Jul 01, 2026 at 06:08:15PM +0200, Thierry Reding wrote:
>>>>>>> From: Chun Ng <chunn@nvidia.com>
>>>>>>>
>>>>>>> Add helpers to swap PROT_NORMAL and PROT_DEVICE_nGnRnE protection bits
>>>>>>> on a kernel-linear-map range.
>>>>>>
>>>>>> That sounds like a really terrible idea. Why is this necessary and how
>>>>>> does it interact with things like load_unaligned_zeropad()?
>>>>>
>>>>> This is necessary because once the memory controller has walled off the
>>>>> new memory region the CPU must not access it under any circumstances or
>>>>> it'll cause the CPU to lock up (I think technically it'll hit an SError
>>>>> but in practice that just means it'll freeze, as far as I can tell).
>>>>>
>>>>> Probably doesn't interact well at all with load_unaligned_zeropad().
>>>>>
>>>>>> I think you should unmap the memory from the linear map and memremap()
>>>>>> it instead.
>>>>>
>>>>> Given that the memory can never be accessed by the CPU after the memory
>>>>> controller locks it down, I don't think we'll even need memremap(). The
>>>>> only thing we really need is the sg_table we hand out via the DMA BUFs
>>>>> so that they can be used by device drivers to program their DMA engines
>>>>> internally.
>>>>>
>>>>> Looking through some of the architecture code around this, shouldn't we
>>>>> simply be using set_memory_encrypted() and set_memory_decrypted() for
>>>>> this? While they might've been created for slightly other use-cases,
>>>>> they seem to be doing exactly what we want (i.e. remove the page range
>>>>> from the linear mapping and flushing it, or restoring the valid bit and
>>>>> standard permissions, respectively).
>>>>
>>>> Ah... I guess we can't do it because we're not in a realm world and so
>>>> the early checks in __set_memory_enc_dec() would return early and turn
>>>> it into a no-op.
>>>>
>>>> How about if I extract a common helper and provide set_memory_p() and
>>>> set_memory_np() in terms of those. Those are available on x86 and
>>>> PowerPC as well, so fairly standard. I suppose at that point we're
>>>> closer to set_memory_valid().
>>>
>>> Why not just call set_direct_map_invalid_noflush() +
>>> flush_tlb_kernel_range() for each page? We already have APIs for this.
>>
>> Having a "standard" helper with a fixed and documented purposed seemed
>> like a preferable approach for this particular case. We also may want to
>> make the driver that uses this buildable as a module, in which case we'd
>> need to export these rather low-level APIs. And then there's also the
>> fact that we typically call this on a rather large region of memory
>> (usually something like 512 MiB), so doing it page-by-page is rather
>> suboptimal.
>>
>>> The big challenge I see with any linear map manipulation, however, is
>>> that it will rely on can_set_direct_map() which likely means you need to
>>> give up some performance and/or security to make this work. Does memory
>>> become inaccesible dynamically at runtime? If not, the best bet would
>>> be to describe it as a carveout in the DT and mark it as "no-map" so
>>> we avoid mapping it in the first place.
>>
>> VPR exists in two modes: static and resizable. For static VPR we do
>> exactly that: describe it as carveout in DT with no-map and deal with it
>> accordingly in the driver. Resizable VPR is for device that have small
>> amounts of RAM. Content-protected video playback will in the worst case
>> consume around 1.8 GiB of RAM, so we want to be able to reuse for other
>> purposes when VPR is unused on those devices. In that case, the memory
>> is also described as a reserved-memory region in DT, but it is marked as
>> reusable so that it can be managed by CMA.
>>
>> The resize operation is fairly slow to begin with because we need to
>> stall the GPU and put it into reset before the operation, then take it
>> out of reset and resume it afterwards.
>>
>> What kind of performance impact do you expect?
> 
> You'll need to measure it, but we've seen reports of double-digit
> percentage regressions in performance and power. As I said, the problem
> is that you need to split the linear map to 4k page at runtime to unmap
> the dynamic carveout, but that isn't something that can be done on most
> CPUs. Therefore you end up having to use page-granular mappings for the
> entire thing, similarly to how 'rodata_full' drives can_set_direct_map()
> and the perf/power hit affects everything.
> 
> It's hard to know what to suggest... I wonder if any of the memory
> hotplug logic could help here?

Given the precedent of memblock_mark_nomap(), as long as the reusable 
reserved-memory regions also get split into distinct memblocks, then it 
seems like in principle we ought to be able to give them a new 
MEMBLOCK_PTEMAP (or whatever) flag which could then be picked up in 
map_mem() without needing to override force_pte_mapping() globally?

Cheers,
Robin.

