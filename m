Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B95338B6E9
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237136AbhETTPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237138AbhETTPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:15:17 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68046C061763;
        Thu, 20 May 2021 12:13:55 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso15847969otn.3;
        Thu, 20 May 2021 12:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4e2VdgTFJlvcvj2P7xFhk2OWf2Vw8hURmKQ/jkEZ8DQ=;
        b=ezXgqYpyUEE3k6E23Z2w5y+7QpfYLuVRb58W1d8LCGCQ0rI4n/+xcn5pEOnD2XEwGc
         ZFESJRjhrzmvYJypAz7kjFxjWWm69x1rgmsg1M5+byOvCbkqD42Kily+y/V2v7FJzoQG
         GfDqsptBHJ0Uxc3A6wre9aw1x4UCQx+8I5G1vOLiof5atKnNOO6XN1iNHxqQb2vMGBLf
         53GGvgIlVVnteholUZOzNBuxzJhcv7wvIo/t18cbb5lbKHntcgUKW4U+Z9clRT/TAcLx
         dc+jUzXPwbm/yPvryNh3KuiOLNobxwyIFoHHpPTE3KtW7XcCnOXgmMGaZ4+7xbGqHpjI
         R8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4e2VdgTFJlvcvj2P7xFhk2OWf2Vw8hURmKQ/jkEZ8DQ=;
        b=gcb/SUeJc0U8Bqm46Y7S8g0n4UFArvacA8PviScpEk+i2qDhgnqzPgLUzE2IbE880U
         91jVUGktu9aRhDJtQeGdsVbFvVQ8wx8gMNtI6zclTH6Uz4ruL8b2FdWXGg9Jdx8fvXfY
         YwSC5Pyy0MggeMjLXuElPsDQi3n5Z7I1jrpMyA03AqJNnaSh/GPfxvVGgvCnEhJU0Zjs
         FiYzdv7h4qwQdjjTC9YgP0hq7e+F5GE589ULIp3eye1gIhR8Yt2TvphtxCNMo/Dh4vHu
         Bpz2UYhpwj4ZnDkPxn59VIbw7yrxgKiUClTeI7G/7PqTg4FEJwEMqPLWFVZbsrAPWGr1
         YMrA==
X-Gm-Message-State: AOAM533uVc6b38JI6ANE7P5ksviR1pdmAsrr9QYPDrkduPrc4rXaP+2t
        mT0LZoJ2YhqnChEDn8V8rQaRZANRRarfCtHuXTw=
X-Google-Smtp-Source: ABdhPJzAKzYxXdp5xq0MqY9EcXKxblI7UDxmIIZsPw8Bd2K9JzAYaNM6nwJLxQjNQ1GW6s2RE+yFoJXI7ECtaUP0+68=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr5101139oti.23.1621538034833;
 Thu, 20 May 2021 12:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org> <20210520120248.3464013-15-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-15-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 20 May 2021 15:13:43 -0400
Message-ID: <CADnq5_Mpddbb4FX0FX+6NAhhOH0iQ3ZnP37-jOkWupqdmWwmrA@mail.gmail.com>
Subject: Re: [PATCH 14/38] drm/amd/amdgpu/gfx_v7_0: Repair function names in
 the documentation
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

Alex

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2126: warning: expecting prototype=
 for gfx_v7_0_ring_emit_hdp(). Prototype was for gfx_v7_0_ring_emit_hdp_flu=
sh() instead
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2262: warning: expecting prototype=
 for gfx_v7_0_ring_emit_ib(). Prototype was for gfx_v7_0_ring_emit_ib_gfx()=
 instead
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3207: warning: expecting prototype=
 for gfx_v7_0_ring_emit_vm_flush(). Prototype was for gfx_v7_0_ring_emit_pi=
peline_sync() instead
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v7_0.c
> index c35fdd2ef2d4d..685212c3ddae5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -2116,7 +2116,7 @@ static int gfx_v7_0_ring_test_ring(struct amdgpu_ri=
ng *ring)
>  }
>
>  /**
> - * gfx_v7_0_ring_emit_hdp - emit an hdp flush on the cp
> + * gfx_v7_0_ring_emit_hdp_flush - emit an hdp flush on the cp
>   *
>   * @ring: amdgpu_ring structure holding ring information
>   *
> @@ -2242,7 +2242,7 @@ static void gfx_v7_0_ring_emit_fence_compute(struct=
 amdgpu_ring *ring,
>   * IB stuff
>   */
>  /**
> - * gfx_v7_0_ring_emit_ib - emit an IB (Indirect Buffer) on the ring
> + * gfx_v7_0_ring_emit_ib_gfx - emit an IB (Indirect Buffer) on the ring
>   *
>   * @ring: amdgpu_ring structure holding ring information
>   * @job: job to retrieve vmid from
> @@ -3196,7 +3196,7 @@ static int gfx_v7_0_cp_resume(struct amdgpu_device =
*adev)
>  }
>
>  /**
> - * gfx_v7_0_ring_emit_vm_flush - cik vm flush using the CP
> + * gfx_v7_0_ring_emit_pipeline_sync - cik vm flush using the CP
>   *
>   * @ring: the ring to emit the commands to
>   *
> --
> 2.31.1
>
