Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B382E2AD04C
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 08:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgKJHU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 02:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbgKJHU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 02:20:58 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C87C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 23:20:56 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id p8so10672985wrx.5
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 23:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xAGL+MqhZzKyrUoLXU8MWIWR+zEnYIu8+jLrfBt+Ymo=;
        b=rTGy57DSN9XQoBCQvVJsCf80xY/yL1F27+sV2Uck0Evb3/yyznaYfcwmF25iXGPxHP
         s/J4Bga12wkOZlS7jy8pwfMXUK6eH4uzgipq8uUt83TcEmKfJpzDJYrIy+1uQnyqWB45
         i8N5hdwv5bOHhmk2wGJQ4i5chN0fAiB3CdIDUK9+doprcsIYTY86Exju6DGVzQDIOVP5
         ZQXoBAyv4528nn2m3gHAsuTOvGXqyTQMbEDgUGYfEa8zHxaAEllgMbsLA4CgPLOdDa4x
         wXD1xFHk3IPDXk+P0m9KyoQdXtugrRey4DiuUFtiQ5dyDaxKNH7sIzt+ePd57A6Fj/q5
         8DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xAGL+MqhZzKyrUoLXU8MWIWR+zEnYIu8+jLrfBt+Ymo=;
        b=tHmTWBnpQz9huSFhmb/jDZTmutSV4mVgIdFqoLrscDxGVK3WGvbjEWCBRbOR846+2G
         UqvGwAZFIzXyrb4IpfOVC0Z44Vn/9lGCbILb1ltfWsW8/evT/dsxQe2MusCU3yk/1oZB
         qsyfbIEsB+2gVDmFdLU0tRVwoSdnlu1FlmV2umFckot8PgI6J8Swi9XjpfWgOhVC2oBw
         NUYguu9ECQ+CJn8MlNG1QhAX/O+H0TM6DHCFT2VwnVc12MV3egn0oJ1ls9a6HczAzeaa
         YBvme2VbyFZh3AUR7Ef3q5YJeZgf7/Y9xpBtpSLJBNMu3j1znmEJMBykdpSgpOsPnR5b
         I0vA==
X-Gm-Message-State: AOAM533GGnT20VQPC/OS9IFGx7RL7o+VzSmq2YHoAu0trDAxGtqPvRVh
        eYceF32zZ78Q2x9ZJ3gzgKQINw==
X-Google-Smtp-Source: ABdhPJyijq/ksDVuRAKwo3BX7XOAe+raYXlSVEktgYFSH6CSRs0ryV7el71/y3dyTkGCoqBbojSefA==
X-Received: by 2002:adf:a54d:: with SMTP id j13mr18936180wrb.132.1604992855052;
        Mon, 09 Nov 2020 23:20:55 -0800 (PST)
Received: from dell ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id q1sm4777033wrj.59.2020.11.09.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 23:20:54 -0800 (PST)
Date:   Tue, 10 Nov 2020 07:20:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Alex Deucher <alexdeucher@gmail.com>
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
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 00/20] [Set 3] Rid W=1 warnings from GPU
Message-ID: <20201110072024.GE2063125@dell>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <CADnq5_N1BbXosxsGoc7L2NCY3rf3dqFB7SD84PNsFTC7rJPY6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_N1BbXosxsGoc7L2NCY3rf3dqFB7SD84PNsFTC7rJPY6Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 09 Nov 2020, Alex Deucher wrote:

