Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF13462F28
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 10:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbhK3JFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 04:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235278AbhK3JF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 04:05:29 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA813C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 01:02:10 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id t9so25787956wrx.7
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 01:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SyhOY1PWVHdj7OGLzuhI+3QnabA2X3t1wGqtY/Cum7o=;
        b=WwH7MvELKyxjjGwc9yiPsyAAIBuF06DvxGYA/WES6IfpRL3NVHrVKKnvpMKaQ6PJA5
         mykiDsNEKYKjPzfhIkzfa0dgIhrUaySGoMtOSwTMMWbcn7bxmVTQzeVIecytjaKeRWCJ
         EzTT47ZYbGku37TfsYG3lYHRrnKE8aD5dYSik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SyhOY1PWVHdj7OGLzuhI+3QnabA2X3t1wGqtY/Cum7o=;
        b=sPkB7M+jOILcLUQyFHFEFRqI+JYX7Atb9CgN0PnRvVQ92BVy2JpOpoSR/oV++trofp
         ZTVbUm20wOKknxP1Fmv0yRiA3TNOEvZU5vsLSqFodbd/ucVaU7xGfmMzDaFdDh2C5rhM
         6r5ihgD7dvlJq505f2YGTGDLl0rJ74QJVPQ6zwOi+8K8HcghcEQs/lZ0pwpgUvOXi0Mf
         Hl1qXIfUVuTVXYXofgYErmRClUJ/0cWS/OSjKmu1VqiG7ZmNuD9Cvi18qRD40i8SoqTL
         SWSUXmjmvNimXaOcrDkWiYGvPX/CDHIFwtdnhjWzjSfnM1FUROSI2EsVv0/jLimfjMS7
         hVZw==
X-Gm-Message-State: AOAM53286/1vvXrLW+bFspn4UYwPn4pScw/EOUoyh3Iu94su/0A79aYI
        HvRtpaEnNLuicf3V7AiSDGLb1A==
X-Google-Smtp-Source: ABdhPJzIghKd5RuGlVbrc+DKuTzdkXkSPPV5i18aTKE6MdkrhHBQB8No2j9Zb80BZ0xtQuH7QekziQ==
X-Received: by 2002:a05:6000:12d2:: with SMTP id l18mr39532679wrx.289.1638262929322;
        Tue, 30 Nov 2021 01:02:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h204sm1797534wmh.33.2021.11.30.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:02:08 -0800 (PST)
Date:   Tue, 30 Nov 2021 10:02:07 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 02/28] drm/ttm: stop pruning fences after wait
Message-ID: <YaXoj3fzu0cfhd6j@phenom.ffwll.local>
References: <20211129120659.1815-1-christian.koenig@amd.com>
 <20211129120659.1815-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211129120659.1815-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 29, 2021 at 01:06:33PM +0100, Christian König wrote:
> This is just abusing internals of the dma_resv object.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Yeah I think if we want this back we could do a _locked version of the
wait, which prunes internally.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Btw I wonder, should we put the ttm_bo_wait wrapper on the chopping block
in gpu/todo.rst? It's really just complications I think in most cases. And
it would be nice if ttm has the same errno semantics for these as everyone
else, I always get very confused about this stuff ...

Cheers, Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e4a20a3a5d16..fc124457ba2f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1086,7 +1086,6 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>  	if (timeout == 0)
>  		return -EBUSY;
>  
> -	dma_resv_add_excl_fence(bo->base.resv, NULL);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_bo_wait);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
