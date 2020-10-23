Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869BC296D39
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 12:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462645AbgJWK6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 06:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S460693AbgJWK6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 06:58:22 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACE1C0613CE;
        Fri, 23 Oct 2020 03:58:22 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id p25so615660vsq.4;
        Fri, 23 Oct 2020 03:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ItpYQ9GC5N7T8BIaRPk6eDBkbaLNrhafp2hlkR07Zf8=;
        b=UWCMKvB22GNLPgs/wI1WMvtJJWWyCwl5uYR5/+GlTMTjEXFJELvwTkGow1zPIG31qj
         5owmCXqTsL5+giHkxsK0gu7nxaD9rL6MAxrU9aoPPHSUErOmQ1byFpAdhPywSz46Rf1R
         il793oELbdCqICbPhyEHegwwP7QeNl4SysPX035uiWDlK/w5X4MGYvYYjwrMKHQ+QL0w
         CYTHoxTDcFsTmnKYHb3jJ0uwYRFi1tkB5Y2lhIFNN2dHLD1uPIbzV3sp0H2IUXDx/V9t
         CgZ5R4ScrCUewwPHap8Vj6iRKJjkvjkwFncidFOZUGR/Do5bHy8oSM3ikMqlkpwVkLLc
         FQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ItpYQ9GC5N7T8BIaRPk6eDBkbaLNrhafp2hlkR07Zf8=;
        b=NnNobxdp9Zh+jCQJEX/3AFW+CTKupnXBFiMoceXwrMia+6LkvgtJRLbcK5nqvHqjdR
         CeUVxe/KiHWqw358xYiXjZunuRXi9opSFRFxNpcT967FN2nSG7/IsTaCPzMn9Mwbu1E5
         w/RYTusCGkzsW7VpABgaGnyva5TIBQcyJPgydvzRbtITl8mWO8h83zfUGuOBkmTzRDBZ
         PznGFl6oljOdupdh6ptKTdtcJ5mGMxqCbulGFgErS82BecdR0LNI3zYWvXOXykv6YG/y
         fZZArQS2peMrgz0HbQFlWJVpzKtcx2LorKTtrhOlSVchywU9v1ZEK8P9/WUnhxtdTUDk
         Z+bQ==
X-Gm-Message-State: AOAM533hTqixtxvpf1NXnB4vlvl/WTvHA6fvYfQB8t1vv7eBJ2p45STx
        allay15jgvcWStPNu2BqbEalemYTmEP/9ncBnlI=
X-Google-Smtp-Source: ABdhPJzRCu5YBLYYbZrfyB1lNhHvs2A3xuz04HFQccRe3INHBEU4kBKApK9853f5c1kF9RhQUXPegvd1h6khtJJrJuU=
X-Received: by 2002:a05:6102:31b5:: with SMTP id d21mr796747vsh.19.1603450701006;
 Fri, 23 Oct 2020 03:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201019204636.139997-1-robdclark@gmail.com>
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
From:   =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date:   Fri, 23 Oct 2020 12:58:09 +0200
Message-ID: <CAOeoa-fAkNGfCbmZ-nBaYyupFV4Eo8fc7pKimaWtPhczmK4h3Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 00/23] drm/msm: de-struct_mutex-ification
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Thierry Reding <treding@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Brian Masney <masneyb@onstation.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 19, 2020 at 10:45 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This doesn't remove *all* the struct_mutex, but it covers the worst
> of it, ie. shrinker/madvise/free/retire.  The submit path still uses
> struct_mutex, but it still needs *something* serialize a portion of
> the submit path, and lock_stat mostly just shows the lock contention
> there being with other submits.  And there are a few other bits of
> struct_mutex usage in less critical paths (debugfs, etc).  But this
> seems like a reasonable step in the right direction.
>
> v2: teach lockdep about shrinker locking patters (danvet) and
>     convert to obj->resv locking (danvet)
> v3: fix get_vaddr locking for legacy userspace (relocs), devcoredump,
>     and rd/hangrd

For the series:

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Rob Clark (23):
>   drm/msm: Fix a couple incorrect usages of get_vaddr_active()
>   drm/msm/gem: Add obj->lock wrappers
>   drm/msm/gem: Rename internal get_iova_locked helper
>   drm/msm/gem: Move prototypes to msm_gem.h
>   drm/msm/gem: Add some _locked() helpers
>   drm/msm/gem: Move locking in shrinker path
>   drm/msm/submit: Move copy_from_user ahead of locking bos
>   drm/msm: Do rpm get sooner in the submit path
>   drm/msm/gem: Switch over to obj->resv for locking
>   drm/msm: Use correct drm_gem_object_put() in fail case
>   drm/msm: Drop chatty trace
>   drm/msm: Move update_fences()
>   drm/msm: Add priv->mm_lock to protect active/inactive lists
>   drm/msm: Document and rename preempt_lock
>   drm/msm: Protect ring->submits with it's own lock
>   drm/msm: Refcount submits
>   drm/msm: Remove obj->gpu
>   drm/msm: Drop struct_mutex from the retire path
>   drm/msm: Drop struct_mutex in free_object() path
>   drm/msm: Remove msm_gem_free_work
>   drm/msm: Drop struct_mutex in madvise path
>   drm/msm: Drop struct_mutex in shrinker path
>   drm/msm: Don't implicit-sync if only a single ring
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |   6 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  12 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |   6 +-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |   1 +
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |   1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c        |   1 +
>  drivers/gpu/drm/msm/msm_debugfs.c         |   7 +
>  drivers/gpu/drm/msm/msm_drv.c             |  21 +-
>  drivers/gpu/drm/msm/msm_drv.h             |  73 +-----
>  drivers/gpu/drm/msm/msm_fbdev.c           |   1 +
>  drivers/gpu/drm/msm/msm_gem.c             | 266 +++++++++++-----------
>  drivers/gpu/drm/msm/msm_gem.h             | 133 +++++++++--
>  drivers/gpu/drm/msm/msm_gem_shrinker.c    |  81 ++-----
>  drivers/gpu/drm/msm/msm_gem_submit.c      | 158 ++++++++-----
>  drivers/gpu/drm/msm/msm_gpu.c             | 110 +++++----
>  drivers/gpu/drm/msm/msm_gpu.h             |   5 +-
>  drivers/gpu/drm/msm/msm_rd.c              |   2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c      |   3 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |  13 +-
>  19 files changed, 495 insertions(+), 405 deletions(-)
>
> --
> 2.26.2
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
