Return-Path: <linux-media+bounces-47788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2EDC8C39C
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 23:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 357DA3A62AD
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 22:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C0C34250E;
	Wed, 26 Nov 2025 22:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWMB7gch"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A51FF7C7;
	Wed, 26 Nov 2025 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764196383; cv=none; b=tfp+XJi5awVRkmkkPyxwWen9ndz8XuiUDBtLT6H0aI46d1JcY27AYcusy7M6cBPgm4u4xTfAJukB3vT2MiwXGyj6ZXAvCc0mdpjwD5Bgnqd7ZuaHsa+HZgwmEx1jRrfkjw6srC7HDvS/X0roIxcZDjm/2C1leBU1QavZu2XL5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764196383; c=relaxed/simple;
	bh=7Ct7uOMrWpgwBo1dfjc42myZkFavQ4K32rkkdeRtH/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFoHFKtnMaSlzB5jMaGZGTz0srMgfxc5DVJe7VrpAf39gfZneViQcCasJsnPSBNlp4BAdYM9IkI760saP1ZVtNBOngBjECsxUNULdYnJgBwDGZ0w6Q3bhdSF81aM3uHbJLlMQyiwoQzpPvBLOcbwBG8pNhF4fejJgWktHjt2Y7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWMB7gch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C744C4CEF7;
	Wed, 26 Nov 2025 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764196383;
	bh=7Ct7uOMrWpgwBo1dfjc42myZkFavQ4K32rkkdeRtH/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWMB7gchRkVrfZlY3QMDFMcCwjsnsT5KZqFcH6rU2RBTslXL4YsP6k0UHAz5YQ+/6
	 0LoiU3bntvAzH+hoXy+lO+iAUIqRsd/rp/93MvHWOLyZrGtC1AEGal8TIDrembNF+g
	 HXLb7rQEfaTJ9zLGYpAjo2FXf6Jno1jg/l2/EKixIuBf2psqyaq8iTcQJ6dpiZs8bh
	 8rryo1aRtjk75e9KLDvWfUikXnyyVsTNBaFmrj9GKvZfUXydwQosPOWjTVKrNJ8FSs
	 QpNNQ2B2w2M3t96i1VIEUanvJacH1jHmX0kSlma0v3Ksjbb0wp4F/x0YnzNhEh1iLB
	 d1trTdgooJbjQ==
Date: Wed, 26 Nov 2025 23:32:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Gustavo Padovan <gustavo@padovan.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
Message-ID: <3b7b26uc566c3j4elnnkii5wvxvgqgnjsvwxpihz2cifupfnwa@cokmciv5umcg>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126131914.149445-3-phasta@kernel.org>

Hi Philipp,

> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 39e6f93dc310..25117a906846 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  
>  	lockdep_assert_held(fence->lock);
>  
> -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				      &fence->flags)))
> +	if (unlikely(dma_fence_test_signaled_flag(fence)))
>  		return -EINVAL;

Please, drop this change.

Andi

