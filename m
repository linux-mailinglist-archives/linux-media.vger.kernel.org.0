Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896CE42C2EC
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbhJMOZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbhJMOZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:25:22 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4262C061753
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:23:18 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u18so9072264wrg.5
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aYg90o+vAlenz3v9nyvq6NbxIIAcYGj0FssSPUnAiFg=;
        b=AmfY+aim06wD3tQeVQ4yrNHsj6eRmGtBactGGzWNX03gCUGx7AKpu61USFaKTqN/q7
         FOjHZy9ZNWAvsNrvKsOkQrqW9vvIch+28PVCJfzqwDRug261C3wnd9aSFnrfzHGt/Ezm
         etYh27NJj9ZQuobiw9uGHoonUagrntoYUPFig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aYg90o+vAlenz3v9nyvq6NbxIIAcYGj0FssSPUnAiFg=;
        b=RkY9WTIlrPw66YwGpV4VNpkaZKqqDhIilH1CkmkTalv05sYNV5Lw9xE6L1tGGzK5U5
         lKziP9CEH34Hhlc47KYkWmaznfUXoQfSTpE6F7TANblxpjKFCxXiykPpGUTAZfbt2xff
         QEa9KC/cBMK4aISiiCh/XG5U85fKYCGuXMle7G3+qFgbvgM7B3Ho0CWo7aMlnqPmpmVb
         t/xm9O5TAObRZZHBuxxfioVyPf5KMDcr3yNeMQnFql8ou5YrDib/B3Wjcs8ufU/hmcFo
         2dYn1OBSj62++ikzdsvWpm1ic7Yg4GbUQug5b/d+1spXMrUtDlWtVQ2IPNxFxKNrmlDX
         51EA==
X-Gm-Message-State: AOAM532cGZEL6yOoYOTuz/uVs011WXb/1W801Pk2zVGxk2wzsqX3R3xH
        UvtmTA2vMmOqNQ6brLExO3sB8w==
X-Google-Smtp-Source: ABdhPJxKy6Zj/ZXE+R74iOcucsIyIDxW/UMZ54YPO5tLJBzyQCV95JIsV7M6L+rta31Bylb41EG/pg==
X-Received: by 2002:a5d:6da5:: with SMTP id u5mr39299569wrs.436.1634134997373;
        Wed, 13 Oct 2021 07:23:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i24sm5170720wml.26.2021.10.13.07.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:23:16 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:23:15 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
Message-ID: <YWbr0/ey1rCbb0Yi@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-25-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-25-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 01:37:38PM +0200, Christian König wrote:
> Makes the handling a bit more complex, but avoids the use of
> dma_resv_get_excl_unlocked().
> 
> v2: improve coding and documentation
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index e570398abd78..8534f78d4d6d 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -143,6 +143,7 @@
>   */
>  int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  {
> +	struct dma_resv_iter cursor;
>  	struct drm_gem_object *obj;
>  	struct dma_fence *fence;
>  
> @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>  		return 0;
>  
>  	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	fence = dma_resv_get_excl_unlocked(obj->resv);
> -	drm_atomic_set_fence_for_plane(state, fence);
> +	dma_resv_iter_begin(&cursor, obj->resv, false);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		/* TODO: We only use the first write fence here and need to fix
> +		 * the drm_atomic_set_fence_for_plane() API to accept more than
> +		 * one. */

I'm confused, right now there is only one write fence. So no need to
iterate, and also no need to add a TODO. If/when we add more write fences
then I think this needs to be revisited, and ofc then we do need to update
the set_fence helpers to carry an entire array of fences.
-Daniel

> +		dma_fence_get(fence);
> +		break;
> +	}
> +	dma_resv_iter_end(&cursor);
>  
> +	drm_atomic_set_fence_for_plane(state, fence);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
