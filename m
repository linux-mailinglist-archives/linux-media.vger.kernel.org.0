Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0B0215B6A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 18:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729438AbgGFQGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 12:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgGFQGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 12:06:48 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57161C061755;
        Mon,  6 Jul 2020 09:06:48 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b6so41632453wrs.11;
        Mon, 06 Jul 2020 09:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xCr/E2UfpfNx/3DS3JnlJgbuc+JNeFMMCFYGgSgWR/I=;
        b=mlqIbKZzvsR8H7X+H3bWpRjyAvsFIRS7m9r+3QwodLOn4YLUv8Iv41WHDpQB5yUkhe
         rvARNPXNxp2vv0Cui6XM1E9maK1sklAJEpEQYTy72veFM3wieR6hrtR1tUDo2xLwZvjX
         ApuE7mzTEliYkyWYR1gYrHsrGR552XeqmKHOQ2BT2RvjgrY7m0/LKar0xOLch/1pRJ80
         j6dqdSzcTHkQR0kQqPfa0K7VP08nUDsNHt18Vm7MnRMcP+GF1884ivyrWt8omJ0XxImN
         uZIDaAt25iNtHSywPtSpQMhz7fDCIJ+/Of/um4AV0s87aOoofiK5pXTZe/WRl/Sg/6Ck
         5sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xCr/E2UfpfNx/3DS3JnlJgbuc+JNeFMMCFYGgSgWR/I=;
        b=JRWtIFt+i9/mhJ09wv5V9gpuci8nPEclJW/Hhm/+rW5FMLxlv7t142IVggbvxvxbTP
         uhEzN8hy/cHnr8IsOkaOkswhFPyt572sS9nFNvw9qYJMhQA7ycoc3EAxSO+kgeU81CIE
         5S5yoK2bnIJPgpYnVGHbvV//HvX32NKIiSCxn+8JiKr9ea8AXv2y18E7yo0uzclgLgbh
         s/QrLBvaq+uWYDGZ1Q1Bn1Gg349jk125vA+vERrCLBKEDGRZzQvQ5fE7Gdrt1V7sxY7n
         ZhHweyf8JF6x/Is/ODEGg7Nh11zPP+HpMXgmsiicC3YykzCZa8T7kfdRbhI9iZuPqY0H
         vI9Q==
X-Gm-Message-State: AOAM5331BX9z8r0LH6B8hHmcge0CQ3Aqbm4itQNh/h8TwwHccUezRXlc
        R5JX4SuVYuoPZMESd9EIZ76BS1UAMvlF/0OgDCQ=
X-Google-Smtp-Source: ABdhPJxdm0SXjqdvnZSqVXcNs0zZL+fxT8CbYJGVE6ad2dBa9So/9NH/7pLse8Fajv9YZRRN3Dtr8tqXQjjPfoZIRfs=
X-Received: by 2002:adf:fa89:: with SMTP id h9mr48658791wrr.120.1594051607057;
 Mon, 06 Jul 2020 09:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200702015552.42377-1-yuehaibing@huawei.com>
In-Reply-To: <20200702015552.42377-1-yuehaibing@huawei.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 6 Jul 2020 12:06:36 -0400
Message-ID: <CADnq5_M35jhfPDCGaYxYBxMcptVJjcXw5qSy-PLTh0Z8vjSFZA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variable 'adev'
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        tiancyin <tianci.yin@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
        Likun Gao <Likun.Gao@amd.com>,
        "Kuehling, Felix" <Felix.Kuehling@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        kernel-janitors@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 2, 2020 at 3:25 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_init_mem_type':
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:81:24: warning:
>  variable 'adev' set but not used [-Wunused-but-set-variable]
>   struct amdgpu_device *adev;
>                         ^
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

With our current -next tree, this patch is no longer applicable.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index bb95627ad2cc..8199702d3354 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -78,10 +78,6 @@
>  static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
>                                 struct ttm_mem_type_manager *man)
>  {
> -       struct amdgpu_device *adev;
> -
> -       adev = amdgpu_ttm_adev(bdev);
> -
>         switch (type) {
>         case TTM_PL_SYSTEM:
>                 /* System memory */
>
>
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
