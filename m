Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76BE6534040
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 17:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240000AbiEYPSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 11:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236085AbiEYPSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 11:18:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42960AFAE9
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 08:18:46 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e2so18973550wrc.1
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hz1L99EHsA+Mjk0mhKuLuqrS0ycdn4FgXsH4+Dwo498=;
        b=KjdIWBfJIDfoz7ZSaRk2qCOBHQx90U6e/2lcoqkFLsd3uM6esCJx1+8EVMrQOez8+K
         Egfe+DToEuvaUesG0nVk/Mhy6rNdHOh0bm02vV6lEy0vGSc6N+ojE3P9EbUU8c6nPdFV
         xEaJdHufy7oeuMurfHIHQoTKDTm8jUOOZRz1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hz1L99EHsA+Mjk0mhKuLuqrS0ycdn4FgXsH4+Dwo498=;
        b=C2/QATsCC3jPjba+V03fNIgx1kugbkrXv8u6JDVBzBW6as/Y03ALGDPxkYwbGG5Dhh
         wSO+nEeWYeqTuzvz8toIPwrkQZcuTmIvblvj8a6aB834DDCBGhRZD/GWvOGhUNpMVBKn
         KsfvK+ZGrm2LqgyyAjsKY4bAxuuIk3xWw3nPc/5xxNMKTeJJdmwenCgbGrsbm0htvPIl
         q52/n559OP4ID/CdFPEOZaVC1GdP/3ERkEDWeTiOjx/hE8Ts1j5/6yNZxvw5purOmZAh
         Rkm9MFqdUev3vQoBWt4Oo1Gnwrb1rMlGjlDQqKbprhS1iY2dSo9ox5Wt31jYb24tbIzu
         FjHw==
X-Gm-Message-State: AOAM530pzP6kVGSoSvHC79fxhb/v4hXkecbcSOqcbI/tCkDBGoIG5Xya
        pqYNQNZr/MhjgxzlddFFGNw6xg==
X-Google-Smtp-Source: ABdhPJzjSWNrzsOHnr2Xjku9V7Y9WQIaS2JAbhRpeSWCiKwCFNlOxPCyG8KdFfvrl8YT5NviT08POQ==
X-Received: by 2002:a05:6000:178d:b0:20f:e7da:6a21 with SMTP id e13-20020a056000178d00b0020fe7da6a21mr10518051wrg.689.1653491924879;
        Wed, 25 May 2022 08:18:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f2-20020a1c3802000000b003974027722csm1891727wma.47.2022.05.25.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:18:44 -0700 (PDT)
Date:   Wed, 25 May 2022 17:18:42 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: cleanup dma_fence_chain_walk
Message-ID: <Yo5I0otoyJsHY0dk@phenom.ffwll.local>
References: <20220518085446.31338-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220518085446.31338-1-christian.koenig@amd.com>
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

On Wed, May 18, 2022 at 10:54:46AM +0200, Christian König wrote:
> Use unrcu_pointer() instead of the manual cast.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

TIL about unrcu_pointer, and also that entire code here freaks me out. But
at least this seems more with what other users of similar xchg and cmpxchg
tricks are doing, so that's nice.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-fence-chain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 06f8ef97c6e8..a0d920576ba6 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -62,8 +62,8 @@ struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
>  			replacement = NULL;
>  		}
>  
> -		tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
> -			      prev, replacement);
> +		tmp = unrcu_pointer(cmpxchg(&chain->prev, RCU_INITIALIZER(prev),
> +					     RCU_INITIALIZER(replacement)));
>  		if (tmp == prev)
>  			dma_fence_put(tmp);
>  		else
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