> On Mon, Nov 9, 2020 at 4:19 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> >
> > This set takes the running (decreasing) total from 5000 before
> > [Set 1] down to 2300.
> >
> > Lee Jones (20):
> >   drm/radeon/radeon_ttm: Place declaration of 'rdev' in same clause as
> >     its use
> >   drm/radeon: Move radeon_ttm{init,fini} to shared location
> >   drm/radeon/radeon_fence: Demote some non-conformant kernel-doc headers
> >     and fix another
> >   drm/radeon: Move 'radeon_add_legacy_encoder' prototype to shared
> >     header
> >   drm/radeon: Move 'radeon_add_legacy_encoder's prototype to shared
> >     location
> >   drm/radeon/radeon_connectors: Strip out set but unused variable 'ret'
> >   drm/radeon/radeon_display: Remove unused variable 'mod'
> >   drm/radeon/radeon_i2c: Remove pointless function header
> >   drm/radeon/radeon_irq_kms: Demote non-conformant kernel-doc fix
> >     another
> >   drm/radeon/radeon_ring: Add missing function parameters 'rdev' and
> >     'data'
> >   drm/radeon/r600: Strip out set but unused 'tmp' variables
> >   drm/radeon/radeon_cs: Fix a bunch of doc-rot issues
> >   drm/radeon/evergreen: Move 'rv770_set_clk_bypass_mode' prototype to
> >     shared location
> >   drm/radeon: Move 'radeon_pm_acpi_event_handler' prototype into shared
> >     header
> >   drm/radeon/r600d: Move 'rc600_*' prototypes into shared header
> >   drm/radeon/radeon_audio: Move 'dce3_2_*' prototypes to shared location
> >   drm/radeon/evergreend: Move 'evergreen_*' and 'sumo_*' prototypes out
> >     to shared location
> >   drm/radeon/radeon_display: Fix function doc formatting and missing
> >     param issues
> >   drm/radeon/r600: Fix a misnamed parameter description and a formatting
> >     issue
> >   drm/radeon/cik: Fix a bunch of function parameter descriptions
> >
> >  drivers/gpu/drm/radeon/cik.c               | 10 +++----
> >  drivers/gpu/drm/radeon/evergreen.c         |  1 -
> >  drivers/gpu/drm/radeon/ni.c                | 16 ----------
> >  drivers/gpu/drm/radeon/r600.c              | 11 +++----
> >  drivers/gpu/drm/radeon/r600d.h             | 14 +++++++++
> >  drivers/gpu/drm/radeon/radeon.h            | 34 ++++++++++++++++++++++
> >  drivers/gpu/drm/radeon/radeon_acpi.c       |  2 --
> >  drivers/gpu/drm/radeon/radeon_atombios.c   |  5 ----
> >  drivers/gpu/drm/radeon/radeon_audio.c      | 23 +--------------
> >  drivers/gpu/drm/radeon/radeon_audio.h      | 12 ++++++++
> >  drivers/gpu/drm/radeon/radeon_combios.c    |  5 ----
> >  drivers/gpu/drm/radeon/radeon_connectors.c |  4 +--
> >  drivers/gpu/drm/radeon/radeon_cs.c         | 12 ++++----
> >  drivers/gpu/drm/radeon/radeon_display.c    | 17 +++++------
> >  drivers/gpu/drm/radeon/radeon_encoders.c   |  3 --
> >  drivers/gpu/drm/radeon/radeon_fence.c      |  6 ++--
> >  drivers/gpu/drm/radeon/radeon_i2c.c        |  4 ---
> >  drivers/gpu/drm/radeon/radeon_irq_kms.c    |  6 ++--
> >  drivers/gpu/drm/radeon/radeon_object.c     |  2 --
> >  drivers/gpu/drm/radeon/radeon_ring.c       |  3 ++
> >  drivers/gpu/drm/radeon/radeon_ttm.c        |  8 ++---
> >  drivers/gpu/drm/radeon/si.c                |  6 ----
> >  22 files changed, 96 insertions(+), 108 deletions(-)
> 
> Instead of just dumping everything in radeon.h, I think it would be
> cleaner to add new headers that match the .c files that define them.
> E.g., add evergreen.h and put all the stuff from evergreen.c in there.
> Add rv770.h and add all the stuff defined in rv770.c, etc.

This was my original solution, but Sam pushed back.

Please can you decide amongst yourselves what is the best way forward?

I will abide by whatever you decide.

> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Jerome Glisse <glisse@freedesktop.org>
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-media@vger.kernel.org
> > Cc: report to <xorg-driver-ati@lists.x.org>
> > Cc: Slava Grigorev <slava.grigorev@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
