Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C76E742C349
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237449AbhJMOe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236703AbhJMOeU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:34:20 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5910BC061753
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:32:17 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id y3so9187770wrl.1
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iKQ96m1zzkQMuFL3fcXQPzaxnnE4DluBXjRvFkSR5wI=;
        b=ODf6itJ3fnWbDlharuS4Wj+1XeDkgwC8SSXHTy+CeDfYmS8y1a4+OuduJ3MChaifTP
         GgeKZkeLiaUbLvIOiC9S9XqAmkICJYYBhlnJYHE/QKU/OA30SExGMtA3ucg3zDbW//2+
         KcKkk1wVoLLSvWfWDVDOeUNBKIGDSsrz3/GoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iKQ96m1zzkQMuFL3fcXQPzaxnnE4DluBXjRvFkSR5wI=;
        b=0WDD/gU7j9m5Lt6wlmYFYItKnxa+qObMfzDWa3GOtNF+sPCMGSDrITmpTDH5KSiIB/
         bLvKY+ifIkZHF4YTfVnKc1851cPLC2nEN/Z9NosI807Op4QoJh+7W7XadrzH86/T6cOu
         tYlODyvCF4KxK1G1ANcyFCdf3oi+M0kkDDE++KS1xXZFFMVyByr/VkEhD0LZLvs2ileJ
         7ifsDDafL2o14p7Tkfculh1VP0VwG/SEzufnYD6xN9se3NtnJAvyMkAed/mARuhwV6ip
         rHOeVm01N08kVl/nWLNEHQLxSN6BbY21bAO3LObLYa0OSY3/5EqPJ+6dQh0oJxdruzIS
         rySw==
X-Gm-Message-State: AOAM530w0VsnWDqicio0lpvFzicipzPdCDGtfeIRnXQdC3bDh7DafxS6
        I8JI52ku8NKFjaQ3gJtJvOYRDQ==
X-Google-Smtp-Source: ABdhPJxOOVUWtj4KaDAa/dBN+HmwBExqoN7dFMBZ9hrJ2SWC4H73/jm3/GoodLipJP6b1uo6WHOAGQ==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr13006075wmi.143.1634135535984;
        Wed, 13 Oct 2021 07:32:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b19sm5756585wmb.1.2021.10.13.07.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:32:15 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:32:13 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 28/28] drm/etnaviv: replace dma_resv_get_excl_unlocked
Message-ID: <YWbt7cLOLDSQhkOV@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-29-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-29-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 01:37:42PM +0200, Christian König wrote:
> We certainly hold the reservation lock here, no need for the RCU dance.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 4dd7d9d541c0..7e17bc2b5df1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -195,7 +195,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>  			if (ret)
>  				return ret;
>  		} else {
> -			bo->excl = dma_resv_get_excl_unlocked(robj);

Maybe have that in the series to sunset dma_resv_get_excl_unlocked()? Just
so it makes a bit more sense from a motivation pov. Or explain that in the
commit message.

Anyway looks correct.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
>  		}
>  
>  	}
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
