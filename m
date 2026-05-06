Return-Path: <linux-media+bounces-60640-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKaXI6Nb+2mUaAMAu9opvQ
	(envelope-from <linux-media+bounces-60640-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:17:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A234DD029
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB96A302CFDB
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8255648B37F;
	Wed,  6 May 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FmnnVKGi"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACFA48AE22;
	Wed,  6 May 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080028; cv=none; b=fX9o0tCOtQOOjt63ilwnb7kOo3+5CZ+Q+lAqar8MQAXbY11+E7fQQo+udXP8LjgeZ89uGYd5+zkod/xOfk15qtO0BQW3/T9wXGc78onC+KhURMCePTHYGAhgv/c5l9E4kkJaI2lyL+85I0IrJEXSudYrYnxX3JYE1JMydsA+HXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080028; c=relaxed/simple;
	bh=0Qvkwoc6ppPEBLSk9uM5Rsgl5b8rqzzkFxSZy6MZlV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoBDnx1zdnkjkRZeQwyjd2soxWwqeUdeqhWMe0z8rPJ3zBQky+XatgXBC+p46XeV9OEWgtenpOwA2lyy0xiGTrCpxioQ052MaOFFCOHPO3cwyVWZlEDEYbjXFETgFRCWy9kfMpehTb504WaFb2RaRduhaSjzDfgPJrkIr8/viCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FmnnVKGi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1A5F1A00;
	Wed,  6 May 2026 08:06:59 -0700 (PDT)
Received: from [10.57.69.49] (unknown [10.57.69.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB7173F7B4;
	Wed,  6 May 2026 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778080025; bh=0Qvkwoc6ppPEBLSk9uM5Rsgl5b8rqzzkFxSZy6MZlV8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FmnnVKGik6Xi8qEL1+q1giTNjcCEklsr6JI2g2nwenfvZhfM3nqzgpT+RM2xxmcJC
	 xly2Z0kjShS+ZRLlyw6kV6yCShZvUoFu2DPHS+flFwwTX2uS0zZJ94JWhsqo0vVpe1
	 zeNFJykwZSUlOJaLygI3u2hyQJgsKDJ1m5jWaAZo=
Message-ID: <ed1b0be1-cf6e-4318-b040-12d315eae3f0@arm.com>
Date: Wed, 6 May 2026 16:06:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/panthor: Add freed_sz parameter to
 reclaim_priv_bos
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
 <20260506-panthor-explicit-reclaim-v1-1-44f82ac147ce@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260506-panthor-explicit-reclaim-v1-1-44f82ac147ce@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 20A234DD029
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60640-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email,arm.com:dkim,arm.com:mid]

On 06/05/2026 11:45, Nicolas Frattaroli wrote:
> panthor_mmu_reclaim_priv_bos returns the number of freed pages. However,
> how many bytes of freed memory this translates to can't generally be
> deduced from the number of pages, as the page size is a per-VM property.
> 
> It may be useful to know the exact number of bytes that have been freed

The "useful" aspect seems to just be a drm_dbg() message from what I can
see with this series? Am I missing something or is it not actually that
useful?

Thanks,
Steve

> for observability and debugging purposes. To that end, add a new
> parameter "freed_sz", which is a pointer to a size_t where this
> information will be stored. It may be NULL, in which case the
> information isn't stored at all.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c |  3 ++-
>  drivers/gpu/drm/panthor/panthor_mmu.c | 12 ++++++++++--
>  drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
>  3 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 13295d7a593d..80e82238f3c5 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -1511,7 +1511,8 @@ panthor_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>  		goto out;
>  
>  	freed += panthor_mmu_reclaim_priv_bos(ptdev, sc->nr_to_scan - freed,
> -					      &remaining, panthor_gem_try_evict);
> +					      &remaining, NULL,
> +					      panthor_gem_try_evict);
>  	if (freed >= sc->nr_to_scan)
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index a7ee14986849..b81388b35a58 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -3127,13 +3127,18 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
>  unsigned long
>  panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
>  			     unsigned int nr_to_scan, unsigned long *remaining,
> +			     size_t *freed_sz,
>  			     bool (*shrink)(struct drm_gem_object *,
>  					    struct ww_acquire_ctx *))
>  {
> +	unsigned long newly_freed;
>  	unsigned long freed = 0;
>  	LIST_HEAD(remaining_vms);
>  	LIST_HEAD(vms);
>  
> +	if (freed_sz)
> +		*freed_sz = 0;
> +
>  	mutex_lock(&ptdev->reclaim.lock);
>  	list_splice_init(&ptdev->reclaim.vms, &vms);
>  
> @@ -3152,8 +3157,11 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
>  
>  		mutex_unlock(&ptdev->reclaim.lock);
>  
> -		freed += drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
> -					  remaining, shrink, NULL);
> +		newly_freed = drm_gem_lru_scan(&vm->reclaim.lru, nr_to_scan - freed,
> +					       remaining, shrink, NULL);
> +		if (freed_sz)
> +			*freed_sz += panthor_vm_page_size(vm) * newly_freed;
> +		freed += newly_freed;
>  
>  		mutex_lock(&ptdev->reclaim.lock);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 3522fbbce369..12b18b5f90e1 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -52,6 +52,7 @@ int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo);
>  unsigned long
>  panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
>  			     unsigned int nr_to_scan, unsigned long *remaining,
> +			     size_t *freed_sz,
>  			     bool (*shrink)(struct drm_gem_object *,
>  					    struct ww_acquire_ctx *));
>  int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec,
> 


