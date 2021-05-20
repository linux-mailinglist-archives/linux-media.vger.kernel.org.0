Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B1C38B707
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237880AbhETTRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236921AbhETTRe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:17:34 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B525DC061574;
        Thu, 20 May 2021 12:16:12 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id z3so17412120oib.5;
        Thu, 20 May 2021 12:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8IA4EK6QCZUPS2VJM/CthWGQXD1VY0qEbTyCJO+YaKI=;
        b=IB7FUTa3Fm9U+stZPo8LH03erUcgUmfhx7Jry7EQ7Jtzc3Ac1SG4eaPkgQitM1UHr0
         jpEDSZeQG+skg4Dwxxv/gO/wLl867g1RwV0EN1QvM6I+Djtd7951uvKVrQnx7hOJfg+o
         miEzOj5wK5zSDduqudgNH7DiQDBvLljTQapNLDsAXmkfTZOF02r1LiNMkbwwlPnnVFIH
         VvXftcgZxL+5WaQrD86+D4UAPJ5Dp/4yu/z0PNs/LeQ8/NuzS0R31Fk8I68nEDKmDGjP
         5zohz3AsNpNBp5VfyqmlQ7bZTKU3kL7PcB/G5XVu3FrGbBJHk7ejRMG4qU8InVWmjbpW
         rw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8IA4EK6QCZUPS2VJM/CthWGQXD1VY0qEbTyCJO+YaKI=;
        b=EfnEa5dC7wveKhzohCczZLjkTFnN4I7kgV+6OHfKEDbExvNqfr+FfWKkI7fKA2uy1H
         4asLq5bvGVKIEaKp3TnP8ULqYlNHBb916GHbGD4nqZg2MyfYawyyduN2iiDG7dK+xpe5
         AfD/njsEcr2ZeDOm3wiVEjOc9Gu4TOIV8Jw9D20MwS5aZbKVNUiz1xT367hse0Zpa+U7
         iAmwyG7tW5adPKcLgS4UY1nZJbnPjyjMFXHAvY4Z3/XPiBorwomQnhXS/IxTPCC9wyxO
         bsKYGpRemTBtsw89EuXRUkcmns0Vp4gWtx2M8p4BU8RHw8jPRgWWEyK9ginvKP0f2S7+
         GNNw==
X-Gm-Message-State: AOAM532zM+PM8ehRahrqKunN+G7SvH8OQrTxlLnDQvqNIFaVFlcuw+gl
        RhFccxmSg18JywXCIa/XCrqCRf8JBEzBBKvLi1A=
X-Google-Smtp-Source: ABdhPJyjZJXNvUa5xHZWnGMQdRLZVinC4OBHnKgEG8wYkwieJ5ywWJUtdKBa3zvbFenStYoZkol8ak3wmyzA1Ffu+LI=
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr4194241oie.120.1621538170961;
 Thu, 20 May 2021 12:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-20-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-20-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:15:59 -0400
Message-ID: <CADnq5_OZR3qTX2hcDQyhgSGUyWAgCdUiJu3ODD_owJRip_RMOw@mail.gmail.com>
Subject: Re: [PATCH 19/38] drm/radeon/cik: Fix incorrectly named function 'cik_irq_suspend()'
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

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/cik.c:7450: warning: expecting prototype for cik_=
irq_disable(). Prototype was for cik_irq_suspend() instead
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
>  drivers/gpu/drm/radeon/cik.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 42a8afa839cbb..73ea5189dfb1a 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -7439,7 +7439,7 @@ static void cik_irq_disable(struct radeon_device *r=
dev)
>  }
>
>  /**
> - * cik_irq_disable - disable interrupts for suspend
> + * cik_irq_suspend - disable interrupts for suspend
>   *
>   * @rdev: radeon_device pointer
>   *
> --
> 2.31.1
>
