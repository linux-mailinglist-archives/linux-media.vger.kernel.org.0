Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CAB2B1687
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 08:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgKMHgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 02:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgKMHgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 02:36:38 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81868C0613D1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 23:36:38 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 23so8590546wrc.8
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 23:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=h75klXVcmCdUqgkQ6FTqe7WDEW7XWDLja/aoiNvLvvA=;
        b=XDxXhtqca6DKFfUR/ZqKAryL+7RB5T3U/piwok/uUO3i3lEYq4wahqq/CgTckFwbE0
         FqJSLb8ZyaiBHndwkwq6XHm+N3LK+rUqrEJwx4IzlQTIwbxydg2FALf7l5Mggdjtmqtg
         ePDME5k8cZ8ZW0jRK5ouCvXJCFJdPd9PITB/sktY4lGOOT1CjAdJScXi1RGXFGZCPH0r
         db83Y+jXtz4qUR+a7MQ05mw6+zspknlWKwjptHvjKijBAiKzRjlAS2us2eX59ChzpXs0
         h22ELXdErcpdwy7AZ/jDGzAmeQN4/AB0lht7cm5HXnruSocnymj1Y9hz+Yyy/WVH3UCJ
         Fr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=h75klXVcmCdUqgkQ6FTqe7WDEW7XWDLja/aoiNvLvvA=;
        b=oS/CRAXA/E3yfbC5JY6OxgoHj4WpEJS2EyEvJcaEgebSsklaMskp5udTqUfxrGh9Qc
         V36rJg2gTVxf4d3qtHrSl51PVWnMaSTcFTKvjmDeAZG89OMGsZ8j5AjHxH4bAGTOxVaR
         yg+LYBKtpJpI1WXSs8NcHFxBg+bQMxFDGkaIm28im7cecwKxbmMz+x+8OuP6RgDh7KZt
         ypoPtSKSvOZ5dsePidxX0XFS0wPCrsjJDZtUbo6+G3PIIR/bIW9tBXdBeSKVFn91YpnS
         LTYCROTQ6lTnske/NTzV+bMculmMKoQXsCDhKwZbaClh00+CiuQSRwc4dH5EOjA4Fr4o
         +Lpg==
X-Gm-Message-State: AOAM531e/usEI1hRYk5CnZmQ8mvlzgrY2fPrZOv4DV/BvtrGnGZVCnd2
        HN22axQGdCXUibE9kNVBWbaFYw==
X-Google-Smtp-Source: ABdhPJwj2l3oAnuo6QHrM5Iat4Yv7D1oYYIfgkBuiyIm2+e/H9IEYWvHD5BWIHM/ICwOyeusyGOvlQ==
X-Received: by 2002:adf:dc4c:: with SMTP id m12mr1662187wrj.177.1605252997162;
        Thu, 12 Nov 2020 23:36:37 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id q2sm9826724wru.76.2020.11.12.23.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:36:36 -0800 (PST)
Date:   Fri, 13 Nov 2020 07:36:34 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Andy Gross <andy.gross@ti.com>,
        by <jhartmann@precisioninsight.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Eric Anholt <eric@anholt.net>,
        Faith <faith@valinux.com>, Gareth Hughes <gareth@valinux.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Jeff Hartmann <jhartmann@valinux.com>,
        Keith Whitwell <keith@tungstengraphics.com>,
        Leo Li <sunpeng.li@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>, Rob Clark <rob@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201113073634.GG2787115@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201113071932.GF2787115@dell>
 <CADnq5_NnKoOMQCQm0fJnER7mOGgYPvudfbbFOZkPC5Kg6Lp0XA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NnKoOMQCQm0fJnER7mOGgYPvudfbbFOZkPC5Kg6Lp0XA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Nov 2020, Alex Deucher wrote:

