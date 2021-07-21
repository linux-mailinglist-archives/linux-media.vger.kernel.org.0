Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB1F3D143C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 18:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbhGUPuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 11:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbhGUPuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 11:50:01 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD9FC061575;
        Wed, 21 Jul 2021 09:30:37 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id n1so2822589wri.10;
        Wed, 21 Jul 2021 09:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=695MrDT0K9k+DPPQVTnkggC9g+99Gebdftp/V5WcV7E=;
        b=tE2zlnUNHozA9P+a1k4lJpYerJo4F9LNDK32HUnwTz1qs0wNomMFs9f/Pshlq/v7nd
         9mPRqllJS2yP58SJP/ixoCNTTeH1FKPTpRGtfKuSGVbv8GPStt6JtfABdp1oa53CMRds
         /YcCsSB6ARAKEs+r8XOaa8nU5DFlOodpM2XLmFAE4SudMNpAowoj/XXskrK1K2ElJkF9
         yzLeLFxuKDBIC11Pmm94FtMiCNApnXGTWY+6kIusmXhyGz5xwj/jl3ovmuco5JwzQMok
         ZB/owN9Hawj7xa5cr/ObrNSzhLTt80uv+ENdsYxBzHk9AX38hSjEB32IVK7SVHpeiyQ5
         xdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=695MrDT0K9k+DPPQVTnkggC9g+99Gebdftp/V5WcV7E=;
        b=geGh69aVZhZewx2i5sLvQ8WXvbOH961z2ZWiObTUMKaH2V0yOyDiE/O16J8QCjW0CG
         7FtMrbwmW/WEkfLxcd0358k4NhzZL88rkdcf+Rx5FearJCRheAygfAwm550ac1XhC0+W
         OjZebe7gYfEXfn1gOaOGi2A8uG+w6P3szGS3Dehnst74jUCboO8FUdu0Tko2mJUY908X
         me+4KgOK7ULk4Q1CYVOI+pXxY30Lo5CDHhK1s25TXrzLsQaEDUax/YVxO3a4+/cATPX1
         k2XYf91nRL+bH02HwGkAXhHhfUpLYpKUBNf0232i6U10Kwkeyue1gUtPU1dd1klSTh1N
         Lifw==
X-Gm-Message-State: AOAM530gEL7hm3vdPFN/aoNm7YnSu2IeCGBeIDjBhNRM8BN1CgVovXLV
        Ruk7WP8+aFJTGvYz3eSsX/dWUO3qCbdQAgJPFD4=
X-Google-Smtp-Source: ABdhPJwk21KU1klLs4pYnPOPgpXaJSial8OghcGwbfJeYDt/kG3Xb2Lx+UxjaPcp7ecwerwAvAc8mh0D3usKG8EzVoQ=
X-Received: by 2002:adf:eb43:: with SMTP id u3mr43883874wrn.83.1626885035777;
 Wed, 21 Jul 2021 09:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com> <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com> <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
In-Reply-To: <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 21 Jul 2021 09:34:43 -0700
Message-ID: <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Sean Paul <sean@poorly.run>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 21, 2021 at 12:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 21, 2021 at 12:32 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, Jul 20, 2021 at 1:55 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wrote=
:
> > > >
> > > > On Tue, Jul 20, 2021 at 11:03 AM Christian K=C3=B6nig
> > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > >
> > > > > Hi Rob,
> > > > >
> > > > > Am 20.07.21 um 17:07 schrieb Rob Clark:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Somehow we had neither ->wait() nor dma_fence_signal() calls, a=
nd no
> > > > > > one noticed.  Oops.
> > > > >
> > > > >
> > > > > I'm not sure if that is a good idea.
> > > > >
> > > > > The dma_fence->wait() callback is pretty much deprecated and shou=
ld not
> > > > > be used any more.
> > > > >
> > > > > What exactly do you need that for?
> > > >
> > > > Well, the alternative is to track the set of fences which have
> > > > signalling enabled, and then figure out which ones to signal, which
> > > > seems like a lot more work, vs just re-purposing the wait
> > > > implementation we already have for non-dma_fence cases ;-)
> > > >
> > > > Why is the ->wait() callback (pretty much) deprecated?
> > >
> > > Because if you need it that means for your driver dma_fence_add_cb is
> > > broken, which means a _lot_ of things don't work. Like dma_buf poll
> > > (compositors have patches to start using that), and I think
> > > drm/scheduler also becomes rather unhappy.
> >
> > I'm starting to page back in how this works.. fence cb's aren't broken
> > (which is also why dma_fence_wait() was not completely broken),
> > because in retire_submits() we call
> > dma_fence_is_signaled(submit->hw_fence).
> >
> > But the reason that the custom wait function cleans up a tiny bit of
> > jank is that the wait_queue_head_t gets signaled earlier, before we
> > start iterating the submits and doing all that retire_submit() stuff
> > (unpin/unref bo's, etc).  I suppose I could just split things up to
> > call dma_fence_signal() earlier, and *then* do the retire_submits()
> > stuff.
>
> Yeah reducing the latency there sounds like a good idea.
> -Daniel
>

Hmm, no, turns out that isn't the problem.. or, well, it is probably a
good idea to call drm_fence_signal() earlier.  But it seems like
waking up from wait_event_* is faster than wake_up_state(wait->task,
TASK_NORMAL).  I suppose the wake_up_state() approach still needs for
the scheduler to get around to schedule the runnable task.

So for now, I'm going back to my own wait function (plus earlier
drm_fence_signal())

Before removing dma_fence_opps::wait(), I guess we want to re-think
dma_fence_default_wait().. but I think that would require a
dma_fence_context base class (rather than just a raw integer).

BR,
-R

