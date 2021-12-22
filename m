Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0777D47D8F7
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240578AbhLVVwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240333AbhLVVwh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:52:37 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1470AC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:52:37 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id y22so13857273edq.2
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c7jtBamXWY7Ec9ROV3OjQL0fvP/qcLqLqrMSbN3AvqY=;
        b=ecRC2EllFpOPXFx3eUOJpN9EMHM+yrA3y4nYhQ3Q6cDMpUV9ZUtLIpsPG3IylvPhXx
         7NEFPhUsS32xRVSG+1lBEqWdpWTzcPcuxqFCGFNlPm/Mm6NTnAcTH6ywcnaRQtIDiPyG
         z62vXQMBt4BBad622pJR62wXhSNKyBMmpO+Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c7jtBamXWY7Ec9ROV3OjQL0fvP/qcLqLqrMSbN3AvqY=;
        b=GMm1AglUZoPynWU2d7V0TKZanlnJfKuE7PHftYH/mbldGtBoODaxIxBVHtXKEapEcL
         4tZ0kL35IUCYbGElojYSBpxRg4qooH7ZOovpPrlQ2fOIRVGXIIXw0c0wktEWazzGCD3u
         DV23bjWk44W9KntS2Xrg7YWOVWx1HLoO1kooPny0vvO9aJBAHrRz6NLnejynl2czDhui
         60JX70j/LulIiZGK8sJY/32dczhiviwQAxFCAslTfxVLvmah/NJZpUwIqDVUYPWb48Au
         EFgREBhY6mXUjI2RNbHfu40mmi87f85owaRcegetxMZVDy6mOwZJkKdlQ4XJVCWdBgOi
         ivJg==
X-Gm-Message-State: AOAM531NddT7C5sBAlkVyV6MvfjFCDBPidZqwUuFQI8Q3IJaufbiXcAD
        /3gNffFEYZFT8CExj8h/f9wXjQ==
X-Google-Smtp-Source: ABdhPJya0W2q658d/hOLrgWA6I3WAs9SdToJcK6EKM3kejv0OPyZOAA4uQllKuDPAmH5Y2h6ddZrKQ==
X-Received: by 2002:a17:907:2d28:: with SMTP id gs40mr3760932ejc.765.1640209955690;
        Wed, 22 Dec 2021 13:52:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ne31sm1112670ejc.48.2021.12.22.13.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:52:35 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:52:33 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 16/24] drm/nouveau: support more than one write fence in
 fenv50_wndw_prepare_fb
Message-ID: <YcOeIfLwB6srBtQu@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-17-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-17-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:34:03PM +0100, Christian König wrote:
> Use dma_resv_get_singleton() here to eventually get more than one write
> fence as single fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 133c8736426a..b55a8a723581 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -536,8 +536,6 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  	struct nouveau_bo *nvbo;
>  	struct nv50_head_atom *asyh;
>  	struct nv50_wndw_ctxdma *ctxdma;
> -	struct dma_resv_iter cursor;
> -	struct dma_fence *fence;
>  	int ret;
>  
>  	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
> @@ -560,13 +558,11 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  			asyw->image.handle[0] = ctxdma->object.handle;
>  	}
>  
> -	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
> -	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		/* TODO: We only use the first writer here */
> -		asyw->state.fence = dma_fence_get(fence);
> -		break;
> -	}
> -	dma_resv_iter_end(&cursor);
> +	ret = dma_resv_get_singleton(nvbo->bo.base.resv, false,
> +				     &asyw->state.fence);

Needs nouveau-ack, but otherwise lgtm.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	if (ret)
> +		return ret;
> +
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
