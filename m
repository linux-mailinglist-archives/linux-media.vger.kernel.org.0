Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB3B284442
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 05:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgJFDYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 23:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgJFDYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 23:24:14 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6309AC0613CE;
        Mon,  5 Oct 2020 20:24:14 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w5so11745353wrp.8;
        Mon, 05 Oct 2020 20:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gm5Rf54gYnkxJnrNPTvtfxE73fL5jd+U+PmQSMJsRvc=;
        b=VZyb7PmpfJgybAomaVGcyJCByMa//i6iSgwkSgK+x1NvOl016eP/UXi506QBBORKTi
         tCGJ/E76dAYPiXqNrZrcErB7Q0xU10hnaOt03I7zxUaU9GF3j2X2NsQ6wYncvNlW2SWl
         HIEGE1PDKdy+6AbcACmRbTJTquq8RUUuZg7EQjXnUKSEnyO1qqiQKH2PIxexqvEWF8p4
         5t7mKf1AWrQpG7txzTW454PA3VnGCs5h2D4yiORRiHTNTImQ9ZBXVSNk0Y7bjBPEUSf9
         ZGPV+OscToCX1ucGwRfs6q9vRP9iFwGykbHytukPTA7zVhlBcSGVNMcBKkEFJxzNWUBN
         +prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gm5Rf54gYnkxJnrNPTvtfxE73fL5jd+U+PmQSMJsRvc=;
        b=DvKctZcmAkdvCCEiPDORA7VHep4lYRjP7X5PYcpZ/ccvApWR84MgcwkIorilswS9Jg
         LDh/mjhPMexLybMWM5JXOj0/XWW2XS2Yfnv1NA1fuMdPYGFpFEr+TGYvNtTELoKpNN7b
         Y+R6s/e7RAr/jSyIg9l9gjTxR0+INIvHKe4ptpccvnBmpX/Jxp6WzLkwZdThCk1H9B4O
         ZkaXGFeukGzh92klQH0gAqtlggiPW+aZrws3guJqDe5gdX0/rVHhTwabTskcajRQacfk
         JOMvlLHemGKCyGo+Y3JQK3oexFP5GVPPk70T685Qv5CT2IGI5CL8yqIs1jXYG7vkuE9b
         NuUg==
X-Gm-Message-State: AOAM533oCk0UMlPonrPHBCqk5872w+SIlnoWLf+eZE9f6024CCIw/XIK
        RiQW7C6XfZRUQZBETgfdRQt1YdM1pa31gJsQozPFzAz5JQI=
X-Google-Smtp-Source: ABdhPJxMU6rAehG8uhyB/PTRpKBwU9ZZkYETuLsP9OyIut+i8rZ6MfrGcCOTvVIDW1IHzfNQuBUG9yIDHp1ndNOzhHM=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr2345446wru.28.1601954652929;
 Mon, 05 Oct 2020 20:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com> <CAOeoa-d4-KyuVjwPCBcau6yp6sxeeHN4K0cQzZ=H+OQVgHsLFw@mail.gmail.com>
 <CAKMK7uHeZptOKWKTanBB_c2ek2emNjs9fFCbTwgafS19rL1sww@mail.gmail.com>
In-Reply-To: <CAKMK7uHeZptOKWKTanBB_c2ek2emNjs9fFCbTwgafS19rL1sww@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 5 Oct 2020 20:25:21 -0700
Message-ID: <CAF6AEGu9riswKODKuftqtxkaM=qz9CmFoVgLn1j=yCJ-TuDXLA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 00/14] drm/msm: de-struct_mutex-ification
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>,
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

On Mon, Oct 5, 2020 at 11:20 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 5, 2020 at 6:24 PM Kristian H=C3=B8gsberg <hoegsberg@gmail.co=
m> wrote:
> >
> > On Sun, Oct 4, 2020 at 9:21 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > This doesn't remove *all* the struct_mutex, but it covers the worst
> > > of it, ie. shrinker/madvise/free/retire.  The submit path still uses
> > > struct_mutex, but it still needs *something* serialize a portion of
> > > the submit path, and lock_stat mostly just shows the lock contention
> > > there being with other submits.  And there are a few other bits of
> > > struct_mutex usage in less critical paths (debugfs, etc).  But this
> > > seems like a reasonable step in the right direction.
> >
> > What a great patch set. Daniel has some good points and nothing that
> > requires big changes, but on the other hand, I'm not sure it's
> > something that needs to block this set either.
>
> Personally I'd throw the lockdep priming on top to make sure this
> stays correct (it's 3 lines), but yes imo this is all good to go. Just
> figured I'll sprinkle the latest in terms of gem locking over the
> series while it's here :-)

Yeah, I'll defn throw the lockdep priming into v2.. and I've got using
obj->resv for locking on the todo list but looks like enough churn
that it will probably be it's own series (but seems like there is room
to introduce some lock/unlock helpers that don't really change
anything but make an obj->lock transition easier)

BR,
-R

> -Daniel
>
> > Either way, for the series
> >
> > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> >
> > > Rob Clark (14):
> > >   drm/msm: Use correct drm_gem_object_put() in fail case
> > >   drm/msm: Drop chatty trace
> > >   drm/msm: Move update_fences()
> > >   drm/msm: Add priv->mm_lock to protect active/inactive lists
> > >   drm/msm: Document and rename preempt_lock
> > >   drm/msm: Protect ring->submits with it's own lock
> > >   drm/msm: Refcount submits
> > >   drm/msm: Remove obj->gpu
> > >   drm/msm: Drop struct_mutex from the retire path
> > >   drm/msm: Drop struct_mutex in free_object() path
> > >   drm/msm: remove msm_gem_free_work
> > >   drm/msm: drop struct_mutex in madvise path
> > >   drm/msm: Drop struct_mutex in shrinker path
> > >   drm/msm: Don't implicit-sync if only a single ring
> > >
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  4 +-
> > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 12 +--
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +-
> > >  drivers/gpu/drm/msm/msm_debugfs.c         |  7 ++
> > >  drivers/gpu/drm/msm/msm_drv.c             | 15 +---
> > >  drivers/gpu/drm/msm/msm_drv.h             | 19 +++--
> > >  drivers/gpu/drm/msm/msm_gem.c             | 76 ++++++------------
> > >  drivers/gpu/drm/msm/msm_gem.h             | 53 +++++++++----
> > >  drivers/gpu/drm/msm/msm_gem_shrinker.c    | 58 ++------------
> > >  drivers/gpu/drm/msm/msm_gem_submit.c      | 17 ++--
> > >  drivers/gpu/drm/msm/msm_gpu.c             | 96 ++++++++++++++-------=
--
> > >  drivers/gpu/drm/msm/msm_gpu.h             |  5 +-
> > >  drivers/gpu/drm/msm/msm_ringbuffer.c      |  3 +-
> > >  drivers/gpu/drm/msm/msm_ringbuffer.h      | 13 ++-
> > >  14 files changed, 188 insertions(+), 194 deletions(-)
> > >
> > > --
> > > 2.26.2
> > >
> > > _______________________________________________
> > > Freedreno mailing list
> > > Freedreno@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/freedreno
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
