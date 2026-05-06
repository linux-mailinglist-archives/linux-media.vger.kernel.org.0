Return-Path: <linux-media+bounces-60639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI9iFmla+2kuZwMAu9opvQ
	(envelope-from <linux-media+bounces-60639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:12:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A001B4DCF58
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF650302DA13
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A59A48B364;
	Wed,  6 May 2026 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NcQbZM4P"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9076047DD74;
	Wed,  6 May 2026 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080025; cv=none; b=CcsD9Rg8oTPIxTGNKj4SVKEPV0ZDXpCRRihvmFtGF3AN2LCRdHFttybxXimjejSENQynzV5YhX85CTjb2XIFJrulZjfU49WH8+L7lE9i9L/bULc/F3z3W5jv++AzL/LN6+GdPhnF19OwoanbSfI0gDSmCYusHjxgvyFq8hZ6H30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080025; c=relaxed/simple;
	bh=lBGCayGvLObt4utL3x/Gntz0gbSLpK2Kdmd/cyJzcXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHfkEf2LnjDq8scF4+aPanNK/WrfeklCRyVRIV49ZfXMhlJBC96PWugFgDrlRTSSPLaSpPGrqGw+zWNthqhY9i7NbZETj3zgojRoGJMW2VjYKqPbuJF0wX6fB9KVanmnC4A1YyvPzOGGyr30vJxZSO28afk4ZC7hz2XL97BA3yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NcQbZM4P; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 284A919F6;
	Wed,  6 May 2026 08:06:57 -0700 (PDT)
Received: from [10.57.69.49] (unknown [10.57.69.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A5703F7B4;
	Wed,  6 May 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778080022; bh=lBGCayGvLObt4utL3x/Gntz0gbSLpK2Kdmd/cyJzcXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NcQbZM4Pxnep1uNs1Um11J1hVT4lQXEnAMaOkFxE3oksqybNtjvFrceF/FnFfkn9g
	 jh8S5taoT7IRtqSRtBPfp9E+d0EAnUFMSexiz68GGXUka5oKG0UUBLCj/XQiyWb2wF
	 +NbXo5ZBqYWbUaGmo2Hfzo5bVWF1ITcgQzm7dHLc=
Message-ID: <829b8887-48de-4cfa-8bb2-79db1471bb8d@arm.com>
Date: Wed, 6 May 2026 16:06:56 +0100
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
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A001B4DCF58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60639-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim,arm.com:mid]

On 06/05/2026 11:45, Nicolas Frattaroli wrote:
> RAM is not, in fact, cheap. Especially on embedded systems with a low
> amount of memory, but known and well-defined userspace, more explicit
> resource management can lead to better utilisation patterns. As an
> example, a resource manager process on a purpose-built device may wish
> to launch, and then explicitly swap out, memory of processes that are
> kept "warm", to improve perceived startup latency of individual
> full-screen applications without making the kernel figure out the usage
> pattern from observation alone in order to swap out the right pages.

Have you considered memory control groups (memcg) for this purpose?
Imposing a lower limit than currently allocated should trigger reclaim,
so 'background' applications could have the limit lowered and then
restored when moved to the foreground.

> To allow for this explicit control in the context of panthor's GPU
> memory, add two new sysfs knobs. The first, mem_reclaim, runs an
> explicit priv BO reclaim cycle on the TGID written to it.
> 
> The second, mem_claim, does the opposite: it swaps BOs back into active
> memory.

How necessary is this mem_claim for performance? Have you done any
benchmarking of explicitly claiming vs just allowing it to happen
naturally? My gut feeling is that mem_claim should be unnecessary in
most situations, but I'm prepared to be proved wrong.

I'm not saying this series is necessarily the wrong approach - but I
think we need a bit more justification for adding a new API for this.

Thanks,
Steve

> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Nicolas Frattaroli (4):
>       drm/panthor: Add freed_sz parameter to reclaim_priv_bos
>       MAINTAINERS: Add sysfs ABI docs to list of panthor files
>       drm/panthor: Add explicit memory reclaim sysfs knob
>       drm/panthor: Add explicit memory claim sysfs knob
> 
>  Documentation/ABI/testing/sysfs-driver-panthor-mem | 34 ++++++++
>  MAINTAINERS                                        |  1 +
>  drivers/gpu/drm/panthor/panthor_drv.c              | 93 ++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.c              |  7 +-
>  drivers/gpu/drm/panthor/panthor_gem.h              |  1 +
>  drivers/gpu/drm/panthor/panthor_mmu.c              | 70 +++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_mmu.h              |  4 +
>  7 files changed, 205 insertions(+), 5 deletions(-)
> ---
> base-commit: 2c4b906cd135bbb44855287d0d0eff0ee0b47afe
> change-id: 20260506-panthor-explicit-reclaim-3dffed028d8c
> 
> Best regards,
> --  
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 


