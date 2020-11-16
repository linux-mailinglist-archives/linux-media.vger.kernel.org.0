Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBDF2B5130
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 20:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgKPTbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 14:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgKPTbQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 14:31:16 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C47C0613CF;
        Mon, 16 Nov 2020 11:31:16 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id c17so20013412wrc.11;
        Mon, 16 Nov 2020 11:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Gy+aFlZ+UlqhCXFPvBz8U6FZZuIx3dpLmw8zSmXA8bs=;
        b=tktXMXSoQe00hopXFLEAQLRQeP9k+E/HKScf31HK6V6K/kUIQdXwkXtEbrAtZfqrOY
         sCl6o3Y9g609bJ/iEVV9jV298vQSKRLohPxf8C7vhfvbqiPxp+aAIk2ZcnvFzCYpAvHs
         iDO5D7Y1+vGVfu3W3BZatYGxDccjxYFlehNmo/VmlVmfK4JhyhyU8xWGNTB5cLzYyZYL
         Jp8CaE4G2BF2vB1Fl8yzfItBiXXzgFv7zzav1bqo4q0tSoacJ1ODIaBRWXiPoEpqv+fg
         Zo4OAPe46RgY3MRPfhVLnAFve4xxo7EjDOH4y3SsHMrhvITUAANpZ5y+8TYiuoqcrE4U
         o4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gy+aFlZ+UlqhCXFPvBz8U6FZZuIx3dpLmw8zSmXA8bs=;
        b=nWz9hkOhwa32kx83LENkFv+DtYxl0xsuOGxa7kJOxI9B8xMIseXsJ0xPMYfFeipBZp
         tBBi7acLVqiHyZbAMTgBXLZjkmKmwWS8PF8IlLgMlbRPgfvtFBNzE2NH4qipU+3VB1nG
         TDZIBYPhKfKmclUo+u/YQwCM7y/44dAYb7W5KmGWArJEhDCv1yHevCotNMfNbR3lA5/r
         SLhsHRu5ytS42BuH+0uC2Qve4b7ZBa4q0uGF6nNbXaaX7aoz9cpkVAkkI+TDeqKsPxNT
         K1J1r/1WsihN8YD3CMo8lip0cvP9uWQwBx/H4GSThsvSqHt2bFTRJvMr+c62sG8YZap/
         18Lw==
X-Gm-Message-State: AOAM533yaBCj+fpTE5IWkbtF5JweFV5N8VbnsyEAxTiAYMwEVrsgqlm4
        E+Xqmyvs4+QBk7icb4rrz00ML6L0iEGt9byUy5A=
X-Google-Smtp-Source: ABdhPJwP4kLb4gC4O9SvAVF/pYgU8WFFbMp3YumXDAJEWsu61ncuO3AZp3wNmBHUvb08R/hhAkRtZHxAg4t/T5B1He0=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr22164333wrn.124.1605555074945;
 Mon, 16 Nov 2020 11:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org> <20201116173005.1825880-4-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-4-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 14:31:03 -0500
Message-ID: <CADnq5_PDG_b4dtcPP-8_YM8wC9FQ6=owJFWn7DeRJmcETaLfFg@mail.gmail.com>
Subject: Re: [PATCH 03/43] drm/radeon/radeon_kms: Move 'radeon_*_kms'
 prototypes to shared header
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 12:30 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/radeon_kms.c:756:5: warning: no previous prototyp=
e for =E2=80=98radeon_get_vblank_counter_kms=E2=80=99 [-Wmissing-prototypes=
]
>  756 | u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  drivers/gpu/drm/radeon/radeon_kms.c:826:5: warning: no previous prototyp=
e for =E2=80=98radeon_enable_vblank_kms=E2=80=99 [-Wmissing-prototypes]
>  826 | int radeon_enable_vblank_kms(struct drm_crtc *crtc)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~
>  drivers/gpu/drm/radeon/radeon_kms.c:853:6: warning: no previous prototyp=
e for =E2=80=98radeon_disable_vblank_kms=E2=80=99 [-Wmissing-prototypes]
>  853 | void radeon_disable_vblank_kms(struct drm_crtc *crtc)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_display.c |  1 +
>  drivers/gpu/drm/radeon/radeon_kms.c     |  1 +
>  drivers/gpu/drm/radeon/radeon_kms.h     | 35 +++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 drivers/gpu/drm/radeon/radeon_kms.h
>
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/ra=
deon/radeon_display.c
> index eb0d4cb95f0a6..3a6fedad002d7 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -44,6 +44,7 @@
>
>  #include "atom.h"
>  #include "radeon.h"
> +#include "radeon_kms.h"
>
>  static void avivo_crtc_load_lut(struct drm_crtc *crtc)
>  {
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon=
/radeon_kms.c
> index 3d31c04e4b3db..001940bca90a6 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -41,6 +41,7 @@
>  #include "radeon.h"
>  #include "radeon_asic.h"
>  #include "radeon_drv.h"
> +#include "radeon_kms.h"
>
>  #if defined(CONFIG_VGA_SWITCHEROO)
>  bool radeon_has_atpx(void);
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.h b/drivers/gpu/drm/radeon=
/radeon_kms.h
> new file mode 100644
> index 0000000000000..36e73cea92154
> --- /dev/null
> +++ b/drivers/gpu/drm/radeon/radeon_kms.h
> @@ -0,0 +1,35 @@
> +/* radeon_kms.h -- Private header for radeon driver -*- linux-c -*-
> + *
> + * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
> + * Copyright 2000 VA Linux Systems, Inc., Fremont, California.
> + * All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR=
 OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __RADEON_KMS_H__
> +#define __RADEON_KMS_H__
> +
> +u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
> +int radeon_enable_vblank_kms(struct drm_crtc *crtc);
> +void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> +
> +#endif                         /* __RADEON_KMS_H__ */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
