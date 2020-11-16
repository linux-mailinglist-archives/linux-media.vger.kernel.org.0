Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588782B522F
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 21:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731985AbgKPUOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 15:14:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731956AbgKPUOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 15:14:09 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD39C0613CF;
        Mon, 16 Nov 2020 12:14:09 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id b6so20213594wrt.4;
        Mon, 16 Nov 2020 12:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tlFFgICp87GKZs6ppYHW2rMrLGlJH6xaYF8VswIu2r8=;
        b=WT0sw49xTmzfyuepsj8KVXsdlk1NQkHaKlUQDvqqCND8FHQvwhpnn5uYP+2zZFQqwM
         KNWPU3FwKRP61VymQxCJZHLZV0dAJ45Cps+OhCDc0YK+sXtLuue6vP7BpskUJX7ZUJ57
         qL0/dBLUyqYtQGcva88qLlsGCsI/FuxjDlaUSGLArXtDdLZLUZOBRv2vzC6grY8K6OMs
         wFTCh0+FP/0N8Qt8QntAZM8DbbxAZMinOAJwQN7fck93Z4Nht3bFmEmOoWlJuZ+59Kjd
         6K7gXi2b1wLdOin94HV94OP7+jPb7hOVzRao03uMhSd5WCv9In1zGKphSqfKSpBoH0E/
         kwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tlFFgICp87GKZs6ppYHW2rMrLGlJH6xaYF8VswIu2r8=;
        b=iYb8IYbbgVAJdkBGPOecPItE+HUs2xgqOcK3Od0n8Kbs5BMKXxVLPuIN3ux1zJikFF
         hZSmfO4ek7WFISa0f1R9kHEiCMAYJDepiGwBxNmY0CJuaB8Y3RODq2ZqGup1GIMJQZmT
         W+M9pHsHgLjOh+bh3a+8JLMagl/MGQvtdcXkLwf88aOin5muJx60veaDqQPXTKsUGA3X
         1DS/T+B91stO3qtohl5Rb3vJQCZgNZuBV0LXkpTrpv+Ad8+p5b9YjirtVqcSbxdXB0ww
         itK4ATfRIDDrO4aEcHRBVCWf2tJKEAJBYx0H6cLjFtw/2AhaUUMJvoyw8hHQC5wYQsnh
         a4WQ==
X-Gm-Message-State: AOAM530WWbTHi+2LEI0q5IPqlyxMmxbiOe50XtySgMIW/OP2JIJQLQOg
        bu2NjslPsKrrz2IAJqlfVfXwZ0gmFnsG+wARDDg=
X-Google-Smtp-Source: ABdhPJyhVjBfB4XwW22p2f67Xq+c+n49ESvD/mLBvHttBW5MOL3/bbo6s1Z+aAzlKoUDvKA9FP/lfmG14QOnR/KpvmY=
X-Received: by 2002:adf:9144:: with SMTP id j62mr4516760wrj.419.1605557647980;
 Mon, 16 Nov 2020 12:14:07 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org> <20201116173700.1830487-22-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-22-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 15:13:56 -0500
Message-ID: <CADnq5_MosQTaddZ7-ydRiGjPZ6FZ26F_WXgwV7MN5wmaqdEm0w@mail.gmail.com>
Subject: Re: [PATCH 21/43] drm/radeon/r600_dma: Move 'r600_gpu_check_soft_reset()'s
 prototype to shared location
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

On Mon, Nov 16, 2020 at 12:38 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/r600.c:1615:5: warning: no previous prototype for=
 =E2=80=98r600_gpu_check_soft_reset=E2=80=99 [-Wmissing-prototypes]
>  1615 | u32 r600_gpu_check_soft_reset(struct radeon_device *rdev)
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

Applied with minor changes.  Thanks!

Alex


> ---
>  drivers/gpu/drm/radeon/r600.c     |  1 +
>  drivers/gpu/drm/radeon/r600.h     | 35 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/radeon/r600_dma.c |  3 +--
>  3 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/radeon/r600.h
>
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.=
c
> index f09b6dc5cbeb3..94e8815e5067d 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -39,6 +39,7 @@
>
>  #include "atom.h"
>  #include "avivod.h"
> +#include "r600.h"
>  #include "r600d.h"
>  #include "rv770.h"
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/r600.h b/drivers/gpu/drm/radeon/r600.=
h
> new file mode 100644
> index 0000000000000..2a3915f0039e4
> --- /dev/null
> +++ b/drivers/gpu/drm/radeon/r600.h
> @@ -0,0 +1,35 @@
> +/* r600.h -- Private header for radeon driver -*- linux-c -*-
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
> +#ifndef __R600_H__
> +#define __R600_H__
> +
> +struct radeon_device;
> +
> +u32 r600_gpu_check_soft_reset(struct radeon_device *rdev);
> +
> +#endif                         /* __R600_H__ */
> diff --git a/drivers/gpu/drm/radeon/r600_dma.c b/drivers/gpu/drm/radeon/r=
600_dma.c
> index af6c0da45f28a..89ca2738c5d4c 100644
> --- a/drivers/gpu/drm/radeon/r600_dma.c
> +++ b/drivers/gpu/drm/radeon/r600_dma.c
> @@ -24,10 +24,9 @@
>
>  #include "radeon.h"
>  #include "radeon_asic.h"
> +#include "r600.h"
>  #include "r600d.h"
>
> -u32 r600_gpu_check_soft_reset(struct radeon_device *rdev);
> -
>  /*
>   * DMA
>   * Starting with R600, the GPU has an asynchronous
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
