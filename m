Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA673EE917
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 11:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239283AbhHQJE6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 05:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235586AbhHQJEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 05:04:55 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB1EC0613C1
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 02:04:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r7so27574644wrs.0
        for <linux-media@vger.kernel.org>; Tue, 17 Aug 2021 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=j4i/x9tyzc/3LgdLRFqgQgxEO4pmJgQLsrj80WtwhVI=;
        b=KxIpxVtWjns4F7qLg1rRcmYAW3SH1eBW9sxDxCEB/2uN9a/FcASQ4t2WjsOxmPgxmd
         fgz5X/LnvStc/dmaZypl8I2CLhvMTPQvq6+5wSjEtiUMwMdBFl0TqJEk7e7klYUpDrkI
         1ao2oorbeN2dN+umv0mr5W2gM8/ZhXk0b3GGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=j4i/x9tyzc/3LgdLRFqgQgxEO4pmJgQLsrj80WtwhVI=;
        b=g/9al/yh8lFtElfR+Frmr5W1823tvKwih1sQU1ajP5WtiXrN8E4mnN6hj8dtXEPFgE
         Iug4M6VfLWri5qMSuog1jxc9O62RUERZW7zip4MflvvMVWyw13nS+IjIhkL3CLS+lfZ0
         Rq4r6F5KzXPrtpqRzPcxDHQtk0tM3c8p/LfIxbt93nemOjq5IzkKL6ny+ReKRahAXBNd
         sX2zJ80gAZweVcZlVJEKjOAv8mSdO5KUxKX7z2bedkXtt/K9psSCClW4+qnD49RFIL/K
         /N5RxAuddkY3BQRO9lU/e2kc9j2VonPW2M4HhWFXm6bWR1MLdE4nMV71TqMFWjAklUCC
         hkWw==
X-Gm-Message-State: AOAM531dVQGcvORE8pjxSToJr+X8MNxgjhrkDDDwyOfEr+nFMKOznZ74
        Bp3mUy1CUvLcspeyHQEWiagLkQ==
X-Google-Smtp-Source: ABdhPJy/Dl1NsISUcWJ7CU+4M3hb5C4YhyxhHFqeiJF0/2LxZzlK7v8qd5PIxfPQBoJAIj1gqztDvw==
X-Received: by 2002:a05:6000:1043:: with SMTP id c3mr2732415wrx.144.1629191059584;
        Tue, 17 Aug 2021 02:04:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e17sm1625963wrs.78.2021.08.17.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 02:04:19 -0700 (PDT)
Date:   Tue, 17 Aug 2021 11:04:17 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Steven Price <steven.price@arm.com>, Roy Sun <Roy.Sun@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 4/5] drm/scheduler: Add fence deadline support
Message-ID: <YRt7ka8TZrjdxy/6@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Steven Price <steven.price@arm.com>, Roy Sun <Roy.Sun@amd.com>,
        Lee Jones <lee.jones@linaro.org>, Jack Zhang <Jack.Zhang1@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
References: <20210807183804.459850-1-robdclark@gmail.com>
 <20210807183804.459850-5-robdclark@gmail.com>
 <e28020c5-3da3-c721-96df-9a115f105bf7@gmail.com>
 <YRqGazgGJ2NAIzg2@phenom.ffwll.local>
 <CAF6AEGtyA2ovPcsP_3wbD-KfJFZosc=qf=SMkE2BVMq5+=cxWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtyA2ovPcsP_3wbD-KfJFZosc=qf=SMkE2BVMq5+=cxWw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 16, 2021 at 03:25:20PM -0700, Rob Clark wrote:
> On Mon, Aug 16, 2021 at 8:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Aug 16, 2021 at 12:14:35PM +0200, Christian König wrote:
> > > Am 07.08.21 um 20:37 schrieb Rob Clark:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > As the finished fence is the one that is exposed to userspace, and
> > > > therefore the one that other operations, like atomic update, would
> > > > block on, we need to propagate the deadline from from the finished
> > > > fence to the actual hw fence.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > I guess you're already letting the compositor run at a higher gpu priority
> > so that your deadline'd drm_sched_job isn't stuck behind the app rendering
> > the next frame?
> 
> With the scheduler conversion we do have multiple priorities (provided
> by scheduler) for all generations.. but not yet preemption for all
> generations.
> 
> But the most common use-case where we need this ends up being display
> composition (either fullscreen app/game or foreground app/game
> composited via overlay) so I haven't thought too much about the next
> step of boosting job priority.  I might leave that to someone who
> already has preemption wired up ;-)

