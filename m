Return-Path: <linux-media+bounces-60453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAoeOSsT+mlRJAMAu9opvQ
	(envelope-from <linux-media+bounces-60453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:56:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 810034D0B7E
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0158C3093B9F
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 15:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD63348A2BB;
	Tue,  5 May 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R2dNc5lI"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5A548A2CE;
	Tue,  5 May 2026 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996077; cv=none; b=C6DH8jsXjGwguYs1bOOvTKz0431AjSwxwm+rpJkezow3yBdNq9W119zTbULh0GGiqOLPbfhVm0KgMqJPwYXuN6xUbFQyaSqXdNPjGPPBh5I6AMaNHniZOpAGs/BBEXq1Ukz21yhwVRm64VFisUCoXBsqopom8+RBQsTeBsbW/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996077; c=relaxed/simple;
	bh=H4hfN0oMllcNEjPVcnu5mtrqlmjlS8rr/h+c93usT34=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uCQok6HuwjtGYPCqKP874zc48u47Vhl4Bl4bJaMg68KNfN7igEdF/0SLYrA1n3l+Tbf3ilh4QXCiry6O7wOn63FKxOloYU1GpyTqaWMEFlzEM7a+DnyhdnyzuToHqhuBR84DcjQivMO0vFA0Aq6qsdjxRXgsPRUyqkU20s37vlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R2dNc5lI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777996072;
	bh=H4hfN0oMllcNEjPVcnu5mtrqlmjlS8rr/h+c93usT34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R2dNc5lIkfxzRIdZj5bE8Pht0wT+bdc6exMlFXhdxJPXapmX818okKAW7mgW1UrYb
	 8URaR1dfHXkCp7xtrPHFWe2ueSq5ODIvOPNSGEGz9qtMftbWPaYkYWNPP/l9aRoyai
	 71B+VdiYYtw6yBQdsLnY1GzSCftSI1ZSlc6Tnwhjy45MEg+NgIVngeyb1aBBlAEkxA
	 +fd/A5I9KZ0tpKdG20e7dlT8nu1X94pzHbUyJXkN6GESzab2ksAA2eeVE/9g1pXD+3
	 pDtyD7zPhFi1UUaEW+14i0+wICfppaGGofhpheacoMmeKqr6Kvks84NZOPdxeYTBXL
	 +gUM9nF3JSs6g==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 362F817E05FC;
	Tue,  5 May 2026 17:47:51 +0200 (CEST)
Date: Tue, 5 May 2026 17:47:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/8] drm/panthor: De-duplicate FW memory section sync
Message-ID: <20260505174747.3c199a81@fedora>
In-Reply-To: <20260505140516.1372388-4-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-4-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 810034D0B7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60453-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,arm.com:email]

On Tue,  5 May 2026 16:05:09 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> Handle the sync to device of FW memory sections inside
> panthor_fw_init_section_mem() so that the callers do not have to.
> 
> This small improvement is also critical for protected FW sections,
> so we avoid issuing memory transactions to protected memory from
> CPU running in normal mode.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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