> On Fri, Nov 13, 2020 at 2:19 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Fri, 06 Nov 2020, Lee Jones wrote:
> >
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > >
> > > There are 5000 warnings to work through.  It will take a couple more
> > > sets.  Although, ("drm/amd/display/dc/basics/fixpt31_32: Move
> > > variables to where they're used") does take care of 2000 of them!
> > >
> > > Lee Jones (19):
> > >   drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
> > >   drm/r128/ati_pcigart: Source file headers are not good candidates for
> > >     kernel-doc
> > >   drm/selftests/test-drm_dp_mst_helper: Move
> > >     'sideband_msg_req_encode_decode' onto the heap
> > >   drm/mga/mga_dma: Demote kernel-doc abusers to standard comment blocks
> > >   drm/mga/mga_state: Remove unused variable 'buf_priv'
> > >   drm/radeon/atom: Move prototype into shared location
> > >   drm/radeon/radeon_kms: Include header containing our own prototypes
> > >   drm/omapdrm/omap_gem: Fix misnamed and missing parameter descriptions
> > >   drm/omapdrm/omap_dmm_tiler: Demote abusive use of kernel-doc format
> > >   drm/radeon/radeon: Move prototype into shared header
> > >   drm/radeon/radeon_drv: Source file headers are not good candidates for
> > >     kernel-doc
> > >   drm/amd/display/dc/basics/fixpt31_32: Move variables to where they're
> > >     used
> > >   drm/radeon/radeon_drv: Move prototypes to a shared headerfile
> > >   drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr'
> > >     params
> > >   drm/radeon: Move prototypes to shared header
> > >   drm/amd/amdgpu/amdgpu_kms: Remove 'struct drm_amdgpu_info_device
> > >     dev_info' from the stack
> > >   drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev param
> > >   drm/radeon/atombios_crtc: Remove description of non-existent function
> > >     param 'encoder'
> > >   drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'
> > >
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 104 +++++++++---------
> > >  .../drm/amd/display/dc/basics/fixpt31_32.c    |   5 +
> > >  .../gpu/drm/amd/display/include/fixed31_32.h  |   6 -
> > >  drivers/gpu/drm/mga/mga_dma.c                 |  10 +-
> > >  drivers/gpu/drm/mga/mga_state.c               |   2 -
> > >  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c      |   6 +-
> > >  drivers/gpu/drm/omapdrm/omap_gem.c            |   3 +-
> > >  drivers/gpu/drm/r128/ati_pcigart.c            |   2 +-
> > >  drivers/gpu/drm/radeon/atom.h                 |   6 +
> > >  drivers/gpu/drm/radeon/atombios_crtc.c        |   1 -
> > >  drivers/gpu/drm/radeon/atombios_encoders.c    |   4 -
> > >  drivers/gpu/drm/radeon/radeon.h               |   6 +
> > >  drivers/gpu/drm/radeon/radeon_device.c        |   1 +
> > >  drivers/gpu/drm/radeon/radeon_device.h        |  32 ++++++
> > >  drivers/gpu/drm/radeon/radeon_display.c       |   4 -
> > >  drivers/gpu/drm/radeon/radeon_drv.c           |  11 +-
> > >  drivers/gpu/drm/radeon/radeon_drv.h           |   7 ++
> > >  drivers/gpu/drm/radeon/radeon_kms.c           |   3 +-
> > >  .../drm/selftests/test-drm_dp_mst_helper.c    |  11 +-
> > >  drivers/gpu/drm/ttm/ttm_range_manager.c       |   2 +-
> > >  drivers/gpu/drm/v3d/v3d_drv.c                 |  36 ------
> > >  22 files changed, 138 insertions(+), 126 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/radeon/radeon_device.h
> >
> > Still no Radeon patches in today's -next.
> >
> > I really wanted to have had this set rebased by now.
> >
> > How long do they take to peculate through?
> 
> Usually a day or two, but I was swamped the last couple of days. I
> pushed an updated -next branch today:
> https://cgit.freedesktop.org/~agd5f/linux/log/?h=drm-next

Ah, wonderful.

I'll rebase all of the sets on Monday and see what we're left with.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
