Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D012E3EDFE6
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 00:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbhHPWVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 18:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234503AbhHPWVf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 18:21:35 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832FCC061764;
        Mon, 16 Aug 2021 15:21:03 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id k4so12464630wms.3;
        Mon, 16 Aug 2021 15:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MD79y8jzRWUs3Lb63ir/9Z7YXREjW2AbOeDZQfYBwAY=;
        b=ugjLgS1SYCinwoxSubl122blXZUlhE1G5WredQD0xopGMNFOzMPiOp67DuKNE81PUM
         PYLk7BQMupvkdwFt5fX0QQ+EWpDIlS8VrZs8qi/rYMKubAjkXqD5AwQJXoY2LcWMk2iE
         +OeWAi8t49LfB5Boh0PJoXlmZf5XviDE0v0udsa+cSbvLIwJHeRKVEswQuf8Srkh95UL
         cx7dblIlthEvXUzdBWEjfLj0B0ElI84hfn33WSSTG6r3ZJxYyONcRB4JEz0YwCY/VOnp
         4uTCLXK+DQkCqfvDz6/jq5x4kxw2AI7q2GBrFUKBtiGLzxy3eNnYC+XL/0kEAydHrLK0
         az2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MD79y8jzRWUs3Lb63ir/9Z7YXREjW2AbOeDZQfYBwAY=;
        b=p7SejRTQp7+VI8nEzR1PM8o+gzyehLD3XyTepXSKynokVnjFcVKwd7NCv8Bc5tTjZn
         xVrtXMAVlgy5AA2zn62+PTLE6aaW8N5P+PZln8MSsosDmT9vruqUvbxINzxjlu6YjdU5
         Yhxg+hK28FjWgLcAD+8pM/NheTAg/cpGAPWJ7dB9K4bSflftMlZQ33aw5gNotJcy0rhA
         EB1Un+rnZkemFdwO/SVULu3Aaupcr+SyeHo5L0cf3f+fNzk+NcvrzceeAgtgb/w5nyRS
         F0LhLcT7TQmSDK3x/SUOP/geM5sI1LDydsfSXL7thwuSTGFLIg/LIB00AqrmW/omY3L5
         tC6Q==
X-Gm-Message-State: AOAM531E2HbwPc88ZLelIsNAS/xO0d3VlEOfSg6xuj3l3XHscYkzv1Y5
        4wgdJPcaBASO+3JQuQdtx4SVAifpk0p7Tp32yoI=
X-Google-Smtp-Source: ABdhPJxcwI5NX0yTJwhaks0eDKYsxDJoy28PKEeAcGDKp+JI9zbCEcdxqA0pFxhb4hDbfFEJyCzBMmpbuQKLPMvgMH8=
X-Received: by 2002:a05:600c:35d1:: with SMTP id r17mr264901wmq.175.1629152462126;
 Mon, 16 Aug 2021 15:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210807183804.459850-1-robdclark@gmail.com> <20210807183804.459850-5-robdclark@gmail.com>
 <e28020c5-3da3-c721-96df-9a115f105bf7@gmail.com> <YRqGazgGJ2NAIzg2@phenom.ffwll.local>
In-Reply-To: <YRqGazgGJ2NAIzg2@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 16 Aug 2021 15:25:20 -0700
Message-ID: <CAF6AEGtyA2ovPcsP_3wbD-KfJFZosc=qf=SMkE2BVMq5+=cxWw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/scheduler: Add fence deadline support
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
        <linaro-mm-sig@lists.linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 16, 2021 at 8:38 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Aug 16, 2021 at 12:14:35PM +0200, Christian K=C3=B6nig wrote:
> > Am 07.08.21 um 20:37 schrieb Rob Clark:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > As the finished fence is the one that is exposed to userspace, and
> > > therefore the one that other operations, like atomic update, would
> > > block on, we need to propagate the deadline from from the finished
> > > fence to the actual hw fence.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> I guess you're already letting the compositor run at a higher gpu priorit=
y
> so that your deadline'd drm_sched_job isn't stuck behind the app renderin=
g
> the next frame?

