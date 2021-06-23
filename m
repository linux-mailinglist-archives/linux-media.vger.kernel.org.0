Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88E43B20DF
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 21:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFWTTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 15:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWTTW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 15:19:22 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4C5C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 12:17:04 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id he7so5586014ejc.13
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 12:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7Hua08stsWuHXUQaJW2px47NH816H2YtXOe8cA4IlCg=;
        b=igrDooVK7zk8zc3g3dng9Z4kKomtb0NBT/xyXoKOS94YQo/bjKuJrZADYBrMzD09nW
         8ViG1g+Jg+fDW1mVxTt0V786rlCxik1uVc+AvXawxAIArMsqXfluF3j4zx8Z0vlo9uvD
         8Dy525bFR2inG+gm3XXR2dYbhgCibAdYaUrCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7Hua08stsWuHXUQaJW2px47NH816H2YtXOe8cA4IlCg=;
        b=KLb6aOF+hKwN1dYj5rErZbu4fFlVVCbukwCa64hxU2mODIbOFij6c2UFp0sgZpq5ky
         X0/3x+HZhWelwAAsUWaQNsFBlEEaphNkXzx/xv2mggIr4QL+FByf++gznKAtHM+sGMAG
         jfdwLRv7ppYeM2mioMGhbdQy1MI88+oc++xN67dpcWeQlLlf3z1ljSxP/Gvto50Mhbwy
         DOfVvsnP/NuaR5fB5+6hhtthZPlPgRLfWlmnn3AryixWqMvxh8fjbml6m82QDWZP5Ksa
         TkrgrS4me2T0YfADGXydPPIGB+tCaC8bGHyzcWY4c+lnfQPLzRui+dSyn4wk9qz9lVzm
         VsHw==
X-Gm-Message-State: AOAM531SqnE2NN5LkFV/We+JRNWHyGvJ5txiri//4tw1wRXWL0e7hskF
        IfQ8wa4l8hbej9cMskLhPw9CJQ==
X-Google-Smtp-Source: ABdhPJzJhju7GF3OV5WfqUhYCkKTkqdmd8DF/MurQj6ivLt84BKbGtZA9SzfqW27EuszS2xGxd/K8A==
X-Received: by 2002:a17:907:1ca0:: with SMTP id nb32mr1565572ejc.105.1624475822653;
        Wed, 23 Jun 2021 12:17:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s7sm260735ejd.88.2021.06.23.12.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 12:17:02 -0700 (PDT)
Date:   Wed, 23 Jun 2021 21:17:00 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        linaro-mm-sig@lists.linaro.org,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 06/15] drm/panfrost: Fix implicit sync
Message-ID: <YNOIrGJY7lpy+/VE@phenom.ffwll.local>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-7-daniel.vetter@ffwll.ch>
 <20210623184737.7e47f77c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210623184737.7e47f77c@collabora.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 06:47:37PM +0200, Boris Brezillon wrote:
> On Tue, 22 Jun 2021 18:55:02 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> 
> > Currently this has no practial relevance I think because there's not
> > many who can pull off a setup with panfrost and another gpu in the
> > same system. But the rules are that if you're setting an exclusive
> > fence, indicating a gpu write access in the implicit fencing system,
> > then you need to wait for all fences, not just the previous exclusive
> > fence.
> > 
> > panfrost against itself has no problem, because it always sets the
> > exclusive fence (but that's probably something that will need to be
> > fixed for vulkan and/or multi-engine gpus, or you'll suffer badly).
> > Also no problem with that against display.
> > 
> > With the prep work done to switch over to the dependency helpers this
> > is now a oneliner.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Pushed the 3 panfrost patches to drm-misc-next, thanks for reviewing them.
-Daniel

> 
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_job.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 71cd43fa1b36..ef004d587dc4 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -203,9 +203,8 @@ static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
> >  	int i, ret;
> >  
> >  	for (i = 0; i < bo_count; i++) {
> > -		struct dma_fence *fence = dma_resv_get_excl_unlocked(bos[i]->resv);
> > -
> > -		ret = drm_gem_fence_array_add(deps, fence);
> > +		/* panfrost always uses write mode in its current uapi */
> > +		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
> >  		if (ret)
> >  			return ret;
> >  	}
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
