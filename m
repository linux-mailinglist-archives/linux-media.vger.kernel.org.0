Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A13C47D8E8
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbhLVVnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhLVVnd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:43:33 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA50FC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:43:32 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id f5so13706463edq.6
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rGFC189p0/EoAKk+SmDLGFHPVcyFlSei8zEewkFJCeM=;
        b=Ji3RtVGcSaXXziXVZvdyWjy5OJnrLNDeKC0x5OT9/UGktaxejOUmlXezGaOy4t4wOV
         9q8q6zw5UVHab8o7RzaGML1+u0p76ecrdjvF35UDmPrd1O4IR3yeAqeqF4GMnQq/uLdo
         fmWTSdnwOKFNHbgIXtF3vjRpFEgSvZNVz0DTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rGFC189p0/EoAKk+SmDLGFHPVcyFlSei8zEewkFJCeM=;
        b=X6dr8KiBoxxfqAEWCJgt+t5obd2wt5nByio2+ubqSDQVw/7hYx6YE2yZqTzIF27KCm
         VkdnncClS4I8emEbKsj37utfqe5WuhtfIXuBNei7WV6jzUTcwWE+01SW1urQ03f8tAHh
         /Ci/U9MPjG4QN0sRd5/X6ylrRYxU+FBynMsK06W7VyVlvHF6kVCTKirrtlC4oQNGCIH9
         So0pIsMZvnmtdmCZd2Ihgy8igNLPjIFCtAaltA1OfNFIASTTk+RxLVO2Hazm0VVUuOUJ
         9VdXscTq4tFlSTv+iHiVehK2E2V3vQZ5YBHKGk1KvfO+tc0nXxI7ESOipMLF7hTAj2r9
         3/SA==
X-Gm-Message-State: AOAM532ciw+/ze2vnM+W/augZzFQO9fkss3Igv14XSxj68vP00Y+na68
        4REMfD3fY1up3zdPt1zS/MFHNQ==
X-Google-Smtp-Source: ABdhPJyxT8KQWM8hWC2wsRK03dqYPtFEF4zFxsnHzxRKmkHsJr22wE0SHz/Id4iluMcIzDpRPDM8YQ==
X-Received: by 2002:a05:6402:3490:: with SMTP id v16mr2838442edc.398.1640209411476;
        Wed, 22 Dec 2021 13:43:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p4sm1083242eju.98.2021.12.22.13.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:43:30 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:43:29 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 13/24] dma-buf: drop the DAG approach for the dma_resv
 object
Message-ID: <YcOcASxfAApIpbrf@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-14-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-14-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:34:00PM +0100, Christian König wrote:
> So far we had the approach of using a directed acyclic
> graph with the dma_resv obj.
> 
> This turned out to have many downsides, especially it means
> that every single driver and user of this interface needs
> to be aware of this restriction when adding fences. If the
> rules for the DAG are not followed then we end up with
> potential hard to debug memory corruption, information
> leaks or even elephant big security holes because we allow
> userspace to access freed up memory.
> 
> Since we already took a step back from that by always
> looking at all fences we now go a step further and stop
> dropping the shared fences when a new exclusive one is
> added.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 9acceabc9399..ecb2ff606bac 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c

No doc update at all!

I checked, we're not that shitty with docs, Minimally the DOC: section
header and also the struct dma_resv kerneldoc. Also there's maybe more
references and stuff I've missed on a quick look, please check for them
(e.g. dma_buf.resv kerneldoc is rather important to keep correct too).

Code itself does what it says in the commit message, but we really need
the most accurate docs we can get for this stuff, or the confusion will
persist :-/

Cheers, Daniel

> @@ -383,29 +383,16 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  {
>  	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
> -	struct dma_resv_list *old;
> -	u32 i = 0;
>  
>  	dma_resv_assert_held(obj);
>  
> -	old = dma_resv_shared_list(obj);
> -	if (old)
> -		i = old->shared_count;
> -
>  	dma_fence_get(fence);
>  
>  	write_seqcount_begin(&obj->seq);
>  	/* write_seqcount_begin provides the necessary memory barrier */
>  	RCU_INIT_POINTER(obj->fence_excl, fence);
> -	if (old)
> -		old->shared_count = 0;
>  	write_seqcount_end(&obj->seq);
>  
> -	/* inplace update, no shared fences */
> -	while (i--)
> -		dma_fence_put(rcu_dereference_protected(old->shared[i],
> -						dma_resv_held(obj)));
> -
>  	dma_fence_put(old_fence);
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
