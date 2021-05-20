Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D2038B784
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237886AbhETT1r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbhETT1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:27:47 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FE4C061574;
        Thu, 20 May 2021 12:26:25 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id t10-20020a05683022eab0290304ed8bc759so15847826otc.12;
        Thu, 20 May 2021 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L/aKDgdFp8azkNRPkBfwbGry+KpDDgeXnCjUZiXUHAk=;
        b=Iw2EOxuFQfHZ+eCHYMxU66KVGsltX5SDbaLnDelNONGLKRdnxrXhfh6GppGwh9hF03
         zNvDroo3j7IUMxWxmZItxH2vSffYWDPnXuVYVtLzvighVR1J1ro5K5lH4V4PSepWV0G4
         gvXSbivlFa1OnRM2D+IU6gdjLxPfcOtdfwX5/T6rhck+gIPtsOygu76ZuH1axb5/d0fc
         IBMpwixmy7uqUA5RhLSu+puEmdboK+4ah5hkBntYbSM0xU8NxvJmiwnGzmOfqMwPu1RB
         twbrTkQ+A+Dtnwhoe3AAYNOOdzIONhJ6vseidUA3CV9HPcPV0t6tz8Q/xDC7s7YVh947
         A1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L/aKDgdFp8azkNRPkBfwbGry+KpDDgeXnCjUZiXUHAk=;
        b=UeOI8XJqgLzFHvQFQVZCdj7+3pj9E43sBTGDIinKfkwWirK7o+COPKt8pD3R0GmuBd
         XQgWqSsjBJuPvTAW/iswceNMJJH1Ek98xwjuQuhM1UJyQuCKBruih5JiGDpLVwM9fFtI
         0V9ELKvauOYBuar22fzYh9G1c2RUWuxaCtG85Yq8NdsktU2OmMzK9xXGtE0epr/CLOvY
         8K+CGAEX+PKob9ALK+C9gjENgtOZTnU4izxEliHqgst7WWn59xHdmwYT1hwENjOlMNWf
         dZP59yV9VQM2CbFWmjsjSUkqb3jl8HKKa4zqFLIs+DpnZfYmIMPLSd0YMJoJULCwm8JD
         ygqg==
X-Gm-Message-State: AOAM530TOvZInI7/LqytCk/Ugmqm5v6/hSqk5VDQb6pMYGY6L+ndRV9u
        YzKmXtP6p2hO35jANZpJZUj7RiY79OHam+Q8xDo=
X-Google-Smtp-Source: ABdhPJx0fYn3UtO85WnCHYo3oCG9Ca6arkIE1QlALKzujCj8PWSdmjcwps+puWxR/yT2HWQLUUkvJ/ALvmm3ZQZ3twg=
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr5160706otl.132.1621538784761;
 Thu, 20 May 2021 12:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-38-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-38-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:26:13 -0400
Message-ID: <CADnq5_OuzthTQOUkYRSPz0coL1-xgpfzMq57=9SzW3WDSrY_uA@mail.gmail.com>
Subject: Re: [PATCH 37/38] drm/amd/amdgpu/gfx_v10_0: Demote kernel-doc abuse
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:51: warning: This comment starts =
with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/k=
ernel-doc.rst
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index fc12e3c3e9cae..c833be31e4ae6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -47,7 +47,7 @@
>  #include "gfx_v10_0.h"
>  #include "nbio_v2_3.h"
>
> -/**
> +/*
>   * Navi10 has two graphic rings to share each graphic pipe.
>   * 1. Primary ring
>   * 2. Async ring
> --
> 2.31.1
>
