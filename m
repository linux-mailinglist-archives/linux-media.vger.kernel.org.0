Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD072B523F
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 21:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbgKPUPb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 15:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727204AbgKPUPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 15:15:30 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F338C0613CF;
        Mon, 16 Nov 2020 12:15:30 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id s13so514934wmh.4;
        Mon, 16 Nov 2020 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Cqs0L9mq4LM3hzHwL7Vxr+3/WEKB0WUANiW7vqEYbdw=;
        b=EcuCUIrgOLUyuPpQ7CA/cbD7Tg+QHLQPQM11HjaTX/YtQTOdwjJ5Wn2jTNxChrW+mO
         mIo5+zyP4WaB0rHls2FhXfWP6kllcHGJt0dJOzQATSbFVRS4yMgUYImDNqJSjNi1D7Ai
         8xDGXEq/mQD8h16w9sNIgTsXcjzCNxpjMcZOhaFnZFB7uP/qZZ+7cUqtS7CZGaaxVvTu
         3ia6UwFLnTs3XIs0jdh8J/voMxT1rrvP14Qh0aZykcbDNwIHpSdM1kMfoaWJenDRWFS5
         iXAL83eNJKDW44WRPE+d6xQ/6YvQ01S3XShcDGCNsRi8mM+cNj5CSWmy/87vjauxH2C4
         +RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Cqs0L9mq4LM3hzHwL7Vxr+3/WEKB0WUANiW7vqEYbdw=;
        b=doZUUqxM0B87xGbnCPMZ6vhkpxz+fhxWUVQrkvSzIKoTOrvTfPB2x8DwaTjv4Dz0D6
         NY1yAnmyLFh/N/aT7oIIqlt8ECuuXWDV1Syg2aPRRLory23xubREJm3TVZ6q41xr1sOa
         TxkBavH+C1znsmJtdHdaYsTlz23B00+sAIFCFr6aIkDjTPfqULMEGyKJWBx5OuEeMB1x
         gX1qmpv0ztxX1FigJ1KTIp5VxWnjT7bznTYBtwDxSSQuWYiLDWVK7Lb9kJ/JlOvP/CId
         lU9428QEZtci3VfWKQZIq09W97q/3vRZE9XmFWunGTAlifh4wAvuJFhyjftddPmWk3bB
         ejpA==
X-Gm-Message-State: AOAM532rkqHdFHYXp2MlkFt48R5eFx2tLdlLiioiL9GrZXH+68/ev8mr
        OaadnYztXKQ9IJNLa9E64JX3FzPYSMU8R9RGhYQ=
X-Google-Smtp-Source: ABdhPJxW6dtT5waXDuu9RfOmT1vSRwN4pUavgumlbd68/qeoEMNN0kUrMTLhSpdG6DjOKNpJPdQDZtyuJlgXWXgPlag=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr604675wmb.39.1605557729178;
 Mon, 16 Nov 2020 12:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org> <20201116173700.1830487-23-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-23-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 15:15:18 -0500
Message-ID: <CADnq5_MVdGk7XrdOpRA0wDH1jNXcZ84iOUcmD9hdnGY7aw4e1A@mail.gmail.com>
Subject: Re: [PATCH 22/43] drm/radeon/cik: Move 'r600_ih_ring_{alloc,
 fini}()'s prototypes to shared header
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
>  drivers/gpu/drm/radeon/r600.c:3480:5: warning: no previous prototype for=
 =E2=80=98r600_ih_ring_alloc=E2=80=99 [-Wmissing-prototypes]
>  3480 | int r600_ih_ring_alloc(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~~~~~~~
>  drivers/gpu/drm/radeon/r600.c:3516:6: warning: no previous prototype for=
 =E2=80=98r600_ih_ring_fini=E2=80=99 [-Wmissing-prototypes]
>  3516 | void r600_ih_ring_fini(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~~~~~~
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
>  drivers/gpu/drm/radeon/cik.c  | 3 +--
>  drivers/gpu/drm/radeon/r600.h | 2 ++
>  drivers/gpu/drm/radeon/si.c   | 3 +--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 315c4f3df3656..980b50d046cbc 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -34,6 +34,7 @@
>  #include "cik_blit_shaders.h"
>  #include "cikd.h"
>  #include "clearstate_ci.h"
> +#include "r600.h"
>  #include "radeon.h"
>  #include "radeon_asic.h"
>  #include "radeon_audio.h"
> @@ -125,8 +126,6 @@ MODULE_FIRMWARE("radeon/mullins_mec.bin");
>  MODULE_FIRMWARE("radeon/mullins_rlc.bin");
>  MODULE_FIRMWARE("radeon/mullins_sdma.bin");
>
> -extern int r600_ih_ring_alloc(struct radeon_device *rdev);
> -extern void r600_ih_ring_fini(struct radeon_device *rdev);
>  extern void si_vram_gtt_location(struct radeon_device *rdev, struct rade=
on_mc *mc);
>  extern void si_rlc_reset(struct radeon_device *rdev);
>  extern void si_init_uvd_internal_cg(struct radeon_device *rdev);
> diff --git a/drivers/gpu/drm/radeon/r600.h b/drivers/gpu/drm/radeon/r600.=
h
> index 2a3915f0039e4..e66ef58706cd8 100644
> --- a/drivers/gpu/drm/radeon/r600.h
> +++ b/drivers/gpu/drm/radeon/r600.h
> @@ -31,5 +31,7 @@
>  struct radeon_device;
>
>  u32 r600_gpu_check_soft_reset(struct radeon_device *rdev);
> +int r600_ih_ring_alloc(struct radeon_device *rdev);
> +void r600_ih_ring_fini(struct radeon_device *rdev);
>
>  #endif                         /* __R600_H__ */
> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> index 45076c27d7ded..d0407145c07b5 100644
> --- a/drivers/gpu/drm/radeon/si.c
> +++ b/drivers/gpu/drm/radeon/si.c
> @@ -33,6 +33,7 @@
>  #include "atom.h"
>  #include "clearstate_si.h"
>  #include "evergreen.h"
> +#include "r600.h"
>  #include "radeon.h"
>  #include "radeon_asic.h"
>  #include "radeon_audio.h"
> @@ -128,8 +129,6 @@ static void si_pcie_gen3_enable(struct radeon_device =
*rdev);
>  static void si_program_aspm(struct radeon_device *rdev);
>  extern void sumo_rlc_fini(struct radeon_device *rdev);
>  extern int sumo_rlc_init(struct radeon_device *rdev);
> -extern int r600_ih_ring_alloc(struct radeon_device *rdev);
> -extern void r600_ih_ring_fini(struct radeon_device *rdev);
>  static void si_enable_gui_idle_interrupt(struct radeon_device *rdev,
>                                          bool enable);
>  static void si_init_pg(struct radeon_device *rdev);
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
