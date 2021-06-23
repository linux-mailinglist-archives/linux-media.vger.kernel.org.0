Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806BA3B1EF6
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 18:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFWQuB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 23 Jun 2021 12:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWQuA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 12:50:00 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187C1C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 09:47:42 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A99241F438A5;
        Wed, 23 Jun 2021 17:47:40 +0100 (BST)
Date:   Wed, 23 Jun 2021 18:47:37 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        linaro-mm-sig@lists.linaro.org,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 06/15] drm/panfrost: Fix implicit sync
Message-ID: <20210623184737.7e47f77c@collabora.com>
In-Reply-To: <20210622165511.3169559-7-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
        <20210622165511.3169559-7-daniel.vetter@ffwll.ch>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Jun 2021 18:55:02 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Currently this has no practial relevance I think because there's not
> many who can pull off a setup with panfrost and another gpu in the
> same system. But the rules are that if you're setting an exclusive
> fence, indicating a gpu write access in the implicit fencing system,
> then you need to wait for all fences, not just the previous exclusive
> fence.
> 
> panfrost against itself has no problem, because it always sets the
> exclusive fence (but that's probably something that will need to be
> fixed for vulkan and/or multi-engine gpus, or you'll suffer badly).
> Also no problem with that against display.
> 
> With the prep work done to switch over to the dependency helpers this
> is now a oneliner.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 71cd43fa1b36..ef004d587dc4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -203,9 +203,8 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
>  	int i, ret;
>  
>  	for (i = 0; i < bo_count; i++) {
> -		struct dma_fence *fence = dma_resv_get_excl_unlocked(bos[i]->resv);
> -
> -		ret = drm_gem_fence_array_add(deps, fence);
> +		/* panfrost always uses write mode in its current uapi */
> +		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
>  		if (ret)
>  			return ret;
>  	}

