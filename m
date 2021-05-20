Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CB938B77B
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234170AbhETT03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbhETT00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:26:26 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC025C061574;
        Thu, 20 May 2021 12:25:04 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id u11so17446879oiv.1;
        Thu, 20 May 2021 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lVeE6IXTSZq52YIMiJlL2kagzPEUqCZI6X+G12sjjFk=;
        b=NppzDjpIoyI0AJgaBtwTYOMbeW6j7IM2/FKF5wmpjpVAf4XOhG1i+aZmXpKAYWmrEZ
         QWZu3sRp244vQJASQrXoVgkbhZuCUAaCF6K7KeYAl3q3jfA6FFjH+Iov8R72ZT+bT+np
         xHilSrgDF4womkZkKuDJEbZwxHL6nvz/aBrqYIdcJUuue2K+fqt4216E4zwAsVwffm9N
         0HNP7n+XXlKXVG8UjfrGU6/bH+2Jw2Sl7hjQw7Y6fhmOJz0Vms9S9GCRJEvOQ1MP2/bp
         sYANxZ5PRJ4jVNRVha7NGZFm9xcZ3PDPiOo/1nhCvjvP9Bq0yA9qx27hNa2Nm3usoL4e
         SsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lVeE6IXTSZq52YIMiJlL2kagzPEUqCZI6X+G12sjjFk=;
        b=KF3jg2EKGEbR5QkivZoVT8xPSwV2V/55x+1rPCXxRHDNNb3PDiVHfoU1dyF6co+p3F
         4h27rFg/8J2FqPTO6UYHvXgRa3mOPel7zXur0nLmFDlGkU/YZAzjHYxRvGKc+iKurwZ5
         Bu6MLM+1lugm9WJlyY+1QK8fFFKd+e9z8etdYRGtF8iaaIAmJjFx2yTJLbIh+3kuxZEu
         14TGjlxO2Jwt/9a1wXkMspz5c7ndIfirXN/GhnygyX1IIfXAd6MuB+ky4Z9R+o9B6BOE
         kKylKC0j6/Ly9vNvFhWB+QJcjxu6EH24/yn98ozELMqRVZ1oy4DFlOZ8a4wnJiW/bqum
         mc6g==
X-Gm-Message-State: AOAM531sMpkaQ2Gs/SPa5lxHrt26K4j6w02fGcivACWSl8j21RKQ08BW
        vfuiKjGNwMEjqzTZ0ttupCtiqPEFKpLVRRH5LgA=
X-Google-Smtp-Source: ABdhPJwUTj/6hABxGzsumBBPCdBSvbVvUey+E+MnywXwN4uKu+7momw2GO2WmgYigcRZgt26sng4UQTTieCnXeyCtKo=
X-Received: by 2002:a05:6808:1592:: with SMTP id t18mr2494803oiw.123.1621538704376;
 Thu, 20 May 2021 12:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-36-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-36-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:24:53 -0400
Message-ID: <CADnq5_Pk9ez0e46DD=zZzUOnORh6JX1QCow7hCZvT-UucwJ9Tg@mail.gmail.com>
Subject: Re: [PATCH 35/38] drm/amd/amdgpu/sdma_v5_2: Repair typo in function name
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

Applied.  Thanks!

On Thu, May 20, 2021 at 8:04 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:501: warning: expecting prototype=
 for sdma_v_0_ctx_switch_enable(). Prototype was for sdma_v5_2_ctx_switch_e=
nable() instead
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
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v5_2.c
> index ecb82c39b1062..deb907f960906 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -517,7 +517,7 @@ static void sdma_v5_2_rlc_stop(struct amdgpu_device *=
adev)
>  }
>
>  /**
> - * sdma_v_0_ctx_switch_enable - stop the async dma engines context switc=
h
> + * sdma_v5_2_ctx_switch_enable - stop the async dma engines context swit=
ch
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs context switch.
> --
> 2.31.1
>
