Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEB52B1069
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 22:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgKLV2z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 16:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgKLV2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 16:28:54 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AF4C0613D1;
        Thu, 12 Nov 2020 13:28:54 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c9so6468664wml.5;
        Thu, 12 Nov 2020 13:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G2BYNuIxlaObS9p75wcHPXenJKV2OHZTqCiRZ3u3/NU=;
        b=MjSmxuzUy3A5nn2fW066uU93yV94ooVSUHoz6odmOf1nsFJ03GGRyLVDJVCSyYOY85
         8u7A1f43k99+/zp9KJUZ2aXt3pkZ1x1fbWRfRDFXLwnOd0EX6W7bfBuG6Ww0CSZQOD5K
         xeM7/Xw2pc+2/ZRW7NKqr3he6CaUEQfzuswJ5vpMnSp0tz3natDcFiqp0DOwAisWXBdt
         AShV7rRe5dbd74S0/maGQK0u88EIwPn/JgtF5Rc0Xy8N2FCLafPZGvKYSWRxzZVYUYdT
         VaTklWmbH8dCI6aK/0sv1qpWkNgSP5u7yc9wmLkaf+yGTYudq1KpsVZFEnrfGDH6K0Ir
         rPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G2BYNuIxlaObS9p75wcHPXenJKV2OHZTqCiRZ3u3/NU=;
        b=i/iGoyfyIjf2dsb9ZFQ2thEEsBDWlYfIOyOlCq/SB+q+rk5HPM47/3rXwjGfxdR6pu
         bD7q7yLg1PMkytykz9it7OdevLoGLmtyl5XJn9ssY5A+sYN4M3Bmx+YlTJdYbodNqgVA
         R/HcmbavJ+ZrU23c/FPXEEltzuBVjs4hsVb7jTQQIznO5Pmezo/4ispwU0FlzPcZutQw
         u9Lm7h4mTa9iQfTZs/pjqWsrhQZLxJ4kqzCWdznMZAR5tEHLYrLBLIOC++i8Xv5vgdNL
         i+pQox5uWcLti1MGzPZ+ySDg1GcqacriiaXKmEe8XfscdS0MWbg3Pvl2Pd9JzaRW/xX2
         2trw==
X-Gm-Message-State: AOAM5306ZAJwUZmj+U6LgOtO0BJqubbJSzvEkLbmzJ/VbyJ8xeSHRV61
        IASs7uKyycrohwaEvq42H9fmIJszOQKr37ETrGU=
X-Google-Smtp-Source: ABdhPJwACnsJDr0htDUIcZ1390M+ztGM6mHPEVrjB75T5GqTdIpxllFizlL3nKTN1oMXRIMVR4CpDhPQIZX/zXW37Sk=
X-Received: by 2002:a1c:8150:: with SMTP id c77mr1687617wmd.26.1605216522204;
 Thu, 12 Nov 2020 13:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org> <20201112190039.2785914-20-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-20-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 12 Nov 2020 16:28:30 -0500
Message-ID: <CADnq5_Pu0v=JHsRnB_M1OJNqKOZT0otcU1GCtif12GnKt4ArAg@mail.gmail.com>
Subject: Re: [PATCH 19/30] drm/amd/amdgpu/amdgpu_cs: Add a couple of missing
 function param descriptions
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 2:07 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:685: warning: Function parameter =
or member 'backoff' not described in 'amdgpu_cs_parser_fini'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1655: warning: Function parameter=
 or member 'map' not described in 'amdgpu_cs_find_mapping'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 8d2878e950dab..594a0108e90fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -676,6 +676,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_pars=
er *p)
>   * cs_parser_fini() - clean parser states
>   * @parser:    parser structure holding parsing context.
>   * @error:     error number
> + * @backoff:   indicator to backoff the reservation
>   *
>   * If error is set than unvalidate buffer, otherwise just free memory
>   * used by parsing context.
> @@ -1644,6 +1645,7 @@ int amdgpu_cs_wait_fences_ioctl(struct drm_device *=
dev, void *data,
>   * @parser: command submission parser context
>   * @addr: VM address
>   * @bo: resulting BO of the mapping found
> + * @map: Placeholder to return found BO mapping
>   *
>   * Search the buffer objects in the command submission context for a cer=
tain
>   * virtual memory address. Returns allocation structure when found, NULL
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
