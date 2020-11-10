Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6252AE25A
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 23:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732193AbgKJWAE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 17:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732199AbgKJWAD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 17:00:03 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D195FC0613D1;
        Tue, 10 Nov 2020 14:00:02 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 10so4713027wml.2;
        Tue, 10 Nov 2020 14:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kQXXRFyXwxRS/I2RgZpEGIowDOXzMpZPv5s9Y3k7QhI=;
        b=j2cdkNt2/4bsAh1RBkbd/u0wSdArQ78T4xxdeBsW+/M6f6LD/81+RHepLgSU8jEJ9c
         f9WemXa2FyA/zxrsTylztAKXuq0YJuj9cxdDPXcF7kjC/E/wnutNAoTNsa9/fRwyPiWc
         +78MWhXNIm57moM4vMRvWf1DcGUnsFSno5zHoldcv7YKQV4FGO0ZtFk2dcIByjtQAluG
         A1AXBA7Dw8JTOoDYGL3iJ5mulzzCccTJTlyU+yBela+/iTpOeOh4bAXiakRfdECIEnLG
         1LS6PeRzptHzcsSiTkg+tTBbKxjaYaB3ughnn3vmOkXcH4rq3iY2DLIXN3VvS84y2WHj
         K6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kQXXRFyXwxRS/I2RgZpEGIowDOXzMpZPv5s9Y3k7QhI=;
        b=X1Bh8GyxLUyYypWMtHSgJYlKd8HGsPB753k0yBgG4iKo3YIU2uPRPg5ehZYGovTx17
         nQIdJJAq63aF8eXNiQ1tk4+cVbTpxDLMUSgpbKtj5X4G0GYKa9TL10vT+wu7BV/W4VD7
         Qicywt36K0waTQzkKzP6Rg8YvSQk1V7THpnoKTsurtoXNmT6ceLarcGOVA72b0bypD8l
         qTEDPKzNT9oSllMqHBoZZsGmm8Zb4hMK/PLoEOAjg2vqeByKKJQc3GHU1dnXcwIws7bT
         7vsxtucJ1MTCtHDWNQFyKOolOlDvEFENKEplkxBjwcegbI9Oz1nFvsgxpV1Grw+PDosm
         ozVA==
X-Gm-Message-State: AOAM530kU0CKxEaosbXFkPAQ95LHDy6u4Dh2MPrSZZ1aiDZAhwXg/hLM
        AeNRxljl7cQkqnBIrk3sPGBbLlF+0aJO3lg+0Yw=
X-Google-Smtp-Source: ABdhPJyA6KMQLGspxDQuMB3AJjwy1n4N6vTF1NTBv7oDFWmt8buswnwQw/m1E/kYfC65a/uWB9XotDCuHrLZ3DbVAI0=
X-Received: by 2002:a1c:46c6:: with SMTP id t189mr192270wma.79.1605045601646;
 Tue, 10 Nov 2020 14:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org> <20201106214949.2042120-16-lee.jones@linaro.org>
In-Reply-To: <20201106214949.2042120-16-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 16:59:50 -0500
Message-ID: <CADnq5_MYU0FMVm-ALPRAeF1O29TnZc83xpY+W-=iiSJY2AX2LQ@mail.gmail.com>
Subject: Re: [PATCH 15/19] drm/radeon: Move prototypes to shared header
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

On Fri, Nov 6, 2020 at 4:50 PM Lee Jones <lee.jones@linaro.org> wrote:
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
>  drivers/gpu/drm/radeon/radeon.h         | 6 ++++++
>  drivers/gpu/drm/radeon/radeon_display.c | 4 ----
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rad=
eon.h
> index e1132d86d2507..961a31b8805c2 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2832,6 +2832,12 @@ extern void radeon_program_register_sequence(struc=
t radeon_device *rdev,
>                                              const u32 array_size);
>  struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev);
>
> +/* KMS */
> +
> +u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
> +int radeon_enable_vblank_kms(struct drm_crtc *crtc);
> +void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> +
>  /*
>   * vm
>   */
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/ra=
deon/radeon_display.c
> index b79686cf8bdbd..bd60f16fd0d78 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -45,10 +45,6 @@
>  #include "atom.h"
>  #include "radeon.h"
>
> -u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
> -int radeon_enable_vblank_kms(struct drm_crtc *crtc);
> -void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> -
>  static void avivo_crtc_load_lut(struct drm_crtc *crtc)
>  {
>         struct radeon_crtc *radeon_crtc =3D to_radeon_crtc(crtc);
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
