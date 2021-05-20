Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0D738B78F
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238217AbhETT3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbhETT3Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:29:24 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E783AC061574;
        Thu, 20 May 2021 12:28:02 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id s20-20020a4ae9940000b02902072d5df239so4047822ood.2;
        Thu, 20 May 2021 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4k80R92raKX44try8NOlI5SNEciXr8tCWt15U235ZOY=;
        b=u5HMyC2dzOhRwetk6bFz5gxLMOhluu4CAuFx5YJ9V3fbc/xw/CgL5YRqYjhGiyTW5n
         3AqF3gy2HlXhnwJ0kZfowlu0bDBzz2toiJdGn95DqPqVNTsAq0ZvJ8Q+HfHXnQFAJuEF
         B+gCJPmEySu7ANm9VWs7g6r1aM2vci0dafOoH+ksiVn0CwsVL6/mH8ppdwz8MJ+DT1dH
         cN2WQhb020RIVtBZqgNHNS43F6T9b8ou7Tw2j7gfAgwHfcUZzHUmMxfsECPsBFofyL2r
         nzo8wZzOG+rq6dVItNbWteQlyBTRaS5mpPUPrcawglZWe15fu50Our5mUlnK1SJ8Yxdo
         NrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4k80R92raKX44try8NOlI5SNEciXr8tCWt15U235ZOY=;
        b=pTHKqVJB5bCjhc+CfDYxjVpLrdK8PM1+aaw13oHig1It54SJB3Yu6++nJfD8zVH7B4
         bfPwNTLYOkG9HtRCRBC35+1Elpk/EVdSLjAkeSSGtKCyJzmLs5WOld/hEQPLTA9tCOG4
         D2qSnDUUHTHpFyYv/CNWS2nL7mJKRRq3/MXXJFWYx4IEaXXOFZXxjIlrbNksCkwD0dLb
         7+vGyA2l1g+9RFfkLEJGG/tK9ex9Qo/1FprqfR/MQ9j2En/5FXbaq1vlTNHIrkcUn1tR
         qTt/y8a4TdWsKiH9dXX4QPLxqGOH6wLNwRMPmw+uaJ0Fg7kzL1ROQ98S4gnGQLCeiEdB
         XTYA==
X-Gm-Message-State: AOAM533TE/c3s+Kwyb1T8xvDrridEc/EPKWxzqbH/zdvcAIblkEcCCPY
        amZ1V+WPtRsQcaqUJ/qslBqOQI60wamkaI4n/ms=
X-Google-Smtp-Source: ABdhPJw/G1SAe+q/1vmFaWI1wZ9doKKFcivmwBNweNkYvrpMqu9DHVkQfhze30Eo9Oia8iZcUi5SWEhoaNXsk7+gfII=
X-Received: by 2002:a4a:d085:: with SMTP id i5mr4993114oor.61.1621538882348;
 Thu, 20 May 2021 12:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-35-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-35-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:27:51 -0400
Message-ID: <CADnq5_NqMsveaWdJGzGzx4OZ3wkHso=3T+r2RXwYBAbsFSLSOg@mail.gmail.com>
Subject: Re: [PATCH 34/38] drm/amd/amdgpu/amdgpu_vce: Fix a few incorrectly
 named functions
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:98: warning: expecting prototype=
 for amdgpu_vce_init(). Prototype was for amdgpu_vce_sw_init() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:214: warning: expecting prototyp=
e for amdgpu_vce_fini(). Prototype was for amdgpu_vce_sw_fini() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:590: warning: expecting prototyp=
e for amdgpu_vce_cs_validate_bo(). Prototype was for amdgpu_vce_validate_bo=
() instead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:724: warning: expecting prototyp=
e for amdgpu_vce_cs_parse(). Prototype was for amdgpu_vce_ring_parse_cs() i=
nstead
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:960: warning: expecting prototyp=
e for amdgpu_vce_cs_parse_vm(). Prototype was for amdgpu_vce_ring_parse_cs_=
vm() instead
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vce.c
> index ea6a62f67e380..7ad83da613edd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -87,7 +87,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_rin=
g *ring, uint32_t handle,
>                                       bool direct, struct dma_fence **fen=
ce);
>
>  /**
> - * amdgpu_vce_init - allocate memory, load vce firmware
> + * amdgpu_vce_sw_init - allocate memory, load vce firmware
>   *
>   * @adev: amdgpu_device pointer
>   * @size: size for the new BO
> @@ -204,7 +204,7 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, un=
signed long size)
>  }
>
>  /**
> - * amdgpu_vce_fini - free memory
> + * amdgpu_vce_sw_fini - free memory
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -574,7 +574,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_r=
ing *ring, uint32_t handle,
>  }
>
>  /**
> - * amdgpu_vce_cs_validate_bo - make sure not to cross 4GB boundary
> + * amdgpu_vce_validate_bo - make sure not to cross 4GB boundary
>   *
>   * @p: parser context
>   * @ib_idx: indirect buffer to use
> @@ -715,7 +715,7 @@ static int amdgpu_vce_validate_handle(struct amdgpu_c=
s_parser *p,
>  }
>
>  /**
> - * amdgpu_vce_cs_parse - parse and validate the command stream
> + * amdgpu_vce_ring_parse_cs - parse and validate the command stream
>   *
>   * @p: parser context
>   * @ib_idx: indirect buffer to use
> @@ -951,7 +951,7 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser =
*p, uint32_t ib_idx)
>  }
>
>  /**
> - * amdgpu_vce_cs_parse_vm - parse the command stream in VM mode
> + * amdgpu_vce_ring_parse_cs_vm - parse the command stream in VM mode
>   *
>   * @p: parser context
>   * @ib_idx: indirect buffer to use
> --
> 2.31.1
>
