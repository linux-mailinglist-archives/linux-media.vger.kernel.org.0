Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6AC351C1F3
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 16:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380387AbiEEOM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 10:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242724AbiEEOMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 10:12:25 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CBE58E7D
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 07:08:45 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id kq17so8986721ejb.4
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=whU2Grj2hTMn+FouYox1YxYi97Wm6FNkZiyqXWhPOUA=;
        b=akAqrBV0UCJt5kdXnjxjtqW6s1hUOqmM7GAnqUSMXQ0HstjvuJunNVAPrkkr06KiEp
         DJ55hQVx91xGIpnqZwDMsZhurjgyj/DdnxyquJzsm3l+mg/RVVRDbc2z3+PiQ55K51I+
         3kLVmDji1r+KdQTkPJWq+pcMiVcWFQfVNDKbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=whU2Grj2hTMn+FouYox1YxYi97Wm6FNkZiyqXWhPOUA=;
        b=6ZDrof+P/OaGCVKN3qYvkTSfMgGGtYF+hPdySEYnnH2zWzixNkgBhaYUFimxKoSKvM
         n9h4E6/LWHCw2SWfz8w52RmbAsQ84yOhkBFD3WPASrSM76Oe8GrrlqZBDfZiyT93jH27
         6uSXzrS5HRIo3GHlO7s4WUMReA19HPRYirheosw9BJzQ/wBDi4vOnNYALBttixmtqIyq
         ht1pHD7RoCh9O4FkLTsC8QrjXqZKz4YO8hGbn3Q55H5H0Q/RsUV35YlrOI42j+EdTr9g
         QLRMfNjiKu6iEBKpj2vnyPuPaZCcvJvwo3kD297ABRSY+RFMiO2+v3AzfyvinEqBe3/N
         jhYg==
X-Gm-Message-State: AOAM533rFVm54hDHkrYfG7urj/SVeGGDqq87VLtPsLJFFhv0T6slFzx6
        ipDsxfCu7m2CwMeiQ2EJFlikKjo7/qScrA==
X-Google-Smtp-Source: ABdhPJyd2lHGirqCzJ7MwmLX+vEXwRdS5/1VGdcqlUfczFM3BID+iBgZf5y/64BdxtG+AXSln2AquA==
X-Received: by 2002:a17:906:c145:b0:6f3:9ea7:1d41 with SMTP id dp5-20020a170906c14500b006f39ea71d41mr26269083ejc.269.1651759724417;
        Thu, 05 May 2022 07:08:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ia12-20020a170907a06c00b006f3ef214e0esm768619ejc.116.2022.05.05.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 07:08:43 -0700 (PDT)
Date:   Thu, 5 May 2022 16:08:42 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each
Message-ID: <YnPaapZfMZuwW1h7@phenom.ffwll.local>
References: <20220504122256.1654-1-christian.koenig@amd.com>
 <20220504122256.1654-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504122256.1654-3-christian.koenig@amd.com>
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

On Wed, May 04, 2022 at 02:22:54PM +0200, Christian König wrote:
> dma_fence_chain containers cleanup signaled fences automatically, so
> filter those out from arrays as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-unwrap.c | 23 ++++++++++++++++-------
>  include/linux/dma-fence-unwrap.h   |  4 ++--
>  2 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 711be125428c..7b0b91086ded 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -32,8 +32,13 @@ __dma_fence_unwrap_array(struct dma_fence_unwrap *cursor)
>  struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
>  					 struct dma_fence_unwrap *cursor)
>  {
> +	struct dma_fence *tmp;
> +
>  	cursor->chain = dma_fence_get(head);
> -	return __dma_fence_unwrap_array(cursor);
> +	tmp = __dma_fence_unwrap_array(cursor);
> +	if (tmp && dma_fence_is_signaled(tmp))
> +		tmp = dma_fence_unwrap_next(cursor);
> +	return tmp;
>  }
>  EXPORT_SYMBOL_GPL(dma_fence_unwrap_first);
>  
> @@ -48,12 +53,16 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>  {
>  	struct dma_fence *tmp;
>  
> -	++cursor->index;
> -	tmp = dma_fence_array_next(cursor->array, cursor->index);
> -	if (tmp)
> -		return tmp;
> +	do {
> +		++cursor->index;
> +		tmp = dma_fence_array_next(cursor->array, cursor->index);
> +		if (tmp && !dma_fence_is_signaled(tmp))
> +			return tmp;

Don't do need a do {} while here too to first walk through the array
before going to the next one in the chain? Maybe add a testcase for this?

> +
> +		cursor->chain = dma_fence_chain_walk(cursor->chain);
> +		tmp = __dma_fence_unwrap_array(cursor);
> +	} while (tmp && dma_fence_is_signaled(tmp));
>  
> -	cursor->chain = dma_fence_chain_walk(cursor->chain);
> -	return __dma_fence_unwrap_array(cursor);
> +	return tmp;
>  }
>  EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
> index e7c219da4ed7..e9d114637294 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -41,8 +41,8 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
>   * @head: starting point for the iterator
>   *
>   * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
> - * potential fences in them. If @head is just a normal fence only that one is
> - * returned.
> + * potential none signaled fences in them. If @head is just a normal fence only
> + * that one is returned.

I think I get what you want to say, but it reads garbled. What about
leaving the current text as-is and adding something like

"Note that signalled fences are opportunistically filtered out, which
means the iteration is potentially over no fence at all"

Or something like that? I think smashing this all into one sentence
doesn't work well.

Then please also add this same sentence to unwrap_first/next() for
completeness.
-Daniel

>   */
>  #define dma_fence_unwrap_for_each(fence, cursor, head)			\
>  	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
