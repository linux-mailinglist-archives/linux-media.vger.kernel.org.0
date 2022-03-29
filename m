Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748324EA993
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 10:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbiC2Is1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 04:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234156AbiC2Is0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 04:48:26 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944612414CD
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:46:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b19so23687443wrh.11
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WQ2kaLdWd6bHTTrUYmbjDh5DyF5e2Q5tFk7Y5yf6aUw=;
        b=eTH/oHfZCV5h175g+RYPvPFYYi6sXFINblkVYg23zTrxiBsRnTFWise7hJ4+9STE/G
         ZDHccT2vFfBJrJN4Ag/Fk7dNV1RxSoITw3Mi+zPhCs0Qwnu8Av84KmlR4TkM+8Ecmy9q
         /Io6bY6jMY35VykqPN/PuL1VVXtUHa8wHreG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WQ2kaLdWd6bHTTrUYmbjDh5DyF5e2Q5tFk7Y5yf6aUw=;
        b=m3g+vfV3TZFv822vuIsW0uYV6zPW7mNznJAi1HeXu/7/S4PYCLYtTJod9ecaqYyGBE
         Vu9zQeGmeScLh9/swBIneqvDuGYa67qRsY0j9Mf7MYeM7SeH8NinN0RbVm/81sRwUwtZ
         HJy6gvQoAVE0RGZ9/spFbSPNYnUTJoqgI6xXTXLScMTCMxwtKEOtdvU8NNOpKLmbJRpx
         8UePzmDUgdS9OEnNWn/qjkcFVBfj0P9MGuXs1HhskKjf5Tb0pe37CVaaM8uordaTg0vn
         c7+NjBJfNEqBPQBOxxnxN59zyhENMJOdEkAjarE2tTmkU2oMMclUXUA0/iGGI1XM1FFW
         m9yw==
X-Gm-Message-State: AOAM532LGruc4gn6o7IySIov5ViTrMW4IvX/pixh3rCKth5A4XxQFxin
        BklCNuki2f4e/7V8MAJcsNZmuw==
X-Google-Smtp-Source: ABdhPJwf7Cm09Z2yPWUhWw1HzwyqJfse0xcCimVQyH8DzhRGXu5ot9HMcA9Ssfthoofr9lmI4zKDOw==
X-Received: by 2002:adf:e488:0:b0:205:a8e0:6095 with SMTP id i8-20020adfe488000000b00205a8e06095mr22344861wrm.324.1648543603106;
        Tue, 29 Mar 2022 01:46:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d20-20020a05600c34d400b0038caf684679sm2398607wmq.0.2022.03.29.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 01:46:42 -0700 (PDT)
Date:   Tue, 29 Mar 2022 10:46:40 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        ville.syrjala@linux.intel.com, daniel@ffwll.ch,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] dma-buf/sync-file: fix logic error in new fence
 merge code
Message-ID: <YkLHcMGARAA9Ektl@phenom.ffwll.local>
References: <20220329070001.134180-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220329070001.134180-1-christian.koenig@amd.com>
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

On Tue, Mar 29, 2022 at 09:00:00AM +0200, Christian König wrote:
> When the array is empty because everything is signaled we can't use
> add_fence() to add something because that would filter the signaled
> fence again.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
> ---
>  drivers/dma-buf/sync_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index b8dea4ec123b..514d213261df 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -262,7 +262,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>  	}
>  
>  	if (index == 0)
> -		add_fence(fences, &index, dma_fence_get_stub());
> +		fences[index++] = dma_fence_get_stub();

Uh idiot me wondered about this and somehow convinced myself that adding a
random fences instead of a singalled stub is ok. I should have checked
more carefully :-/

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
>  	if (num_fences > index) {
>  		struct dma_fence **tmp;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