> >
> > BR,
> > -R
> >
> > > It essentially exists only for old drivers where ->enable_signalling
> > > is unreliable and we paper over that with a retry loop in ->wait and
> > > pray no one notices that it's too butchered. The proper fix is to hav=
e
> > > a driver thread to guarantee that ->enable_signalling works reliable,
> > > so you don't need a ->wait.
> > >
> > > Can you type up a kerneldoc patch for dma_fence_ops->wait to hammer
> > > this in please?
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > Regards,
> > > > > Christian.
> > > > >
> > > > > >
> > > > > > Note that this removes the !timeout case, which has not been us=
ed in
> > > > > > a long time.
> > > > >
> > > > >
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > >   drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++-----=
---------
> > > > > >   1 file changed, 34 insertions(+), 25 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/=
msm/msm_fence.c
> > > > > > index cd59a5918038..8ee96b90ded6 100644
> > > > > > --- a/drivers/gpu/drm/msm/msm_fence.c
> > > > > > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > > > > > @@ -38,11 +38,10 @@ static inline bool fence_completed(struct m=
sm_fence_context *fctx, uint32_t fenc
> > > > > >       return (int32_t)(fctx->completed_fence - fence) >=3D 0;
> > > > > >   }
> > > > > >
> > > > > > -/* legacy path for WAIT_FENCE ioctl: */
> > > > > > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fe=
nce,
> > > > > > -             ktime_t *timeout, bool interruptible)
> > > > > > +static signed long wait_fence(struct msm_fence_context *fctx, =
uint32_t fence,
> > > > > > +             signed long remaining_jiffies, bool interruptible=
)
> > > > > >   {
> > > > > > -     int ret;
> > > > > > +     signed long ret;
> > > > > >
> > > > > >       if (fence > fctx->last_fence) {
> > > > > >               DRM_ERROR_RATELIMITED("%s: waiting on invalid fen=
ce: %u (of %u)\n",
> > > > > > @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context=
 *fctx, uint32_t fence,
> > > > > >               return -EINVAL;
> > > > > >       }
> > > > > >
> > > > > > -     if (!timeout) {
> > > > > > -             /* no-wait: */
> > > > > > -             ret =3D fence_completed(fctx, fence) ? 0 : -EBUSY=
;
> > > > > > +     if (interruptible) {
> > > > > > +             ret =3D wait_event_interruptible_timeout(fctx->ev=
ent,
> > > > > > +                     fence_completed(fctx, fence),
> > > > > > +                     remaining_jiffies);
> > > > > >       } else {
> > > > > > -             unsigned long remaining_jiffies =3D timeout_to_ji=
ffies(timeout);
> > > > > > -
> > > > > > -             if (interruptible)
> > > > > > -                     ret =3D wait_event_interruptible_timeout(=
fctx->event,
> > > > > > -                             fence_completed(fctx, fence),
> > > > > > -                             remaining_jiffies);
> > > > > > -             else
> > > > > > -                     ret =3D wait_event_timeout(fctx->event,
> > > > > > -                             fence_completed(fctx, fence),
> > > > > > -                             remaining_jiffies);
> > > > > > -
> > > > > > -             if (ret =3D=3D 0) {
> > > > > > -                     DBG("timeout waiting for fence: %u (compl=
eted: %u)",
> > > > > > -                                     fence, fctx->completed_fe=
nce);
> > > > > > -                     ret =3D -ETIMEDOUT;
> > > > > > -             } else if (ret !=3D -ERESTARTSYS) {
> > > > > > -                     ret =3D 0;
> > > > > > -             }
> > > > > > +             ret =3D wait_event_timeout(fctx->event,
> > > > > > +                     fence_completed(fctx, fence),
> > > > > > +                     remaining_jiffies);
> > > > > > +     }
> > > > > > +
> > > > > > +     if (ret =3D=3D 0) {
> > > > > > +             DBG("timeout waiting for fence: %u (completed: %u=
)",
> > > > > > +                             fence, fctx->completed_fence);
> > > > > > +             ret =3D -ETIMEDOUT;
> > > > > > +     } else if (ret !=3D -ERESTARTSYS) {
> > > > > > +             ret =3D 0;
> > > > > >       }
> > > > > >
> > > > > >       return ret;
> > > > > >   }
> > > > > >
> > > > > > +/* legacy path for WAIT_FENCE ioctl: */
> > > > > > +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fe=
nce,
> > > > > > +             ktime_t *timeout, bool interruptible)
> > > > > > +{
> > > > > > +     return wait_fence(fctx, fence, timeout_to_jiffies(timeout=
), interruptible);
> > > > > > +}
> > > > > > +
> > > > > >   /* called from workqueue */
> > > > > >   void msm_update_fence(struct msm_fence_context *fctx, uint32_=
t fence)
> > > > > >   {
> > > > > > @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma=
_fence *fence)
> > > > > >       return fence_completed(f->fctx, f->base.seqno);
> > > > > >   }
> > > > > >
> > > > > > +static signed long msm_fence_wait(struct dma_fence *fence, boo=
l intr,
> > > > > > +             signed long timeout)
> > > > > > +{
> > > > > > +     struct msm_fence *f =3D to_msm_fence(fence);
> > > > > > +
> > > > > > +     return wait_fence(f->fctx, fence->seqno, timeout, intr);
> > > > > > +}
> > > > > > +
> > > > > >   static const struct dma_fence_ops msm_fence_ops =3D {
> > > > > >       .get_driver_name =3D msm_fence_get_driver_name,
> > > > > >       .get_timeline_name =3D msm_fence_get_timeline_name,
> > > > > >       .signaled =3D msm_fence_signaled,
> > > > > > +     .wait =3D msm_fence_wait,
> > > > > >   };
> > > > > >
> > > > > >   struct dma_fence *
> > > > >
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
