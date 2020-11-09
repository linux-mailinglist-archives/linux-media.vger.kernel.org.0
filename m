Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBF22AC838
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 23:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgKIWXM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 17:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729247AbgKIWXM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 17:23:12 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35574C0613CF;
        Mon,  9 Nov 2020 14:23:12 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id o15so2695395wru.6;
        Mon, 09 Nov 2020 14:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HIMdkonH/M8RHuv/jMDRV8k2qN0Wz0T+rWEsqMPSnwA=;
        b=qXD2SUCfRXs2Son41xS9JrmModwUyi7zW8lHeER2+tNs+uLvRQ/DEASEaivbDeyq7N
         te/ZdwmqkOmiQ9aSgFbKP0DbNupVOJGRVcDNvVDGdBc4a77uq+b8XCjbQm+lcc4G6BFJ
         S4nENyYsMN/GK1oPm5ivx7auaI4cjA1Udqhuwsbk9y3meAheXjLm7NkEWRBQ6HQnBcZG
         GMfZU8vd7THL0I7JuY22nEBwdgxHpDpCNyjlNO9Ti9opIDFNRsgahgezGCZvsof36WMw
         L3t+67irsIWyrvKOBfVwjNd1VvRdyGEQ4Z5lgKzAqDkHy2MF0EOnsfxL11ikqj5timPT
         iUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HIMdkonH/M8RHuv/jMDRV8k2qN0Wz0T+rWEsqMPSnwA=;
        b=KQy4C3iS1xLlQqx1XIXWmWaKG0dQvFjvjax18VofJXYl4abifWgiVkfA64CWn/1N73
         06M2nGE1g2WKPXSbkEYB1Y8J9px6egY46svjtO0+pO/Mj4DF6ObYa+kA9VvFIshGT6li
         Dno1Mt8fpR6V331UJ3AuEKPBBE1ecph37eiXTQ7XRnBYVgLisfcPkmKYcWldljtGckg6
         Ml/Be5ypdjZyhRR4eO/NIwNyku68YoK+yhLCyxl7bh2+w4R8ngk4ZGV89fmeUKexwA9n
         ZeQBk5OLQ0Ubk3Rux+gUbOGGi5v1ZYC9/qgHlOh6ChOW9qMvBDGQ5mlCDBb7N9Eu5dsE
         BiaQ==
X-Gm-Message-State: AOAM533cPM67yH0hsGwXRNxJzfhcSVBqVzNLrUWEMhbJz/kpyp2J/JP+
        FO67yZrmaAB4YgQpVhXJfGzQb75cSvjYI+rXJPs=
X-Google-Smtp-Source: ABdhPJxxQlstl0Xclg6pLXD+2YnocUBWnj82fQETra99luiqoS75TrxTds454fJh8RamwMKKq4SYChqU7lpxyUScJvs=
X-Received: by 2002:adf:f246:: with SMTP id b6mr20074356wrp.111.1604960590933;
 Mon, 09 Nov 2020 14:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 9 Nov 2020 17:22:59 -0500
