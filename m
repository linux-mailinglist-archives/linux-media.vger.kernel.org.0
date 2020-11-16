Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558682B5123
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 20:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgKPTaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 14:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgKPTaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 14:30:04 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6376C0613CF;
        Mon, 16 Nov 2020 11:30:03 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id d142so385622wmd.4;
        Mon, 16 Nov 2020 11:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=baVdptJRCbDZjJ8DuZudh573ITj/FBuGjcAGOwxiymE=;
        b=IuvYiIBdBzwE/ULUmhF38FiOnb7R4NGmVftrkFCqCOQR0O/KEd6bZXGyeJ1nJDgPr4
         Y7kS8W0aDBBmijlFQQNnlEjiMXBqv5aZiDy0JiEijD6S2xWceJP976I+//bU8u8IKVw9
         xNRKr3Sp8iVmL9vJVw7jcKdC6WVAiDGVC0jLk/JGmUwPv/QkwHe/lAvONDSq6rCbgrMn
         YKrlBGaXfm5Vbs3u/829/sqTDC62+ekXnUJ+UxNZzXSivvtXFY/lQbLa23IfbT+nAfiM
         PrqJtql+f4kzXPcxxW57BQIi03p6hGmE12/lcAfNPxvcTrQRhGzD2xX5QosSsXuRiiu5
         47Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=baVdptJRCbDZjJ8DuZudh573ITj/FBuGjcAGOwxiymE=;
        b=KfRHtiockJZx6gCP2Tep2nFgLqoKTaDK99ClyrY9GupyI+MMi0os+kXrpSvokrhHDr
         MSBiGwb4MrLVAlwMPXwD+S4Vqe8dOdk3MMhXb7YHqWaSDDjsAuu2cjCOTFJ6N4nT/kQ2
         368qe5SMHPQgDUQdd9V+JzTFlz/mvR2c+UPjmRvndu9pPnTUWdRpWjVZ2W0zqyZ7NbUD
         Alx/WSofufl2HJ52K3k1rSo330+ZFXUR3RxhSf0JnzlJ7mavZ0vEujPvjp3F+DHTV9Rn
         oT6v4oea0ixw4kXmt25daY+4d0Lt4GvuzStcGZ631koIxtdo5jTdZHuL1XLqX120fVUr
         zKdA==
X-Gm-Message-State: AOAM531AVxufOE0/z8A3aDf9pAz5GzEuQj07LwfVFBGKoTlyVnnUUw8A
        jOJ9SmbKBoViKoR5Udv7wdkvvMduZvfMNnTDlNA=
X-Google-Smtp-Source: ABdhPJyqLuVQBeAcZ0X7bNgq/BftyKAlmOzveP2UgPrWbROSjaHIRnbl5ejKqxG3FbJwSCmGSrlpiJAJ47st7HsMhrY=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr468742wmi.70.1605555002601;
 Mon, 16 Nov 2020 11:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org> <20201116173005.1825880-3-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-3-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 14:29:51 -0500
Message-ID: <CADnq5_MjjgY0mUKh81Qr6rsX8e52C_snz2-LXwpV-WGxuVnbFQ@mail.gmail.com>
Subject: Re: [PATCH 02/43] drm/radeon/radeon: Move prototype into shared header
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
> Unfortunately, a suitable one didn't already exist.
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/radeon_device.c:637:6: warning: no previous proto=
type for =E2=80=98radeon_device_is_virtual=E2=80=99 [-Wmissing-prototypes]
>  637 | bool radeon_device_is_virtual(void)
>  | ^~~~~~~~~~~~~~~~~~~~~~~~
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
>  drivers/gpu/drm/radeon/radeon_device.c |  1 +
>  drivers/gpu/drm/radeon/radeon_device.h | 32 ++++++++++++++++++++++++++
>  drivers/gpu/drm/radeon/radeon_drv.c    |  3 +--
>  3 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/radeon/radeon_device.h
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/rad=
eon/radeon_device.c
> index 7f384ffe848a7..ad572f965190b 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/radeon_drm.h>
>
> +#include "radeon_device.h"
>  #include "radeon_reg.h"
>  #include "radeon.h"
>  #include "atom.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_device.h b/drivers/gpu/drm/rad=
eon/radeon_device.h
> new file mode 100644
> index 0000000000000..3112b99ae36f1
> --- /dev/null
> +++ b/drivers/gpu/drm/radeon/radeon_device.h
> @@ -0,0 +1,32 @@
> +/* radeon_device.h -- Private header for radeon device -*- linux-c -*-
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
> + */
> +
> +#ifndef __RADEON_DEVICE_H__
> +#define __RADEON_DEVICE_H__
> +
> +bool radeon_device_is_virtual(void);
> +
> +#endif                         /* __RADEON_DEVICE_H__ */
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon=
/radeon_drv.c
> index f813eb5e140dd..536b246b9a6aa 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -52,6 +52,7 @@
>
>  #include "radeon_drv.h"
>  #include "radeon.h"
> +#include "radeon_device.h"
>
>  /*
>   * KMS wrapper.
> @@ -293,8 +294,6 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>
>  static const struct drm_driver kms_driver;
>
> -bool radeon_device_is_virtual(void);
> -
>  static int radeon_pci_probe(struct pci_dev *pdev,
>                             const struct pci_device_id *ent)
>  {
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
