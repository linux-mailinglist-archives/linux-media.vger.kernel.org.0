Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940733EDFEC
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 00:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbhHPW0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 18:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbhHPW0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 18:26:04 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93153C061764;
        Mon, 16 Aug 2021 15:25:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k8so6732572wrn.3;
        Mon, 16 Aug 2021 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3pjhlUQ9zfXp80LAsXsFddhwkDCjIr1Qa6F73Rea0zo=;
        b=R2kIByJ61EjHKTZg4V2rq3Z7W17o8o4uPxU/T0mj4fztjC60Yn60rkDWcP6k5wuKSe
         pOMwhNxGPeTTcHosG5mvzlvzBfVfTIHyPXfDsxEXaHQVkpwMLcYGdU7mN6+B5fozfxKM
         OTH8GlaS/Js2USbMgOBx7JPthoW4h6Jg5KbFr/zqgfT3gJo3klvwqM672rjTni4+6MPQ
         Dt45zNlkb5nWvdI7+NUwHYNQ+Vn9N9Qm02MZMN9j0YvET7t1EAtJYpGhxwPGK6d8b3SM
         uWIAl+1ZGvF9C4dlLBhDCS2JJiNaIhs9c+wVXkzk4Y2vrItPDVH8Ei36QF0oe7kdEHlS
         j7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3pjhlUQ9zfXp80LAsXsFddhwkDCjIr1Qa6F73Rea0zo=;
        b=lfFvWsXIZVZhtB3piu8Fkmt6WJfBO1h8zerBD/V5BQqFHpKSI0k1PoZUhpEZKsbD9l
         TTDlc+3h3AVRbtubub34Inrqhu7ZGb9MA8zqlYv0Sff15vJzijniTp6/6pgakztc1SX0
         q5FHUVSrsfGKklv+UDeAmsyT6ePyp+Na1E5p8g2ywmTwsL5a0WTjVxw+8lFqhG9WvWnE
         hu7xPkbb9YxPyz/Gm30cdpZ0Wu8wqDZw/2t5m/diusajgTKSGTQW1GpYZ7qqwiazzL6y
         g5/KL9vw+BpaBv7iL/ZUKgCXkTy8n8+ZzH0sqTJo8KIpM3oBhmX/hzT7hydY9WJlW9id
         Q+ww==
X-Gm-Message-State: AOAM532SasTeAstOFS3Ws0R6ONYsEVHe7AVYkm2XMezxQlOU45M+nOpe
        1O9C+77ncfvhNa+m6ezpFbEv5NsNBQEbDdXw3JQ=
X-Google-Smtp-Source: ABdhPJyNem4NbmX4zNKpNipu1Xbu257Pj4hM0/aydLtGI6NNqHWvdhzNERN5io39lCQQLYxin7sgkoaB45AFy8ihnhE=
X-Received: by 2002:adf:dd11:: with SMTP id a17mr312204wrm.132.1629152731183;
 Mon, 16 Aug 2021 15:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210807183804.459850-1-robdclark@gmail.com> <9a7bdcb5-4f6f-539b-060e-d69ec15da874@amd.com>
In-Reply-To: <9a7bdcb5-4f6f-539b-060e-d69ec15da874@amd.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 16 Aug 2021 15:29:49 -0700
Message-ID: <CAF6AEGuwmLXW0xiFGGLie6qiL_ryE47pTiNYxmwwyshrb7eDpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] dma-fence: Deadline awareness
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
        Steven Price <steven.price@arm.com>,
        Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dma_fence_array looks simple enough, just propagate the deadline to
all children.

I guess dma_fence_chain is similar (ie. fence is signalled when all
children are signalled), the difference being simply that children are
added dynamically?

BR,
-R

On Mon, Aug 16, 2021 at 3:17 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> The general approach seems to make sense now I think.
>
> One minor thing which I'm missing is adding support for this to the
> dma_fence_array and dma_fence_chain containers.
>
> Regards,
> Christian.
>
> Am 07.08.21 um 20:37 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Based on discussion from a previous series[1] to add a "boost" mechanis=
m
> > when, for example, vblank deadlines are missed.  Instead of a boost
> > callback, this approach adds a way to set a deadline on the fence, by
> > which the waiter would like to see the fence signalled.
> >
> > I've not yet had a chance to re-work the drm/msm part of this, but
> > wanted to send this out as an RFC in case I don't have a chance to
> > finish the drm/msm part this week.
> >
> > Original description:
> >
> > In some cases, like double-buffered rendering, missing vblanks can
> > trick the GPU into running at a lower frequence, when really we
> > want to be running at a higher frequency to not miss the vblanks
> > in the first place.
> >
> > This is partially inspired by a trick i915 does, but implemented
> > via dma-fence for a couple of reasons:
> >
> > 1) To continue to be able to use the atomic helpers
> > 2) To support cases where display and gpu are different drivers
> >
> > [1] https://patchwork.freedesktop.org/series/90331/
> >
> > v1: https://patchwork.freedesktop.org/series/93035/
> > v2: Move filtering out of later deadlines to fence implementation
> >      to avoid increasing the size of dma_fence
> >
> > Rob Clark (5):
> >    dma-fence: Add deadline awareness
> >    drm/vblank: Add helper to get next vblank time
> >    drm/atomic-helper: Set fence deadline for vblank
> >    drm/scheduler: Add fence deadline support
> >    drm/msm: Add deadline based boost support
> >
> >   drivers/dma-buf/dma-fence.c             | 20 +++++++
> >   drivers/gpu/drm/drm_atomic_helper.c     | 36 ++++++++++++
> >   drivers/gpu/drm/drm_vblank.c            | 31 ++++++++++
> >   drivers/gpu/drm/msm/msm_fence.c         | 76 ++++++++++++++++++++++++=
+
> >   drivers/gpu/drm/msm/msm_fence.h         | 20 +++++++
> >   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 20 +++++++
> >   drivers/gpu/drm/scheduler/sched_fence.c | 25 ++++++++
> >   drivers/gpu/drm/scheduler/sched_main.c  |  3 +
> >   include/drm/drm_vblank.h                |  1 +
> >   include/drm/gpu_scheduler.h             |  6 ++
> >   include/linux/dma-fence.h               | 16 ++++++
> >   12 files changed, 255 insertions(+)
> >
>
