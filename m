Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A89283C62
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 18:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgJEQYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 12:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgJEQYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 12:24:34 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D74C0613CE;
        Mon,  5 Oct 2020 09:24:33 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id z19so2705066uap.2;
        Mon, 05 Oct 2020 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qBumfCmhAXhY6hDQgspF9hUMTgcwdq6ZvwLFthSZGKg=;
        b=FqgucgTbGuny7Ms/SWPL4HahrbIIvGxOn4Zb1JCVFIdVq4oFzJnG9Lig/ZJD+lJ+s/
         7z5Ew6VOel/j/DPaKaY8Jgffv6XMOZaMxJCjTrMXLNdF2CaHsuCV6nvK9fVzLtPe18k8
         XsJEIS3GSofDUIgLWpDbum1ae6IhdzyjabIq3rnE+7canVicUVSzryoQIQhj5QzGc8/m
         J+al3GNCZWv8cH4ug3+omqfo0SzAMOuN5lczBQb+eteSlN2bQlPdPGD+y9JpdQEkaLDX
         pbE9eKwoz5hm3AFBibyPly+JHhDSawWQRCUH6CC/4UWeVpIl2mI4uoiI3KNB/AlGrQLL
         wzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBumfCmhAXhY6hDQgspF9hUMTgcwdq6ZvwLFthSZGKg=;
        b=EeTv7+D/6Bd8OxRsHYLhU5pWix21qEYNTa0ocESNrnClgyFrp6T0bxIhpjlg+pTKbS
         eN13ZgpeeCt/2iPQXc18KK9TsFg+e27poqA5M5Gne6CLNcl5Poq9lYCSFkQ+UcopKWF+
         hURgRiFsS2h0pcBSC4jRrJUA7x79CCTlhKUkymyrRefI60dJUcHaVXWSWbZAc2ywuPGr
         +VYN6HMv8lnMs3NF6vwCrVopAGZLtaxQ9AQcXZZk2+2sgLiQ7Eg9TtDCDpIy6y5ZxmmJ
         3aI5vwsV12SQJywc7tkPv160uQQp0juWw84z3hp/L51fjZMxNqMBxXxR4SLN2oSHk4Gg
         ITmQ==
X-Gm-Message-State: AOAM530+Bk58WWnqXZpyod4Q5L+B5lt+UTF7PeLolDYaou6aof8/4mkS
        ZSpE8y3BN8hIXvMmav2rff7kH0biwdCEOqP1/I+PZg5QVuqCurHe
X-Google-Smtp-Source: ABdhPJznyMapjDMGbUJSAUPrB5hWXc5IE1Vq0Zi5rWJZl03TsE1S3clOeekLVUiAwcemyucFJg5Cj3CY5Fd3yEzo76Y=
X-Received: by 2002:a9f:3f46:: with SMTP id i6mr449424uaj.31.1601915072945;
 Mon, 05 Oct 2020 09:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201004192152.3298573-1-robdclark@gmail.com>
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
From:   =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date:   Mon, 5 Oct 2020 18:24:21 +0200
Message-ID: <CAOeoa-d4-KyuVjwPCBcau6yp6sxeeHN4K0cQzZ=H+OQVgHsLFw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 00/14] drm/msm: de-struct_mutex-ification
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Eric Anholt <eric@anholt.net>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 4, 2020 at 9:21 PM Rob Clark <robdclark@gmail.com> wrote:
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

What a great patch set. Daniel has some good points and nothing that
requires big changes, but on the other hand, I'm not sure it's
something that needs to block this set either.

Either way, for the series

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Rob Clark (14):
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
>   drm/msm: remove msm_gem_free_work
>   drm/msm: drop struct_mutex in madvise path
>   drm/msm: Drop struct_mutex in shrinker path
>   drm/msm: Don't implicit-sync if only a single ring
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  4 +-
>  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 12 +--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +-
>  drivers/gpu/drm/msm/msm_debugfs.c         |  7 ++
>  drivers/gpu/drm/msm/msm_drv.c             | 15 +---
>  drivers/gpu/drm/msm/msm_drv.h             | 19 +++--
>  drivers/gpu/drm/msm/msm_gem.c             | 76 ++++++------------
>  drivers/gpu/drm/msm/msm_gem.h             | 53 +++++++++----
>  drivers/gpu/drm/msm/msm_gem_shrinker.c    | 58 ++------------
>  drivers/gpu/drm/msm/msm_gem_submit.c      | 17 ++--
>  drivers/gpu/drm/msm/msm_gpu.c             | 96 ++++++++++++++---------
>  drivers/gpu/drm/msm/msm_gpu.h             |  5 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c      |  3 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.h      | 13 ++-
>  14 files changed, 188 insertions(+), 194 deletions(-)
>
> --
> 2.26.2
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
