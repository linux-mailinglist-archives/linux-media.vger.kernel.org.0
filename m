Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653A23319D8
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 22:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhCHV5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 16:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhCHV5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 16:57:16 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1AAC06174A;
        Mon,  8 Mar 2021 13:57:16 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id f33so10758719otf.11;
        Mon, 08 Mar 2021 13:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vBWk93dB6A/oALjtzEiM8cCSb4V0wTNQU+avL5sjbpk=;
        b=jPEr12eJOevKFdEXIwQnNzZdbudcLEhlPf1DMoP45Rvwfl4BFXV0YotJ1gHKiUIdX7
         9xK/3dLI7ddnG97S64MUx2d6PPQ8pF9v3/Jd3GiOC4TP4VcjcvnXU2FcUuM2HZ0qIkId
         BIkQphCez5RhIb7n98loEBPfAz/5YTKR5+m6FIUrAmTbFUV+JEap3K8RjOZQTYGekYZz
         f5W0jvlQZUi2f24LdRkHtO9MpNxTwTsZqv89uCD0Vpv2dd3bdQDA7h2gsAeTv+TYASYH
         gK+u/zdG2jqKUi8K9PmF/9jCGLqm9tN2KqDNcu0AODBNjdYbqthX9uWRFhK7ioT+EeSA
         +eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vBWk93dB6A/oALjtzEiM8cCSb4V0wTNQU+avL5sjbpk=;
        b=oLJYh8vxuz8Z4m7pX49fZPgosI5d7Ht+8pKVdqYCigM2kImDoXNZsNblyiWYlNUP8l
         qY53NF8GQEo1A8o/Ww6ohAsPcf8Kljgkc6Sn0rDAzuX1n8WKSeoEzg0MW0ccyDF1P1yY
         sSiamxB3NwlBdpuDHI22YY3YZ+jPkof1AzNjPgetOkGD20DwsaQ4f9p8O5e73XPZGoew
         pQEDP067++muGqwkqRCtjJ5yT03TkrTEF3+6fzIBrfvh5Ihut+QGWJzFq9bDYw4zJNvD
         eJnEToD3FdIRNcaj1S/L26TnGgt+RfmWnJl5XjFK0qnYcVI2ZCWkWXt8eeTf8VMDETv2
         KTmw==
X-Gm-Message-State: AOAM531cJubBDFz/t6yO/3ahO0bIyfh4mGpm689D0lrcMsIhspmGotcK
        GwTJKWhXqUGTvoYnYz5Jj3FNda13Riu499of80w=
X-Google-Smtp-Source: ABdhPJxrYC5b+Bfy28dEBHW3FjF2qWGh0W9dW/P/7CoZ3wnlKV8yAc+scjpfhvvVoKtqiq7I17x9HGjyMxBJB0BvS80=
X-Received: by 2002:a05:6830:408f:: with SMTP id x15mr22421343ott.132.1615240635925;
 Mon, 08 Mar 2021 13:57:15 -0800 (PST)
MIME-Version: 1.0
References: <1615173254-22078-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1615173254-22078-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 8 Mar 2021 16:57:05 -0500
Message-ID: <CADnq5_NeAv5HeD=whn30Yu1hoMW2XfPxjeN53b995AzXOY1-dw@mail.gmail.com>
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

On Sun, Mar 7, 2021 at 10:14 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1600:40-45: WARNING: conversion
> to bool not needed here.
>
> ./drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1598:40-45: WARNING: conversion
> to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

This patch was already applied.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 690a509..b39e7db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -1595,9 +1595,9 @@ static int sdma_v5_2_set_clockgating_state(void *handle,
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
