Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C01242C28E
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 16:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235564AbhJMOQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 10:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbhJMOQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 10:16:52 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF04C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:14:48 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id k7so8800569wrd.13
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QGMl28YhRUiVkwlLZBmVBXM/gyOekGqQg/96lael90E=;
        b=P0JFBTHJb1PbNMI8zjyzr7d9fJsFYOFHA0yBi6E2RZWs9BbG3pgP09Q5ZbfNPBYrfe
         omcKg0S8cPzW2K3NVO1TtfBvQGSQmGi81ZTXvdFcqcuT3/GvLOrN8on5acW1QONc+L3Q
         dVWlOopJ2jZgRk57IgcSw6BClvk7y94ehK1mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QGMl28YhRUiVkwlLZBmVBXM/gyOekGqQg/96lael90E=;
        b=j/GlAAgFXH9t6GvHm2AKhUukFL5PtU6CHBYNb6tS3qCFLIuO1ImLKTBCGjkRBLIWH/
         T0+vI0EIdrkObXUxalRcgdpq7PSpxh5+DNSRjuml4/La8OIWGNZ5D9ZZ2IncPR+TOU2W
         72ghNwW/sjRVWQ5bQrgY1PX5D2SpByKQ7jk4mP/Nj4J7JeVpQ8hHoubhmjzoDLfThMwC
         SsZ8LL5234nLDmJ+3hpBOxBfuNSfNfXhVdugiVpyeDsrMo4z9Ov9REijZOYNLGStlrjk
         YsirAUUQrC2QwVk5tT6xFoB1m8TgsLYoJoLIrvO2BnzrxupIwqdu0zfsa60TSfbclvpg
         YUOg==
X-Gm-Message-State: AOAM532aMtvTqaJUwXnZCAOfYoVqq/rT+u9y+Tc4kHlAsrh7qbr6SChL
        cDR8dxzHZeHieoFvg1Nvvi2gcw==
X-Google-Smtp-Source: ABdhPJz3DWZJUUUVjvwZK5GxUdwNkVvvYKU7kkJTlhYb5/u8jsP/6ywjOD2vzguomUiuBwi9+TI1iA==
X-Received: by 2002:a5d:6ad2:: with SMTP id u18mr40933209wrw.47.1634134487220;
        Wed, 13 Oct 2021 07:14:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b190sm5490616wmd.25.2021.10.13.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 07:14:46 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:14:44 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 14/28] drm/msm: use new iterator in msm_gem_describe
Message-ID: <YWbp1PoezuLqHpKZ@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-15-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-15-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 05, 2021 at 01:37:28PM +0200, Christian König wrote:
> Simplifying the code a bit. Also drop the RCU read side lock since the
> object is locked anyway.
> 
> Untested since I can't get the driver to compile on !ARM.

Cross-compiler install is pretty easy and you should have that for pushing
drm changes to drm-misc :-)

> Signed-off-by: Christian König <christian.koenig@amd.com>

Assuming this compiles, it looks correct.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 40a9863f5951..5bd511f07c07 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>  {
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>  	struct dma_resv *robj = obj->resv;
> -	struct dma_resv_list *fobj;
> +	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
>  	struct msm_gem_vma *vma;
>  	uint64_t off = drm_vma_node_start(&obj->vma_node);
> @@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>  		seq_puts(m, "\n");
>  	}
>  
> -	rcu_read_lock();
> -	fobj = dma_resv_shared_list(robj);
> -	if (fobj) {
> -		unsigned int i, shared_count = fobj->shared_count;
> -
> -		for (i = 0; i < shared_count; i++) {
> -			fence = rcu_dereference(fobj->shared[i]);
> +	dma_resv_for_each_fence(&cursor, robj, true, fence) {
> +		if (dma_resv_iter_is_exclusive(&cursor))
> +			describe_fence(fence, "Exclusive", m);
> +		else
>  			describe_fence(fence, "Shared", m);
> -		}
>  	}
>  
> -	fence = dma_resv_excl_fence(robj);
> -	if (fence)
> -		describe_fence(fence, "Exclusive", m);
> -	rcu_read_unlock();
> -
>  	msm_gem_unlock(obj);
>  }
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
