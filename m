Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C736D3D26CF
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 17:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbhGVO4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 10:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhGVO4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 10:56:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B17C061575;
        Thu, 22 Jul 2021 08:36:35 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso3211240wmj.4;
        Thu, 22 Jul 2021 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=b0DoJx2BsbVVJrk2vhA6kDfquGRohjbc2PM7uCJo7AQ=;
        b=qHf9OnWhVMewnBbcFMkLefFnXcpymEjYudSG0ys60GLD0Qqj29UwPxDjYRTi1bFgWE
         Of7wRgf0ZZhtR5c+swf6vMqjVKSGhM1KD6PcZnqQ+Usgp/QkLWXaC1mJaJyEYuygJt78
         Kj5/oQpBY/Z4gFgwiMrzmUEo2Ntd1oCRYdzfRiBKhy+R4QQybhfvqL/O2JZ7UudKEHh+
         uZZIStXwovcNMremIcEh5hhEMEp+pXLcscxehmhWXdj8lGVZrSAev0auU2IFnIOX3ajk
         JpaGrq3FPqzl0boPVilTPm8n9Oqllf3KvCPBOuLV/MNi32Q4iyfhpOk1NY7hMvYC4Jwr
         PLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=b0DoJx2BsbVVJrk2vhA6kDfquGRohjbc2PM7uCJo7AQ=;
        b=lsEj65C+8NoZeOdLu8l2g4mjq5WEM5ZMB2x2+0K6tEwm2Iu4WlN74YmjhxlY2xreZO
         zYDsHhHwh179YdfFt1otCl1+HS+hNLdvpjSRebw+MqU9Kc1gzQRpJLGAywi04hCxfRJM
         5FlTLOwyuIfFwVQLU9U2SkTfZLuIdQpwiYMJfVL4eTtyprP2VmPQoGFB/bdaZSe8ZiBa
         LJkWV8gtk0HUm7rD7QMGoclJsrQ7YuCd16eqjsSanyYkyhDrsp+vhNa8E78ulRpe8egJ
         rKlHb6BQmQrMtElZUU+ge+VR10xstF1cCXbFOWSNZQ6RAlreXu3mfLM+GaMDAunRFjqc
         sUAg==
X-Gm-Message-State: AOAM532l0p4zSF9cwg1O/+2zEotGufh1fbbsVVT4AHv9sOHK1iK+nwwZ
        jGo9qVml+PXimIqs/Sc/GbXWICxNLrQiWIoq6Y4=
X-Google-Smtp-Source: ABdhPJxCkdIVm7iTrG4HCBPglTT8Jd2ruOUzfhfaiqWM3gbxHRbhBAOwJMUcdcc5JmreBWyQuVeEjCRkg5PGbQro08k=
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr9870542wmc.123.1626968193910;
 Thu, 22 Jul 2021 08:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com> <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local> <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
In-Reply-To: <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 22 Jul 2021 08:40:42 -0700
Message-ID: <CAF6AEGuWFPway2_UThe9p=OwL1rLaADONHmt7++qC3PUX+y_SQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
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

On Thu, Jul 22, 2021 at 1:42 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 21.07.21 um 21:03 schrieb Daniel Vetter:
> > On Wed, Jul 21, 2021 at 09:34:43AM -0700, Rob Clark wrote:
> >> On Wed, Jul 21, 2021 at 12:59 AM Daniel Vetter <daniel@ffwll.ch> wrote=
:
> >>> On Wed, Jul 21, 2021 at 12:32 AM Rob Clark <robdclark@gmail.com> wrot=
e:
> >>>> On Tue, Jul 20, 2021 at 1:55 PM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> >>>>> On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wro=
te:
> >>>>>> On Tue, Jul 20, 2021 at 11:03 AM Christian K=C3=B6nig
> >>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>>> Hi Rob,
> >>>>>>>
> >>>>>>> Am 20.07.21 um 17:07 schrieb Rob Clark:
> >>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>
> >>>>>>>> Somehow we had neither ->wait() nor dma_fence_signal() calls, an=
d no
> >>>>>>>> one noticed.  Oops.
> >>>>>>>
> >>>>>>> I'm not sure if that is a good idea.
> >>>>>>>
> >>>>>>> The dma_fence->wait() callback is pretty much deprecated and shou=
ld not
> >>>>>>> be used any more.
> >>>>>>>
> >>>>>>> What exactly do you need that for?
> >>>>>> Well, the alternative is to track the set of fences which have
> >>>>>> signalling enabled, and then figure out which ones to signal, whic=
h
> >>>>>> seems like a lot more work, vs just re-purposing the wait
> >>>>>> implementation we already have for non-dma_fence cases ;-)
> >>>>>>
> >>>>>> Why is the ->wait() callback (pretty much) deprecated?
> >>>>> Because if you need it that means for your driver dma_fence_add_cb =
is
> >>>>> broken, which means a _lot_ of things don't work. Like dma_buf poll
> >>>>> (compositors have patches to start using that), and I think
> >>>>> drm/scheduler also becomes rather unhappy.
> >>>> I'm starting to page back in how this works.. fence cb's aren't brok=
en
> >>>> (which is also why dma_fence_wait() was not completely broken),
> >>>> because in retire_submits() we call
> >>>> dma_fence_is_signaled(submit->hw_fence).
> >>>>
> >>>> But the reason that the custom wait function cleans up a tiny bit of
> >>>> jank is that the wait_queue_head_t gets signaled earlier, before we
> >>>> start iterating the submits and doing all that retire_submit() stuff
> >>>> (unpin/unref bo's, etc).  I suppose I could just split things up to
> >>>> call dma_fence_signal() earlier, and *then* do the retire_submits()
> >>>> stuff.
> >>> Yeah reducing the latency there sounds like a good idea.
> >>> -Daniel
> >>>
> >> Hmm, no, turns out that isn't the problem.. or, well, it is probably a
> >> good idea to call drm_fence_signal() earlier.  But it seems like
> >> waking up from wait_event_* is faster than wake_up_state(wait->task,
> >> TASK_NORMAL).  I suppose the wake_up_state() approach still needs for
> >> the scheduler to get around to schedule the runnable task.
>
> As far as I know wake_up_state() tries to run the thread on the CPU it
> was scheduled last, while wait_event_* makes the thread run on the CPU
> who issues the wake by default.
>
> And yes I've also noticed this already and it was one of the reason why
> I suggested to use a wait_queue instead of the hand wired dma_fence_wait
> implementation.
>
> >>
> >> So for now, I'm going back to my own wait function (plus earlier
> >> drm_fence_signal())
> >>
> >> Before removing dma_fence_opps::wait(), I guess we want to re-think
> >> dma_fence_default_wait().. but I think that would require a
> >> dma_fence_context base class (rather than just a raw integer).
> > Uh that's not great ... can't we fix this instead of papering over it i=
n
> > drivers? Aside from maybe different wakeup flags it all is supposed to
> > work exactly the same underneath, and whether using a wait queue or not
> > really shouldn't matter.
>
> Well it would have been nicer if we used the existing infrastructure
> instead of re-inventing stuff for dma_fence, but that chance is long gone=
.
>
> And you don't need a dma_fence_context base class, but rather just a
> flag in the dma_fence_ops if you want to change the behavior.

Hmm, I was thinking dma_fence_context to have a place for the
wait_queue_head, but I guess that could also be per-dma_fence
