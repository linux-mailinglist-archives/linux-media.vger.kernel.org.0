Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA44283E2E
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 20:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgJESUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 14:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727187AbgJESUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 14:20:36 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAC5C0613A8
        for <linux-media@vger.kernel.org>; Mon,  5 Oct 2020 11:20:34 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x69so9625372oia.8
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2020 11:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kZPEXkmRFhKPxE4UsJ1anlhQ3+0vTVsGBvgPlUPbE7w=;
        b=digCacwGUHn+oARFLUlEEiRTDoPXLO1xnxIuBum/VKhKQK7BCTulEUnSODFeCvDgqR
         ONx+Ygs1zeRud/eBv0KktRHkZij8UcSubxt6fRsWSbSb5URyynq9bUJ9Z1mPNuVzys6O
         B7+ktxEVlNZMJZvzGUecbDLxWpbn9fJMLuzr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kZPEXkmRFhKPxE4UsJ1anlhQ3+0vTVsGBvgPlUPbE7w=;
        b=KiSF6fobyRk5rAxZeGEeS+4e6lvd51VqhseZqesy5bBXHJf/whMGcBBHn2bcL1sbCs
         0kzLsIa4hL4Y1U8gaSt3e35w8M5gX1XLpGuOBSUa8/arul2GZljTU2SaQqjmz+QGJskS
         jah0vVHrHLrCaHqubRs1zx0JDh+gXqUXQpK5+lY4g//eVlscstkq3sXOW+T81T5dW6Rp
         t/PVEzFC9w+nKF7fGpwPGONO3EuTPkyJvvp7Y7aJUVwGOU9y/3izLbU1EKn07+s5zDbQ
         +1tqcNscIYSvVki1dHI+rOKZwILFQlVLlw+RbWO9nXp3EaWy6hlQSj+h4yBGMWQS0hPL
         e96Q==
X-Gm-Message-State: AOAM533CJglyO2gRCOx5QIHKhE3W5xAgEjax9LZgOQBI7MDR5s5SA1n7
        rOJEcuYPtH+sb4OR2HwifBHtWs7dFp7CiWUojsqQqw==
X-Google-Smtp-Source: ABdhPJyJa7U8SQQEss3scNAd++32yQJ9inG+jtPNdgXpwnwGtNsOIHLVfEr4vMOsbMx/1Epql3rutItK4vq4Q/a+KbE=
X-Received: by 2002:aca:6083:: with SMTP id u125mr418733oib.14.1601922033920;
 Mon, 05 Oct 2020 11:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com> <CAOeoa-d4-KyuVjwPCBcau6yp6sxeeHN4K0cQzZ=H+OQVgHsLFw@mail.gmail.com>
In-Reply-To: <CAOeoa-d4-KyuVjwPCBcau6yp6sxeeHN4K0cQzZ=H+OQVgHsLFw@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 5 Oct 2020 20:20:22 +0200
Message-ID: <CAKMK7uHeZptOKWKTanBB_c2ek2emNjs9fFCbTwgafS19rL1sww@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 00/14] drm/msm: de-struct_mutex-ification
To:     =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 5, 2020 at 6:24 PM Kristian H=C3=B8gsberg <hoegsberg@gmail.com>=
 wrote:
>
> On Sun, Oct 4, 2020 at 9:21 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This doesn't remove *all* the struct_mutex, but it covers the worst
> > of it, ie. shrinker/madvise/free/retire.  The submit path still uses
> > struct_mutex, but it still needs *something* serialize a portion of
> > the submit path, and lock_stat mostly just shows the lock contention
> > there being with other submits.  And there are a few other bits of
> > struct_mutex usage in less critical paths (debugfs, etc).  But this
> > seems like a reasonable step in the right direction.
>
> What a great patch set. Daniel has some good points and nothing that
> requires big changes, but on the other hand, I'm not sure it's
> something that needs to block this set either.

Personally I'd throw the lockdep priming on top to make sure this
stays correct (it's 3 lines), but yes imo this is all good to go. Just
figured I'll sprinkle the latest in terms of gem locking over the
series while it's here :-)
-Daniel

> Either way, for the series
>
> Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
>
> > Rob Clark (14):
> >   drm/msm: Use correct drm_gem_object_put() in fail case
> >   drm/msm: Drop chatty trace
> >   drm/msm: Move update_fences()
> >   drm/msm: Add priv->mm_lock to protect active/inactive lists
> >   drm/msm: Document and rename preempt_lock
> >   drm/msm: Protect ring->submits with it's own lock
> >   drm/msm: Refcount submits
> >   drm/msm: Remove obj->gpu
> >   drm/msm: Drop struct_mutex from the retire path
> >   drm/msm: Drop struct_mutex in free_object() path
> >   drm/msm: remove msm_gem_free_work
> >   drm/msm: drop struct_mutex in madvise path
> >   drm/msm: Drop struct_mutex in shrinker path
> >   drm/msm: Don't implicit-sync if only a single ring
> >
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  4 +-
> >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 12 +--
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +-
> >  drivers/gpu/drm/msm/msm_debugfs.c         |  7 ++
> >  drivers/gpu/drm/msm/msm_drv.c             | 15 +---
> >  drivers/gpu/drm/msm/msm_drv.h             | 19 +++--
> >  drivers/gpu/drm/msm/msm_gem.c             | 76 ++++++------------
> >  drivers/gpu/drm/msm/msm_gem.h             | 53 +++++++++----
> >  drivers/gpu/drm/msm/msm_gem_shrinker.c    | 58 ++------------
> >  drivers/gpu/drm/msm/msm_gem_submit.c      | 17 ++--
> >  drivers/gpu/drm/msm/msm_gpu.c             | 96 ++++++++++++++---------
> >  drivers/gpu/drm/msm/msm_gpu.h             |  5 +-
> >  drivers/gpu/drm/msm/msm_ringbuffer.c      |  3 +-
> >  drivers/gpu/drm/msm/msm_ringbuffer.h      | 13 ++-
> >  14 files changed, 188 insertions(+), 194 deletions(-)
> >
> > --
> > 2.26.2
> >
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
