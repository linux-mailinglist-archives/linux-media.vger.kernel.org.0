Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553693E2F5F
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 20:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243268AbhHFSmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 14:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243232AbhHFSmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 14:42:15 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABB5C0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Aug 2021 11:41:59 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so5577809otl.9
        for <linux-media@vger.kernel.org>; Fri, 06 Aug 2021 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8atLGqLu8Hqvv/SZSAMN2eH9CGQowt0kdxBJ7I2ZF6E=;
        b=eDxQabAbNE9a2+Kxer/XVIIGbUZeq4sNv9QRTWobDGmYxaAB7OnFE0dn0PrZ80koO6
         6F1wLHjpnzoeNXdn4KHoC3iA2oCb5ZpvG3sBQIurNTLTrs8QcTVaJaMU9fZt/C/46pYY
         KPcl+SohtLiKEYwhj4f/EU4152FnQPe9uAzYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8atLGqLu8Hqvv/SZSAMN2eH9CGQowt0kdxBJ7I2ZF6E=;
        b=RFpLMA4TkOrmTLDyw8oxzH6U4FJWKjsTpUF6WH2ELyQ23WZ6Uzm5+FMxq+992A3/HY
         oMdsaqPD4uS36lhE499Wy56H3+kDQu6xvdlJjX1IQgvePqAlKl5C6msUK1ulOZwoYftR
         Xq+yIZgG01skNhzBx6Qvg+TeOvBbaBVoMoeNo3Z3RzEv//l46E5L0W8l42quXUcNR4Pj
         QlcfcxjfXb9XGFDsC3RSgKK+nlDacF7Q6GhZnBVBHAvwH2isnw9g36A8488Jh66t0t4x
         z9gYSVOyQ4U/yGXacf+DYVUvab7WL6x6+zpgaGHi8/oQzOeDrWN0gcJLayuE0swDFfky
         DvRg==
X-Gm-Message-State: AOAM5330/GmEmHTMqdGWoX0hGAzQEM6LxB6UMXw6tn1255zdLjGQZ3CR
        UMjVo/1HXy5Gl+6o5jLKu+wRLNoPZ4gyTlXwUd8ycg==
X-Google-Smtp-Source: ABdhPJwaNdHMovNLPYbXgKqYUusF3P7mPKu6J0scXlCOdv15tRugLmYdT7R9nikw9/kGkyFtoTkgTPoztcgGPWwhfn4=
X-Received: by 2002:a05:6830:2802:: with SMTP id w2mr8539791otu.303.1628275319027;
 Fri, 06 Aug 2021 11:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-3-daniel.vetter@ffwll.ch> <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
 <CAKMK7uG3gRNfYinM51UVAUckV9ZgN3mgRnJd8E9tERani9b1JQ@mail.gmail.com> <CAF6AEGuqxb5jEtpQi-aNvjSfPaq0gasH2TLZ+5O836ov9qw+3w@mail.gmail.com>
In-Reply-To: <CAF6AEGuqxb5jEtpQi-aNvjSfPaq0gasH2TLZ+5O836ov9qw+3w@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 6 Aug 2021 20:41:47 +0200
Message-ID: <CAKMK7uH2v2x+=Ct-v-2RCVXez4MzjMvhh4yCs_f8HPvYa+DXcA@mail.gmail.com>
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

On Fri, Aug 6, 2021 at 7:15 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 9:42 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
> >
> > On Fri, Aug 6, 2021 at 12:58 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch>=
 wrote:
