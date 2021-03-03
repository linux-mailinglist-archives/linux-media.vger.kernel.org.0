Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D9132C749
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343715AbhCDAbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244846AbhCCO7G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 09:59:06 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00B6C0613E3;
        Wed,  3 Mar 2021 06:57:25 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id x10so5748623oor.3;
        Wed, 03 Mar 2021 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qt5wXwklMsm6s5Zb+eD9YN9oX2rhIgEmQ1SsEPhvWyc=;
        b=nVMMGUMobAMEySPNKmp/GvwtfCn8twa9qGl3V2/yBfUPYitFWdp/2Ulqi+3lBJV7jk
         FFrhkBwRkcUxEzdMjR0W52HDWRRBo96sj9s4REwN5U6mknHKvkvGlucquRTtQFIqEsCq
         N+auS/TTDoqNWo4tbTMBdHRC6oIr7hbdFe0fY+D/2LwAK3RL9SSU7SHPDCJlyphKjbEy
         1X1eOMKNy2z7Jzb2DyxS3Mh1xRsTyBtxhDYLQ98WQtLZq0eYPZwPmE1JJkKfpmVRytoC
         O9eDVSxANWIvF8tjvL6P6LxkF32Lba6EwwdVCk6dVlfxcnA3X3JNIOQqBK/ID71yZRjZ
         nzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qt5wXwklMsm6s5Zb+eD9YN9oX2rhIgEmQ1SsEPhvWyc=;
        b=OdcJ/9ObL00ql/iSd9RZtqLcxJSnaGcb95+mwlHb9HrVL8dqnk5SwgqHFyLO9Gliku
         CksOa4/xc/AyDLSAP9RPU7WMRnn93+qtm0SsLZ68fijHgItVSUXoq7og+B5rov9YOwcW
         qZZA3Tw6B67y7cm17kM+YBrurmHftDIXY40Jj17+CQMDMXUTrKbM+KrTLd2mGpIOT9DZ
         PiEZvz0UWnHgirCUxS9auou781CdiJdE+0VtabdSMc8PIWoKag1jykhhGFeZfXtNFBv+
         1p5F+v0U+3rP0g9s9IPLZFelC9LWdqeD+tAkSuntRWcvs/8VZ709USoNzKfURdqHjHFu
         uHXA==
X-Gm-Message-State: AOAM5327n/jfpWCPpYcrWkyS5nB9QMa+XfEinvCRjbNGWcYFxMAG2Qop
        jstmsgmd8emtzJO/evBooIZV0FmEk2XMmdBLwSQ=
X-Google-Smtp-Source: ABdhPJxCv+I6j1jzZfjyYLdp+mYWLwPR3jdJK2Nb20n18ezv35ZR6OF8qMWWIVzO/17rhWFlEGpY/BRJoE8Bt7mhc8c=
X-Received: by 2002:a4a:88ee:: with SMTP id q43mr21478044ooh.61.1614783445212;
 Wed, 03 Mar 2021 06:57:25 -0800 (PST)
MIME-Version: 1.0
References: <1614763065-114245-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1614763065-114245-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 3 Mar 2021 09:57:13 -0500
Message-ID: <CADnq5_OXuJbZpaaW7m+skg9zgdS5Buwi6ANSttz41yjBP+HxLQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove unnecessary conversion to bool
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

On Wed, Mar 3, 2021 at 4:18 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2252:40-45: WARNING: conversion
> to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index c8c22c1..00d3773 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2249,7 +2249,7 @@ static int sdma_v4_0_set_powergating_state(void *handle,
>         case CHIP_RAVEN:
>         case CHIP_RENOIR:
>                 sdma_v4_1_update_power_gating(adev,
> -                               state == AMD_PG_STATE_GATE ? true : false);
> +                               state == AMD_PG_STATE_GATE);
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
