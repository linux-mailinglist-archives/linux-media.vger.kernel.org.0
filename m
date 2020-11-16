Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B0B2B514A
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 20:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgKPThY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 14:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729983AbgKPThW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 14:37:22 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9CEC0613CF;
        Mon, 16 Nov 2020 11:37:22 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p8so20077013wrx.5;
        Mon, 16 Nov 2020 11:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FktysoifawADvA/RDMcAKN2Ahr/6b++WM0C+fv50nl8=;
        b=UJUw3oogklG90as0IJ4pIER1IWgf43agnd0Ux2/wK0mgHtCilgx+O/gf5K5BaSlDC6
         TWoqaNHmk7fQLKfnXVIP5lVYaaMyZUnJ77HZvOMa2sf6kBW+aDFu56NFGriMojDMILFo
         AIbISRSoFuTyObe8/uepifiqmFm5MX4roLRiKC3tDCx5d+KewOwbCoTc0pDL5zAivkpT
         /ODjla8hrc25SVXMfsDPowlRaBdrd5NSloN4LsfmR2lVI4IZ1ySk66yggRRObD9oz41P
         /SjCcStBMJ7MVzwMBhhs4Y5Hp3ZT05KUDGafE8AYz1sIRFiyJKe10WEdxRIiHQLlFs0w
         xcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FktysoifawADvA/RDMcAKN2Ahr/6b++WM0C+fv50nl8=;
        b=TvYRbz1gAnpxAUAbX0VPW+EjaQAS2dhQBE3rmIrdvZkLkOoZS7RuEBi80HEuhxwbyQ
         3jWw/LUKvJiVUetuavM3XYhodDI/1+TVUjeAi/keDwvMEwgwAvmOL4m1Mwi/P4I5+FD/
         BGSF4PjTXY1KNudgPnFdFvUsLq5lLAEsE43LKWuTjP7B3DKkPm6qjEti2x2JcCsUYStD
         ntKb7HBqVYHaP9XLqxKqc6mK8bedhE6czKhwHoanCoxfZDSUJ7wpRdK8KRC1k+sm1U85
         QuTlHrMgw0TWMiFasNe6WehH3FNKdLpJMgcUOhEdHq75on7l8TV/42Pb8aGjpMD2BfH3
         gHHA==
X-Gm-Message-State: AOAM533PgYDBPsyupxjVuqF2tKPn6GBKWMY+9cHKAFIm2rv9n+HDU+mq
        576rzvjAAcu0dRLewKCD7PXtrngWwKpwb5QR5s8=
X-Google-Smtp-Source: ABdhPJxADI3eMAfY9bqXlkvYYYo7FnWkN55qyaeNshQ7JhmiukswfUQyQsMfa+JTAZTEe6i41VEWpkIYwE4Rc/rokJw=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr22188666wrn.124.1605555441436;
 Mon, 16 Nov 2020 11:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org> <20201116173005.1825880-7-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-7-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 14:37:10 -0500
Message-ID: <CADnq5_N5SrK3LxYrscubnYQWWis1xybTNfq0XCmEm=LC4frK9Q@mail.gmail.com>
Subject: Re: [PATCH 06/43] drm/radeon/radeon_legacy_encoders: Move
 'radeon_add_legacy_encoder' prototype to shared header
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
>   drivers/gpu/drm/radeon/radeon_legacy_encoders.c:1745:1: warning: no pre=
vious prototype for =E2=80=98radeon_add_legacy_encoder=E2=80=99 [-Wmissing-=
prototypes]
>  1745 | radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encode=
r_enum, uint32_t supported_device)
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
>  drivers/gpu/drm/radeon/radeon_encoders.c      |  4 +--
>  .../gpu/drm/radeon/radeon_legacy_encoders.c   |  1 +
>  .../gpu/drm/radeon/radeon_legacy_encoders.h   | 34 +++++++++++++++++++
>  3 files changed, 36 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/radeon/radeon_legacy_encoders.h
>
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/r=
adeon/radeon_encoders.c
> index ced022fae19d7..b60a373d3ead3 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -31,11 +31,9 @@
>  #include <drm/radeon_drm.h>
>
>  #include "radeon.h"
> +#include "radeon_legacy_encoders.h"
>  #include "atom.h"
>
> -extern void
> -radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
> -                            struct drm_connector *drm_connector);
>  extern void
>  radeon_atom_backlight_init(struct radeon_encoder *radeon_encoder,
>                            struct drm_connector *drm_connector);
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gp=
u/drm/radeon/radeon_legacy_encoders.c
> index 44d060f75318e..e64fd0ce67070 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
> @@ -35,6 +35,7 @@
>
>  #include "radeon.h"
>  #include "radeon_asic.h"
> +#include "radeon_legacy_encoders.h"
>  #include "atom.h"
>  #ifdef CONFIG_PMAC_BACKLIGHT
>  #include <asm/backlight.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.h b/drivers/gp=
u/drm/radeon/radeon_legacy_encoders.h
> new file mode 100644
> index 0000000000000..a80b387559d4d
> --- /dev/null
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.h
> @@ -0,0 +1,34 @@
> +/* radeon_legacy_encoders.h -- Private header for radeon driver -*- linu=
x-c -*-
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
> +#ifndef __RADEON_LEGACY_ENCODERS_H__
> +#define __RADEON_LEGACY_ENCODERS_H__
> +
> +void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
> +                                 struct drm_connector *drm_connector);
> +
> +#endif                         /* __RADEON_LEGACY_ENCODERS_H__ */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
