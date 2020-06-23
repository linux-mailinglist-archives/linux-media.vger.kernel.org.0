Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC1D204F8E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 12:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732302AbgFWKvQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 06:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732288AbgFWKvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 06:51:16 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0908DC061795
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 03:51:16 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id k15so16108729otp.8
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QoCPlVuRfLdDkwTBRDRK73tEwxS3sN2fuJiGkn2CvdE=;
        b=gOKzF5Yl8kKYahi5zjnsTU+qXPPirvcXIt/7AkVJ+qdy+FWf0uU8V6HbpsO4r2juD7
         w2iP9eBLHtTmU+rweutvCfl7szvkDoX2LnG9M/YYCRnGryXBoohfc4iAuNKngf9sT2St
         1E0jtqC1MmLkv3KSwEE7j8DVPU+fk/IRWiczw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QoCPlVuRfLdDkwTBRDRK73tEwxS3sN2fuJiGkn2CvdE=;
        b=U1TcCdFv30PSq9BDS2m//pMCdvydne5eSTv5lAhkQZxBiCezUb0PpI3SJIb8jarIS2
         BwmNpf+qWi1uMerYB+F/VNc3GMYH49dSTRE9pWWH/M/UfyURtfF2UWpImX2i7+Jq/vCF
         XSD4725Ex3UJ+eWIGCEmQTD+0D991/UGiIXXgjqr8TU1rDm+YrTeIPevR/WfMM89URMA
         wstXRbGfwJZaZ4lcQJK4g2sUfTtjyOAawQwedtDZjX8JJ2q/H3r2ORXCMImjH+efwXeZ
         SsW+jsNUOgvYphQv8ylQg3a0RmHEG2FHSUopFkOoXpgJkhD3rlv12ynrmvVLAgADilpo
         oVnA==
X-Gm-Message-State: AOAM533Moif/wsmuk8WcPp8uCBm0Uoj/co3l7e7krCxVyYlzGBD2HpFv
        mV6glEVNpRDjDm8qi6Y0UUcpeTGki8OvHB9lg9bufl/Q
X-Google-Smtp-Source: ABdhPJwsXeafc7ngCrqn/R9dExkVr9aTpMWL7pHCp5L8XQ6N2/9uvR1ASQII2PdIi3/ADKwLAzkpagO1g50upZNnhdo=
X-Received: by 2002:a05:6830:54:: with SMTP id d20mr18786397otp.281.1592909475390;
 Tue, 23 Jun 2020 03:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch> <20200604081224.863494-9-daniel.vetter@ffwll.ch>
In-Reply-To: <20200604081224.863494-9-daniel.vetter@ffwll.ch>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 23 Jun 2020 12:51:04 +0200
Message-ID: <CAKMK7uHx+rFyjQOWL2r1fOo2EP3u_owMP2zfg3NnEkxUY4BhkA@mail.gmail.com>
Subject: Re: [PATCH 08/18] drm/amdgpu: add dma-fence annotations to atomic
 commit path
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        Roland Scheidegger <sroland@vmware.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Roland & vmwgfx maintainers,

Thomas has played around with these annotations on his vmwgfx setup,
and found some issues. Apparently in the atomic_commit_tail path when
handling the dirty rectangle stuff you acquire a ttm reservation,
which is a no-go since it could deadlock with other paths - atomic
commits can produce a dma_fence.

This patch here highlights that with the new annotations, and
apparently causes a lockdep splat if you go through the dirty rect
paths (not sure if it also happens otherwise, Thomas can fill you in
with the details).

Can you pls take a look at this? I'm happy to help out with analyzing
any lockdep splats. For actual fixes Thomas is better since I don't
understand a lot of how drm/vmwgfx works internally.

Cheers, Daniel


On Thu, Jun 4, 2020 at 10:12 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> I need a canary in a ttm-based atomic driver to make sure the
> dma_fence_begin/end_signalling annotations actually work.
>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-rdma@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bdba0bfd6df1..adabfa929f42 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -57,6 +57,7 @@
>
>  #include "ivsrcid/ivsrcid_vislands30.h"
>
> +#include <linux/module.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/version.h>
> @@ -7320,6 +7321,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm=
_atomic_state *state)
>         struct drm_connector_state *old_con_state, *new_con_state;
>         struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
>         int crtc_disable_count =3D 0;
> +       bool fence_cookie;
> +
> +       fence_cookie =3D dma_fence_begin_signalling();
>
>         drm_atomic_helper_update_legacy_modeset_state(dev, state);
>
> @@ -7600,6 +7604,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm=
_atomic_state *state)
>         /* Signal HW programming completion */
>         drm_atomic_helper_commit_hw_done(state);
>
> +       dma_fence_end_signalling(fence_cookie);
> +
>         if (wait_for_vblank)
>                 drm_atomic_helper_wait_for_flip_done(dev, state);
>
> --
> 2.26.2
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
