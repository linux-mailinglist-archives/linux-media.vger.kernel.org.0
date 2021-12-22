Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4E747D8FE
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240864AbhLVVxQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:53:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240833AbhLVVxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:53:16 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EACC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:53:15 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id bm14so13789352edb.5
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yBDJCmeaT+tM7/3ZGzr3jqJyscYabJL4fOLvv95NZ8Y=;
        b=TeelYZqeWHWDKFtFiBJXZ1GpKy8D7JsVxszcrXd7AMSOFZpl42DDrNPK3nDh26/Oo0
         SMAzaLQYMD1NeJ/p/LUFyqlNeqeSp/0J0uXufjC7dI+QEwYV07GaUEjqoHQLHtYjPXwv
         vX6mP8otA5kQ1QmfpeaM93b5ZzGWMdzb1Bf9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yBDJCmeaT+tM7/3ZGzr3jqJyscYabJL4fOLvv95NZ8Y=;
        b=HkkHy15/YbPkCR4Kg9J/ft6bbv51UXag/OKEw/vx7MGtiaPlJcUe5qZCTOu50/V6l2
         Ls0X2Awy7fECq3sKusRQv4n6eT2VlmWWy8zQWTV3vX71opet/C1vW3LxixnoihmUvnpO
         8i85LqIWe1mtQMhjdOFRY8gMPsj8AKGtmAmXPZDnt7bJ7Nj7PPVN4XCG6hbqJeucqlA7
         HXHd4sGSUn08Flgq/qWnuvzJKswI5cl0y1AxsGgqCuqpSj+J2ms4nzj6gLVRL4oOVYFZ
         ZJTxkVMFS7IAbWMbc88KTFKnQcYt6MAnHERQdnyxiol6L8xyx0260MTQ/tlJfAOVkX9A
         DWVw==
X-Gm-Message-State: AOAM530l/G+owBDP/A9qA/3KKbnbtAOe/3e2HnZpP/CHzyNESxzQjDl4
        FMaEqK6dRb26qNbCgLIRxoKLpA==
X-Google-Smtp-Source: ABdhPJwgrUJcT/9tjLzdw/pZnJlRl0CYKBxXTvQbO1TJ9r3hWHI/E/5nmcelnHOMi+EKS/8k3+U5xg==
X-Received: by 2002:a17:907:168b:: with SMTP id hc11mr4155613ejc.518.1640209994552;
        Wed, 22 Dec 2021 13:53:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id qw20sm1110251ejc.185.2021.12.22.13.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:53:14 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:53:12 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 17/24] drm/amdgpu: use dma_resv_get_singleton in
 amdgpu_pasid_free_cb
Message-ID: <YcOeSCEZ/MYqP1Sr@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-18-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-18-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:34:04PM +0100, Christian König wrote:
> Makes the code a bit more simpler.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> index be48487e2ca7..888d97143177 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -107,36 +107,19 @@ static void amdgpu_pasid_free_cb(struct dma_fence *fence,
>  void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>  			       u32 pasid)
>  {
> -	struct dma_fence *fence, **fences;
>  	struct amdgpu_pasid_cb *cb;
> -	unsigned count;
> +	struct dma_fence *fence;
>  	int r;
>  
> -	r = dma_resv_get_fences(resv, true, &count, &fences);
> +	r = dma_resv_get_singleton(resv, true, &fence);
>  	if (r)
>  		goto fallback;
>  
> -	if (count == 0) {
> +	if (!fence) {
>  		amdgpu_pasid_free(pasid);
>  		return;
>  	}
>  
> -	if (count == 1) {
> -		fence = fences[0];
> -		kfree(fences);
> -	} else {
> -		uint64_t context = dma_fence_context_alloc(1);
> -		struct dma_fence_array *array;
> -
> -		array = dma_fence_array_create(count, fences, context,
> -					       1, false);
> -		if (!array) {
> -			kfree(fences);
> -			goto fallback;
> -		}
> -		fence = &array->base;
> -	}
> -
>  	cb = kmalloc(sizeof(*cb), GFP_KERNEL);
>  	if (!cb) {
>  		/* Last resort when we are OOM */
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
