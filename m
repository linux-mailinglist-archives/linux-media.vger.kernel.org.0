Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D973D8D79
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 14:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbhG1MJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 08:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234647AbhG1MJa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 08:09:30 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD759C061757
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 05:09:28 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id o185so3376277oih.13
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 05:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=epsE9NfA9DWMmQX7B7TUHrwoN0esHZLX/lAuY9R/APs=;
        b=DHWilW85wtL8urWXwK1H35IgOGWct4GNNoH6L2TweyrfSeqohh2SgHlytOyaXk14F4
         nvF7vjevWX82rvVHyvzx1ZbnZeRWF7GYGsfg94wZ9TZMMZCApBFIhorcnBSJAqeydEFq
         z5xPNkjc0P+ANkt/6IP97XE+Nt6V+eT5RGwyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=epsE9NfA9DWMmQX7B7TUHrwoN0esHZLX/lAuY9R/APs=;
        b=YW/wXx4ytACHvvJAuxX3tSUGEngmXk548O7q1tKoy7h/OgL472HYvHbfSW0VFKsrHO
         R5SXXDxhA9VHxredIMhEeiEz/M+8iWMtuipjh6D5k+dgVKNCz1YWvht5mgM9k0m78I0P
         mXCFDEyg5ay1HNeELMFU910iIj5EwRfx2j6wCo8vKNWqOUHRfIynGjQS2ItbYu9+u6zo
         4UBrYsqjIcCuLeF+lUAwHdlzbwGu64xfKop7P1Mom09K1TNvR71y8mNTAmL3tZHf10JA
         hU8tVAbZhCxV7tfpZUA9qrbtqqTP2fXuf1AdvD2XYY5VS/779YfewTVR5MpefemSlC1d
         q9KA==
X-Gm-Message-State: AOAM53326YDS5JVquTGfqPIj9R7mBWtsS3RSgvP3Pd5KCPOeY9UxW/Xt
        9fWtzeYaYnYZDSP8JNuQ//xlQXvtyLoT9z63KW41kg==
X-Google-Smtp-Source: ABdhPJyoP8j3HcVFOx21JkZ1fbw/u0UOrXcFrbpnUtr9/NGZi5d8IdfwW93rEYxekFa9C908SCfaP6dekAAbolqc/xs=
X-Received: by 2002:aca:d682:: with SMTP id n124mr18525460oig.128.1627474168027;
 Wed, 28 Jul 2021 05:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-4-daniel.vetter@ffwll.ch> <CAKMK7uG8bMuDP=7-z9nZ38WgMdbeUk96eNx3buTCiaKatYOJxw@mail.gmail.com>
 <2bcfba05-b7d5-1bd9-d74a-b9aac1147e20@gmail.com>
In-Reply-To: <2bcfba05-b7d5-1bd9-d74a-b9aac1147e20@gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 28 Jul 2021 14:09:16 +0200
Message-ID: <CAKMK7uE7GBZYih=KZm5t7-_0P8i7M0tA2KgSOgJsm+-HUE+HzA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v4 03/18] drm/sched: Add dependency tracking
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        David Airlie <airlied@linux.ie>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Steven Price <steven.price@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 28, 2021 at 1:29 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 27.07.21 um 13:09 schrieb Daniel Vetter:
> > Adding a few more people to this bikeshed.
> >
> > On Mon, Jul 12, 2021 at 10:02 PM Daniel Vetter <daniel.vetter@ffwll.ch>=
 wrote:
> >
> >> @@ -349,6 +367,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >>                         struct drm_sched_entity *entity,
> >>                         void *owner);
> >>   void drm_sched_job_arm(struct drm_sched_job *job);
> >> +int drm_sched_job_await_fence(struct drm_sched_job *job,
> >> +                             struct dma_fence *fence);
> >> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> >> +                                struct drm_gem_object *obj,
> >> +                                bool write);
> >> +
> >> +
> > I'm still waiting on the paint delivery for these two functions so I
> > can finish this shed.
>
> Well I wouldn't call that bike shedding, good names are important.
>
> Just imaging we would have called the exclusive-fence write-fence instead=
.

Sure naming matters, but at least to my English understanding there's
not a semantic different between telling something to await for
something else (i.e. add a dependency) or to tell something to add a
dependency (i.e. await that thing later on before you start doing your
own thing).

Exclusive vs write fence otoh is a pretty big difference in what it means.

But also if there's consensus that I'm wrong then I'm happy to pick
the more preferred of the two options I deem equivalent.

> What speaks against calling them add_dependency() and
> _add_implicit_depencencies() ?

Nothing. I just like another ack on this before I rename it all. Also
I wasnt sure what you'd want to name the implicit dependency thing.

Lucas, Boris, Melissa, any acks here?
-Daniel

> Regards,
> Christian.
>
> >
> > Thanks, Daniel
> >
> >>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> >>                                      struct drm_gpu_scheduler **sched_=
list,
> >>                                      unsigned int num_sched_list);
> >> --
> >> 2.32.0
> >>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
