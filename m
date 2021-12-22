Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B497547D8CB
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234486AbhLVVcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234004AbhLVVb5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:31:57 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C665C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:31:57 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id o6so13659366edc.4
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2T7m6MaySg2FvxYaYRTpWc42tSr8dmW3Qbv0jXUALeY=;
        b=dMgTo6RrvNQuOM8G52QyijpF7jh0AkCNEt6cihbEwJB3TckVCPvdeWvsTQjiqHo2m9
         zR+r9ZaHWGVyGRSR2lE4zCtt7QaKDhmDH1aySG52CYxDTZWnN948zrMxyoiobIRvkc0T
         1mPDnmZok26tFdbr61Q8wFql62SZstlpxlp98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2T7m6MaySg2FvxYaYRTpWc42tSr8dmW3Qbv0jXUALeY=;
        b=zhemrmzplEPGymG1aOeZe3GzL4wGU8dM+L3C89JcVzksCx+dhsmvgRKzO48Eklwbx4
         0Ai5bp7XZYDBnrWr5h0gLJeI/M73cTLK9cTeLUMZ8jbhh3O5MfTa4Xr6PJrkxsYJ1PMC
         fxiiMCQg1VzOHsh8VIvCUJG2bhrwdWOWfn0DSQ3nEmdVCAh4Pz/qrngDA5imTp+HbS5e
         yPEy9JsLm6gUhKgpCmNR6Tg4VQeV4THvi4FtUleoMhGSKbU3u533Yl/yL3D3N22Ica5r
         YoVw91kTSKKmbxHemLHr7OEqTX1+p3Kryrpt0qymuCBWV07p4jr6p54njDU8k/k9LOri
         kPrQ==
X-Gm-Message-State: AOAM531Qrlm17a84P7CKZZfphy6vyRl9fNTFIzKHQe5ce38S3u45/+Ld
        y/QfkRZNdbOhF3048rJNIM3bCQ==
X-Google-Smtp-Source: ABdhPJwzKn8NHPstNozIVE3zEuBv/ScM3bK17X1lHdgr1ouDigeX0VV5H0WqaeFXBBWpV7d0iw64EQ==
X-Received: by 2002:a17:906:eb56:: with SMTP id mc22mr3849902ejb.331.1640208716064;
        Wed, 22 Dec 2021 13:31:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id zh8sm1061978ejb.1.2021.12.22.13.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:31:55 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:31:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 08/24] drm/vmwgfx: stop using dma_resv_excl_fence
Message-ID: <YcOZSc3Z1hf5lPlA@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-9-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-9-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:55PM +0100, Christian König wrote:
> Instead use the new dma_resv_get_singleton function.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index 8d1e869cc196..23c3fc2cbf10 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -1168,8 +1168,10 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
>  		vmw_bo_fence_single(bo, NULL);
>  		if (bo->moving)
>  			dma_fence_put(bo->moving);
> -		bo->moving = dma_fence_get
> -			(dma_resv_excl_fence(bo->base.resv));
> +
> +		/* TODO: This is actually a memory management dependency */
> +		return dma_resv_get_singleton(bo->base.resv, false,
> +					      &bo->moving);

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	}
>  
>  	return 0;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
