Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E273E2FAE
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 21:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbhHFTLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 15:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbhHFTLQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 15:11:16 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B066EC0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Aug 2021 12:11:00 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so5667988otl.9
        for <linux-media@vger.kernel.org>; Fri, 06 Aug 2021 12:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wwdLLncHcQmn8V0lQ1zikWkAtZyXR0Qt+eajA4TCzA4=;
        b=XKyxQcIlOnuQAAkYeR6VX0Kvl3HkpnxBkVEqfVZCebg/cEsFG79uFfPr3PyZy89atW
         LEP/WPUfqnt3pr3aPsv2H+BfZdZS27Uyda3jC/4O3TStB98BCcVzMQlowxrucMnSwSU/
         bTjdlXsGGL8qhKGgN6yJROmPWIE+/2YbAB/ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wwdLLncHcQmn8V0lQ1zikWkAtZyXR0Qt+eajA4TCzA4=;
        b=uECe+OACkrxcheQmVRC4c6Ax/d3WNFBZmkmkTor0SWsDnJOfw3VtKMOeRNOPgKhoxt
         Wg8J+A3HXS7zpuYvl4il4R07ACN4+hZuL1qE/3Op4IDt1/QMjeoxLMDoUoBgG8IKug0d
         ZcpVaIGi+ndwemA2t5P6XUnApB2GX43Tuoadmjezt85Wqp62KByPB8q0/DIFCd7a88O/
         pvjkhsmLyzai5Q8aURckhBh2aeg8D8d6iQCrrAoej03Swm7Ve73ZjeV5q9aO1bzKdzd9
         v4HbTBo7xs+Ng8F6ICxza3mlEAmfyYxWRO+ucpshoUWsHYcLHzvsrjNaK83xYlXm4WE9
         +zkg==
X-Gm-Message-State: AOAM533dY5Vc6LUsWXA6kdL6zVi3MKAJSVIC4sTX+l+xA1kQrTEjI5Sa
        438Zmu+OJy8uMNDzjajHpIBZWLWecJrFQ5i8llObqQ==
X-Google-Smtp-Source: ABdhPJwTzyaYRYgqMYelT348bKx7Zt4moB1xmD2AXEay6/jj3T1D9DIuQ1CF2V9UCsSlAhSbmsjMDnxFmmoGKgH/4YY=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr8845841otb.281.1628277060095;
 Fri, 06 Aug 2021 12:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-3-daniel.vetter@ffwll.ch> <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
 <CAKMK7uG3gRNfYinM51UVAUckV9ZgN3mgRnJd8E9tERani9b1JQ@mail.gmail.com>
 <CAF6AEGuqxb5jEtpQi-aNvjSfPaq0gasH2TLZ+5O836ov9qw+3w@mail.gmail.com>
 <CAKMK7uH2v2x+=Ct-v-2RCVXez4MzjMvhh4yCs_f8HPvYa+DXcA@mail.gmail.com> <CAF6AEGuX6UgXpCJqvo4kT3j5zYeuRBYTtMWM8yz0x_tOb1rm4w@mail.gmail.com>
In-Reply-To: <CAF6AEGuX6UgXpCJqvo4kT3j5zYeuRBYTtMWM8yz0x_tOb1rm4w@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 6 Aug 2021 21:10:49 +0200
Message-ID: <CAKMK7uF-CswLD8E8=gwLAKhKCFcD2KMwdzjjod+JmGGk2TiZUw@mail.gmail.com>
Subject: Re: [PATCH v5 02/20] drm/msm: Fix drm/sched point of no return rules
To:     Rob Clark <robdclark@gmail.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 6, 2021 at 8:57 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 11:41 AM Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
> >
> > On Fri, Aug 6, 2021 at 7:15 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Fri, Aug 6, 2021 at 9:42 AM Daniel Vetter <daniel.vetter@ffwll.ch>=
 wrote:
> > > >
> > > > On Fri, Aug 6, 2021 at 12:58 AM Rob Clark <robdclark@gmail.com> wro=
te:
> > > > >
> > > > > On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll=
.ch> wrote:
> > > > > >
> > > > > > Originally drm_sched_job_init was the point of no return, after=
 which
