Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC953221B1
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 22:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhBVVnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 16:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbhBVVnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 16:43:04 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E27C061574;
        Mon, 22 Feb 2021 13:42:24 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id j1so3625555oiw.3;
        Mon, 22 Feb 2021 13:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dhUE+BTyH6wr+/ARgGP1BN/9HRGnBQw8k+/gXIcdf18=;
        b=gXpXfWLtRd8OhqYCVObAF80z+Z9L3DgNYOXxh71eUxW8XtXwJo9yWZZPNkv7hUeRDM
         cvv0M0uar+jrYvY1VF9/ECl5v2SxQI/0yy63bkWs1ClHqiVyGLAnEZhc6UgOsAd5EIQs
         9YnHIDzrcvwpVmJgDEyax6WNyK/QYF0/YY3EBYl+K574RIkHb2leAa6I+ks+nlFq2+6d
         DWenUQ/Y0Qd1ecoVksVXxytUE/yoJo41ZVkmMifRXJRgMeQ0ZTRTFW6Ao0NOR85LDWOr
         MtaR3OYxw3NRTrOsnyJ2Tu1NY1DySmTbeVA1lqX/oL2viu3jNk37FuMX1YnZmL87nMxj
         hV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhUE+BTyH6wr+/ARgGP1BN/9HRGnBQw8k+/gXIcdf18=;
        b=nLzYo6c0XksZft7gGfNs0NN86x12v+T/e5A6y1DMiIwAFU0kRXBIkzAu7AObwvy4/p
         fim3cbGTY92PUo9d0763FdC6xfain+xDoygSpdUgj8j+AFGVHl9MPy/hzvNncS38GeUN
         6MKUy7SZ9hhi5G9pKV7G5MLIlard0oRniC9gNtJbrWPcNaWis5fzN1qCnHH2w7Zf0NJA
         WvpzrpZdslGxQob+xRbPBjP+skSs9F1ORJpRGBFvCa3ZmzGYSijUPo3fT3RyxfC0GDIG
         byGmPF99taRqfkpDl8yC5IbNM/FIWBXzsqokYz/pdkSJHj/oqiHbYZJPexKOtjdtiwb8
         minQ==
X-Gm-Message-State: AOAM53285Ev6Q6bTJIiT47ZXg+02L3zqwRXWCfukCy/7B67gRzkPi1CD
        dJ23uWkAfk0aOb/j9pmWYiy8X4XDSCAzNy5Z0Co=
X-Google-Smtp-Source: ABdhPJzfn71SCwifR8WX+lGVU6vR4TxYHBxjwhj+i0lE4Rz9jlSnoSrSHzTX8keOZeXzlF+kiI3NxJkcunNeDOVGPzE=
X-Received: by 2002:aca:f485:: with SMTP id s127mr4991211oih.120.1614030143812;
 Mon, 22 Feb 2021 13:42:23 -0800 (PST)
MIME-Version: 1.0
References: <1613810110-106402-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1613810110-106402-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 22 Feb 2021 16:42:12 -0500
Message-ID: <CADnq5_OS3KNQU1QWP=0Y8U0hDSf6uL087wj=prLQQrOf6DZYeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/sdma5.2: Remove unnecessary conversion to bool
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     "Deucher, Alexander" <alexander.deucher@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

Alex

On Sat, Feb 20, 2021 at 3:35 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1621:40-45: WARNING: conversion
> to bool not needed here.
>
> ./drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1619:40-45: WARNING: conversion
> to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index f1ba36a..9ed79a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -1616,9 +1616,9 @@ static int sdma_v5_2_set_clockgating_state(void *handle,
>         case CHIP_VANGOGH:
>         case CHIP_DIMGREY_CAVEFISH:
>                 sdma_v5_2_update_medium_grain_clock_gating(adev,
> -                               state == AMD_CG_STATE_GATE ? true : false);
> +                               state == AMD_CG_STATE_GATE);
>                 sdma_v5_2_update_medium_grain_light_sleep(adev,
> -                               state == AMD_CG_STATE_GATE ? true : false);
> +                               state == AMD_CG_STATE_GATE);
>                 break;
>         default:
>                 break;
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
