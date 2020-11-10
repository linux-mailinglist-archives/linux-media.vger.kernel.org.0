Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575AF2AE38F
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 23:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732053AbgKJWoa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 17:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729862AbgKJWo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 17:44:29 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F01C0613D1;
        Tue, 10 Nov 2020 14:44:29 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p19so2932813wmg.0;
        Tue, 10 Nov 2020 14:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E8qX2MyVZaqXQ+DgMT6o987ZTOdf//JmBCbI5n7zhSQ=;
        b=Ys17rDAvK5FQ0Xs5tOKEHRGISTxIGFvOjmkoOg/JNz2X+74JlvM1dOrZgTBwiNYfcQ
         2hoCs/q9TDiiYxiX9IwHSb17MnQFM5/rQuZ8e/SKaq1KnaHyQqgVkRq9GkT/WMzmkZe8
         knYuda3gHotlw5kbg9nkPonbd2g2Y/A7PnO130BgpNBPmAA16ggB7pmGRsetmHLe4Hjk
         6euQ8eCWSRwXnypAPMoKIzT7uCHqhHEHxQGwuGrpPcB9N93OmoEne4WJGc3KJLh8rVgo
         9mLOyWiMU40cem64UXH8UBG5Pm95dFY1Gka3j+xIic50TNwxXWOQSG9/vaHiAO9wOVtl
         rDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E8qX2MyVZaqXQ+DgMT6o987ZTOdf//JmBCbI5n7zhSQ=;
        b=QQSlUgDWRl4ncdRFLwXjBvF+sOkDToRxq+3KT6IVy0jP0Tg4STw9ueMzdtUfWpFlk4
         0fuc0F8ONOajP82KEnT6VcEHK0WRRnVJ2TRPtbYPARH7bPZBzBCxcSPRGUfB8Cxr/bFV
         9p01pTlCN3UzsFu5i3+r2rEM98EvquiCpl0xG6BcQJ0R/fdqsBUnrT1TLvADKsBXHtal
         QovEQApSpUguc/2X8Im360TR6U7Z6ORBMBNN2xKs+kMwZ/cORdjtZrv6DvLhnJQWp0RD
         0zPVeYbdemH0uVxkNlOnlUhhUFNtgdbeq7jEbnJdNJei5Zamdq5Lhx2A3TbIUU5UhGKD
         Twvg==
X-Gm-Message-State: AOAM5320Z1UgD9JKYgxY+8A+37uSnL09rCGvY5WcP2eS/bTm8PMoDChJ
        WW473ZDfmSRW1uJ/xh44GQFWZskqWzzjWujLs9nL6C9Y
X-Google-Smtp-Source: ABdhPJxyXIebVjU1Atrqpua5dtKDirjyc52NSZc98ZTYE/FsuzlcpOtT7sy7zRJi6WqQkhI2fsPC6nxReuER6O7+2vE=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr350988wmb.39.1605048267737;
 Tue, 10 Nov 2020 14:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org> <20201109211855.3340030-19-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-19-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 17:44:16 -0500
Message-ID: <CADnq5_Mbqj1pFvekssqP3L_gW7fZxiVDD1Ux5K6xZ06_bzXcsg@mail.gmail.com>
Subject: Re: [PATCH 18/20] drm/radeon/radeon_display: Fix function doc
 formatting and missing param issues
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
>  drivers/gpu/drm/radeon/radeon_display.c:264: warning: Function parameter=
 or member '__work' not described in 'radeon_unpin_work_func'
>  drivers/gpu/drm/radeon/radeon_display.c:406: warning: Function parameter=
 or member '__work' not described in 'radeon_flip_work_func'
>  drivers/gpu/drm/radeon/radeon_display.c:956: warning: Function parameter=
 or member 'freq' not described in 'radeon_compute_pll_avivo'
>  drivers/gpu/drm/radeon/radeon_display.c:956: warning: Function parameter=
 or member 'fb_div_p' not described in 'radeon_compute_pll_avivo'
>  drivers/gpu/drm/radeon/radeon_display.c:956: warning: Function parameter=
 or member 'frac_fb_div_p' not described in 'radeon_compute_pll_avivo'
>  drivers/gpu/drm/radeon/radeon_display.c:956: warning: Function parameter=
 or member 'ref_div_p' not described in 'radeon_compute_pll_avivo'
>  drivers/gpu/drm/radeon/radeon_display.c:956: warning: Function parameter=
 or member 'post_div_p' not described in 'radeon_compute_pll_avivo'
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

Applied.  Thanks,

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_display.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/ra=
deon/radeon_display.c
> index 78fceedfd9255..eb0d4cb95f0a6 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -256,7 +256,7 @@ static void radeon_crtc_destroy(struct drm_crtc *crtc=
)
>  /**
>   * radeon_unpin_work_func - unpin old buffer object
>   *
> - * @__work - kernel work item
> + * @__work: kernel work item
>   *
>   * Unpin the old frame buffer object outside of the interrupt handler
>   */
> @@ -398,7 +398,7 @@ void radeon_crtc_handle_flip(struct radeon_device *rd=
ev, int crtc_id)
>  /**
>   * radeon_flip_work_func - page flip framebuffer
>   *
> - * @work - kernel work item
> + * @__work: kernel work item
>   *
>   * Wait for the buffer object to become idle and do the actual page flip
>   */
> @@ -937,11 +937,12 @@ static void avivo_get_fb_ref_div(unsigned nom, unsi=
gned den, unsigned post_div,
>   * radeon_compute_pll_avivo - compute PLL paramaters
>   *
>   * @pll: information about the PLL
> + * @freq: target frequency
>   * @dot_clock_p: resulting pixel clock
> - * fb_div_p: resulting feedback divider
> - * frac_fb_div_p: fractional part of the feedback divider
> - * ref_div_p: resulting reference divider
> - * post_div_p: resulting reference divider
> + * @fb_div_p: resulting feedback divider
> + * @frac_fb_div_p: fractional part of the feedback divider
> + * @ref_div_p: resulting reference divider
> + * @post_div_p: resulting reference divider
>   *
>   * Try to calculate the PLL parameters to generate the given frequency:
>   * dot_clock =3D (ref_freq * feedback_div) / (ref_div * post_div)
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
