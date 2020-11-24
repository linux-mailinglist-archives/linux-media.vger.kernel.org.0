Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234E12C2CA6
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 17:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390160AbgKXQTZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 11:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388568AbgKXQTY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 11:19:24 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468E8C0613D6;
        Tue, 24 Nov 2020 08:19:24 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a65so3465423wme.1;
        Tue, 24 Nov 2020 08:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7HGiO0DgR9eXvqkxA8eOYyORP/pAS/lYW6lSD1i1EXI=;
        b=i4zQwZN2jbnV5TFiUsIybhPvEcn/SA4ob58frZNxSiSy8XYTfX0yCfngM6U73z+HRz
         Gak74tqXM8qCD7Jd6g/scdbe2T5/TXFAT0vEAsWBgfqxMm+S25fDyCbAmaDlVcsuENCi
         6emutj2AKoonRuyv9grPOHSI8hKmlc0gEsxe9U/7roehsl93sG3ictaVRAb9UWGeGUUq
         iC3NPw14YdoC40jf3DB8GrViRyaLFKRx3vBy8t3cvwlT9zqpIQTvvwbfwZagvH9mT7fJ
         +2pmZf1Js4B30E7eKKApgLDjKxZ269DlcdliYuVgparSy/qX3NHW4BXpNFIFgBJeKlWb
         B5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7HGiO0DgR9eXvqkxA8eOYyORP/pAS/lYW6lSD1i1EXI=;
        b=hYi5d3yhurw2eRvJ0z0RlFEssHz4z2LJ1EDigX/jOOffy8pL6UPlmsUvChc0OcY/ft
         jG2RN3fD14Oprv4G78aPDhwLoABOGa1OpFE9oq1TvBqru2x7qM/SWeRgI5s+NKDNjXjd
         MUvD6Vp5N1k4DRVw+mzGcZ648yfP6ZUQJ23yknsGHviDVQEUz5ko01yq7OVpZpFdivY3
         mIigs3Q+owP9d4Jav06cD+G5P677ScO0Y5frq3WH53M0AVXerShLLPZY4vYfNM5dQLMW
         8cBRYbQRlFy0CJ/hdBOV891HjOW24Z7ukcipJzrc5+DCGIRPZSTkHU7vZKDCxZ/rFTU1
         9AqA==
X-Gm-Message-State: AOAM531v2bVgQ/LsC7Cdzi3kmv/3gOie2mmD+is3xttxcTmZZ9WTeDP+
        WvfxE+cHRF2on8XbnLwzmbM5Fbs5AAPrYqoCVuk3ui4I
X-Google-Smtp-Source: ABdhPJwGyYag4yGAiHq/SMaLo1AA1wmaXzNEGygYbvFDgDJscO523CXblf6N8wr/xd8P8i/MgAybqmvp+cnzQyuQwCQ=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr5127721wmb.39.1606234763015;
 Tue, 24 Nov 2020 08:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org> <20201123111919.233376-34-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-34-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 24 Nov 2020 11:19:12 -0500
Message-ID: <CADnq5_Nt3pi9F1fGF24ZWk2rE_Hk+g2-dNhQrCcoKMxNizFLCg@mail.gmail.com>
Subject: Re: [PATCH 33/40] drm/amd/amdgpu/cik_sdma: Add one and remove another
 function param description
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

On Mon, Nov 23, 2020 at 6:20 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:282: warning: Function parameter o=
r member 'flags' not described in 'cik_sdma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:282: warning: Excess function para=
meter 'fence' description in 'cik_sdma_ring_emit_fence'
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

Applied with minor changes.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/=
amdgpu/cik_sdma.c
> index f1e9966e7244e..28a64de8ae0e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -271,7 +271,7 @@ static void cik_sdma_ring_emit_hdp_flush(struct amdgp=
u_ring *ring)
>   * @ring: amdgpu ring pointer
>   * @addr: address
>   * @seq: sequence number
> - * @fence: amdgpu fence object
> + * @flags: fence related flags
>   *
>   * Add a DMA fence packet to the ring to write
>   * the fence seq number and DMA trap packet to generate
> @@ -279,7 +279,7 @@ static void cik_sdma_ring_emit_hdp_flush(struct amdgp=
u_ring *ring)
>   */
>  static void cik_sdma_ring_emit_fence(struct amdgpu_ring *ring, u64 addr,=
 u64 seq,
>                                      unsigned flags)
> -{
> +  {
>         bool write64bit =3D flags & AMDGPU_FENCE_FLAG_64BIT;
>         /* write the fence */
>         amdgpu_ring_write(ring, SDMA_PACKET(SDMA_OPCODE_FENCE, 0, 0));
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
