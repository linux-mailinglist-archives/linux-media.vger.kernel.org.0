Return-Path: <linux-media+bounces-43829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C612ABC0FAE
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 12:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C08674E8990
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 10:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904A92D8378;
	Tue,  7 Oct 2025 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PisdVE2p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE11991D4;
	Tue,  7 Oct 2025 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832074; cv=none; b=VTS6mSWZh9bye/BJ+flKGyRfhFmhivFhtfMyNTTj1N7NG+hJdWtu6P4oKIeAFaLnSu1e50QTdrfX3OSCwz0CNcKFWSBTI8G6FM28j+jT5v8K87Z3GC/P7X2eC6Ow9h2SxOb6VkD1K6hZrrIkRv5yvjbh+/YY/uVyMcc1WmZVXX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832074; c=relaxed/simple;
	bh=3esV0ytccBxzur/KLi5NKJu08t5jZgIJWULK85MYAJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMFSt/JdijwIoaDw96VJodrExU9AL5bWZi/ZGfmbEgmpcYVwTaXWdb5msmjiE/qTwVlNXOxU6WL9PZLNdGCJfjZfvmcnmRtrGJ0OfBD6jv5Zzb7VVB7tOQgPjZARJ83+Q/HBDyYFi4ogCnfme1Foe5gbY/WzvfqvouUb7ygDaaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PisdVE2p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522B1C4CEF1;
	Tue,  7 Oct 2025 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759832073;
	bh=3esV0ytccBxzur/KLi5NKJu08t5jZgIJWULK85MYAJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PisdVE2pmak6fACq2DRWMwHrPN9glJkXCwwTLPTb7uNbkEvwpZ3bqo2OndZuIuHGL
	 8YxK1rvL8iXv2lnQb+DVLBQunfJTkSELnuzhZCiaXB2nUdmDyYiIOOxxM7p2Vy8DYe
	 d7Zri/4ZtyC30D6ohhMFqJAd5+G5Fjovi4L9NU084ka3XbqwbDyXSm7pHO0gExx1nB
	 thqy7ZijQipGP3zCULTMdYqiEzeHfC3BpaIVavZiSm19hVTjuY31n6faDTgAWv+PU4
	 dqb3E5gz/hlLLpO5I5aNbGHlx1ZfbTtfC7z37Xac4xPaqj7EkiBqzeLTkRNRFxH3YK
	 XVkjlGh7VKhMQ==
Date: Tue, 7 Oct 2025 12:14:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Message-ID: <ris5iw6gdn7squdjpo5kapdyd7jqwbzy3kbpnzspp7jhpm4tlj@osq47p45ydcv>
References: <20251002084828.11-1-alsp705@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002084828.11-1-alsp705@gmail.com>

Hi,

On Thu, Oct 02, 2025 at 11:48:26AM +0300, Alexandr Sapozhnkiov wrote:
> From: Alexandr Sapozhnikov <alsp705@gmail.com>
> 
> In the drm_vma_node_allow function, kmalloc may 
> return NULL, in which case the file element will not be 
> added to the mmo->vma_node list. It would be good to 
> not ignore this event, but at least log an error message.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index a2195e28b625..adaef8f09d59 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
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

NACK here! You have received several reviews on this patch and
didn't react to them. Please, read carefully the reviews you
received and send a second version of the patch.

Please do use versioning properly in your title and add a
changelog.

Before sending patches, please read the documentation[*].

Andi

[*] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html

>  	return mmo;
>  
>  err:
> -- 
> 2.43.0
> 