Message-ID: <CADnq5_N1BbXosxsGoc7L2NCY3rf3dqFB7SD84PNsFTC7rJPY6Q@mail.gmail.com>
Subject: Re: [PATCH 00/20] [Set 3] Rid W=1 warnings from GPU
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Slava Grigorev <slava.grigorev@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        report to <xorg-driver-ati@lists.x.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 9, 2020 at 4:19 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> This set is part of a larger effort attempting to clean-up W=3D1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>
> This set takes the running (decreasing) total from 5000 before
> [Set 1] down to 2300.
>
> Lee Jones (20):
>   drm/radeon/radeon_ttm: Place declaration of 'rdev' in same clause as
>     its use
>   drm/radeon: Move radeon_ttm{init,fini} to shared location
>   drm/radeon/radeon_fence: Demote some non-conformant kernel-doc headers
>     and fix another
>   drm/radeon: Move 'radeon_add_legacy_encoder' prototype to shared
>     header
>   drm/radeon: Move 'radeon_add_legacy_encoder's prototype to shared
>     location
>   drm/radeon/radeon_connectors: Strip out set but unused variable 'ret'
>   drm/radeon/radeon_display: Remove unused variable 'mod'
>   drm/radeon/radeon_i2c: Remove pointless function header
>   drm/radeon/radeon_irq_kms: Demote non-conformant kernel-doc fix
>     another
>   drm/radeon/radeon_ring: Add missing function parameters 'rdev' and
>     'data'
>   drm/radeon/r600: Strip out set but unused 'tmp' variables
>   drm/radeon/radeon_cs: Fix a bunch of doc-rot issues
>   drm/radeon/evergreen: Move 'rv770_set_clk_bypass_mode' prototype to
>     shared location
>   drm/radeon: Move 'radeon_pm_acpi_event_handler' prototype into shared
>     header
>   drm/radeon/r600d: Move 'rc600_*' prototypes into shared header
>   drm/radeon/radeon_audio: Move 'dce3_2_*' prototypes to shared location
>   drm/radeon/evergreend: Move 'evergreen_*' and 'sumo_*' prototypes out
>     to shared location
>   drm/radeon/radeon_display: Fix function doc formatting and missing
>     param issues
>   drm/radeon/r600: Fix a misnamed parameter description and a formatting
>     issue
>   drm/radeon/cik: Fix a bunch of function parameter descriptions
>
>  drivers/gpu/drm/radeon/cik.c               | 10 +++----
>  drivers/gpu/drm/radeon/evergreen.c         |  1 -
>  drivers/gpu/drm/radeon/ni.c                | 16 ----------
>  drivers/gpu/drm/radeon/r600.c              | 11 +++----
>  drivers/gpu/drm/radeon/r600d.h             | 14 +++++++++
>  drivers/gpu/drm/radeon/radeon.h            | 34 ++++++++++++++++++++++
>  drivers/gpu/drm/radeon/radeon_acpi.c       |  2 --
>  drivers/gpu/drm/radeon/radeon_atombios.c   |  5 ----
>  drivers/gpu/drm/radeon/radeon_audio.c      | 23 +--------------
>  drivers/gpu/drm/radeon/radeon_audio.h      | 12 ++++++++
>  drivers/gpu/drm/radeon/radeon_combios.c    |  5 ----
>  drivers/gpu/drm/radeon/radeon_connectors.c |  4 +--
>  drivers/gpu/drm/radeon/radeon_cs.c         | 12 ++++----
>  drivers/gpu/drm/radeon/radeon_display.c    | 17 +++++------
>  drivers/gpu/drm/radeon/radeon_encoders.c   |  3 --
>  drivers/gpu/drm/radeon/radeon_fence.c      |  6 ++--
>  drivers/gpu/drm/radeon/radeon_i2c.c        |  4 ---
>  drivers/gpu/drm/radeon/radeon_irq_kms.c    |  6 ++--
>  drivers/gpu/drm/radeon/radeon_object.c     |  2 --
>  drivers/gpu/drm/radeon/radeon_ring.c       |  3 ++
>  drivers/gpu/drm/radeon/radeon_ttm.c        |  8 ++---
>  drivers/gpu/drm/radeon/si.c                |  6 ----
>  22 files changed, 96 insertions(+), 108 deletions(-)

Instead of just dumping everything in radeon.h, I think it would be
cleaner to add new headers that match the .c files that define them.
E.g., add evergreen.h and put all the stuff from evergreen.c in there.
Add rv770.h and add all the stuff defined in rv770.c, etc.

Alex

>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-media@vger.kernel.org
> Cc: report to <xorg-driver-ati@lists.x.org>
> Cc: Slava Grigorev <slava.grigorev@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
