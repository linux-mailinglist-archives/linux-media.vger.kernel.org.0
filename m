Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC5D2B52D7
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 21:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgKPUmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 15:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgKPUmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 15:42:36 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E76C0613CF;
        Mon, 16 Nov 2020 12:42:36 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 23so656293wmg.1;
        Mon, 16 Nov 2020 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3z+NbxLCoSUpXc6qIVJmm/Cby6IwqNHb9FTQiHAyLpQ=;
        b=ZMaZY17YDp5J0FtljoLT9MOJyeYK9wI2VldyllFIjWA+feBYKFM87WUnZOQLj3BR3J
         8X8mv5IcJ9elNlTLN6HprUhcSWl1Oyc4K5leOKdfVF/zdngMzEhAAh13tju6GlLFiGMT
         5UT2sGbxEQAWkqdQiDS31uRCWgtt0USGVUc2odIlHHa6AwjBPiNBgWsFlaC30TnjOQRI
         /HwXVRM3DO4GIY6jcQiPh4BTNGdvHKNQoTRGtHbl+Z+6YTNfjyqpbxfxCSSl6ECUExTO
         BmXdK42koWVsdxugF5RKR2qqp5NSPPotc0Od8AcbD5K9lpUFvVU+MfCZAr0PuVpEAq4z
         Ypxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3z+NbxLCoSUpXc6qIVJmm/Cby6IwqNHb9FTQiHAyLpQ=;
        b=f7/RckoDt7eBUdfHYh1Rzj6xR5RrvKkowMKXIhJcW+4Cqag026ceTQT5LMotaocHig
         hHK7wqbhcmnFfIQJVKciMyNz4XNnd4izd7wEwvYomnHWk9OTqEoLKKsMhge+MrUUr3ZR
         8zwTbOtEL6i0FVK8fExwh4ZKrfzEMBVHJ9DqvelXXwGEGneRnKEZmxpKEzxeCElUlFww
         OQ9Xnr+689N6EiDPP3SoAdgVl8bdk2UveEx9gBoNCuJIP+dcvhQtDli3EfTk5qle842K
         w12KlC9iL6csyv2d/aXwIKIhqnWOVGKKw2yzLN76gGrgXHZceMzAVK+JyyCYu/8/mcW2
         O+6A==
X-Gm-Message-State: AOAM530/Um2dUi5ckGbidJCyqSqaWGsPDXR1ZEa05HXC2DhgHTuAIziS
        avk6eXCevHNVITPjiVzNhPlssJ5MfWiJmT1ltg0=
X-Google-Smtp-Source: ABdhPJzMitW7KoFSksU/zt+YNQhzbtPynx2aS+dOwmPuAI1Vbj8yIE/6ayztvfblfVaSIEsfQFY+bJuDWGnscmxiEAk=
X-Received: by 2002:a7b:c015:: with SMTP id c21mr705614wmb.79.1605559354802;
 Mon, 16 Nov 2020 12:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org> <20201116173700.1830487-39-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-39-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Nov 2020 15:42:23 -0500
Message-ID: <CADnq5_NdY-vbn74Qzp8X04y_eozZVFiOXwepSP2+iABRzUOTxA@mail.gmail.com>
Subject: Re: [PATCH 38/43] drm/radeon/cik: Move 'Move 'cik_sdma_*()'s
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

On Mon, Nov 16, 2020 at 12:38 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/cik_sdma.c:331:6: warning: no previous prototype =
for =E2=80=98cik_sdma_enable=E2=80=99 [-Wmissing-prototypes]
>  331 | void cik_sdma_enable(struct radeon_device *rdev, bool enable)
>  | ^~~~~~~~~~~~~~~
>  drivers/gpu/drm/radeon/cik_sdma.c:528:5: warning: no previous prototype =
for =E2=80=98cik_sdma_resume=E2=80=99 [-Wmissing-prototypes]
>  528 | int cik_sdma_resume(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~~~~
>  drivers/gpu/drm/radeon/cik_sdma.c:557:6: warning: no previous prototype =
for =E2=80=98cik_sdma_fini=E2=80=99 [-Wmissing-prototypes]
>  557 | void cik_sdma_fini(struct radeon_device *rdev)
>  | ^~~~~~~~~~~~~
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
>  drivers/gpu/drm/radeon/cik.c | 3 ---
>  drivers/gpu/drm/radeon/cik.h | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index cef0f3111cd3a..2af76463906ad 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -129,9 +129,6 @@ MODULE_FIRMWARE("radeon/mullins_rlc.bin");
>  MODULE_FIRMWARE("radeon/mullins_sdma.bin");
>
>  static u32 cik_get_cu_active_bitmap(struct radeon_device *rdev, u32 se, =
u32 sh);
> -extern int cik_sdma_resume(struct radeon_device *rdev);
> -extern void cik_sdma_enable(struct radeon_device *rdev, bool enable);
> -extern void cik_sdma_fini(struct radeon_device *rdev);
>  extern void vce_v2_0_enable_mgcg(struct radeon_device *rdev, bool enable=
);
>  static void cik_rlc_stop(struct radeon_device *rdev);
>  static void cik_pcie_gen3_enable(struct radeon_device *rdev);
> diff --git a/drivers/gpu/drm/radeon/cik.h b/drivers/gpu/drm/radeon/cik.h
> index 420207d19de52..d1bf541da5923 100644
> --- a/drivers/gpu/drm/radeon/cik.h
> +++ b/drivers/gpu/drm/radeon/cik.h
> @@ -34,4 +34,7 @@ void cik_init_cp_pg_table(struct radeon_device *rdev);
>  u32 cik_get_csb_size(struct radeon_device *rdev);
>  void cik_get_csb_buffer(struct radeon_device *rdev, volatile u32 *buffer=
);
>
> +int cik_sdma_resume(struct radeon_device *rdev);
> +void cik_sdma_enable(struct radeon_device *rdev, bool enable);
> +void cik_sdma_fini(struct radeon_device *rdev);
>  #endif                         /* __CIK_H__ */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
