Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3042AA615
	for <lists+linux-media@lfdr.de>; Sat,  7 Nov 2020 16:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgKGPHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Nov 2020 10:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgKGPHO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Nov 2020 10:07:14 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849A1C0613CF
        for <linux-media@vger.kernel.org>; Sat,  7 Nov 2020 07:07:14 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p22so4170001wmg.3
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2020 07:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cLF2BfyjeGN3iJU0oaMXvVmMSlcoqcilafci6j43Wek=;
        b=kE7Db+rEae6rIGK79T5xPZMkKFt7dhWg6i6zCjBEOlowiXCxsWYabKqNJIuqPVMmNS
         S22XTL3krgeVZp0pS8ktxH73T77De0zH/VFSPs9Wj8JR5Td2QD9dWFdX+4r8g0l3ekqT
         +DTstkYEfC3S4n+y6nKlvo2zDAAoFkhGYsgZguoR5lDO+DkOO4o0STctIAQvcm4pqQM3
         ts6N4mZQhhvqtLUpRIKnlgLTQ1ptiZFVAQjJaV2gAnaUs6IvlunTi0trqFVsK+lEYvmT
         QQhRNfzOEjvOHkNkzpeI3PrYREQCc961cK8mW1PvdDRDpfUTKC2mJ5gwtNV5UbqN2wNC
         4vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cLF2BfyjeGN3iJU0oaMXvVmMSlcoqcilafci6j43Wek=;
        b=rp3/te2p0DxwxTT4COzuh6dnAFuhCR6fn9tsbe3pAGsi9s2Ws1W6PidGfkEi+p07Fk
         YvL3GyzfrRmlzkacJBJn/JtZL6N3tW2bBMHh8rcOqwfVufqhH43d0CbXkf2q7em4qUb4
         7YclnIQWGy8cc/e/+RFxmooNab9pbajeCUrW52EyI+r33B7MDTDoouk1TjO9RJwR3k5z
         hwfEYpBW+B1B1bkr7dezd9Jl/FdqksZw7nZ0cn+2bTBzEE1t9IyzBvfoKFGLTnxGFEB/
         yNHfJuodJo28NoHrlr2suYmclOhKcefKzfGqilaxQw5Plf1xzG4AmjOHDFv/PaGDRiZC
         PhVQ==
X-Gm-Message-State: AOAM5319KDNsvmlyJfSMvGfXB9kLvaJzLyMlPONXjaCK1rkfyHoE60SR
        9neUoI8kGGNrSBffKkl9bjIfwA==
X-Google-Smtp-Source: ABdhPJzPDVIEXN1qjx3/ckNqpMTNKAJvwwwbRtp4FCrcpbVSCbKW0szdkj957LjvR3zUEjIX+h4gKA==
X-Received: by 2002:a1c:3b87:: with SMTP id i129mr5425025wma.134.1604761633150;
        Sat, 07 Nov 2020 07:07:13 -0800 (PST)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id v189sm7243406wmg.14.2020.11.07.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 07:07:12 -0800 (PST)
Date:   Sat, 7 Nov 2020 15:07:10 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andy Gross <andy.gross@ti.com>,
        by <jhartmann@precisioninsight.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Faith <faith@valinux.com>, Gareth Hughes <gareth@valinux.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Jeff Hartmann <jhartmann@valinux.com>,
        Keith Whitwell <keith@tungstengraphics.com>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <rob.clark@linaro.org>, Rob Clark <rob@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201107150710.GP2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <9d4be6a4-4f39-b908-4086-2b6adb695465@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d4be6a4-4f39-b908-4086-2b6adb695465@amd.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 07 Nov 2020, Christian König wrote:

> Well that's quite a patch set.
> 
> First of all can you separate this a bit more by driver? I'm assuming we
> maintainers are supposed to pick that up and apply it.

I'm not sure what would achieve?  It's not a pull-request.

Either way, patches should be applied individually.

> radeon and amdgpu can stick together since that is mostly Alex and me, but
> I'm not sure if we want to do some of the suggested changes to radeon.

That's fine.  Just review, providing your reasons as to why they are
not suitable and we'll work through the issues together, patch by
patch.

