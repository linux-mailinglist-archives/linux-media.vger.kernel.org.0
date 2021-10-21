Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C519343605D
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 13:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhJULfl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 07:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbhJULfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 07:35:41 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B8DC06161C
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 04:33:25 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id s198-20020a1ca9cf000000b0030d6986ea9fso453620wme.1
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 04:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Zl6IbkoInf5UicY+j8DDMBtOrzL+VF+yR479ysx8ejg=;
        b=ZBqljJUZ4MFRZoJdAexm2mTa9BnieHyZ868JiyyIxyqopSU5Fd9KVR76BNqCQ+Nx9w
         fgHmWN2p4gT0TCsLp0WEscJpXp15SX8GrF9JXDzD/B3zvbGTdpn4X7yM248DFgYQ4MPn
         UYZufwWny0oHgPdzU//t299Ej4ORRkslSnz0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Zl6IbkoInf5UicY+j8DDMBtOrzL+VF+yR479ysx8ejg=;
        b=D5yz2qq2tcX5J4g/1q4YaPXm86ed8t0+aMRRMP8TePXFpY8uUkGROsFofdZt1Y7EI3
         wB6wBACElGZILxU5KVzxKYu2K4Srn3QMqU+LQSVdArOiACAmyaRvypKOOt8gtpfVawPT
         ilU7rcJZIUPVTZfgkdQAlg1Dp6kzKbisvnj9NeWmWKwfGCOnfgXG5GJZkt3Ud+zqulvF
         DDRpproR3z0R89Oi6E0F7qpPIE2tx7JZoeYiZqhzPKyW5mOmE0glNQtKOb98+CNdwSK7
         mczCQJc7tEi9QbHlCDkduIE+ukEIAAsmopawt6X2AtWuNYOy27gFxwFcMStyBrgulJDZ
         MsFQ==
X-Gm-Message-State: AOAM53251QltKI1/DWQSi/OAnV3XPeFdaJgPL2mMX/YQxFNuaOsfBb3m
        Xtc1JeGG7eq9XBtc0sOx9+/MPw==
X-Google-Smtp-Source: ABdhPJyoq5TeNgHAwXtWgVJjxcKwV91bkdqYyew+/OUXQKSaxzSm9K3M/Un2Bxx4E324wBk6jmwr0A==
X-Received: by 2002:a1c:a591:: with SMTP id o139mr2080147wme.172.1634816003780;
        Thu, 21 Oct 2021 04:33:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j15sm4697048wrr.8.2021.10.21.04.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 04:33:23 -0700 (PDT)
Date:   Thu, 21 Oct 2021 13:33:21 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
Message-ID: <YXFQAeggTok/oYwe@phenom.ffwll.local>
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

Maybe reword the todo that currently there's only one write fence, and if
that changes we have work to do. Or something like that. The current
comments sounds like multiple write fences are possible, which is not the
case.

With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		 * the drm_atomic_set_fence_for_plane() API to accept more than
> +		 * one. */
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
