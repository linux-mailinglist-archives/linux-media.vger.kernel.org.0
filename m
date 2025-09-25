Return-Path: <linux-media+bounces-43135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C81B9E10B
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 10:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E57D117FB99
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 08:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA2725A322;
	Thu, 25 Sep 2025 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="TdUU5r7X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6F44A1E;
	Thu, 25 Sep 2025 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758789177; cv=none; b=lgN8e9+65xaQ8mPzY6XSOv+ZMdBdbjay0YXWCPN2N3y7mVCshKOaG8Nhq+5QuvEskozAd6X21T8OXQ6Wim+uvpIHs7ZRSg2iLKZyqWz07LgDE/gG/M3KyKkDwFnW13lGcW5x7vCUBlv/3TNyUa/0omuDmwrKHWSataeZSRelW/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758789177; c=relaxed/simple;
	bh=uLr9gNjhfQSYXTBCXfi7Wl3TOWCYc9WbRmV0hJDbZCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jp1XK3phEQ7nAe6EZx9oxRplBABRz7+URXAilz5RbUqAxFVJYAOGsAGzLfHRWPGCLF0i/JfTEVTxLdznrvJ0IgEByOalLu9Pe44zBBdCjH5Im/sJiqLDZE85ZIaWqXs/gVDKcO3Pekh1kFIvZW0hyddetg4Va8HXT3LrGPwvXzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=TdUU5r7X; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [10.10.165.19])
	by mail.ispras.ru (Postfix) with UTF8SMTPSA id 751A340A327F;
	Thu, 25 Sep 2025 08:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 751A340A327F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1758789170;
	bh=uF++8OOm94LNs+zLFNRWXX3dSoN0NrPv7HsDF6GaeFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdUU5r7XH8j54tB6O3sp2bTkzmOQHYRTQuxsEuZgsLgU+0gL/i/Rf/d/1rBuryJy8
	 OZLGt8z8jg92d4b/Ns5P9QGC+0yNQs2ooraBzcV7NmnnWt99FPeeU82B2KwO32lvst
	 z4kjDeJlOXhC4yseYcgzl4oeCmsp/JMToFZM0vR0=
Date: Thu, 25 Sep 2025 11:32:50 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Krzysztof Karas <krzysztof.karas@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, linux-media@vger.kernel.org
Subject: Re: [lvc-project] [PATCH] gpu: i915: fix error return in
 mmap_offset_attach()
Message-ID: <20250925112453-9f2adbf071ed0db667442c83-pchelkin@ispras>
References: <20250924124852.11-1-alsp705@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250924124852.11-1-alsp705@gmail.com>

On Wed, 24. Sep 15:48, Alexandr Sapozhnkiov wrote:
> Return value of function drm_vma_node_allow_once(), 
> called at i915_gem_mman.c:672, is not checked.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> ---
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

insert_mmo() inserts mmo into rb tree associated with obj.  So it should
be removed from the tree before mmo is freed on error path.

Is it probably better to return directly without going to the 'err' label?
There should be no memory leaks in such case I guess.

> +	}
>  	return mmo;
>  
>  err:
> -- 
> 2.43.0