> Going to pick up the single TTM change for upstreaming.

Thanks.

> Am 06.11.20 um 22:49 schrieb Lee Jones:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > There are 5000 warnings to work through.  It will take a couple more
> > sets.  Although, ("drm/amd/display/dc/basics/fixpt31_32: Move
> > variables to where they're used") does take care of 2000 of them!
> > 
> > Lee Jones (19):
> >    drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
> >    drm/r128/ati_pcigart: Source file headers are not good candidates for
> >      kernel-doc
> >    drm/selftests/test-drm_dp_mst_helper: Move
> >      'sideband_msg_req_encode_decode' onto the heap
> >    drm/mga/mga_dma: Demote kernel-doc abusers to standard comment blocks
> >    drm/mga/mga_state: Remove unused variable 'buf_priv'
> >    drm/radeon/atom: Move prototype into shared location
> >    drm/radeon/radeon_kms: Include header containing our own prototypes
> >    drm/omapdrm/omap_gem: Fix misnamed and missing parameter descriptions
> >    drm/omapdrm/omap_dmm_tiler: Demote abusive use of kernel-doc format
> >    drm/radeon/radeon: Move prototype into shared header
> >    drm/radeon/radeon_drv: Source file headers are not good candidates for
> >      kernel-doc
> >    drm/amd/display/dc/basics/fixpt31_32: Move variables to where they're
> >      used
> >    drm/radeon/radeon_drv: Move prototypes to a shared headerfile
> >    drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr'
> >      params
> >    drm/radeon: Move prototypes to shared header
> >    drm/amd/amdgpu/amdgpu_kms: Remove 'struct drm_amdgpu_info_device
> >      dev_info' from the stack
> >    drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev param
> >    drm/radeon/atombios_crtc: Remove description of non-existent function
> >      param 'encoder'
> >    drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'
> > 
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 104 +++++++++---------
> >   .../drm/amd/display/dc/basics/fixpt31_32.c    |   5 +
> >   .../gpu/drm/amd/display/include/fixed31_32.h  |   6 -
> >   drivers/gpu/drm/mga/mga_dma.c                 |  10 +-
> >   drivers/gpu/drm/mga/mga_state.c               |   2 -
> >   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c      |   6 +-
> >   drivers/gpu/drm/omapdrm/omap_gem.c            |   3 +-
> >   drivers/gpu/drm/r128/ati_pcigart.c            |   2 +-
> >   drivers/gpu/drm/radeon/atom.h                 |   6 +
> >   drivers/gpu/drm/radeon/atombios_crtc.c        |   1 -
> >   drivers/gpu/drm/radeon/atombios_encoders.c    |   4 -
> >   drivers/gpu/drm/radeon/radeon.h               |   6 +
> >   drivers/gpu/drm/radeon/radeon_device.c        |   1 +
> >   drivers/gpu/drm/radeon/radeon_device.h        |  32 ++++++
> >   drivers/gpu/drm/radeon/radeon_display.c       |   4 -
> >   drivers/gpu/drm/radeon/radeon_drv.c           |  11 +-
> >   drivers/gpu/drm/radeon/radeon_drv.h           |   7 ++
> >   drivers/gpu/drm/radeon/radeon_kms.c           |   3 +-
> >   .../drm/selftests/test-drm_dp_mst_helper.c    |  11 +-
> >   drivers/gpu/drm/ttm/ttm_range_manager.c       |   2 +-
> >   drivers/gpu/drm/v3d/v3d_drv.c                 |  36 ------
> >   22 files changed, 138 insertions(+), 126 deletions(-)
> >   create mode 100644 drivers/gpu/drm/radeon/radeon_device.h
> > 
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: Andy Gross <andy.gross@ti.com>
> > Cc: by <jhartmann@precisioninsight.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Faith <faith@valinux.com>
> > Cc: Gareth Hughes <gareth@valinux.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: Jeff Hartmann <jhartmann@valinux.com>
> > Cc: Keith Whitwell <keith@tungstengraphics.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-media@vger.kernel.org
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Rob Clark <rob.clark@linaro.org>
> > Cc: Rob Clark <rob@ti.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
