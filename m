Return-Path: <linux-media+bounces-43079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD170B9BD7C
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 22:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08AE3814A2
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 20:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0C632856B;
	Wed, 24 Sep 2025 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmYsDnER"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D103161B7;
	Wed, 24 Sep 2025 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758745238; cv=none; b=QZ9ZqoshPlyGMLlrv/dMWSUHvncGHLmGvzvdC0Ugzzr+Wbxd1PbZdDUb5UliqKfCGB7/SwR1snRbab0/qUj/E0RfommUusTi8VpJibVwLSfQ2phtM/Rve2YJhrLinooMiUrqt3rmaBDUtW/YF02GnZCZzImal8j8D3jPaBLR8Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758745238; c=relaxed/simple;
	bh=bLS/hlN1lD3wNbOZhcabpYcqxPoG7q6gXbeLI6MYs8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7sRZNlPACGDrBmXTR1Uzw3S/D7F2+Wh20jHE5bNZcl8hRddlnSLFHbiGYbxE6dZz67YfKvHgXE2udaACXuLi8wlIef0z43wt4vl26Q4yyey19wzG+hc5jh8JfmX/wPIElynElqhqjSdNGWcf/9c0zv3LsmkxSJCwau6WhvdACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmYsDnER; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC72CC4CEE7;
	Wed, 24 Sep 2025 20:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758745238;
	bh=bLS/hlN1lD3wNbOZhcabpYcqxPoG7q6gXbeLI6MYs8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmYsDnERidGaRvMZ1cNNX059PHnnjFiRUPfKMH2PnR23eRJCo8HOQsNrExO7aJRWF
	 OuuDss9BcUD7/dw8LFS0lLT+stIfFvFnWnhP4AurL6zQXPo1ZV0mP8dDBBtj3pGvnV
	 3d5KYr9CYGOCGCR+yoei9Ujwk+V4kiBqBoAj2qq4wwzjr4OsuC04Mol6S/O624w9W8
	 bJl1wDvh71jlT8Q9+7NK1ijjby8KTZ8LYWmpHd4cTvIcAxHnl6w/GtI+0gZEfa49t4
	 OD/7j/WkobP6BnWpG5uUd72FS8+dAp7fSzvN+EMY/X1eHeKbULVu2qyaW3Xe3423hs
	 XPSAOzXxL9fkQ==
Date: Wed, 24 Sep 2025 22:20:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, lvc-project@linuxtesting.org, 
	Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH] gpu: i915: fix error return in mmap_offset_attach()
Message-ID: <ammcxcfamq6f6ip35ccre4an7tcnksksifrjy2alq3eh3eqgai@hvsmgmw5i35n>
References: <20250924124852.11-1-alsp705@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924124852.11-1-alsp705@gmail.com>

Hi Alexandr,

Please, verision the patch: this is [PATCH v2].

On Wed, Sep 24, 2025 at 03:48:50PM +0300, Alexandr Sapozhnkiov wrote:
> Return value of function drm_vma_node_allow_once(), 
> called at i915_gem_mman.c:672, is not checked.

You've been asked to improve the commit log, but you didn't.
Please reply to this email with the commit log improved as
suggested.

> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>

You forgot to add the r-b tag you received.

> ---

you are missing the changelog.

>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 75f5b0e871ef..eb76f8f2bd95 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -758,8 +758,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>  	mmo = insert_mmo(obj, mmo);
>  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
>  out:
> -	if (file)
> -		drm_vma_node_allow_once(&mmo->vma_node, file);
> +	if (file) {
> +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> +		if (err)
> +			goto err;
> +	}

I agree with the change.

Thank you,
Andi

>  	return mmo;
>  
>  err:
> -- 
> 2.43.0

