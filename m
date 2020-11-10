Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150C72AE281
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 23:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732061AbgKJWG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 17:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732031AbgKJWG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 17:06:58 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E06DC0613D1;
        Tue, 10 Nov 2020 14:06:58 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id j7so7132813wrp.3;
        Tue, 10 Nov 2020 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fOBPjcNpz91mCMYtlgOYiEJnJpHJJ7wowgArIUAKBpQ=;
        b=pyUOxBordCoypUr4bkRWCoKGbKwBgSPl6xu5gaWatHcfXzWftuuua4v/W9oleoPJhQ
         4MXaC16vrhJBLJ7T4IZzFCJ1IGPjPuMRNqs6xDLgteZX5CG1j+f1DEirGD0pXlMcsabd
         vwq5iIii4TIM3rvxsptUlZAz5zNCBh5d86aUfJZqwKnwZlQoA9kglclN/XM0xKL+aqyi
         Qbn4vqwjpSoD2Hp6dGoz4J0V5GQzuBlfon0gxyGUXV92KmuwrGgSM16n3dXCKS8AtVZP
         Qw3uk8KGo2CW9YQvNwQDppHcr5MKdvJx06ReeSEF8hIQHar8+aRjAvE79UqoqV00jAZ9
         EpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fOBPjcNpz91mCMYtlgOYiEJnJpHJJ7wowgArIUAKBpQ=;
        b=Uxmar6jq/y9k7mAgIvcPIafICzxeZhjR3CjVo1Sp1qr60x2/Rf6JQxcPis3y5WbJ/W
         tsBtv/rBfqomxrvWq2/nfzzev4ckIDPwKB9nXgYUyh6vO7kJMjMY7iCFyxl80o+7u/bX
         PfaKL5YAZ4O8YBe8gLnMRI/IO8hUtpsTFyEq8bplFbu6JmDve6j5OaBIBnL1pahfFeIC
         /0kxxZrVPP2bJpaskvrAFkLVGSkdS/GLOGjUE92lTLtlXqTsfZbS5H8Lieh8ioyKA6T9
         ZhviI7XhRalrGehIXgsQp6yZEVw00u7zFrvZnZS1akrDZRdiR+A5mlEG0XpHWbt4Ct2W
         y50Q==
X-Gm-Message-State: AOAM533GZTK2rrL+HjAv8lZ61XAgBIYigUrzbd3vygASRTRvgyV9jXGo
        kXP67pA/Ackg5laHzYXJeejC6ZVQAnDcHbpt8iY=
X-Google-Smtp-Source: ABdhPJwp3lXAPU50agZOEqw4doQ3R4tIdinA9SliisR1tkW2IKPNfSZxOF5yGat2GbhQxN0UAuZdd3elAtRyCEiVtJY=
X-Received: by 2002:adf:f246:: with SMTP id b6mr25860054wrp.111.1605046017139;
 Tue, 10 Nov 2020 14:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org> <20201109211855.3340030-4-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-4-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 17:06:46 -0500
Message-ID: <CADnq5_PC1=sxZP2wT-jfeBwObHCRBHOdW4ceEt-2=8PaA3aYzQ@mail.gmail.com>
Subject: Re: [PATCH 03/20] drm/radeon/radeon_fence: Demote some non-conformant
 kernel-doc headers and fix another
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

On Mon, Nov 9, 2020 at 4:19 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/radeon_fence.c:168: warning: Function parameter o=
r member 'wait' not described in 'radeon_fence_check_signaled'
>  drivers/gpu/drm/radeon/radeon_fence.c:168: warning: Function parameter o=
r member 'mode' not described in 'radeon_fence_check_signaled'
>  drivers/gpu/drm/radeon/radeon_fence.c:168: warning: Function parameter o=
r member 'flags' not described in 'radeon_fence_check_signaled'
>  drivers/gpu/drm/radeon/radeon_fence.c:168: warning: Function parameter o=
r member 'key' not described in 'radeon_fence_check_signaled'
>  drivers/gpu/drm/radeon/radeon_fence.c:393: warning: Function parameter o=
r member 'f' not described in 'radeon_fence_enable_signaling'
>  drivers/gpu/drm/radeon/radeon_fence.c:393: warning: Excess function para=
meter 'fence' description in 'radeon_fence_enable_signaling'
>  drivers/gpu/drm/radeon/radeon_fence.c:1010: warning: Function parameter =
or member 'm' not described in 'radeon_debugfs_gpu_reset'
>  drivers/gpu/drm/radeon/radeon_fence.c:1010: warning: Function parameter =
or member 'data' not described in 'radeon_debugfs_gpu_reset'
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

Applied.  Thanks.

Alex

> ---
>  drivers/gpu/drm/radeon/radeon_fence.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/rade=
on/radeon_fence.c
> index 8735bf2bb8b5c..9ee6e599ef83b 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -157,7 +157,7 @@ int radeon_fence_emit(struct radeon_device *rdev,
>         return 0;
>  }
>
> -/**
> +/*
>   * radeon_fence_check_signaled - callback from fence_queue
>   *
>   * this function is called with fence_queue lock held, which is also use=
d
> @@ -383,7 +383,7 @@ static bool radeon_fence_is_signaled(struct dma_fence=
 *f)
>
>  /**
>   * radeon_fence_enable_signaling - enable signalling on fence
> - * @fence: fence
> + * @f: fence
>   *
>   * This function is called with fence_queue lock held, and adds a callba=
ck
>   * to fence_queue that checks if this fence is signaled, and if so it
> @@ -1001,7 +1001,7 @@ static int radeon_debugfs_fence_info(struct seq_fil=
e *m, void *data)
>         return 0;
>  }
>
> -/**
> +/*
>   * radeon_debugfs_gpu_reset - manually trigger a gpu reset
>   *
>   * Manually trigger a gpu reset at the next fence wait.
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
