Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAB82AE31A
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 23:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731907AbgKJWR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 17:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKJWR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 17:17:27 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9866C0613D1;
        Tue, 10 Nov 2020 14:17:26 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 23so14403259wrc.8;
        Tue, 10 Nov 2020 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PybHYHD7oH2aLnG+yvTddEPZqr7VRvhfNzCANa+XKfA=;
        b=AnT0B68fsoy6LnsJzwe/Fm7jjXUzfkVseEBGHrDF8afef5eVu8t5Vc4WHB44H01snU
         Y0XxjtlSavsWQJ++9Q7cyNMhWTMUCQItMA1xUjro37jdTV1GN3Oi81zHV6/cufsj3hrh
         IbKlbsH8DnVVcNymAVVEOE4yAhcrgeMFMicm0ObvYEyOPNLwHhMoxAp893ou/pn9lkII
         riGVsX9X2H6Q3gGnUmc3HIu9VSXp88vjmHfYWlsUCEybqYt0eNc7Nv1H84cBIiCbYmbB
         Io9FqVA5KHeCT5mAPSrAlLl3ZoQpUTnhdd4q1T5VW47Ta+3f6INB3cihUIhZe6ZS8x6W
         3PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PybHYHD7oH2aLnG+yvTddEPZqr7VRvhfNzCANa+XKfA=;
        b=SMXMaRMziqBAclovM2b/SGZtm/F0d5l9SqCRQCFobp1gi4alvFGdC39rY/u5CbMAVe
         yu3Ercmu1o4/i+Lr5f/fdom06rrgy3p97KB1xYwLXznp/eh6V4FPJXqfHluq8UKYZSMz
         Nz9mXUu8zR+/EB82So59gUG9zDP6E2KaiS/rx2BaI6rY0uQ9kUMo2Y9EoQSji2OK9YQG
         jjQofT6QUaX+bLMsaW9PPy0ausxdYRMWWngJFMzbIfD5a+d4skj/I26Oq2XOPStG2g0k
         3L/d52LSuOlQa0F5XflG23e07rg5oNv0s2BxIye2ifyssmBS5niR/t/Rp9ZXLE7sXehv
         Gl0g==
X-Gm-Message-State: AOAM530fWyLq1yFU1X+oLKUtxc5IpX9uYU6neadyLDvgCHujkceILpNp
        PQQYO1KP2XRGvUDLPlSsN3vjYBU8Z4pOMmn1ObY=
X-Google-Smtp-Source: ABdhPJxh2GeljpewW2T0ti487h5NvVsa43l5KqIELZfR5hDC7Aj0bILRpfkBVbdUXZQrjDANOnsCVpXmp8jNi1eT12o=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27815711wrn.124.1605046645534;
 Tue, 10 Nov 2020 14:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org> <20201109211855.3340030-12-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-12-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 17:17:13 -0500
Message-ID: <CADnq5_MJQExKjyigHaYc4Vqy7H755qQC80Y7uSqxBPdR41B1cQ@mail.gmail.com>
Subject: Re: [PATCH 11/20] drm/radeon/r600: Strip out set but unused 'tmp' variables
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

On Mon, Nov 9, 2020 at 4:19 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/r600.c: In function =E2=80=98r600_pcie_gart_tlb_f=
lush=E2=80=99:
>  drivers/gpu/drm/radeon/r600.c:1083:7: warning: variable =E2=80=98tmp=E2=
=80=99 set but not used [-Wunused-but-set-variable]
>  drivers/gpu/drm/radeon/r600.c: At top level:
>  drivers/gpu/drm/radeon/r600.c: In function =E2=80=98r600_mmio_hdp_flush=
=E2=80=99:
>  drivers/gpu/drm/radeon/r600.c:4393:7: warning: variable =E2=80=98tmp=E2=
=80=99 set but not used [-Wunused-but-set-variable]
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
>  drivers/gpu/drm/radeon/r600.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.=
c
> index d9a33ca768f34..6e780b0109995 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -1080,7 +1080,6 @@ void r600_pcie_gart_tlb_flush(struct radeon_device =
*rdev)
>         if ((rdev->family >=3D CHIP_RV770) && (rdev->family <=3D CHIP_RV7=
40) &&
>             !(rdev->flags & RADEON_IS_AGP)) {
>                 void __iomem *ptr =3D (void *)rdev->gart.ptr;
> -               u32 tmp;
>
>                 /* r7xx hw bug.  write to HDP_DEBUG1 followed by fb read
>                  * rather than write to HDP_REG_COHERENCY_FLUSH_CNTL
> @@ -1088,7 +1087,7 @@ void r600_pcie_gart_tlb_flush(struct radeon_device =
*rdev)
>                  * method for them.
>                  */
>                 WREG32(HDP_DEBUG1, 0);
> -               tmp =3D readl((void __iomem *)ptr);
> +               readl((void __iomem *)ptr);
>         } else
>                 WREG32(R_005480_HDP_MEM_COHERENCY_FLUSH_CNTL, 0x1);
>
> @@ -4390,10 +4389,9 @@ void r600_mmio_hdp_flush(struct radeon_device *rde=
v)
>         if ((rdev->family >=3D CHIP_RV770) && (rdev->family <=3D CHIP_RV7=
40) &&
>             rdev->vram_scratch.ptr && !(rdev->flags & RADEON_IS_AGP)) {
>                 void __iomem *ptr =3D (void *)rdev->vram_scratch.ptr;
> -               u32 tmp;
>
>                 WREG32(HDP_DEBUG1, 0);
> -               tmp =3D readl((void __iomem *)ptr);
> +               readl((void __iomem *)ptr);
>         } else
>                 WREG32(R_005480_HDP_MEM_COHERENCY_FLUSH_CNTL, 0x1);
>  }
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
