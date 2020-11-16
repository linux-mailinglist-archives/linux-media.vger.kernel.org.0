Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9056C2B5152
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 20:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730046AbgKPTiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 14:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729983AbgKPTiG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 14:38:06 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D552FC0613CF;
        Mon, 16 Nov 2020 11:38:05 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 19so423133wmf.1;
        Mon, 16 Nov 2020 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ru267PQGlQsOc+0AqYwg/UBJuZfw/k56sykTs1YsbnQ=;
        b=Fj99Tpte9Q1UICmja9Nwy7ObhrnkwQVm9spuX2zXK7spMDHVLHkadP0+EaqpSpEkod
         Ql8MuBX5Pm3J86jaJu83VjxE7foZ6lhCQSEwOX9erdmv30heTB8/7UBEBfHGyCUdXxYM
         7SeGhwN2cG3jvj1uaxueXH0Kq6otpQlOQuFYroEXF7kyeOgXdx22D7oMquz94KWLOSZm
         0fnJci+Wkc78wFGlBh/DD5w70oE8UicZj+IoMpYaCgNm1QN97PpT3wFW/CgJA6Ts9oLt
         nsSOMr4+2WtHytySQohMMB7iJLaO5vFeVs0o1OAknSMyPfwNoMfzMJYQ7xnu9PNKmVYj
         hBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ru267PQGlQsOc+0AqYwg/UBJuZfw/k56sykTs1YsbnQ=;
        b=IRQKWUJypQw0kb7BwOwc/e8OG7FSBUFs44/vxZyhT6l9G2Oq/onkXpI0cHwbpCcKLN
         lRDTciOPlHQjV6Rd67k8rOqZmgd4gHUk1BWNUSo0nhNeS5aurZlgOcWuzh2LeLC46cZs
         xe/e+kR4+66bkaYFXcm8n2NiH0qIKwa7qe1r+A7n9p4cdnL2gm95EQp9jAA6S19og9DV
         opNMPZG+neU8yFpE89mKDzvFJmvnaCSKdsdiUlH/ujoHFnRJt1B228GKfzR0FbPfitdU
         Ilz3T90z9OAufyu3MIGsElRAiD8Po47xMvGaYq54oqfwb5hjbyisDbaWHYmPztiZ3iLP
         DuNQ==
X-Gm-Message-State: AOAM530cH4nyxBpV6x01KF9LaVXhAx9JmQT5JaX2vvl9rjrvXEd3zDJz
        Ngq/qIwRUj4Je5+41DmeB7eXy+mje6C827H8YJc=
X-Google-Smtp-Source: ABdhPJyMgacwGcd6wHE/yIyAqYEiQMiFccSiB9vSGlLV/9TGRb68+QG4qy5jDO+PYPEM/kBTSoIrKEzfMnTOtCHaBUg=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr498985wmi.70.1605555484652;
 Mon, 16 Nov 2020 11:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20201116173005.1825880-1-lee.jones@linaro.org> <20201116173005.1825880-8-lee.jones@linaro.org>
In-Reply-To: <20201116173005.1825880-8-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 14:37:53 -0500
Message-ID: <CADnq5_MtKsXUf3d5z3m4x+HwPYt5yDpbAvgN0W__m+fbbKuxVA@mail.gmail.com>
Subject: Re: [PATCH 07/43] drm/radeon/radeon_legacy_encoders: Move
 'radeon_add_legacy_encoder's prototype to shared location
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
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c:1746:1: warning: no prev=
ious prototype for =E2=80=98radeon_add_legacy_encoder=E2=80=99 [-Wmissing-p=
rototypes]
>  1746 | radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encode=
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
>  drivers/gpu/drm/radeon/radeon_atombios.c        | 6 +-----
>  drivers/gpu/drm/radeon/radeon_combios.c         | 6 +-----
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.h | 2 ++
>  3 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/r=
adeon/radeon_atombios.c
> index 71bf2ed172697..cc80651b25773 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -35,16 +35,12 @@
>  #include "atom-bits.h"
>  #include "radeon_asic.h"
>  #include "radeon_atombios.h"
> +#include "radeon_legacy_encoders.h"
>
>  extern void
>  radeon_add_atom_encoder(struct drm_device *dev, uint32_t encoder_enum,
>                         uint32_t supported_device, u16 caps);
>
> -/* from radeon_legacy_encoder.c */
> -extern void
> -radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum,
> -                         uint32_t supported_device);
> -
>  union atom_supported_devices {
>         struct _ATOM_SUPPORTED_DEVICES_INFO info;
>         struct _ATOM_SUPPORTED_DEVICES_INFO_2 info_2;
> diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/ra=
deon/radeon_combios.c
> index d3c04df7e75d7..ff2135059c071 100644
> --- a/drivers/gpu/drm/radeon/radeon_combios.c
> +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> @@ -31,6 +31,7 @@
>  #include <drm/radeon_drm.h>
>
>  #include "radeon.h"
> +#include "radeon_legacy_encoders.h"
>  #include "atom.h"
>
>  #ifdef CONFIG_PPC_PMAC
> @@ -40,11 +41,6 @@
>  #include <asm/prom.h>
>  #endif /* CONFIG_PPC_PMAC */
>
> -/* from radeon_legacy_encoder.c */
> -extern void
> -radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum,
> -                         uint32_t supported_device);
> -
>  /* old legacy ATI BIOS routines */
>
>  /* COMBIOS table offsets */
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.h b/drivers/gp=
u/drm/radeon/radeon_legacy_encoders.h
> index a80b387559d4d..f4c7432267e67 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.h
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.h
> @@ -30,5 +30,7 @@
>
>  void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
>                                   struct drm_connector *drm_connector);
> +void radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_=
enum,
> +                              uint32_t supported_device);
>
>  #endif                         /* __RADEON_LEGACY_ENCODERS_H__ */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
