Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A17247D8DF
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 22:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbhLVVho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 16:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbhLVVho (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 16:37:44 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BEFC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:37:43 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id z29so13651160edl.7
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 13:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5Qo+nFcnWhfkRsrQeCzbvYusBRH/F2n7RikRiuAf8/g=;
        b=IvYzvI3/k4LalWnS2750Udv5OE/ko7GcCzuzKNVNfHKcMqA0T2D9NinPZtbsC4iUM+
         I1s4AjJqIdn/6n/cjhy81gKOkV82UZZfGsvDFUZUeYeuXxkrfuJ7dGETUdBYvnWlY/pG
         1yq/bHJmHiL2riWajRm0Z4ZyGTf8mvrODxyto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5Qo+nFcnWhfkRsrQeCzbvYusBRH/F2n7RikRiuAf8/g=;
        b=444yxzjwTWfukA32lqsLRfVkzlYHm46g5QgmqJdoXrtE2xdx0zbOYslu5c46kGoNrJ
         juKJqxexB/BsBnSUy6kju5vz9miERyyeaSqsLLuv/Ngq/Dp2QUdHNzqie0JRjDPzygtD
         T+nQ7QtPrM2QuYEWymYEF8GoyNEvyOewVC2SfWG2ysrlpf9yhADU6mN3jHQnif9XSxvT
         6bih9RTsYvhSvac7T8GWyF2XXlMp/qJEsdR6we5580yyZTBlu1Ka+oVbZjTpO0iZqd9E
         y4wl1rOA5VMwTmXUrqyguEqmL+z4fKDlRGojip0YfPwPdJIDCh3a1cEGz8r3vhaXyDF8
         mMXw==
X-Gm-Message-State: AOAM5326ivo5JP/u/WZT778xt3qS9aweKS77wJppbJ0PuHAlsDDgC6hh
        ATA2qW1+LUi9VjXYxBhakgvvrA==
X-Google-Smtp-Source: ABdhPJzOaQ3/3QMM/0PJ7nP8MwY7OPDou96jhbXDS81aDHtiLwn7DX6gpwyf9ktdSVJ4Sh++XjoWCQ==
X-Received: by 2002:a05:6402:51cd:: with SMTP id r13mr4458688edd.184.1640209062287;
        Wed, 22 Dec 2021 13:37:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s26sm1071922eja.152.2021.12.22.13.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 13:37:41 -0800 (PST)
Date:   Wed, 22 Dec 2021 22:37:40 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 11/24] drm/amdgpu: use dma_resv_for_each_fence for CS
 workaround
Message-ID: <YcOapBWDYQj5hKRn@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-12-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-12-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:33:58PM +0100, Christian König wrote:
> Get the write fence using dma_resv_for_each_fence instead of accessing
> it manually.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 53e407ea4c89..7facd614e50a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1268,6 +1268,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>  		struct dma_resv *resv = e->tv.bo->base.resv;
>  		struct dma_fence_chain *chain = e->chain;
> +		struct dma_resv_iter cursor;
> +		struct dma_fence *fence;
>  
>  		if (!chain)
>  			continue;
> @@ -1277,9 +1279,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  		 * submission in a dma_fence_chain and add it as exclusive
>  		 * fence.
>  		 */
> -		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
> -				     dma_fence_get(p->fence), 1);
> -
> +		dma_resv_for_each_fence(&cursor, resv, false, fence) {
> +			break;
> +		}
> +		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);

Uh this needs a TODO. I'm assuming you'll fix this up later on when
there's more than write fence, but in case of bisect or whatever this is a
bit too clever. Like you just replace one "dig around in dma-resv
implementation details" with one that's not even a documented interface
:-)

With an adequately loud comment added interim:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  		rcu_assign_pointer(resv->fence_excl, &chain->base);
>  		e->chain = NULL;
>  	}
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