Atm no-one, drm/sched isn't really aware that's a concept. I was more
thinking of just boosting that request as a first step. Maybe within the
same priority class we pick jobs with deadlines first, or something like
that.

Preempting is an entire can of worms on top.
-Daniel

> 
> BR,
> -R
> 
> > I'm not sure whether you wire that one up as part of the conversion to
> > drm/sched. Without that I think we might need to ponder how we can do a
> > prio-boost for these, e.g. within a scheduling class we pick the jobs with
> > the nearest deadline first, before we pick others.
> > -Daniel
> >
> > > > ---
> > > >   drivers/gpu/drm/scheduler/sched_fence.c | 25 +++++++++++++++++++++++++
> > > >   drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
> > > >   include/drm/gpu_scheduler.h             |  6 ++++++
> > > >   3 files changed, 34 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> > > > index 69de2c76731f..f389dca44185 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > > > @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
> > > >     dma_fence_put(&fence->scheduled);
> > > >   }
> > > > +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> > > > +                                             ktime_t deadline)
> > > > +{
> > > > +   struct drm_sched_fence *fence = to_drm_sched_fence(f);
> > > > +   unsigned long flags;
> > > > +
> > > > +   spin_lock_irqsave(&fence->lock, flags);
> > > > +
> > > > +   /* If we already have an earlier deadline, keep it: */
> > > > +   if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> > > > +       ktime_before(fence->deadline, deadline)) {
> > > > +           spin_unlock_irqrestore(&fence->lock, flags);
> > > > +           return;
> > > > +   }
> > > > +
> > > > +   fence->deadline = deadline;
> > > > +   set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> > > > +
> > > > +   spin_unlock_irqrestore(&fence->lock, flags);
> > > > +
> > > > +   if (fence->parent)
> > > > +           dma_fence_set_deadline(fence->parent, deadline);
> > > > +}
> > > > +
> > > >   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
> > > >     .get_driver_name = drm_sched_fence_get_driver_name,
> > > >     .get_timeline_name = drm_sched_fence_get_timeline_name,
> > > > @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
> > > >     .get_driver_name = drm_sched_fence_get_driver_name,
> > > >     .get_timeline_name = drm_sched_fence_get_timeline_name,
> > > >     .release = drm_sched_fence_release_finished,
> > > > +   .set_deadline = drm_sched_fence_set_deadline_finished,
> > > >   };
> > > >   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index a2a953693b45..3ab0900d3596 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > @@ -818,6 +818,9 @@ static int drm_sched_main(void *param)
> > > >             if (!IS_ERR_OR_NULL(fence)) {
> > > >                     s_fence->parent = dma_fence_get(fence);
> > > > +                   if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > > > +                                &s_fence->finished.flags))
> > > > +                           dma_fence_set_deadline(fence, s_fence->deadline);
> > >
> > > Maybe move this into a dma_sched_fence_set_parent() function.
> > >
> > > Apart from that looks good to me.
> > >
> > > Regards,
> > > Christian.
> > >
> > > >                     r = dma_fence_add_callback(fence, &sched_job->cb,
> > > >                                                drm_sched_job_done_cb);
> > > >                     if (r == -ENOENT)
> > > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > > index d18af49fd009..0f08ade614ae 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -144,6 +144,12 @@ struct drm_sched_fence {
> > > >            */
> > > >     struct dma_fence                finished;
> > > > +   /**
> > > > +    * @deadline: deadline set on &drm_sched_fence.finished which
> > > > +    * potentially needs to be propagated to &drm_sched_fence.parent
> > > > +    */
> > > > +   ktime_t                         deadline;
> > > > +
> > > >           /**
> > > >            * @parent: the fence returned by &drm_sched_backend_ops.run_job
> > > >            * when scheduling the job on hardware. We signal the
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
