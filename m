Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE8851C20F
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 16:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380470AbiEEOQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 10:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379723AbiEEOQY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 10:16:24 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B6F5A096
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 07:12:44 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id a21so5381776edb.1
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kVsswnf/g59OO+feN+eGWTWREjJsADfr8vABwXR+jN4=;
        b=ZZRqDlkh+V4KBi+3tRnCE0GMMIm1yJpg+6UqpoQkS3iFsXMmV9oVHtaBRHe7BIycp7
         PShUzCunCfi4WVfEzwzm1DSQDXkk2zHmRar6Q+0QzzZLIS4tnL78zRT/5tWaNoU4CPAh
         ecD4HXZGVhhCEYhe2g8YhFPmNhhXv3BO7+7qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kVsswnf/g59OO+feN+eGWTWREjJsADfr8vABwXR+jN4=;
        b=wx1exmktSCoSt7H1hUrcvs1StUV/8Dyx0ZZySz4R+v5Zw2MsP0gZ4ewQN6ruudW3DA
         miY72crf2awgDrTJBP5UV78JVIlc5xIbixYB382DZPHki5Hmh6sEMcGTvjeraR8r+5h4
         IFNti+LKA3MncUhEit3Sxwga8Cw7qHJRoEJHU4zZIpvV2hkFoAB4ByVMwZZYkU/95wB6
         lrVZ4DknmNF/bFA8YBi8oz9jr8a4XtjQ/s6Fe2bWRLHcbhHvKFzqwj7PyN7080yPAsfi
         VbMT2HkcFVogt6Fjo0HFV0RgmMErpC3VS8m51XqyqwM97tnV5ASd+3ZrbEh+c+ExwAq/
         jwVQ==
X-Gm-Message-State: AOAM5305hl42/s8vTGsCzs934wX2pHEONkUcSqh5mUjI2BxYSAWpZiRo
        O0FToxEq19E1SrlUofYozuxskg==
X-Google-Smtp-Source: ABdhPJxVh60ePw25wH48SbQ34nxQxHULwVw3a2tw5BFeqHYSaXgGwxHkGLPXE6s3ptQolxtfQhAi2A==
X-Received: by 2002:a05:6402:3552:b0:427:e36a:e839 with SMTP id f18-20020a056402355200b00427e36ae839mr15398404edd.351.1651759963197;
        Thu, 05 May 2022 07:12:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709070b1900b006f3ef214e5esm775164ejl.196.2022.05.05.07.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:12:42 -0700 (PDT)
Date:   Thu, 5 May 2022 16:12:40 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 5/5] drm: use dma_fence_unwrap_merge() in drm_syncobj
Message-ID: <YnPbWNumTafUUEk9@phenom.ffwll.local>
References: <20220504122256.1654-1-christian.koenig@amd.com>
 <20220504122256.1654-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504122256.1654-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 04, 2022 at 02:22:56PM +0200, Christian König wrote:
> The unwrap merge function is now intended for this use case.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Yeah this starts to make sense now as refactor.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_syncobj.c | 57 +++++------------------------------
>  1 file changed, 7 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 7e48dcd1bee4..bbad9e4696e7 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -184,6 +184,7 @@
>   */
>  
>  #include <linux/anon_inodes.h>
> +#include <linux/dma-fence-unwrap.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
>  #include <linux/sched/signal.h>
> @@ -853,57 +854,12 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  					&args->handle);
>  }
>  
> -
> -/*
> - * Try to flatten a dma_fence_chain into a dma_fence_array so that it can be
> - * added as timeline fence to a chain again.
> - */
> -static int drm_syncobj_flatten_chain(struct dma_fence **f)
> -{
> -	struct dma_fence_chain *chain = to_dma_fence_chain(*f);
> -	struct dma_fence *tmp, **fences;
> -	struct dma_fence_array *array;
> -	unsigned int count;
> -
> -	if (!chain)
> -		return 0;
> -
> -	count = 0;
> -	dma_fence_chain_for_each(tmp, &chain->base)
> -		++count;
> -
> -	fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
> -	if (!fences)
> -		return -ENOMEM;
> -
> -	count = 0;
> -	dma_fence_chain_for_each(tmp, &chain->base)
> -		fences[count++] = dma_fence_get(tmp);
> -
> -	array = dma_fence_array_create(count, fences,
> -				       dma_fence_context_alloc(1),
> -				       1, false);
> -	if (!array)
> -		goto free_fences;
> -
> -	dma_fence_put(*f);
> -	*f = &array->base;
> -	return 0;
> -
> -free_fences:
> -	while (count--)
> -		dma_fence_put(fences[count]);
> -
> -	kfree(fences);
> -	return -ENOMEM;
> -}
> -
>  static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>  					    struct drm_syncobj_transfer *args)
>  {
>  	struct drm_syncobj *timeline_syncobj = NULL;
> +	struct dma_fence *fence, *tmp;
>  	struct dma_fence_chain *chain;
> -	struct dma_fence *fence;
>  	int ret;
>  
>  	timeline_syncobj = drm_syncobj_find(file_private, args->dst_handle);
> @@ -912,13 +868,14 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>  	}
>  	ret = drm_syncobj_find_fence(file_private, args->src_handle,
>  				     args->src_point, args->flags,
> -				     &fence);
> +				     &tmp);
>  	if (ret)
>  		goto err_put_timeline;
>  
> -	ret = drm_syncobj_flatten_chain(&fence);
> -	if (ret)
> -		goto err_free_fence;
> +	fence = dma_fence_unwrap_merge(tmp);
> +	dma_fence_put(tmp);
> +	if (!fence)
> +		goto err_put_timeline;
>  
>  	chain = dma_fence_chain_alloc();
>  	if (!chain) {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