With the scheduler conversion we do have multiple priorities (provided
by scheduler) for all generations.. but not yet preemption for all
generations.

But the most common use-case where we need this ends up being display
composition (either fullscreen app/game or foreground app/game
composited via overlay) so I haven't thought too much about the next
step of boosting job priority.  I might leave that to someone who
already has preemption wired up ;-)

BR,
-R

> I'm not sure whether you wire that one up as part of the conversion to
> drm/sched. Without that I think we might need to ponder how we can do a
> prio-boost for these, e.g. within a scheduling class we pick the jobs wit=
h
> the nearest deadline first, before we pick others.
> -Daniel
>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_fence.c | 25 ++++++++++++++++++++++=
+++
> > >   drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
> > >   include/drm/gpu_scheduler.h             |  6 ++++++
> > >   3 files changed, 34 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/dr=
m/scheduler/sched_fence.c
> > > index 69de2c76731f..f389dca44185 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > > @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(str=
uct dma_fence *f)
> > >     dma_fence_put(&fence->scheduled);
> > >   }
> > > +static void drm_sched_fence_set_deadline_finished(struct dma_fence *=
f,
> > > +                                             ktime_t deadline)
> > > +{
> > > +   struct drm_sched_fence *fence =3D to_drm_sched_fence(f);
> > > +   unsigned long flags;
> > > +
> > > +   spin_lock_irqsave(&fence->lock, flags);
> > > +
> > > +   /* If we already have an earlier deadline, keep it: */
> > > +   if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> > > +       ktime_before(fence->deadline, deadline)) {
> > > +           spin_unlock_irqrestore(&fence->lock, flags);
> > > +           return;
> > > +   }
> > > +
> > > +   fence->deadline =3D deadline;
> > > +   set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> > > +
> > > +   spin_unlock_irqrestore(&fence->lock, flags);
> > > +
> > > +   if (fence->parent)
> > > +           dma_fence_set_deadline(fence->parent, deadline);
> > > +}
> > > +
> > >   static const struct dma_fence_ops drm_sched_fence_ops_scheduled =3D=
 {
> > >     .get_driver_name =3D drm_sched_fence_get_driver_name,
> > >     .get_timeline_name =3D drm_sched_fence_get_timeline_name,
> > > @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence=
_ops_finished =3D {
> > >     .get_driver_name =3D drm_sched_fence_get_driver_name,
> > >     .get_timeline_name =3D drm_sched_fence_get_timeline_name,
> > >     .release =3D drm_sched_fence_release_finished,
> > > +   .set_deadline =3D drm_sched_fence_set_deadline_finished,
> > >   };
> > >   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index a2a953693b45..3ab0900d3596 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -818,6 +818,9 @@ static int drm_sched_main(void *param)
> > >             if (!IS_ERR_OR_NULL(fence)) {
> > >                     s_fence->parent =3D dma_fence_get(fence);
> > > +                   if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> > > +                                &s_fence->finished.flags))
> > > +                           dma_fence_set_deadline(fence, s_fence->de=
adline);
> >
> > Maybe move this into a dma_sched_fence_set_parent() function.
> >
> > Apart from that looks good to me.
> >
> > Regards,
> > Christian.
> >
> > >                     r =3D dma_fence_add_callback(fence, &sched_job->c=
b,
> > >                                                drm_sched_job_done_cb)=
;
> > >                     if (r =3D=3D -ENOENT)
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> > > index d18af49fd009..0f08ade614ae 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -144,6 +144,12 @@ struct drm_sched_fence {
> > >            */
> > >     struct dma_fence                finished;
> > > +   /**
> > > +    * @deadline: deadline set on &drm_sched_fence.finished which
> > > +    * potentially needs to be propagated to &drm_sched_fence.parent
> > > +    */
> > > +   ktime_t                         deadline;
> > > +
> > >           /**
> > >            * @parent: the fence returned by &drm_sched_backend_ops.ru=
n_job
> > >            * when scheduling the job on hardware. We signal the
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
