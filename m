Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A363CD667
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 16:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239590AbhGSNgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 09:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239393AbhGSNgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 09:36:36 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03B4C061574;
        Mon, 19 Jul 2021 06:42:37 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l17-20020a05600c1d11b029021f84fcaf75so12975128wms.1;
        Mon, 19 Jul 2021 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YxOE06iQfRI1CKUDbw3hGIS+VF1Rl+wYqbGsSCljupo=;
        b=OBWA7ulibxt21SOpQyH/zVYF2pcgZthfkZb9IplbXvKgG0VcXJh8EeSyOlzKNTeJGQ
         B5JmneMtLahn0ECNMrmmGF72WH4uf9uQ5XEtytSURVxOgaT7KUm96gRWL8h4fs3V2zpL
         qTzb2BEnzqQbgfReCpE6F1T3kOLPAdfc619qlzBY6JOmUhCO2yivQOTD982zNvZVxFOU
         dolpjs/JEAuAJpflASUHTYRn58qSTCeCMTDnkCccqx14a9knnUZoh6+LsrSq0GqY0X9o
         Eo8KLruVrE0J7S+dXxr1lrFTdpaHIXTQXWJxmguCZ9Off5ZlPx/zBC11zRi/eZG36F4e
         fUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YxOE06iQfRI1CKUDbw3hGIS+VF1Rl+wYqbGsSCljupo=;
        b=qBXy0+1BYrRWvhyloTw4v5p2l3WPqfaTTvDHtRiIlHi9e/DkzbYCAAgad9hpQDsVM3
         JWGv09qMftiYrHrDLII2BgZtySRN+d2t/BBrrOt0yFuY9mK33RlmUgcLOjALkDbO1JHB
         d0wfHKiiqRpF0KPqUFPNz4jvYi0aUzMAbp09qdTsT8ITvpA/Fg0YTnCjY+JElTy+fhmZ
         OQ9o0xpkh3zjDhGrHVlD/ajPBb2VWdjgMfNiqkiESsYRSgQ6KwzeeUzKaX7L8mKwGOhR
         anvAtbAWziPycKtOeQbcYKMnJaTzdu6aS9N7gezWNhUOvTIVdzhwEPfEeV3KYbFECo1I
         uG3g==
X-Gm-Message-State: AOAM530DKuQw14ZfVtz6U3jb1QOmBGVhjs8wBnU8QZmG/TLL2k6KqRGj
        aeUPbC/dyfaA2vbsLaq5IOds2aWaQ18oQra1DSA=
X-Google-Smtp-Source: ABdhPJxrSDp2zTG19VBXBLjwH7pcVPq3rHmT2XxCL0Xq8iJo5bPZiCVWZLD5AWEcNySNNzptwxQwRJ96/qe0jx7mjhA=
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr32878432wmc.123.1626704234434;
 Mon, 19 Jul 2021 07:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210717202924.987514-1-robdclark@gmail.com> <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
In-Reply-To: <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 19 Jul 2021 07:21:22 -0700
Message-ID: <CAF6AEGuaxh5FRb6h3aVkUYG7cFCpT6Lb+uuk2R8bmu3hxHs4Aw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm scheduler conversion
 and cleanups
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Emma Anholt <emma@anholt.net>, Bernard Zhao <bernard@vivo.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Dave Airlie <airlied@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 19, 2021 at 1:40 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 17.07.21 um 22:29 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Conversion to gpu_scheduler, and bonus removal of
> > drm_gem_object_put_locked()
>
> Oh yes please!
>
> If I'm not completely mistaken that was the last puzzle piece missing to
> unify TTMs and GEMs refcount of objects.
>
> Only problem is that I only see patch 7 and 9 in my inbox. Where is the
> rest?

Hmm, looks like it should have all gotten to dri-devel:

  https://lists.freedesktop.org/archives/dri-devel/2021-July/315573.html

or if you prefer patchwork:

  https://patchwork.freedesktop.org/series/92680/

BR,
-R

> Thanks,
> Christian.
>
> >
> > Rob Clark (11):
> >    drm/msm: Docs and misc cleanup
> >    drm/msm: Small submitqueue creation cleanup
> >    drm/msm: drop drm_gem_object_put_locked()
> >    drm: Drop drm_gem_object_put_locked()
> >    drm/msm/submit: Simplify out-fence-fd handling
> >    drm/msm: Consolidate submit bo state
> >    drm/msm: Track "seqno" fences by idr
> >    drm/msm: Return ERR_PTR() from submit_create()
> >    drm/msm: Conversion to drm scheduler
> >    drm/msm: Drop struct_mutex in submit path
> >    drm/msm: Utilize gpu scheduler priorities
> >
> >   drivers/gpu/drm/drm_gem.c                   |  22 --
> >   drivers/gpu/drm/msm/Kconfig                 |   1 +
> >   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
> >   drivers/gpu/drm/msm/msm_drv.c               |  30 +-
> >   drivers/gpu/drm/msm/msm_fence.c             |  39 ---
> >   drivers/gpu/drm/msm/msm_fence.h             |   2 -
> >   drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
> >   drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
> >   drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++-------=
-
> >   drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
> >   drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
> >   drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
> >   include/drm/drm_gem.h                       |   2 -
> >   include/uapi/drm/msm_drm.h                  |  10 +-
> >   23 files changed, 440 insertions(+), 359 deletions(-)
> >
>
