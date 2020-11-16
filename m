Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3B72B5324
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 21:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388203AbgKPUpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 15:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbgKPUpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 15:45:40 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823E8C0613D2;
        Mon, 16 Nov 2020 12:45:40 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a65so592464wme.1;
        Mon, 16 Nov 2020 12:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tUf+hLuTWmV9Lrrq70vQEtFjHd9qJhhsAirpAP6Z+pg=;
        b=qBV29QQ+OIuxZvy39eKHPqsKYg5pkmeun2KSEpsIoeUoU5HX8DjR82pybfizZ+4uGl
         g4hiYGyVwKpm3OyjGrlL+wulbyaWBuVC8jlgSXEP/iaC+j6FWRZzvLxKq82+wBJOc5il
         E/RA15N1qOOwdP0GW91QYJH+MfxT1C4Mjp1e6jkg9IBn+XCn9LvGl92rlq9nElXpBtuO
         6YCb3VRlNb7Q0SmzjIkvzAD+Nc55V4uCF+8pSs+H+6hsTA2neXO4oBfB98MCw/jaiZ7F
         yzkyAnHFCbopFV5n0dd7bM51mPU503IrLPJ04lGcRJ3woUjvM0OE+o8KBnJCitv8cUjW
         PnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tUf+hLuTWmV9Lrrq70vQEtFjHd9qJhhsAirpAP6Z+pg=;
        b=jE+JdNZUQEEfdSMQDtzagoO2Wz3S1VVw2ob5c8/2H0tQnT4traTJDZVewE9dkq8MXK
         DvXhuadBXhS9Reb5SfEPk74QPnmdtQlGFgZeikg+dm4zd6xPDmagXeHiX0ScHGjCvY9Y
         TYmJhz1neCNQd7QwIlw967vqkZrn5sgyqjWpSFNnpYbogVCXhbq2crQJzF5Y1aoFUIHX
         BSy4WBjtuzBgC944f3zMcoJbfX0HrqigMOYluv/MH5Zv1cAw9AqPmVIq4obI7K7JD3pj
         FjzQsI6FecK48y2YNllaMkve9N3drazGqB7AqR6RwuPU+bek37ZqR9Q/hFzEKLctvIWy
         kEPg==
X-Gm-Message-State: AOAM531Ds1gSPED+PtMe3cnDo/GS7H2XeoGT10VmT47KX5Ve3ZXiCdkL
        h0hTGiqlAGWrfUVmNdmbmNO9gcVIPaH/EhSz3KkJJ/L5
X-Google-Smtp-Source: ABdhPJwbvslghUU5OAz63L5KkVFc6VvkczPD/RPO9qq6rbYNvw0Kw0jZmg9wNV4J3AJz7tSNYHWdzYk9p6QfYTuCnE0=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr730703wmi.70.1605559539244;
 Mon, 16 Nov 2020 12:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org> <20201116173700.1830487-41-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-41-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 15:45:28 -0500
Message-ID: <CADnq5_MfZBnSPegGHvPvYJDVjaxabP94M_KNtX98gFT5ok_=vA@mail.gmail.com>
Subject: Re: [PATCH 40/43] drm/radeon/cik: Move 'vce_v2_0_enable_mgcg()'s
 prototype to shared header
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
>  drivers/gpu/drm/radeon/vce_v2_0.c:111:6: warning: no previous prototype =
for =E2=80=98vce_v2_0_enable_mgcg=E2=80=99 [-Wmissing-prototypes]
>  111 | void vce_v2_0_enable_mgcg(struct radeon_device *rdev, bool enable)
>  | ^~~~~~~~~~~~~~~~~~~~
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
>  drivers/gpu/drm/radeon/cik.c      | 2 +-
>  drivers/gpu/drm/radeon/vce.h      | 1 +
>  drivers/gpu/drm/radeon/vce_v2_0.c | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 2af76463906ad..8b7a4f7b75766 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -41,6 +41,7 @@
>  #include "radeon_audio.h"
>  #include "radeon_ucode.h"
>  #include "si.h"
> +#include "vce.h"
>
>  #define SH_MEM_CONFIG_GFX_DEFAULT \
>         ALIGNMENT_MODE(SH_MEM_ALIGNMENT_MODE_UNALIGNED)
> @@ -129,7 +130,6 @@ MODULE_FIRMWARE("radeon/mullins_rlc.bin");
>  MODULE_FIRMWARE("radeon/mullins_sdma.bin");
>
>  static u32 cik_get_cu_active_bitmap(struct radeon_device *rdev, u32 se, =
u32 sh);
> -extern void vce_v2_0_enable_mgcg(struct radeon_device *rdev, bool enable=
);
>  static void cik_rlc_stop(struct radeon_device *rdev);
>  static void cik_pcie_gen3_enable(struct radeon_device *rdev);
>  static void cik_program_aspm(struct radeon_device *rdev);
> diff --git a/drivers/gpu/drm/radeon/vce.h b/drivers/gpu/drm/radeon/vce.h
> index 1eb4f5715202e..ccc9c00f0d02c 100644
> --- a/drivers/gpu/drm/radeon/vce.h
> +++ b/drivers/gpu/drm/radeon/vce.h
> @@ -30,5 +30,6 @@
>  struct radeon_device;
>
>  void vce_v1_0_enable_mgcg(struct radeon_device *rdev, bool enable);
> +void vce_v2_0_enable_mgcg(struct radeon_device *rdev, bool enable);
>
>  #endif                         /* __VCE_H__ */
> diff --git a/drivers/gpu/drm/radeon/vce_v2_0.c b/drivers/gpu/drm/radeon/v=
ce_v2_0.c
> index d6fde3659e65f..163c9bfc03da8 100644
> --- a/drivers/gpu/drm/radeon/vce_v2_0.c
> +++ b/drivers/gpu/drm/radeon/vce_v2_0.c
> @@ -30,6 +30,7 @@
>  #include "radeon.h"
>  #include "radeon_asic.h"
>  #include "cikd.h"
> +#include "vce.h"
>
>  #define VCE_V2_0_FW_SIZE       (256 * 1024)
>  #define VCE_V2_0_STACK_SIZE    (64 * 1024)
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
