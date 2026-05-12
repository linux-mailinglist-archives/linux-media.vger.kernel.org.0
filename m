Return-Path: <linux-media+bounces-61267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHW/Nj0wA2qN1QEAu9opvQ
	(envelope-from <linux-media+bounces-61267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:50:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D506521AA1
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D97E4306BDE2
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB317395AC6;
	Tue, 12 May 2026 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Np6KRkZG"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C96A1A6824
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593068; cv=none; b=qq3GzGwQTKQ0fJx9UOKU4fEwiaJt3UqZFo4KncC5jmqkn9Eo6Atd/QRjlFY5JtqV82WYvMnBRW5AKrN6+mWyCmji4Y9XEbQfo+FUNCJNynuU3YlzIHKWTNBB72iXstFpAVr5xpMSkR9K/O2yHGOyGQCLePq3O/q4sL3JKITnHtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593068; c=relaxed/simple;
	bh=Gvl4cEd1ZiXBIpJHrKLmqu+T8vzwYIr7JhCY27iDUns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhdaXpdXWhWUOyzOUQujw5nSXI8e7nrAygk30yq+RPPd6D4Tj8cJJQlHcDFyzIFKFfvXO/z+EmcaKZXSRFxYhlIDmVe4wf96vYFNNFmwaaVgSLG+dCfrqjUa7T5g0UvWpOJ9iVknswacI5UNWAU0O6QpbIG6/qwiN6/fgAyRHHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Np6KRkZG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6E6E3029
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:37:40 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA6953F85F
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778593065; bh=Gvl4cEd1ZiXBIpJHrKLmqu+T8vzwYIr7JhCY27iDUns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Np6KRkZGTDStGBs9EMDF9DyPzP8ZKmy4R3rgp1HdwgT8zCcxCzns/m4g6D8s5NiIm
	 kqVX8itwNmGkvoFP9iovANcSHw2JrL70pvjlJAWQerv20tPv2AoF0XznkASncqhs1v
	 /Q+0kdnVrdAPhlK5LDTv8mwIcSiu7hi+ZkBZHR80=
Date: Tue, 12 May 2026 14:37:21 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/8] drm/panthor: De-duplicate FW memory section sync
Message-ID: <agMtEXOqPGEwKuwt@e142607>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-4-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505140516.1372388-4-ketil.johnsen@arm.com>
X-Rspamd-Queue-Id: 9D506521AA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61267-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 04:05:09PM +0200, Ketil Johnsen wrote:
> Handle the sync to device of FW memory sections inside
> panthor_fw_init_section_mem() so that the callers do not have to.
> 
> This small improvement is also critical for protected FW sections,
> so we avoid issuing memory transactions to protected memory from
> CPU running in normal mode.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index be0da5b1f3abf..0d07a133dc3af 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -446,6 +446,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
>  					struct panthor_fw_section *section)
>  {
>  	bool was_mapped = !!section->mem->kmap;
> +	struct sg_table *sgt;
>  	int ret;
>  
>  	if (!section->data.size &&
> @@ -464,6 +465,11 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
>  
>  	if (!was_mapped)
>  		panthor_kernel_bo_vunmap(section->mem);
> +
> +	/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> +	sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
> +	if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
> +		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>  }
>  
>  /**
> @@ -626,7 +632,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  	section_size = hdr.va.end - hdr.va.start;
>  	if (section_size) {
>  		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
> -		struct panthor_gem_object *bo;
>  		u32 vm_map_flags = 0;
>  		u64 va = hdr.va.start;
>  
> @@ -663,14 +668,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		}
>  
>  		panthor_fw_init_section_mem(ptdev, section);
> -
> -		bo = to_panthor_bo(section->mem->obj);
> -
> -		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> -		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
> -			return -EINVAL;
> -
> -		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
>  	}
>  
>  	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
> @@ -724,17 +721,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>  	struct panthor_fw_section *section;
>  
>  	list_for_each_entry(section, &ptdev->fw->sections, node) {
> -		struct sg_table *sgt;
> -
>  		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
>  			continue;
>  
>  		panthor_fw_init_section_mem(ptdev, section);
> -
> -		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> -		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
> -		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
> -			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>  	}
>  }
>  
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

