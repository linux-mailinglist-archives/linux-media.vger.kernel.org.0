Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A29F3D6A60
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 01:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhGZXLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 19:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbhGZXL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 19:11:29 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76636C061757;
        Mon, 26 Jul 2021 16:51:56 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id l4so13008588wrs.4;
        Mon, 26 Jul 2021 16:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tUIoigUs94bMHsltrSbpLlzLTuAd1wjaaiV0ZjEm+Bw=;
        b=j58O9/6iZBkX0FFFlPgMkDK17SR61mX0DAyRiuYxpvuZFTHbcm/MTFGcdmaNwJibhb
         uTBhqmJYjJWGv3MyOqx4xGwogGAmoI+UZVtAMpFcK+OEYendJwBziq0Rns+3kkBW+O8a
         3fJfm/C9J5jTTrEmg7CJEPy11Aum7gesrmioD5HoVl+4eD4eTMyYZc47HKhJ3Uw+eosu
         BmEcneHHIdMBgGcBFYCW+ZgCUWOHNPGJYJo0tXoR4hy4Rw1pYz5ckBE+OcWVH3jbNzEg
         RWvyOS8MC+EsozfKlizD4TvLFlcl49EUSDdLZf2FM4jYQbglxMxoTmu1AA7WHGTuix5c
         5QLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tUIoigUs94bMHsltrSbpLlzLTuAd1wjaaiV0ZjEm+Bw=;
        b=ugagOSk6xMDcDFVsJV776nPuYwvKfOHJtXKYB1u/Vw+mBSn9H9eFFjRlnnKVBFuiUR
         udA6O2c4udiDhP3vVf0c0X51IaGrz7uL160qpswXHe5j/2Y8ssj30kn4vGqHnu9pW9oc
         FASSKazAteGB8EDTJJL2B9IQia+fj/50NC9WNUi+jmT02qU6jgxQFB9My2HViqtTaksl
         R+hQlops8bSuUT9Msks2aZP9Fz3072EqARmlTL1x5iSPGYRNZ6aXBje8Se/28lHVRF+M
         A0hWEaxkKezzMdSHHlNzWy35pnZPGQleTUYPkOdzZHsZMcplQW2TsjWZw96CKoBbO0RV
         jIrg==
X-Gm-Message-State: AOAM531CCpq6TzGQ/dRCJXJbhGQbnbMvGhPCJsy6APmLd9DGMp+AyOE4
        9FUqaGqPn4udaOt1oFVPOufEAijY9rnGud90f8w=
X-Google-Smtp-Source: ABdhPJwXAzbNGuHdLOISfs3BtoWByAYqTqS3hd9v8tdZ2marIa37ZhMgm41g7p2rWzPxRDI2ZgF9Ns/85zSqMuv0bRc=
X-Received: by 2002:a5d:4348:: with SMTP id u8mr18590399wrr.28.1627343515010;
 Mon, 26 Jul 2021 16:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 26 Jul 2021 16:51:43 -0700
Message-ID: <CAF6AEGtm4NdQfqo6wGFBM-EBzW9E8twpDuS7GTXf2iHiHZYL1g@mail.gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To:     dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Roy Sun <Roy.Sun@amd.com>, Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 26, 2021 at 4:34 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Based on discussion from a previous series[1] to add a "boost" mechanism
> when, for example, vblank deadlines are missed.  Instead of a boost
> callback, this approach adds a way to set a deadline on the fence, by
> which the waiter would like to see the fence signalled.
>
> I've not yet had a chance to re-work the drm/msm part of this, but
> wanted to send this out as an RFC in case I don't have a chance to
> finish the drm/msm part this week.

Fwiw, what I'm thinking for the drm/msm part is a timer set to expire
a bit (couple ms?) before the deadline, which boosts if the timer
expires before the fence is signaled.

Assuming this is roughly in line with what other drivers would do,
possibly there is some room to build this timer into dma-fence itself?

BR,
-R

>
> Original description:
>
> In some cases, like double-buffered rendering, missing vblanks can
> trick the GPU into running at a lower frequence, when really we
> want to be running at a higher frequency to not miss the vblanks
> in the first place.
>
> This is partially inspired by a trick i915 does, but implemented
> via dma-fence for a couple of reasons:
>
> 1) To continue to be able to use the atomic helpers
> 2) To support cases where display and gpu are different drivers
>
> [1] https://patchwork.freedesktop.org/series/90331/
>
> Rob Clark (4):
>   dma-fence: Add deadline awareness
>   drm/vblank: Add helper to get next vblank time
>   drm/atomic-helper: Set fence deadline for vblank
>   drm/scheduler: Add fence deadline support
>
>  drivers/dma-buf/dma-fence.c             | 39 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c     | 36 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_vblank.c            | 31 ++++++++++++++++++++
>  drivers/gpu/drm/scheduler/sched_fence.c | 10 +++++++
>  drivers/gpu/drm/scheduler/sched_main.c  |  3 ++
>  include/drm/drm_vblank.h                |  1 +
>  include/linux/dma-fence.h               | 17 +++++++++++
>  7 files changed, 137 insertions(+)
>
> --
> 2.31.1
>
