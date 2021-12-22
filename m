Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E4B47D8B4
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbhLVV05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:26:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbhLVV04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:26:56 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAEFC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:26:55 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id f5so13579826edq.6
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Yz9uOCBqf37QPt8riRSUwHZh5OXIzEuZG643lYUqqT0=;
        b=AsZf00kNYJbXTi+o0VPiWrjucHLQCYKuMEtPaDmV+QlUkS9Tb8LnTvlYvRund4qRY/
         7Q1HL1ta8f11APqzxBEWRfPCt7VZCMXDNmVhYiXcaz6XH51yOF6rFiD4DdrZjc8jfy50
         ZfF+QBYTKan2yCtlZviSJz2PTde73iCYmHhHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Yz9uOCBqf37QPt8riRSUwHZh5OXIzEuZG643lYUqqT0=;
        b=4qhyXB+di0ZdnQpmNaai1Mbbkat+SF9IpHz5Zbq8E5LW1eSBK/NGAI1NSCtlxDiaRE
         wldg9hy16mu/GORF6NNWgVKyHZP5xUR1o8lkKgEq+s40zB8i6t5EsfxZz2MGfjN1uqdN
         4VUpJlCdwUoYHXJKgrbZQbb6LM2bghRpSPE5X6L/A+7OkO/uw0efuMKe3T9yr9kd7q0o
         VnJLyTtiJdDUMgvx1bPeKlnixlb3SzU59NwSeXe2AR7dgb5heF7UO5aKJ66Sdp/rdmeS
         AEfz/M2xGKpjrRpNRl7LGq/vMDgQxGDvSLRQgh+xCrHXWVYyCO2KuixXuvE3CxbqCI4J
         vqzw==
X-Gm-Message-State: AOAM531+U5sLGMXMYircfu4O1KbBwo6jRxR4OniiBBRuJLXQLfZPnp/k
        lmsE6eJXAAAFe4SdJxWV8ZHGqA==
X-Google-Smtp-Source: ABdhPJwvq7qwcdZObxpBfJF3/nVSIH0D+E85X0+1f84I5+ccF1IFYv54iv16kHiZkbEGAehnLSlIww==
X-Received: by 2002:a05:6402:350a:: with SMTP id b10mr4520545edd.89.1640208414469;
        Wed, 22 Dec 2021 13:26:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 16sm1051926ejd.204.2021.12.22.13.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:26:54 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:26:52 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 07/24] drm/nouveau: stop using dma_resv_excl_fence
Message-ID: <YcOYHNkiN3bZDbyH@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-8-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-8-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:54PM +0100, Christian König wrote:
> Instead use the new dma_resv_get_singleton function.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index fa73fe57f97b..74f8652d2bd3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>  {
>  	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>  	struct drm_device *dev = drm->dev;
> -	struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	/* TODO: This is actually a memory management dependency */
> +	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
> +	if (ret)
> +		dma_resv_wait_timeout(bo->base.resv, false, false,
> +				      MAX_SCHEDULE_TIMEOUT);

Needs ack from nouveau folks.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	nv10_bo_put_tile_region(dev, *old_tile, fence);
>  	*old_tile = new_tile;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
