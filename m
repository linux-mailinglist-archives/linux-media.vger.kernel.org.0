Return-Path: <linux-media+bounces-60651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO6sN1xm+2kzawMAu9opvQ
	(envelope-from <linux-media+bounces-60651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:03:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B94DDCBF
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0347330C0602
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBF949690E;
	Wed,  6 May 2026 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OP8+PNR9"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E04494A19;
	Wed,  6 May 2026 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082952; cv=none; b=XqinJXXWDLdTiVeVALVXnhsC8fM/PJfnUKSxwLJbK6tAEyBwLX+GOaNN1cwQ+oCiPFkLz8ZnG3Bimu19lQQhdKUGG3hug9iazSq0+G47//eDWeYZw2iHilCsGjR8QZdKwjDZNMwFU3eWdkLWuz+d9h2R4F5H7bmLlnjuhh/X8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082952; c=relaxed/simple;
	bh=yx44QsR+dr0wp1FGWIHshhf2FouszWxeHYwpeS2FZdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3i/c7kNlyWU+PIlqYOQo06YctKoTlhnoJVRamepVhKhcDOuaZWK4zJ/iNVAchF3tay0ADUoAagEnNS5E9TtFOUViIkCjk2pVRqqBboG02irBZ9wv2vyDGpl4A5009ud7ecAoR3eSGoQUzPD/OTZCxdVA5GjHu702QepHd+cIUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OP8+PNR9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F74D1A00;
	Wed,  6 May 2026 08:55:42 -0700 (PDT)
Received: from [10.57.69.49] (unknown [10.57.69.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAE7A3F7B4;
	Wed,  6 May 2026 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778082947; bh=yx44QsR+dr0wp1FGWIHshhf2FouszWxeHYwpeS2FZdA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OP8+PNR9HAAL7fsQC1pkWVwQFHDeoeuWGPOUMiDIZm2DfhnHN1KIfEHs0OrIRvYaz
	 xZSj4xf4c/FtDLNgS6E19u5T/pdKEJmw6oI8rUcTk9jiwZCAJ5g1QeRXU4zdbx5elF
	 cN/N/QgEV5oR424hZ7qnkvgDAFMaE0jWBZz6r+J8=
Message-ID: <b3c98120-2493-46a5-a48c-d90c31cf25c0@arm.com>
Date: Wed, 6 May 2026 16:55:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Let userspace explicitly trigger memory reclaims
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
 <829b8887-48de-4cfa-8bb2-79db1471bb8d@arm.com>
 <qxAaM8FMQLuQt09qti64IA@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <qxAaM8FMQLuQt09qti64IA@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7C1B94DDCBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60651-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]

On 06/05/2026 16:43, Nicolas Frattaroli wrote:
> On Wednesday, 6 May 2026 17:06:56 Central European Summer Time Steven Price wrote:
>> On 06/05/2026 11:45, Nicolas Frattaroli wrote:
>>> RAM is not, in fact, cheap. Especially on embedded systems with a low
>>> amount of memory, but known and well-defined userspace, more explicit
>>> resource management can lead to better utilisation patterns. As an
>>> example, a resource manager process on a purpose-built device may wish
>>> to launch, and then explicitly swap out, memory of processes that are
>>> kept "warm", to improve perceived startup latency of individual
>>> full-screen applications without making the kernel figure out the usage
>>> pattern from observation alone in order to swap out the right pages.
>>
>> Have you considered memory control groups (memcg) for this purpose?
>> Imposing a lower limit than currently allocated should trigger reclaim,
>> so 'background' applications could have the limit lowered and then
>> restored when moved to the foreground.
> 
> This is a suggestion in line with what I've made to the entity for
> whom I am adding this, but was told that for them they really do want
> tight control without having to use cgroups into technically doing it
> by dynamically adjusting the limits of them.
> 
> I do think that writing 0 to `memory.high` to swap it out and `"max"`
> to allow it to swap back in might work, though that'll then apply to
> all of the process' memory, not just the GPU resources.
> 
> I will ask for clarification internally.

Thanks, it would be good to have a better understanding of why GPU
memory is special (and needs to be paged out) and the process' other
memory can be kept.

>>
>>> To allow for this explicit control in the context of panthor's GPU
>>> memory, add two new sysfs knobs. The first, mem_reclaim, runs an
>>> explicit priv BO reclaim cycle on the TGID written to it.
>>>
>>> The second, mem_claim, does the opposite: it swaps BOs back into active
>>> memory.
>>
>> How necessary is this mem_claim for performance? Have you done any
>> benchmarking of explicitly claiming vs just allowing it to happen
>> naturally? My gut feeling is that mem_claim should be unnecessary in
>> most situations, but I'm prepared to be proved wrong.
> 
> I've done no benchmarking, but can do so if you have any preferred
> workloads for this. Since we have to keep entire groups either in
> memory or out of memory right now AFAIK, I don't expect this to be
> very beneficial at all. At most we avoid a single fault I think.

Yes the memory should be brought back in as soon as a job is submitted.
I've no particular workloads in mind - but it would be nice to be able
to point to something that actually improves by adding this feature.

> I can drop the mem_claim part, though it may become relevant if we
> ever have more fine-grained memory eviction where a single job or
> group can run into multiple faults before everything it needs to
> render a new frame is back in memory. In that case, it will be
> beneficial, because it avoids doing the swap-in dance several
> times while the user wonders why the UI is rendering at powerpoint
> speeds as it touches memory pages that are still swapped out during
> subsequent frames.

We don't want to be faulting memory in a page at a time for exactly the
reasons you state. So even if we do make things more fine-grained we're
going to have to implement some form of read-ahead. Otherwise it's
"powerpoint time" after any even that causes memory pressure.

A possible justification is if the system can tell an application is
about to be used and can "pre-fault" things before rendering starts. But
it's a rare system design where it has this form of precognition.

Thanks,
Steve

>>
>> I'm not saying this series is necessarily the wrong approach - but I
>> think we need a bit more justification for adding a new API for this.
>>
>> Thanks,
>> Steve
> 
> Kind regards,
> Nicolas Frattaroli
> 
>>
>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>> ---
>>> Nicolas Frattaroli (4):
>>>       drm/panthor: Add freed_sz parameter to reclaim_priv_bos
>>>       MAINTAINERS: Add sysfs ABI docs to list of panthor files
>>>       drm/panthor: Add explicit memory reclaim sysfs knob
>>>       drm/panthor: Add explicit memory claim sysfs knob
>>>
>>>  Documentation/ABI/testing/sysfs-driver-panthor-mem | 34 ++++++++
>>>  MAINTAINERS                                        |  1 +
>>>  drivers/gpu/drm/panthor/panthor_drv.c              | 93 ++++++++++++++++++++++
>>>  drivers/gpu/drm/panthor/panthor_gem.c              |  7 +-
>>>  drivers/gpu/drm/panthor/panthor_gem.h              |  1 +
>>>  drivers/gpu/drm/panthor/panthor_mmu.c              | 70 +++++++++++++++-
>>>  drivers/gpu/drm/panthor/panthor_mmu.h              |  4 +
>>>  7 files changed, 205 insertions(+), 5 deletions(-)
>>> ---
>>> base-commit: 2c4b906cd135bbb44855287d0d0eff0ee0b47afe
>>> change-id: 20260506-panthor-explicit-reclaim-3dffed028d8c
>>>
>>> Best regards,
>>> --  
>>> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>>
>>
>>
> 
> 
> 
> 


