Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442292B1670
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 08:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgKMH2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 02:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgKMH2h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 02:28:37 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15ADEC0613D1;
        Thu, 12 Nov 2020 23:28:37 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id b6so8599979wrt.4;
        Thu, 12 Nov 2020 23:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hVPwHWAZj6up5C0m49QwQFFtiDPClN6OW9TEFDvJOqE=;
        b=XhCXQgh0t2uqfEZaZtU2KTOiB5sGzCX6pkINJ+axvhAajcURoGCQ08OptWg5SQO6hZ
         mKx1iG4cyqkqE+GnmIQhNugvOlrQNSAk5LlJwJvczGUkJHNMfT3NLcfXZYOo0coXOLhe
         lyBZ5PIFFP0bgI9QPCyviCQ+DTySx27SH54HWU2ipInRCEf/V8uRL1YAsaaQPU4GreK0
         esaslZdEoy/nvznghOFV+eePMIEW7uCr+v6LlCt4SbVZvra3h3wuVAanSgju2L+CgNuL
         zN14O4mHHxqIXbQRNpNsTaG8//T7wQOkTae74e4t+fWOMLWwwUWhYnmoJfCXYK3s7uX0
         hqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hVPwHWAZj6up5C0m49QwQFFtiDPClN6OW9TEFDvJOqE=;
        b=C2j/741u1z/wDx5wjYeNeXbmd/W2AybQKECk3oQrZaOT78rk4xzoLs5xjwZwMlf3Bn
         j0PjtSNonlvoH7aWUhtZOcl+FSTxww55C9C/1tyvT3nggDn/mqXRUpar1tTrwfvwqx4M
         I9xO+Y/4HdmOaVPbcrMDxJNTVBOVWcSpDdNmk8A8ExFg0sI8aYQvW3t6xyQnhiBDOjnq
         QX6i+z8q8q7B2LNXOuLvsdhZ7rWQoghPqKcH5JZx+fuZhPDyOI9TfQ54DMcytqOJrkN7
         pjGJN2jiJfXOa2+RdfIz87m2wL0gto5VNq1QKBMCCIcwkehbwanqGWzgeUd9oYYfJe7q
         arkA==
X-Gm-Message-State: AOAM530ySVCTCeb+wb7C8NUM4rS4VfRN8plwGJvvdjiJobe5eHtjRV19
        pXc3kDsAaFvTw6tXShlVITFxeO/TmtxT9GlsbxE=
X-Google-Smtp-Source: ABdhPJwgRv2GXLjMRaooE4zHeMJQnlQeGDQsbGhM5gdUluImaGH8IGbQ4ATMSTmlmwEE+Po8PcAAa18Z2KqjbwbKS70=
X-Received: by 2002:adf:8028:: with SMTP id 37mr1554406wrk.111.1605252515878;
 Thu, 12 Nov 2020 23:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org> <20201113071932.GF2787115@dell>
In-Reply-To: <20201113071932.GF2787115@dell>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 02:28:24 -0500
Message-ID: <CADnq5_NnKoOMQCQm0fJnER7mOGgYPvudfbbFOZkPC5Kg6Lp0XA@mail.gmail.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
To:     Lee Jones <lee.jones@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 13, 2020 at 2:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 06 Nov 2020, Lee Jones wrote:
>
> > This set is part of a larger effort attempting to clean-up W=3D1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> >
> > There are 5000 warnings to work through.  It will take a couple more
> > sets.  Although, ("drm/amd/display/dc/basics/fixpt31_32: Move
> > variables to where they're used") does take care of 2000 of them!
> >
> > Lee Jones (19):
> >   drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
> >   drm/r128/ati_pcigart: Source file headers are not good candidates for
> >     kernel-doc
> >   drm/selftests/test-drm_dp_mst_helper: Move
> >     'sideband_msg_req_encode_decode' onto the heap
> >   drm/mga/mga_dma: Demote kernel-doc abusers to standard comment blocks
> >   drm/mga/mga_state: Remove unused variable 'buf_priv'
> >   drm/radeon/atom: Move prototype into shared location
> >   drm/radeon/radeon_kms: Include header containing our own prototypes
> >   drm/omapdrm/omap_gem: Fix misnamed and missing parameter descriptions
> >   drm/omapdrm/omap_dmm_tiler: Demote abusive use of kernel-doc format
> >   drm/radeon/radeon: Move prototype into shared header
> >   drm/radeon/radeon_drv: Source file headers are not good candidates fo=
r
> >     kernel-doc
> >   drm/amd/display/dc/basics/fixpt31_32: Move variables to where they're
> >     used
> >   drm/radeon/radeon_drv: Move prototypes to a shared headerfile
> >   drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr'
> >     params
> >   drm/radeon: Move prototypes to shared header
> >   drm/amd/amdgpu/amdgpu_kms: Remove 'struct drm_amdgpu_info_device
> >     dev_info' from the stack
> >   drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev para=
m
> >   drm/radeon/atombios_crtc: Remove description of non-existent function
> >     param 'encoder'
> >   drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 104 +++++++++---------
> >  .../drm/amd/display/dc/basics/fixpt31_32.c    |   5 +
> >  .../gpu/drm/amd/display/include/fixed31_32.h  |   6 -
> >  drivers/gpu/drm/mga/mga_dma.c                 |  10 +-
> >  drivers/gpu/drm/mga/mga_state.c               |   2 -
> >  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c      |   6 +-
> >  drivers/gpu/drm/omapdrm/omap_gem.c            |   3 +-
> >  drivers/gpu/drm/r128/ati_pcigart.c            |   2 +-
> >  drivers/gpu/drm/radeon/atom.h                 |   6 +
> >  drivers/gpu/drm/radeon/atombios_crtc.c        |   1 -
> >  drivers/gpu/drm/radeon/atombios_encoders.c    |   4 -
> >  drivers/gpu/drm/radeon/radeon.h               |   6 +
> >  drivers/gpu/drm/radeon/radeon_device.c        |   1 +
> >  drivers/gpu/drm/radeon/radeon_device.h        |  32 ++++++
> >  drivers/gpu/drm/radeon/radeon_display.c       |   4 -
> >  drivers/gpu/drm/radeon/radeon_drv.c           |  11 +-
> >  drivers/gpu/drm/radeon/radeon_drv.h           |   7 ++
> >  drivers/gpu/drm/radeon/radeon_kms.c           |   3 +-
> >  .../drm/selftests/test-drm_dp_mst_helper.c    |  11 +-
> >  drivers/gpu/drm/ttm/ttm_range_manager.c       |   2 +-
> >  drivers/gpu/drm/v3d/v3d_drv.c                 |  36 ------
> >  22 files changed, 138 insertions(+), 126 deletions(-)
> >  create mode 100644 drivers/gpu/drm/radeon/radeon_device.h
>
> Still no Radeon patches in today's -next.
>
> I really wanted to have had this set rebased by now.
>
> How long do they take to peculate through?

Usually a day or two, but I was swamped the last couple of days. I
pushed an updated -next branch today:
https://cgit.freedesktop.org/~agd5f/linux/log/?h=3Ddrm-next

Alex

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
