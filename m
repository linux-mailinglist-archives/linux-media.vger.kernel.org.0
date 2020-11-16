Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5F22B5148
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 20:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbgKPTgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 14:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbgKPTgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 14:36:21 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C45C0613CF;
        Mon, 16 Nov 2020 11:36:19 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id c9so396086wml.5;
        Mon, 16 Nov 2020 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jd4NYM09nIgiVAxjCFV+Ai4BIQhFfa+s3Pg4oNazxak=;
        b=CMWIMP7HUXJzq1+JtJzn9l3x3/CrNuPx77v46/Ed7ywYzt3NoaI1eqWV/WN8oPamWc
         J3dOmYoD/qBMPgXZov1nuN8GmZV1qZaNfBOuxmgi1IAZpDm61f12LQFDt5q8B6UM0b7l
         QjLjRvLakB8D74LobNOJxDLu2at+GI/VOffClcvjIVc8aGpTOFpWnZmXS3XaHR0o+AbK
         DOF2bPGV6P5C9vyTZKzcZdImYYDPK3w8qN8+g9GhxTizJ494golUxzC3a3MSP8EzrslI
         nqaHJ1uusiMSB+1na22w/WQVNL8wWyJtky3FKB3Xtj6zHmaihhsWolLQIp5N3oMisy0G
         gskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jd4NYM09nIgiVAxjCFV+Ai4BIQhFfa+s3Pg4oNazxak=;
        b=bFOHMEVUfiLryinFYJqH5uRWCjw0zDbl0A4F8sjWX/bZ+E+RkoOqK70braTyNE97cu
         rn3YW5JpJWSplk2qhG5Iqo+Fs8iPRGRhPv/WxEKAb1+ybxOwOcsNjj6LmSYl+s+/G6iy
         KS+QYt8f9l+BWzINC2jcL9pLZ8GXTUjhrV/xXdJetCt+NOjXIyqUYPbUak4r/iIZ8xok
         qwuq12j2VSbJ5upWJwZ57+oGBA3Q2j7/r1r+vKAYlBKljezolIqX2uKBw35xqdouCRKj
         TIW3w6u4FZr1m2jHhstSJnsdmSlMfbzuME1rajSXy5qgvD0LvuqO/tV+fyZypNdsnvtR
         pFwA==
X-Gm-Message-State: AOAM530ewCctT+cWK75iTAtukkrliiBzSdxyO7Isyw4/VlwOnvyTXojO
        t/mEbv/Eez2DyTiD28+XOWW0uwtJe5kdFLsUTOg=
X-Google-Smtp-Source: ABdhPJwwedHpQP8TC22Plw3AmPLyM53Oqs5C6ao4BlprKxqBsMtvBBZFpha3W4NY0cIvWVuoBd1EO7VcpHjzLZyJmaQ=
X-Received: by 2002:a7b:c015:: with SMTP id c21mr468641wmb.79.1605555378107;
 Mon, 16 Nov 2020 11:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org> <20201116173005.1825880-6-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-6-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 14:36:07 -0500
Message-ID: <CADnq5_N0FVXjao6W+kNQJAMmL2ARt1Qw2A6726=Vh2jN_ms8jA@mail.gmail.com>
Subject: Re: [PATCH 05/43] drm/radeon: Move radeon_ttm{init, fini} to shared location
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
>  drivers/gpu/drm/radeon/radeon_ttm.c: At top level:
>  drivers/gpu/drm/radeon/radeon_ttm.c:817:5: warning: no previous prototyp=
e for =E2=80=98radeon_ttm_init=E2=80=99 [-Wmissing-prototypes]
>  817 | int radeon_ttm_init(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~~~~
>  drivers/gpu/drm/radeon/radeon_ttm.c:878:6: warning: no previous prototyp=
e for =E2=80=98radeon_ttm_fini=E2=80=99 [-Wmissing-prototypes]
>  878 | void radeon_ttm_fini(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~~~~
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
>  drivers/gpu/drm/radeon/radeon_object.c |  3 +--
>  drivers/gpu/drm/radeon/radeon_ttm.c    |  1 +
>  drivers/gpu/drm/radeon/radeon_ttm.h    | 36 ++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/radeon/radeon_ttm.h
>
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/rad=
eon/radeon_object.c
> index ab81e35cb0606..8bc5ad1d65857 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -40,9 +40,8 @@
>
>  #include "radeon.h"
>  #include "radeon_trace.h"
> +#include "radeon_ttm.h"
>
> -int radeon_ttm_init(struct radeon_device *rdev);
> -void radeon_ttm_fini(struct radeon_device *rdev);
>  static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
>
>  /*
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 2939e71ceb700..28b300ed200ea 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -51,6 +51,7 @@
>
>  #include "radeon_reg.h"
>  #include "radeon.h"
> +#include "radeon_ttm.h"
>
>  static int radeon_ttm_debugfs_init(struct radeon_device *rdev);
>  static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.h b/drivers/gpu/drm/radeon=
/radeon_ttm.h
> new file mode 100644
> index 0000000000000..91ea7141bc812
> --- /dev/null
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.h
> @@ -0,0 +1,36 @@
> +/* radeon_ttm.h -- Private header for radeon driver -*- linux-c -*-
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
> +#ifndef __RADEON_TTM_H__
> +#define __RADEON_TTM_H__
> +
> +struct radeon_device;
> +
> +int radeon_ttm_init(struct radeon_device *rdev);
> +void radeon_ttm_fini(struct radeon_device *rdev);
> +
> +#endif                         /* __RADEON_TTM_H__ */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
