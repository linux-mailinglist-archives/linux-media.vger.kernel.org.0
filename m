Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E5038F33A
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 20:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbhEXSuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 14:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhEXSuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 14:50:35 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEAB7C061574;
        Mon, 24 May 2021 11:49:06 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id u11so27946709oiv.1;
        Mon, 24 May 2021 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYnEhzkp1dbbf9fIGVRRORFDdaTodcnnOdSTVqP9m0o=;
        b=J3EkV+L9cKqEC9dducGQe+dlBDeMynfnUMq+roxzZEzKLRGNcT56FSxo8Ei5FeMx9C
         5OeCXpu0A4JO9WW4UhE3RpEM26Ari6+3g4EcsBxkChmBIzewPsSA9EBS2SLG5QaR27f+
         wj6/1NBybMiWJZwBBPkUyzliWdjaSUvZDPHlcEiMBw9DeugmzMAcZUBbM6sF7CsYghl/
         ghnzS0dH/qs9krdIbeCr+R2u00qPaEQ8aM5DeVSD/u0sD5nyJUNQ/Iw5a4taqbyDdoT2
         05GQday22Hv7KDHRrMyHlo9lWGmOaEKIDUdPmh4JIjhM1gjsq/IT7F70IZF1gH2nTYTV
         v+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYnEhzkp1dbbf9fIGVRRORFDdaTodcnnOdSTVqP9m0o=;
        b=Ab9wGhSIAvtkdvCkS0bb92QpWR8ciHVmHw/6NRov27etJK38haEFOU2dxHjt9TUcV7
         9QT29L04ztPx28tITuCxzC49927YFZMIydHGOMiGI0N7VhI8nS1miPXv9vUyWtzoasuk
         dRn5ZnDAq/ZdXuqrsQ/qiiJYV2J03cm4kN/NwtyaIuWvSqbnXuUzPtdRvaH8Zd1kQNAz
         yBphWjhJy4uA8YUHhm+kk33ixzqwUwcjAihIV6788rXWa7OgrZGLIySanKqu1IMsPjAG
         h1GFZGHVmi3hdJIjqm+XPSfMJMczP//e9Y4yTqm5OOW6+VTKc1gZm0ci0ErVuV/LyfaU
         g3NQ==
X-Gm-Message-State: AOAM5339ZeceYgyP6lCSCbYCZV4/ksEE63vSHGMPPsyc4NM+iE2/5BfQ
        buxbBkS8ENN/rP+nPSf1DrE1uJ67wzFt1Wi8Tfc=
X-Google-Smtp-Source: ABdhPJwVX9evJqZgQ8DoevhP5UkPf9wyiPN6kdoDCnSMac0ZTswKiitlAwMr0DjZ60GMh/dFVtX2UO7EU+ZEJZcSc34=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr329581oie.5.1621882146073;
 Mon, 24 May 2021 11:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1621853213-55876-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 24 May 2021 14:48:55 -0400
Message-ID: <CADnq5_N3WkoYHcn8b1-qZ23+t=E9xxV5fV_1Lwqck6x2dUPqmA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unreachable code
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

On Mon, May 24, 2021 at 6:47 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> In the function amdgpu_uvd_cs_msg(), every branch in the switch
> statement will have a return, so the code below the switch statement
> will not be executed.
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:845 amdgpu_uvd_cs_msg() warn:
> ignoring unreachable code.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 82f0542..375b346 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -842,8 +842,6 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>                 DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>                 return -EINVAL;
>         }
> -       BUG();
> -       return -EINVAL;
>  }
>
>  /**
> --
> 1.8.3.1
>
