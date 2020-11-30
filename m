Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6B52C90C7
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388650AbgK3WO0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:14:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgK3WOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:14:25 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD5BC0613CF;
        Mon, 30 Nov 2020 14:13:45 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id y74so15942261oia.11;
        Mon, 30 Nov 2020 14:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L/eAhlrFrC0aLBaVHXix7LDhxFtZN4hZd7odpTZYr7A=;
        b=BIMkuHqMJhJmDttmx2+W1lq+T5dcIEylJKP8B/FkUBjdGgi1YwEXE1sYZKgLiLL/3Q
         Awv+ATOcPyjfonC/7u21ojHdHjaLcLEq4a+zFHlIZ2J0DaHL7W/s/7qs6LFqqt4fDX4z
         MU1z6y2Hav1ORRzTxEAeFeRUhI4Xv9StwvDCi4RukMabEijUOtCJoQc6rlxqxrlF/M5b
         EkA2iTt577mPj/J/DbTyUtsxugwimR53x0TukoGSyoUAcl7L5MbJWNyc5L9A/alBK7np
         P8TebOWbUgoXxxX8gSnFuObO93pPnNKdFJJ1dhLgjrOLuXt8Yv/bor+rV+MriEnseR2F
         DpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L/eAhlrFrC0aLBaVHXix7LDhxFtZN4hZd7odpTZYr7A=;
        b=jYFYU2rzMn0fL+WeoefOXv1H6FwHOM4uUt+Gk210yiyNIxF9vSbWvxqsMD3EXyt80b
         ba7dkuCxmc92NDkNnJmuHupa7dk6zVVpNmaH+NxVfKSBDqskCB/xI8B55LZT6q4DT7/M
         381NeVZhGiVfywr0UkhaIHM/oarUA9mJGv7Ov+mLphpkl0eP2zbc+8/inFBuBcBtgER3
         M+18krXWICnMywmQfp6mSW45Um1RZO0QmK/0QG+kEoDkLWxEY8mG8+OFACwlBkRjN1RN
         zZ/HLwPuQcjULgKUDAtMzjz7MzBS+EhSoF0IgEf47m4G6Wd62NnzPt9AOxzSXag5yFgO
         99Vg==
X-Gm-Message-State: AOAM5325Af4ybKwoZl4Vli68QAAAfLepfhMASE+kJ8oL5A/2aApLFCu3
        oCqFyqd4Ljs7MEcULqBPhs35D5OQsEWFagwcdhU3nqUp
X-Google-Smtp-Source: ABdhPJwYSpWAlUBLg6XI9B/pUa0ka9+f8AD8sh170wW7+G93V9dlfFIjsDFizRrGIiynDPRd7VFsT/ZG5B9HTd5Ci6w=
X-Received: by 2002:a54:4608:: with SMTP id p8mr886432oip.5.1606774424807;
 Mon, 30 Nov 2020 14:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-15-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-15-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:13:33 -0500
Message-ID: <CADnq5_OfOaxiB1uOVLFni72-GZLBChxtng18kxUvyOMOZsxF-A@mail.gmail.com>
Subject: Re: [PATCH 14/40] drm/amd/amdgpu/gfx_v9_0: Make called-by-reference
 only function static
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

On Tue, Nov 24, 2020 at 2:45 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:2998:6: warning: no previous proto=
type for =E2=80=98gfx_v9_0_rlc_stop=E2=80=99 [-Wmissing-prototypes]
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_0.c
> index 8a6c050cb6caf..eae81fc412556 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -2995,7 +2995,7 @@ static void gfx_v9_0_init_pg(struct amdgpu_device *=
adev)
>         }
>  }
>
> -void gfx_v9_0_rlc_stop(struct amdgpu_device *adev)
> +static void gfx_v9_0_rlc_stop(struct amdgpu_device *adev)
>  {
>         WREG32_FIELD15(GC, 0, RLC_CNTL, RLC_ENABLE_F32, 0);
>         gfx_v9_0_enable_gui_idle_interrupt(adev, false);
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
