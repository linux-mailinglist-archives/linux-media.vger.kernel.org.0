Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654F12C9125
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730697AbgK3WcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgK3Wbx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:31:53 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B711DC0613D2;
        Mon, 30 Nov 2020 14:31:07 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id p126so4979947oif.7;
        Mon, 30 Nov 2020 14:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6axFwa4jYEHmjVpGCVL9P267wNGg+Z8nK+eBebSlIQ8=;
        b=mpwz8hPQUUANXLM+Az3Jnne0uhc/dNdAZqUPcL/aO9nAJ8r2aN8/F4tzmkPkPfu4yw
         JSVsDQGGsCBilS+yl6EkVtRGgFZQXjQFmqz3Yh9/M83bTe/GdLeZvLtzMRvpW7dc20VP
         dHL3G8KEhRLa06V0MUztAPPrsmQ01ejbX+vqZjeyxPu3KrDjiS45cDUKqTTytf2M++vK
         JHyQO8Od/jGS1alTXtnVEhBTxEmjsB2Z2Z4dwKMNbsSgk/UUIeN5UOUraUGm1gHSjSBR
         LYDdrhv4XGg1rslyeFuOsKsV5sGhQ/mKj+clv7UdVxc/lr+GKbWvyCrYhQanV1gk+vCb
         /+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6axFwa4jYEHmjVpGCVL9P267wNGg+Z8nK+eBebSlIQ8=;
        b=oZezuEkNP68g5gnav86rx4aiDLl6zkcZDCrQ+Y0UOQ7CXOcXy9St4XYMJUaj4N0c/p
         8Ca4guVl6xlnlILwv447zS5RN5tVCpzltSKI2NHUuMNTG/DhTRx+I8RFb1FzweVV60OW
         xdndAKQJxZSnN9km3LhAO4DzsMRbe8vhEOv1f3HlogSR4wIKFVwFDkfZz2iNrJ96k0gx
         3+911n/MG2jrMf0zw0n5M5FJdSlIPnoOjswBw3JxydYKFwVIh8mwrEgv1Io3P/tZCh3N
         M5tLnpJkCv9U88AHbm57bTZuOyl+SWm4IEV0MukP25cgWIyR+hqR4Mm7/uCFTd+6URqO
         IGrQ==
X-Gm-Message-State: AOAM532brOckCRhR6sxX8peKcFWWaF+YjBhNtb/a5NC1Mm7nz8hhlcHU
        401Mlb24QFPiTr4RVzTRKAtASlOibJqYq4hsZgM=
X-Google-Smtp-Source: ABdhPJz+RMb175/ocrV0ND3r0KcHMsc1iBrnmvlAuhIHG9qAafkYK3PGhD1YFhiowR4RIw83/KNz/Mq6XFFpNsCHBDY=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr931942oib.120.1606775467209;
 Mon, 30 Nov 2020 14:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-23-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-23-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:30:55 -0500
Message-ID: <CADnq5_NX8=X-naMvn9pA--rjSDmZ_xiXYWfUSgoPJKFeN_6A0g@mail.gmail.com>
Subject: Re: [PATCH 22/40] drm/amd/amdgpu/amdgpu_uvd: Fix some function
 documentation headers
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

On Tue, Nov 24, 2020 at 2:44 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:95: warning: cannot understand f=
unction prototype: 'struct amdgpu_uvd_cs_ctx '
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:555: warning: Function parameter=
 or member 'adev' not described in 'amdgpu_uvd_cs_msg_decode'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1012: warning: Function paramete=
r or member 'ib_idx' not described in 'amdgpu_uvd_ring_parse_cs'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1286: warning: Function paramete=
r or member 'timeout' not described in 'amdgpu_uvd_ring_test_ib'
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

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_uvd.c
> index f8bebf18ee362..f8f0384a8d9ad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -87,7 +87,7 @@
>  #define UVD_NO_OP                              0x03ff
>  #define UVD_BASE_SI                            0x3800
>
> -/**
> +/*
>   * amdgpu_uvd_cs_ctx - Command submission parser context
>   *
>   * Used for emulating virtual memory support on UVD 4.2.
> @@ -545,8 +545,8 @@ static int amdgpu_uvd_cs_pass1(struct amdgpu_uvd_cs_c=
tx *ctx)
>  /**
>   * amdgpu_uvd_cs_msg_decode - handle UVD decode message
>   *
> + * @adev: amdgpu_device pointer
>   * @msg: pointer to message structure
> - * @buf_sizes: returned buffer sizes
>   *
>   * Peek into the decode message and calculate the necessary buffer sizes=
.
>   */
> @@ -1005,6 +1005,7 @@ static int amdgpu_uvd_cs_packets(struct amdgpu_uvd_=
cs_ctx *ctx,
>   * amdgpu_uvd_ring_parse_cs - UVD command submission parser
>   *
>   * @parser: Command submission parser context
> + * @ib_idx: Which indirect buffer to use
>   *
>   * Parse the command stream, patch in addresses as necessary.
>   */
> @@ -1279,6 +1280,7 @@ void amdgpu_uvd_ring_end_use(struct amdgpu_ring *ri=
ng)
>   * amdgpu_uvd_ring_test_ib - test ib execution
>   *
>   * @ring: amdgpu_ring pointer
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Test if we can successfully execute an IB
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
