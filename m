Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0BC42C330
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234057AbhJMObw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235840AbhJMObu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:31:50 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A02BC061746
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:29:47 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v17so9018837wrv.9
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=57KdpWjM6FQj1/ZWMB9uRAMFCr8+sc1UKZVxLCrKqQA=;
        b=fuUKOCG6VKrPu+jFf/OspZpPDw9h7as1LUinC2Id+eX3+6EfH1KxoH8pGPh/zChA4b
         Nz4LNmIua30JsScEBiilD8mppPkM0Lc4IrZvN4bniJaijXGMcQNP5WkabQW2YagFugWI
         Qfln8O6zRTkNHiT6wsElGKTzoV/rv+ML9PSVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=57KdpWjM6FQj1/ZWMB9uRAMFCr8+sc1UKZVxLCrKqQA=;
        b=JEw1AK5Zq4scenwYpq9etQdb33RiBnKhd7gGwQR+wYMmvDs7QV9XMV/Z6+NDg7fuaj
         UpS6anETQTDh0vdXJ38I5RJhmwLnlxdrJ5VhGtyUeSaYI/vN9zfohZ+a2nrDUw6+4XcY
         u+M7LBm3xmRst/T92vdkSgFNvNr4SrmFzaFyIvttI+JgV/0o881RkB9awoK0Fl6AoraU
         +JrLr9ulDI1udQBOHHiJM1kgw11oWNSpV3zWPBk83tGLoO1mHkhGN7aIu7R4+enqsCeH
         VcbZx9zKu4aGf9YIKTRLMwLYp6SYfcHuv26GvpzFfX0inA2bn+AV/pVDQmy/8EmHfXkP
         iuTQ==
X-Gm-Message-State: AOAM533z23smDESH1xWu5+95hIf9s9wmOEbqyibQCohAj3ph4NEPqChC
        6giZxr2JVBRDWgNeGRJPCxyN2g==
X-Google-Smtp-Source: ABdhPJwZvEFu8uN46XH+qqDJB9CUkoPNMzMIIZQcakbI7uBahduwwJFhFv/Vfy0iH9bKYacrjDePVg==
X-Received: by 2002:adf:b1c7:: with SMTP id r7mr40626710wra.392.1634135386079;
        Wed, 13 Oct 2021 07:29:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p25sm5369066wma.2.2021.10.13.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:29:45 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:29:43 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 26/28] drm/nouveau: use the new interator in
 nv50_wndw_prepare_fb
Message-ID: <YWbtV2ZVHg7n1xpm@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-27-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-27-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 01:37:40PM +0200, Christian König wrote:
> Makes the handling a bit more complex, but avoids the use of
> dma_resv_get_excl_unlocked().
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 8d048bacd6f0..30712a681e2a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  	struct nouveau_bo *nvbo;
>  	struct nv50_head_atom *asyh;
>  	struct nv50_wndw_ctxdma *ctxdma;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>  	int ret;
>  
>  	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
> @@ -561,7 +563,13 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  			asyw->image.handle[0] = ctxdma->object.handle;
>  	}
>  
> -	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
> +	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		/* TODO: We only use the first writer here */

Same thing as with the atomic core helper. This is actually broken,
because for atomic we really do _not_ want to wait for any shared fences.
Which this will do, if there's no exclusive fence attached.

So upgrading my general concern on this and the atomic helper patch to a
reject, since I think it's broken.
-Daniel

> +		asyw->state.fence = dma_fence_get(fence);
> +		break;
> +	}
> +	dma_resv_iter_end(&cursor);
>  	asyw->image.offset[0] = nvbo->offset;
>  
>  	if (wndw->func->prepare) {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
