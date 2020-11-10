Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915032AE420
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 00:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731992AbgKJXeJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 18:34:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbgKJXeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 18:34:09 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3471C0613D1;
        Tue, 10 Nov 2020 15:34:08 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p1so287473wrf.12;
        Tue, 10 Nov 2020 15:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gZj8Bm71tJcSxjRihZFAmVL0neWjtvcosDTRkeYcBUg=;
        b=fqk08pPiTtoirrTxKn7wHrsESbAWYleBXL518w2NjEaEKEqBwPwwmqBu64vJnjTm74
         rO/X8+CmGyrzfjKIWyVYA/reQu8owiK2OtQybHubIe/BwqSZOdA7cIaNikxjbEBA2u46
         2hVA9FhoXusWA17MLZfsiquGB37nyBfc8uobXOVeANVWCchiNJginAGgYNXKMRgHRoBw
         uhzWETTNYRQVZak3wJHHeO1eWP+sYqB2M6WCFQTvw4CiDg7dpgmQpUUwSmF+HPt1w6Ih
         6x6V9R0Y4tY8mIPtDiZHxoAjczmabNIaVZiCI58XygjSZjlGq4xQhryWZN3PD0ZFi6x4
         ldqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gZj8Bm71tJcSxjRihZFAmVL0neWjtvcosDTRkeYcBUg=;
        b=RdDpN/LvQuzdUHKwBeASL0CBGY/1/eSK0dEPhQkxSA6CGxbiChXfROLZ5L58XEJ483
         WbAteqnicpP0Zuer2/xvAwmuuSwFNG5gsxDeBikBq3aQLrJL0eg4JbL/xK2tU1h6inaq
         929V6CAER1faawHcF5+++77blf2oDoAaUvPDMbIOhtt90wE/yOOmcRmiLjXzE8lYHj7E
         17xSEotBGfQDuwbeT4LEiHLEjHgc7R0TaETHfR/3/fFkGNR4isvSF8V38Fqd5+xSiRWY
         HV1n3UovxBxurofpQgFqKops6NYOkGxHfylUH9JCEBFwzUk+HIHGinJlqCaSnXZUu1HF
         te6Q==
X-Gm-Message-State: AOAM532ytADxMo5lPMqKAfiRhM+w7AFsfaZZ4X2ChXMW4vECtrTXB+hu
        +F81O4b9jWfiGDuHzDDQi5CTTJ3MO5VbXGM7uT424PFR
X-Google-Smtp-Source: ABdhPJz4u2gyk5XUiRriePPfm6Svh6JwCdua12mAjhsZRb4vezo2M6oG4xGdKIfaOx1lYHehvGfUhF/xc2ndZQ7WarA=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr28093388wrn.124.1605051247731;
 Tue, 10 Nov 2020 15:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org> <20201110193112.988999-6-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-6-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 18:33:55 -0500
Message-ID: <CADnq5_NWwwPKQZi2kZ9pCXxMq4_qq7u_XHQn6fQZmR+8D18LfQ@mail.gmail.com>
Subject: Re: [PATCH 05/30] drm/radeon/cik: Remove set but unused variable 'mc_shared_chmap'
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

On Tue, Nov 10, 2020 at 2:31 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/cik.c: In function =E2=80=98cik_gpu_init=E2=80=99=
:
>  drivers/gpu/drm/radeon/cik.c:3180:6: warning: variable =E2=80=98mc_share=
d_chmap=E2=80=99 set but not used [-Wunused-but-set-variable]
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
>  drivers/gpu/drm/radeon/cik.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 4494f9122fd91..b94e2e678f255 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -3177,7 +3177,7 @@ static void cik_setup_rb(struct radeon_device *rdev=
,
>  static void cik_gpu_init(struct radeon_device *rdev)
>  {
>         u32 gb_addr_config =3D RREG32(GB_ADDR_CONFIG);
> -       u32 mc_shared_chmap, mc_arb_ramcfg;
> +       u32 mc_arb_ramcfg;
>         u32 hdp_host_path_cntl;
>         u32 tmp;
>         int i, j;
> @@ -3270,7 +3270,7 @@ static void cik_gpu_init(struct radeon_device *rdev=
)
>
>         WREG32(BIF_FB_EN, FB_READ_EN | FB_WRITE_EN);
>
> -       mc_shared_chmap =3D RREG32(MC_SHARED_CHMAP);
> +       RREG32(MC_SHARED_CHMAP);
>         mc_arb_ramcfg =3D RREG32(MC_ARB_RAMCFG);
>
>         rdev->config.cik.num_tile_pipes =3D rdev->config.cik.max_tile_pip=
es;
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
