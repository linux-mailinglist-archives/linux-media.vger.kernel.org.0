Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC562B516C
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 20:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbgKPTon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 14:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgKPTon (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 14:44:43 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCB6C0613CF;
        Mon, 16 Nov 2020 11:44:42 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d142so430460wmd.4;
        Mon, 16 Nov 2020 11:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pHZgWmU6XhEz4kKHQRjWGKIdxIJ0C0IVMz/y48zhekY=;
        b=tAbP0yL8IinHcIc95NQ6bzZq8p6mWeQXI5Nzc1oVogkQhqpkk1s8LmeJNJE5I8CaZh
         XeZaZSO7MDWJcdSZYcnrTbkKW6H1FUNpM3WggsK8coH7LQqcqXULKJGZN7P7t+IiJrlB
         7a+MpPEblqcSACJAqX1Mo7m4bJirQSgq8DMg0kneFCyvvVF7tWaI5EpagXhh/B9I3Zmo
         57GaM49g0PjDwaKKhkJ+Tjig7s1KVVFgYpndt3Q7yeJtysvGoBkAXa8OlC0lPm7TBvtW
         +FBnQkiK+Bz/OoWV3lBIc59TaUo84BAhB+m/JrzabmcE7LIwa5BzaAnWLXAYQrDFStZV
         9fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pHZgWmU6XhEz4kKHQRjWGKIdxIJ0C0IVMz/y48zhekY=;
        b=CibN9Bhq9D+4y2CyNRO1cAeDhV+ASyhrjLz2d4d4iz5Viuy3D+fGr4Gy1tjRv5zcYl
         IQ+0KbJMuyQHVwf9/HEnKWSUSNO7g+XxAE3EzlgNw866h02DQx9aZI0pXTFd8hsUaLFv
         /liPz9hN/P+BDF6jKjtuGKsnLRYzIAWiPsBYhHjQtpohTTCO1dkolzOMbjeQZkcIjWPx
         HcjYGQkNmqdBYYA2q6iRkRNaQqAYD3+SPQ+rOuTlyQ3lwl24sFWjYgfzWOMH5tUYqq4y
         Gfi1doPA7t3Px1rld6SkqPPyzTOArzGFj/HGL7AbSHVQdM4edJAqcA08ljcT5t9rvbJI
         6uaw==
X-Gm-Message-State: AOAM533+Vnlt0p5pTX80vjA36ah8MQydjBlzFtfOm4gTeuQnh/Y5Gl1b
        d+8vyyEG1utk5vCVusQWkFf1HA749Afyqoq3JVysBVID
X-Google-Smtp-Source: ABdhPJxnrX3oL/glLVny36dEA33OicyL3plY/Qf7bIxvAxk3pEuPzuj0B47kSHIMhMI+GvH+MgddeQrDkepwz1ilXrk=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr522140wmi.70.1605555881490;
 Mon, 16 Nov 2020 11:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org> <20201116173005.1825880-11-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-11-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 14:44:30 -0500
Message-ID: <CADnq5_MvHi4ktw+_oN8KYTZL_zMM6J8Zrm7-E0R5n9gv1ch0Gg@mail.gmail.com>
Subject: Re: [PATCH 10/43] drm/radeon/radeon_pm: Move 'radeon_pm_acpi_event_handler'
 prototype into shared header
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
>  drivers/gpu/drm/radeon/radeon_pm.c:74:6: warning: no previous prototype =
for =E2=80=98radeon_pm_acpi_event_handler=E2=80=99 [-Wmissing-prototypes]
>  74 | void radeon_pm_acpi_event_handler(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>  drivers/gpu/drm/radeon/radeon_acpi.c |  3 +--
>  drivers/gpu/drm/radeon/radeon_pm.c   |  1 +
>  drivers/gpu/drm/radeon/radeon_pm.h   | 33 ++++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/radeon/radeon_pm.h
>
> diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeo=
n/radeon_acpi.c
> index 6cf1645e7a1a8..1baef7b493def 100644
> --- a/drivers/gpu/drm/radeon/radeon_acpi.c
> +++ b/drivers/gpu/drm/radeon/radeon_acpi.c
> @@ -36,6 +36,7 @@
>  #include "atom.h"
>  #include "radeon.h"
>  #include "radeon_acpi.h"
> +#include "radeon_pm.h"
>
>  #if defined(CONFIG_VGA_SWITCHEROO)
>  bool radeon_atpx_dgpu_req_power_for_displays(void);
> @@ -45,8 +46,6 @@ static inline bool radeon_atpx_dgpu_req_power_for_displ=
ays(void) { return false;
>
>  #define ACPI_AC_CLASS           "ac_adapter"
>
> -extern void radeon_pm_acpi_event_handler(struct radeon_device *rdev);
> -
>  struct atif_verify_interface {
>         u16 size;               /* structure size in bytes (includes size=
 field) */
>         u16 version;            /* version */
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/=
radeon_pm.c
> index 65d172b13e065..1995dad59dd09 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -33,6 +33,7 @@
>  #include "avivod.h"
>  #include "r600_dpm.h"
>  #include "radeon.h"
> +#include "radeon_pm.h"
>
>  #define RADEON_IDLE_LOOP_MS 100
>  #define RADEON_RECLOCK_DELAY_MS 200
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.h b/drivers/gpu/drm/radeon/=
radeon_pm.h
> new file mode 100644
> index 0000000000000..5ef147785e815
> --- /dev/null
> +++ b/drivers/gpu/drm/radeon/radeon_pm.h
> @@ -0,0 +1,33 @@
> +/* radeon_pm.h -- Private header for radeon driver -*- linux-c -*-
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
> +#ifndef __RADEON_PM_H__
> +#define __RADEON_PM_H__
> +
> +void radeon_pm_acpi_event_handler(struct radeon_device *rdev);
> +
> +#endif                         /* __RADEON_PM_H__ */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
