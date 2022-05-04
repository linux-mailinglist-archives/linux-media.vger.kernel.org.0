Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915B05199E6
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 10:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbiEDIiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 04:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbiEDIiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 04:38:03 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979EE24940
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 01:34:27 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id k27so882421edk.4
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8jDOSrZSiV6w3X1ACPuL+sxmkqjx+kq4DiVP5x5vSpk=;
        b=lHVgHnZiH13l2dDPKpQ1leUolO7KzDsTUClQyzz9TzStE1wUzencFkWFRHMglTJ6tE
         QXe/xvG8mhCoR+Tzf/8Shde4hhEk4bmSrvmKOCmcPUhZUtlhA2QD0BitHkP84rsYn/UL
         uBbuHWcsFsUflmTY2tmhkbSYQWGTBYeZmzhiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8jDOSrZSiV6w3X1ACPuL+sxmkqjx+kq4DiVP5x5vSpk=;
        b=d7Y2EdO7u89aX6LLDB1iuPSahzPc9GweLxABE/sPAA4iJlEtmeazHhT320RLIInBzO
         PxmEhnj1MLc9rPnHcfGR/+aUyE/1QcPxe6hK/TLRMzJsytivza03fpANZjGJzYu9r3Mp
         bfNy/OIQ+GwgKsnLnSH369qNzpqUtVAi+a1bcIX+3Yac7xmD6XrDnDxeEeEYQ8BTalHD
         gb8KwK4CwnavkN6kEIWf5akoXZKjWMPqE391igVQQyq5tDgCVIYD/miUg3Pex4PVwcCv
         7vOabOAWsKX+N5aPAJHVsRd4o0M09w/pAFzkqSkppPCav1bKlCQZmIYLQW/iv3WqFobB
         2z9g==
X-Gm-Message-State: AOAM530UEuO3ni+HCRyJ0mQiYp3/jdEW2PoySyKeaiXR6/cVw7SXXQkl
        CglHgvF2YkeDQRJfh7tqLkHZLQ==
X-Google-Smtp-Source: ABdhPJy3I5WdqqSY6fWfVm3ogHu0RoLWrwglM1BgTcYvHJKEt5In0vfkQIYGdQIubOsFqewaPJ7rQg==
X-Received: by 2002:a05:6402:1d4c:b0:427:d1f5:3a41 with SMTP id dz12-20020a0564021d4c00b00427d1f53a41mr11283912edb.218.1651653266220;
        Wed, 04 May 2022 01:34:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id en9-20020a056402528900b00425ff691a32sm8622400edb.0.2022.05.04.01.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:34:25 -0700 (PDT)
Date:   Wed, 4 May 2022 10:34:24 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/3] dma-buf/sync_file: cleanup fence merging a bit
Message-ID: <YnI6kPd01lG/q0N2@phenom.ffwll.local>
References: <20220426124637.329764-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426124637.329764-1-christian.koenig@amd.com>
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

On Tue, Apr 26, 2022 at 02:46:35PM +0200, Christian König wrote:
> krealloc_array() ignores attempts to reduce the array size, so the attempt
> to save memory is completely pointless here.
> 
> Also move testing for the no fence case into sync_file_set_fence(), this
> way we don't even touch the fence array when we don't have any fences.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/sync_file.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 514d213261df..0fe564539166 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -157,9 +157,15 @@ static int sync_file_set_fence(struct sync_file *sync_file,
>  	 * we already own a new reference to the fence. For num_fence > 1
>  	 * we own the reference of the dma_fence_array creation.
>  	 */
> -	if (num_fences == 1) {
> +
> +	if (num_fences == 0) {
> +		sync_file->fence = dma_fence_get_stub();
> +		kfree(fences);
> +
> +	} else if (num_fences == 1) {
>  		sync_file->fence = fences[0];
>  		kfree(fences);
> +
>  	} else {
>  		array = dma_fence_array_create(num_fences, fences,
>  					       dma_fence_context_alloc(1),
> @@ -261,19 +267,6 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  		}
>  	}
>  
> -	if (index == 0)
> -		fences[index++] = dma_fence_get_stub();
> -
> -	if (num_fences > index) {
> -		struct dma_fence **tmp;
> -
> -		/* Keep going even when reducing the size failed */
> -		tmp = krealloc_array(fences, index, sizeof(*fences),
> -				     GFP_KERNEL);
> -		if (tmp)
> -			fences = tmp;
> -	}
> -
>  	if (sync_file_set_fence(sync_file, fences, index) < 0)
>  		goto err_put_fences;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
