Return-Path: <linux-media+bounces-47789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA7C8C43E
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 23:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D383A34C45F
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 22:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EC730148A;
	Wed, 26 Nov 2025 22:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jomsD9na"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7386D2D4B6D;
	Wed, 26 Nov 2025 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764197822; cv=none; b=gRQrPj486oBdi+yVIhcJcptWqWiXEeglZ+SawTjVCZ7a7SBPfUihOb3Jso1YR9cHaT5Tout6zpSuuDyccb/tT15fhr3LFsjLo9jqjrsMXILfe/8wX/Qvd4lRQAPECWusskdjkoXj3ubPjP120oBpXT6lNnohEH5SwOZcEODsg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764197822; c=relaxed/simple;
	bh=8I/xGxV7I8iD8HYdd979j/s++PDEKqXSxYMQBYTKWpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0Rw+LaENg5zZPSm/Ri3FBduJORH54saK8yH6uOTHerZcsZmpQV74gypqRZo1NIsKykmKJ+fmk90DxoAJmnljE2gI4XeKrRLf4cnoIIT8ih3w0HLYIdlZSl2QZryLLiYTz6Hq2zsZeBPxI6YVvStC48kNfgZ2Nml01voX6RfH9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jomsD9na; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1719FC4CEF7;
	Wed, 26 Nov 2025 22:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764197821;
	bh=8I/xGxV7I8iD8HYdd979j/s++PDEKqXSxYMQBYTKWpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jomsD9nanJNdlCen2lyrewaNWmEapu0FwRBQWvsry8urtiF6ZeDM0xRtpsMucbriD
	 NqyB137BJUVGP03Juyd+hMxguTgN4FfqevdbmNfQB0gO58r3Q44H/gUGci58dHTVei
	 3OEJ2gFIcV4xw8GO6MgK/5JSwV613BaPzxS3dftlfNi7ujxvyzbwqa0lGj+qOJNklw
	 SnwkHN1Y7NZO/jgie5BLBWfcOIb/REoPTc129j82R9KGwUKR2xYwSLhEoDd3B0tpOk
	 R4CsGmMlDwXTsJbSu1Ive94vTPqf3N02svFAV3WRPBf87PlGxIiPOs1834EkfH+kkC
	 l8a34+LFmWJCw==
Date: Wed, 26 Nov 2025 23:56:57 +0100
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
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/gpu/xe: Ignore dma_fenc_signal() return code
Message-ID: <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126131914.149445-5-phasta@kernel.org>

Hi Philipp,

in the subject /dma_fenc_signal/dma_fence_signal/

> @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  {
>  	struct xe_hw_fence *fence, *next;
>  	unsigned long flags;
> -	int err;
>  	bool tmp;
>  
>  	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  		spin_lock_irqsave(&irq->lock, flags);
>  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
>  			list_del_init(&fence->irq_link);
> -			err = dma_fence_signal_locked(&fence->dma);

why don't we do

XE_WARN_ON(dma_fence_signal_locked(..))

instead?

Andi

> +			XE_WARN_ON(dma_fence_test_signaled_flag(&fence->dma));
> +			dma_fence_signal_locked(&fence->dma);
>  			dma_fence_put(&fence->dma);
> -			XE_WARN_ON(err);
>  		}
>  		spin_unlock_irqrestore(&irq->lock, flags);
>  		dma_fence_end_signalling(tmp);
> -- 
> 2.49.0
> 