> > > >
> > > > Originally drm_sched_job_init was the point of no return, after whi=
ch
> > > > drivers must submit a job. I've split that up, which allows us to f=
ix
> > > > this issue pretty easily.
> > > >
> > > > Only thing we have to take care of is to not skip to error paths af=
ter
> > > > that. Other drivers do this the same for out-fence and similar thin=
gs.
> > > >
> > > > Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> > > > Cc: Rob Clark <robdclark@chromium.org>
> > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > Cc: Sean Paul <sean@poorly.run>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: freedreno@lists.freedesktop.org
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
> > > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm=
/msm/msm_gem_submit.c
> > > > index 6d6c44f0e1f3..d0ed4ddc509e 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(struc=
t drm_device *dev,
> > > >                 return ERR_PTR(ret);
> > > >         }
> > > >
> > > > -       /* FIXME: this is way too early */
> > > > -       drm_sched_job_arm(&job->base);
> > > > -
> > > >         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> > > >
> > > >         kref_init(&submit->ref);
> > > > @@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev=
, void *data,
> > > >
> > > >         submit->user_fence =3D dma_fence_get(&submit->base.s_fence-=
>finished);
> > > >
> > > > +       /* point of no return, we _have_ to submit no matter what *=
/
> > > > +       drm_sched_job_arm(&submit->base);
> > > > +
> > > >         /*
> > > >          * Allocate an id which can be used by WAIT_FENCE ioctl to =
map back
> > > >          * to the underlying fence.
> > > > @@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_device *d=
ev, void *data,
> > > >         if (submit->fence_id < 0) {
> > > >                 ret =3D submit->fence_id =3D 0;
> > > >                 submit->fence_id =3D 0;
> > > > -               goto out;
> > > >         }
> > > >
> > > > -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> > > > +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) =
{
> > > >                 struct sync_file *sync_file =3D sync_file_create(su=
bmit->user_fence);
> > > >                 if (!sync_file) {
> > > >                         ret =3D -ENOMEM;
> > > > -                       goto out;
> > > > +               } else {
> > > > +                       fd_install(out_fence_fd, sync_file->file);
> > > > +                       args->fence_fd =3D out_fence_fd;
> > > >                 }
> > > > -               fd_install(out_fence_fd, sync_file->file);
> > > > -               args->fence_fd =3D out_fence_fd;
> > >
> > > I wonder if instead we should (approximately) undo "drm/msm/submit:
> > > Simplify out-fence-fd handling" so that the point that it could fail
> > > is moved up ahead of the drm_sched_job_arm()?
> >
> > Hm yeah. Up to you how you want to paint this shed, I think either is f=
ine.
> >
> > > Also, does the dma_fence_get() work before drm_sched_job_arm()?  From
> > > a quick look, it looks like it won't, but I'm still playing catchup
> > > and haven't had a chance to look at your entire series.  If it doesn'=
t
> > > work before drm_sched_job_arm(), then there is really no way to
> > > prevent a error path between the fence-init and job-submit.
> >
> > Yes. I thought I've checked that I put the _arm() in the right spot,
> > but I guess I screwed up and you need the fence before the point where
> > I've put the job_arm()? And yes the error path cannot be avoided for
> > out-fences, that's what I tried to explain in the commit message.
> >
> > > But, prior to your series, wouldn't a failure after
> > > drm_sched_job_init() but before the job is submitted just burn a
> > > fence-id, and otherwise carry on it's merry way?
> >
> > Maybe? I'm not sure whether the scheduler gets confused about the gap
> > and freak out abou that. I'm fairly new to that code and learning
> > (which is part why I'm working on it). Since you look up in
> > fences/syncobj after job_init() it should be pretty easy to whip up a
> > testcase and see what happens. Also as long as nothing fails you won't
> > see an issue, that's for sure.
>
> fair.. I'll try to come up with a test case.. pre-scheduler-conversion
> it wasn't a problem to fail after the fence seqno was allocated (well,
> I guess you might have problems if you had 2^31 failures in a row)

Yeah one thing drm/sched forces you to do is have a very clear notion
about the point of no return in your submit ioctl. Which I think is a
Very Good Thing, at least looking at i915 execbuf where the point of
no return is a multi-stage thing with such interesting intermediate
points like "we submit the ruquest but without actually running the
batchbuffer". The downside is that the submit ioctl isn't perfectly
transaction anymore, but I don't think that matters for tha tail
stuff, which is generally just some out-fence installing. That
generally never fails.
-Daniel

>
> BR,
> -R
>
> > -Daniel
> >
> > > BR,
> > > -R
> > >
> > > >         }
> > > >
> > > >         submit_attach_object_fences(submit);
> > > > --
> > > > 2.32.0
> > > >
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
