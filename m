Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECE02AE29A
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 23:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731746AbgKJWJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 17:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731558AbgKJWJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 17:09:58 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEE4C0613D1;
        Tue, 10 Nov 2020 14:09:58 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id c17so14386416wrc.11;
        Tue, 10 Nov 2020 14:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YcAOS59prb8VFAixQsta0ytgU5jtgd3crgL2WI0lqHU=;
        b=kUOTnCoLAeRSmj0UAOAE3+x2hPe/pDX+HPK7mpEEd9IDCAcZFkmJZOQhHgqvYPgXUc
         IlSEjlANGEGWeeYj96Euc12mtNhmrKnraPANYRx+MCzRIXS1IvrH0EUUp3yLtwoRn6cl
         UYrnyT43isSnVbWjXwWIwYvexHUJwlUlZwRp/oJvJHsdhQJ004txOeefHQZ7DL6DsJFF
         oB2lORCdBLNERQX3xWfQhTbd3T/cKNsqEqhPfibVli/J44Bqy9teCuxyEfAvw/dUgCaq
         GcEZMk13pOvzoKszmKYGacw+47l1rlLVD2lTqt/BjjfzeeM9obi97YZxxQI4FQjihPS0
         C0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YcAOS59prb8VFAixQsta0ytgU5jtgd3crgL2WI0lqHU=;
        b=TRGZdViqYvVKet0WFEvBm3t3rsn0uK6xFfwmuoT3dR/FDqzhsICD7YMjZsufEr/MqH
         tgnbM4bAPBcbN4zIZEDD5+1fMNR12JyNbm6hHVYJP52O3UcyJz+Xtm750TOG/tVk0qXk
         K50GAJYFbTttPIbuSATGPmiZEgxZqcV1QPlbEKg6L7ew2DveokbX92PV3gu6tcbuqrM3
         p4oNa9f9WUEh+mRrFieY62Lb1W3gTlIEixa9JMeqTtgB5HUvmO25wdfvTz0ibfwEUNjA
         W2jIjAQOGzlaxK9jw4h5DupilwbTqIxLjGfAK8iE6ekVZ3h2SXT7hRY79ldto+Ysy9jc
         AE7g==
X-Gm-Message-State: AOAM530GWtyHbavj8gxVCnv7OX0hd83eqPCicV1LPhKOoPBbhGSyVcz4
        yzEAOZfhKB56Ocfo0l+JbsR6DQpKXg784cuqJ1Q=
X-Google-Smtp-Source: ABdhPJzYq8S8HxJ8eUtKIYm1d5SwL0ef0M3FjeAuSs+qo8BL/c4huOEldmmpwCCzireXzEYfm4tAWkHJxsxcP323JV8=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27789872wrn.124.1605046197171;
 Tue, 10 Nov 2020 14:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org> <20201109211855.3340030-8-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-8-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 17:09:46 -0500
Message-ID: <CADnq5_Py-VzeGQMzzGZAO=9OqeniBiXT8625YRcTjVe+bRSNSw@mail.gmail.com>
Subject: Re: [PATCH 07/20] drm/radeon/radeon_display: Remove unused variable 'mod'
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
        report to <xorg-driver-ati@lists.x.org>,
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
>  drivers/gpu/drm/radeon/radeon_display.c: In function =E2=80=98radeon_div=
=E2=80=99:
>  drivers/gpu/drm/radeon/radeon_display.c:1094:11: warning: variable =E2=
=80=98mod=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: report to <xorg-driver-ati@lists.x.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_display.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/ra=
deon/radeon_display.c
> index bd60f16fd0d78..78fceedfd9255 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1091,11 +1091,9 @@ void radeon_compute_pll_avivo(struct radeon_pll *p=
ll,
>  /* pre-avivo */
>  static inline uint32_t radeon_div(uint64_t n, uint32_t d)
>  {
> -       uint64_t mod;
> -
>         n +=3D d / 2;
>
> -       mod =3D do_div(n, d);
> +       do_div(n, d);
>         return n;
>  }
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