> > > > > > drivers must submit a job. I've split that up, which allows us =
to fix
> > > > > > this issue pretty easily.
> > > > > >
> > > > > > Only thing we have to take care of is to not skip to error path=
s after
> > > > > > that. Other drivers do this the same for out-fence and similar =
things.
> > > > > >
> > > > > > Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> > > > > > Cc: Rob Clark <robdclark@chromium.org>
> > > > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > > > Cc: Sean Paul <sean@poorly.run>
> > > > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > > > > Cc: linux-arm-msm@vger.kernel.org
> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Cc: freedreno@lists.freedesktop.org
> > > > > > Cc: linux-media@vger.kernel.org
> > > > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
> > > > > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu=
/drm/msm/msm_gem_submit.c
> > > > > > index 6d6c44f0e1f3..d0ed4ddc509e 100644
> > > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > @@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(s=
truct drm_device *dev,
> > > > > >                 return ERR_PTR(ret);
> > > > > >         }
> > > > > >
> > > > > > -       /* FIXME: this is way too early */
> > > > > > -       drm_sched_job_arm(&job->base);
> > > > > > -
> > > > > >         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> > > > > >
> > > > > >         kref_init(&submit->ref);
> > > > > > @@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device =
*dev, void *data,
> > > > > >
> > > > > >         submit->user_fence =3D dma_fence_get(&submit->base.s_fe=
nce->finished);
> > > > > >
> > > > > > +       /* point of no return, we _have_ to submit no matter wh=
at */
> > > > > > +       drm_sched_job_arm(&submit->base);
> > > > > > +
> > > > > >         /*
> > > > > >          * Allocate an id which can be used by WAIT_FENCE ioctl=
 to map back
> > > > > >          * to the underlying fence.
> > > > > > @@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_devic=
e *dev, void *data,
> > > > > >         if (submit->fence_id < 0) {
> > > > > >                 ret =3D submit->fence_id =3D 0;
> > > > > >                 submit->fence_id =3D 0;
> > > > > > -               goto out;
> > > > > >         }
> > > > > >
> > > > > > -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> > > > > > +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD_O=
UT) {
> > > > > >                 struct sync_file *sync_file =3D sync_file_creat=
e(submit->user_fence);
> > > > > >                 if (!sync_file) {
> > > > > >                         ret =3D -ENOMEM;
> > > > > > -                       goto out;
> > > > > > +               } else {
> > > > > > +                       fd_install(out_fence_fd, sync_file->fil=
e);
> > > > > > +                       args->fence_fd =3D out_fence_fd;
> > > > > >                 }
> > > > > > -               fd_install(out_fence_fd, sync_file->file);
> > > > > > -               args->fence_fd =3D out_fence_fd;
> > > > >
> > > > > I wonder if instead we should (approximately) undo "drm/msm/submi=
t:
> > > > > Simplify out-fence-fd handling" so that the point that it could f=
ail
> > > > > is moved up ahead of the drm_sched_job_arm()?
> > > >
> > > > Hm yeah. Up to you how you want to paint this shed, I think either =
is fine.
> > > >
> > > > > Also, does the dma_fence_get() work before drm_sched_job_arm()?  =
From
> > > > > a quick look, it looks like it won't, but I'm still playing catch=
up
> > > > > and haven't had a chance to look at your entire series.  If it do=
esn't
> > > > > work before drm_sched_job_arm(), then there is really no way to
> > > > > prevent a error path between the fence-init and job-submit.
> > > >
> > > > Yes. I thought I've checked that I put the _arm() in the right spot=
,
> > > > but I guess I screwed up and you need the fence before the point wh=
ere
> > > > I've put the job_arm()? And yes the error path cannot be avoided fo=
r
> > > > out-fences, that's what I tried to explain in the commit message.
> > > >
> > > > > But, prior to your series, wouldn't a failure after
> > > > > drm_sched_job_init() but before the job is submitted just burn a
> > > > > fence-id, and otherwise carry on it's merry way?
> > > >
> > > > Maybe? I'm not sure whether the scheduler gets confused about the g=
ap
> > > > and freak out abou that. I'm fairly new to that code and learning
> > > > (which is part why I'm working on it). Since you look up in
> > > > fences/syncobj after job_init() it should be pretty easy to whip up=
 a
> > > > testcase and see what happens. Also as long as nothing fails you wo=
n't
> > > > see an issue, that's for sure.
> > >
> > > fair.. I'll try to come up with a test case.. pre-scheduler-conversio=
n
> > > it wasn't a problem to fail after the fence seqno was allocated (well=
,
> > > I guess you might have problems if you had 2^31 failures in a row)
> >
> > Yeah one thing drm/sched forces you to do is have a very clear notion
> > about the point of no return in your submit ioctl. Which I think is a
> > Very Good Thing, at least looking at i915 execbuf where the point of
> > no return is a multi-stage thing with such interesting intermediate
> > points like "we submit the ruquest but without actually running the
> > batchbuffer". The downside is that the submit ioctl isn't perfectly
> > transaction anymore, but I don't think that matters for tha tail
> > stuff, which is generally just some out-fence installing. That
> > generally never fails.
>
> So I hacked up:
>
> ------
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
> b/drivers/gpu/drm/scheduler/sched_fence.c
> index 3aa6351d2101..88e66dbc9515 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -176,6 +176,7 @@ struct drm_sched_fence
> *drm_sched_fence_create(struct drm_sched_entity *entity,
>         fence->sched =3D entity->rq->sched;
>         spin_lock_init(&fence->lock);
>
> +       seq =3D atomic_inc_return(&entity->fence_seq);
>         seq =3D atomic_inc_return(&entity->fence_seq);
>         dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>                        &fence->lock, entity->fence_context, seq);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index fcc601962e92..583e85adbbe0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -593,6 +593,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>         if (!job->s_fence)
>                 return -ENOMEM;
>         job->id =3D atomic64_inc_return(&sched->job_id_count);
> +       job->id =3D atomic64_inc_return(&sched->job_id_count);
>
>         INIT_LIST_HEAD(&job->list);
>
> ------
>
> (I guess the job->id part shouldn't really be needed, that looks like
> it is only used by amdgpu)
>
> This didn't cause any problems that I could see.  So I don't *think* a
> failure after drm_sched_job_init() is really problematic, as long as
> things are serialized between drm_sched_job_init() and
> drm_sched_entity_push_job().
>
> I also noticed that in the atomic commit path, the out-fences are
> initialized before atomic-check.. so there should be plenty of
> precedent for skipping fence seqno's.

Oh I think I remember now. The reason why the split into init/arm is
so that you can keep your critical section only around job_arm() and
push_job(). My very first version just pulled the jobs_init() of that
for most drivers to where I needed it, and that would result in a bit
chaos because the fences would signal out of order potentially. But
yeah I guess bailing out is fine with the scheduler.

Do you want me to tune down the commit message a bit, it's not a must
to submit the job, but just makes a bit more sense than bailing out
with a fence seqno reserved?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
