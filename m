Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571633EAB00
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 21:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhHLT3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 15:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhHLT3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 15:29:36 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B02CC0613D9
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 12:29:10 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q18so2943587wrm.6
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vK3N1x/8SbosoS3uBizGVb1PhP4NVJPTrGmAX9XbKo0=;
        b=HHCdJzDBUSSv4gJIkst4UkP003ypJI9ih1Q2cy6gken6e776ZhrJj+MaiecCYquivY
         oV5b8yMgCwSMpQ54XpCjKAiLfuou0JiTOy00ftVAthVt8/xAY5W1xB1VqYAr2EfDMKnu
         oH8/QgoaMPRMj4wLy60MntfWEzzryxVreT1B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vK3N1x/8SbosoS3uBizGVb1PhP4NVJPTrGmAX9XbKo0=;
        b=Bbk15YzcW30nNmHPn+p/Vo1WhnY5e3VyiCPtvEvaUg5ftFSiT40uTjEEZPksyN4E9h
         EAAVLz7y+7KsJfHnjJCtZIlo8qQJBa6whpL+DprLaL2IVN268JHd8fnkl0Zs6NawW+nb
         K1WmJcA7nRezeePVF1YVPniOAte09GDx6fPCr4jaRbMN+9MurGGJWSetxQBB0c9escy8
         e6NXNJD5/hCdfBA9OXa/85rX3dix79jT0whIW3QmQJtOPM0jAzb+ll0pcpAaGXg31UJL
         2ivEeLFZxuXYBuf9gbJ/K5a/ZLLBqnYf/2Rd+fQpYA1yDw6oJ2lVOwi4nmihztCV1RxO
         0iKQ==
X-Gm-Message-State: AOAM532ps6tjHy8n5NXrM70RgMXCAcSFmjfuDpgjPnquZZvhgl+HQ8Uw
        IEAwhmUF6v+MMhHs8ta/j2Yeqw==
X-Google-Smtp-Source: ABdhPJxtaf2b2aXWftudMkaUX0scxPW67FZyX2NlvkEhxSM3RIrnq+OhL1847l8YFlS55Urw3cH0pQ==
X-Received: by 2002:a05:6000:1b02:: with SMTP id f2mr5719224wrz.274.1628796549010;
        Thu, 12 Aug 2021 12:29:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a11sm4182999wrq.6.2021.08.12.12.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 12:29:08 -0700 (PDT)
Date:   Thu, 12 Aug 2021 21:29:06 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 12/20] drm/msm: Use scheduler dependency handling
Message-ID: <YRV2goAobvG+6dmn@phenom.ffwll.local>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-13-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210805104705.862416-13-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 05, 2021 at 12:46:57PM +0200, Daniel Vetter wrote:
> drm_sched_job_init is already at the right place, so this boils down
> to deleting code.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Ping for ack&testing please.
-Daniel

> ---
>  drivers/gpu/drm/msm/msm_gem.h        |  5 -----
>  drivers/gpu/drm/msm/msm_gem_submit.c | 19 +++++--------------
>  drivers/gpu/drm/msm/msm_ringbuffer.c | 12 ------------
>  3 files changed, 5 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index f9e3ffb2309a..8bf0ac707fd7 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -312,11 +312,6 @@ struct msm_gem_submit {
>  	struct ww_acquire_ctx ticket;
>  	uint32_t seqno;		/* Sequence number of the submit on the ring */
>  
> -	/* Array of struct dma_fence * to block on before submitting this job.
> -	 */
> -	struct xarray deps;
> -	unsigned long last_dep;
> -
>  	/* Hw fence, which is created when the scheduler executes the job, and
>  	 * is signaled when the hw finishes (via seqno write from cmdstream)
>  	 */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 96cea0ba4cfd..fb5a2eab27a2 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -52,8 +52,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  		return ERR_PTR(ret);
>  	}
>  
> -	xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> -
>  	kref_init(&submit->ref);
>  	submit->dev = dev;
>  	submit->aspace = queue->ctx->aspace;
> @@ -72,8 +70,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
>  {
>  	struct msm_gem_submit *submit =
>  			container_of(kref, struct msm_gem_submit, ref);
> -	unsigned long index;
> -	struct dma_fence *fence;
>  	unsigned i;
>  
>  	if (submit->fence_id) {
> @@ -82,12 +78,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
>  		mutex_unlock(&submit->queue->lock);
>  	}
>  
> -	xa_for_each (&submit->deps, index, fence) {
> -		dma_fence_put(fence);
> -	}
> -
> -	xa_destroy(&submit->deps);
> -
>  	dma_fence_put(submit->user_fence);
>  	dma_fence_put(submit->hw_fence);
>  
> @@ -343,8 +333,9 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>  		if (no_implicit)
>  			continue;
>  
> -		ret = drm_gem_fence_array_add_implicit(&submit->deps, obj,
> -			write);
> +		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
> +							      obj,
> +							      write);
>  		if (ret)
>  			break;
>  	}
> @@ -588,7 +579,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
>  		if (ret)
>  			break;
>  
> -		ret = drm_gem_fence_array_add(&submit->deps, fence);
> +		ret = drm_sched_job_add_dependency(&submit->base, fence);
>  		if (ret)
>  			break;
>  
> @@ -798,7 +789,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  			goto out_unlock;
>  		}
>  
> -		ret = drm_gem_fence_array_add(&submit->deps, in_fence);
> +		ret = drm_sched_job_add_dependency(&submit->base, in_fence);
>  		if (ret)
>  			goto out_unlock;
>  	}
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index bd54c1412649..652b1dedd7c1 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -11,17 +11,6 @@ static uint num_hw_submissions = 8;
>  MODULE_PARM_DESC(num_hw_submissions, "The max # of jobs to write into ringbuffer (default 8)");
>  module_param(num_hw_submissions, uint, 0600);
>  
> -static struct dma_fence *msm_job_dependency(struct drm_sched_job *job,
> -		struct drm_sched_entity *s_entity)
> -{
> -	struct msm_gem_submit *submit = to_msm_submit(job);
> -
> -	if (!xa_empty(&submit->deps))
> -		return xa_erase(&submit->deps, submit->last_dep++);
> -
> -	return NULL;
> -}
> -
>  static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>  {
>  	struct msm_gem_submit *submit = to_msm_submit(job);
> @@ -52,7 +41,6 @@ static void msm_job_free(struct drm_sched_job *job)
>  }
>  
>  const struct drm_sched_backend_ops msm_sched_ops = {
> -	.dependency = msm_job_dependency,
>  	.run_job = msm_job_run,
>  	.free_job = msm_job_free
>  };
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
