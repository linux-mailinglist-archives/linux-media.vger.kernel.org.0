Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA7A436044
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 13:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhJULc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 07:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbhJULc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 07:32:26 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCA4C06161C
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 04:30:10 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id g141so309032wmg.4
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 04:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dhkroFo5cTqPW/9I0QfTfl4tRGasMCZec3snfXwEdQw=;
        b=cNCzH/F9jo1mrS9fIpnFRxiuK1duTdSiS/BYtW0H9+6dSbICcyVyeVk6jY6OCbznn/
         2cvw43JzEBZdJmClLo6p4YPeApuCIGvjhatiGHDTCUHtpz/JoAHDpayhd4GLNKER4mAO
         +kizyafx9rF0g39mxgF0BMzXJKc8m8qYpo2oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dhkroFo5cTqPW/9I0QfTfl4tRGasMCZec3snfXwEdQw=;
        b=b+4xv6VvDTlHyI0LRnu0nYGZlgGR5pJEXlslbSS0wugXXebwnuJdsG3nLJf/Bdeh26
         Igab0kcwiB6nJPBbz31wRF+h7p5r88xKfLAEL2paR18JJA4pPlwBosj8U1p+PimA2xpV
         iHiwGMK95scggOAanla7PGpJ0fle8Dl05dRk3QoVFWS1tWEvGimJn8CvazazfsAibdek
         aYlDWH5w6mVnGhGr292wyqKSV60pMylj74+ET/5HBcRlYNXMufUQFiSdppbPKDAmmwDl
         ypk4SPKrMLct8YRRX3ww2RSY7I75rt4AW3Ajhvs8auX+jz7Hv/J8Kl32WFn217LNZQg8
         OQgg==
X-Gm-Message-State: AOAM533BPeJjvDhM0nhHIfmYG2hxVlKFayHBNt0rpQkJT7eX510K1BGs
        p7jsIexh4i+Ul/M81YwI6yl1mg==
X-Google-Smtp-Source: ABdhPJzVEsIh/7AIiiuboT/OSVHnKqiQNg3iRZoNs0kgS+jdXcxGYl4P7uvEF+ur0clU4RQu6vQ/fg==
X-Received: by 2002:a1c:4444:: with SMTP id r65mr5934723wma.174.1634815809326;
        Thu, 21 Oct 2021 04:30:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p3sm4628449wrs.10.2021.10.21.04.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 04:30:08 -0700 (PDT)
Date:   Thu, 21 Oct 2021 13:30:07 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 14/28] drm/msm: use new iterator in msm_gem_describe
Message-ID: <YXFPP2wdjNV46YgP@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-15-christian.koenig@amd.com>
 <YWbp1PoezuLqHpKZ@phenom.ffwll.local>
 <9fff1e2b-b4f1-9c36-b621-4c896bf58c01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fff1e2b-b4f1-9c36-b621-4c896bf58c01@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 19, 2021 at 01:49:08PM +0200, Christian König wrote:
> Am 13.10.21 um 16:14 schrieb Daniel Vetter:
> > On Tue, Oct 05, 2021 at 01:37:28PM +0200, Christian König wrote:
> > > Simplifying the code a bit. Also drop the RCU read side lock since the
> > > object is locked anyway.
> > > 
> > > Untested since I can't get the driver to compile on !ARM.
> > Cross-compiler install is pretty easy and you should have that for pushing
> > drm changes to drm-misc :-)
> 
> I do have cross compile setups for some architectures, but I seriously can't
> do that for every single driver.
> 
> With only a bit of work we allowed MSM to be compile tested on other
> architectures as well now. That even yielded a couple of missing includes
> and dependencies in MSM which just don't matter on ARM.

The only ones you need is arm32 and arm64.
-Daniel

> 
> > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Assuming this compiles, it looks correct.
> 
> Yes it does.
> 
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> 
> Thanks,
> Christian.
> 
> > 
> > > ---
> > >   drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
> > >   1 file changed, 5 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> > > index 40a9863f5951..5bd511f07c07 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > @@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
> > >   {
> > >   	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> > >   	struct dma_resv *robj = obj->resv;
> > > -	struct dma_resv_list *fobj;
> > > +	struct dma_resv_iter cursor;
> > >   	struct dma_fence *fence;
> > >   	struct msm_gem_vma *vma;
> > >   	uint64_t off = drm_vma_node_start(&obj->vma_node);
> > > @@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
> > >   		seq_puts(m, "\n");
> > >   	}
> > > -	rcu_read_lock();
> > > -	fobj = dma_resv_shared_list(robj);
> > > -	if (fobj) {
> > > -		unsigned int i, shared_count = fobj->shared_count;
> > > -
> > > -		for (i = 0; i < shared_count; i++) {
> > > -			fence = rcu_dereference(fobj->shared[i]);
> > > +	dma_resv_for_each_fence(&cursor, robj, true, fence) {
> > > +		if (dma_resv_iter_is_exclusive(&cursor))
> > > +			describe_fence(fence, "Exclusive", m);
> > > +		else
> > >   			describe_fence(fence, "Shared", m);
> > > -		}
> > >   	}
> > > -	fence = dma_resv_excl_fence(robj);
> > > -	if (fence)
> > > -		describe_fence(fence, "Exclusive", m);
> > > -	rcu_read_unlock();
> > > -
> > >   	msm_gem_unlock(obj);
> > >   }
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
