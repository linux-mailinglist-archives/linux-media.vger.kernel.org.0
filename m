Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28DD72B0FD6
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 22:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgKLVMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 16:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgKLVMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 16:12:08 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CB2C0613D1;
        Thu, 12 Nov 2020 13:12:08 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id d142so6443727wmd.4;
        Thu, 12 Nov 2020 13:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6ICMZkB+8QOwOmwAKS2RzuNwtbR8tWHZ2VJ+IreUKHY=;
        b=A8pOcjBSzBR35PoWRBwG9QbV2lrZfzhHUGdNR85Rl+5TJE5d+NtCO23lN4yJHl8P1d
         aGhMukBJJHPXq773nCVnrO6soWnkF4YR8N6LL84vthYMsU4LVO+FpYMpoWHYrbEmg/L6
         HXnMW/BywFKWrisEZcOWBb9TZeoOQQ3vPSVlA+c4gGq4smBLcS5m0lqBjGyNar+qx4fT
         3meB3sOMsb+edtOwK3a+Vd9YyzmVH0H+rTpPx/ix16NaEa9mxrXOiPut/U+16nsrEp89
         qu1htdHQlH2+YX/Eyr63edepK09YKPbrcsP5V/tgnZLuHZ+7WeyTNCSRQX9cF742QRnA
         JOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6ICMZkB+8QOwOmwAKS2RzuNwtbR8tWHZ2VJ+IreUKHY=;
        b=kHXgFRC+FPdkZosQ9QcmFIAjdybnKCWKhK0DD6B21Lo6wep8GRwLXvyO87IQXB345k
         YysuYiJjFA9ATuholMUwYOgsdSr6Rf7jSTy2ueq5KimsZZuLZeKCaiV5pYWtmdwkzqdX
         qQzxaFW0YD9tfdP8u8WRVxriRB2eVzyBVgUuLEJSewwGH1mldrRa4pe7l/H3MpbgBWf/
         r89YJKcSTJ52aNWFCHL0a99rBlUugpPMoZ+tOImGuXvc5VYI+/wHDMMMkPIllitRoJ0p
         RAN4bxyIa5MDLkLXW1uRlCr51TqVON8A9VB+UHKlEnXyVcRNjJplb/cbQbhbPruMDKVa
         3AxQ==
X-Gm-Message-State: AOAM532H4GqzvSX66ClzSw2hj3kWKOllTobXWV5M/Wta4O4vVnVUnoqW
        x4l5RESHL7WcqIXfVJ9mZjQ+F9KHkwzpL8bhKBo=
X-Google-Smtp-Source: ABdhPJxPOEYOKE8ALkHNxSVEuwgBfgTMaz9zpMq3Bee1Jcv5zL9lLl3CDWR2QTi4MaHQTM9ggZLKWf0whhsu3dPGHGs=
X-Received: by 2002:a1c:ddc4:: with SMTP id u187mr1607647wmg.55.1605215527193;
 Thu, 12 Nov 2020 13:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org> <20201112190039.2785914-8-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-8-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 12 Nov 2020 16:11:56 -0500
Message-ID: <CADnq5_OxARw4mv1E4QaZf4mG-xAfG2HmL9fq+0KTXr2vmoassA@mail.gmail.com>
Subject: Re: [PATCH 07/30] drm/amd/amdgpu/amdgpu_fence: Fix some issues
 pertaining to function documentation
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

On Thu, Nov 12, 2020 at 2:01 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:139: warning: Function paramet=
er or member 'flags' not described in 'amdgpu_fence_emit'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:197: warning: Function paramet=
er or member 'timeout' not described in 'amdgpu_fence_emit_polling'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:302: warning: Function paramet=
er or member 't' not described in 'amdgpu_fence_fallback'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:302: warning: Excess function =
parameter 'work' description in 'amdgpu_fence_fallback'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:320: warning: Excess function =
parameter 'adev' description in 'amdgpu_fence_wait_empty'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:649: warning: Function paramet=
er or member 'f' not described in 'amdgpu_fence_enable_signaling'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:649: warning: Excess function =
parameter 'fence' description in 'amdgpu_fence_enable_signaling'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:684: warning: Function paramet=
er or member 'f' not described in 'amdgpu_fence_release'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:684: warning: Excess function =
parameter 'fence' description in 'amdgpu_fence_release'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:749: warning: Function paramet=
er or member 'm' not described in 'amdgpu_debugfs_gpu_recover'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:749: warning: Function paramet=
er or member 'data' not described in 'amdgpu_debugfs_gpu_recover'
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

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_fence.c
> index fe2d495d08ab0..d56f4023ebb31 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -130,6 +130,7 @@ static u32 amdgpu_fence_read(struct amdgpu_ring *ring=
)
>   *
>   * @ring: ring the fence is associated with
>   * @f: resulting fence object
> + * @flags: flags to pass into the subordinate .emit_fence() call
>   *
>   * Emits a fence command on the requested ring (all asics).
>   * Returns 0 on success, -ENOMEM on failure.
> @@ -187,6 +188,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struc=
t dma_fence **f,
>   *
>   * @ring: ring the fence is associated with
>   * @s: resulting sequence number
> + * @timeout: the timeout for waiting in usecs
>   *
>   * Emits a fence command on the requested ring (all asics).
>   * Used For polling fence.
> @@ -294,7 +296,7 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
>  /**
>   * amdgpu_fence_fallback - fallback for hardware interrupts
>   *
> - * @work: delayed work item
> + * @t: timer context used to obtain the pointer to ring structure
>   *
>   * Checks for fence activity.
>   */
> @@ -310,7 +312,6 @@ static void amdgpu_fence_fallback(struct timer_list *=
t)
>  /**
>   * amdgpu_fence_wait_empty - wait for all fences to signal
>   *
> - * @adev: amdgpu device pointer
>   * @ring: ring index the fence is associated with
>   *
>   * Wait for all fences on the requested ring to signal (all asics).
> @@ -639,7 +640,7 @@ static const char *amdgpu_fence_get_timeline_name(str=
uct dma_fence *f)
>
>  /**
>   * amdgpu_fence_enable_signaling - enable signalling on fence
> - * @fence: fence
> + * @f: fence
>   *
>   * This function is called with fence_queue lock held, and adds a callba=
ck
>   * to fence_queue that checks if this fence is signaled, and if so it
> @@ -675,7 +676,7 @@ static void amdgpu_fence_free(struct rcu_head *rcu)
>  /**
>   * amdgpu_fence_release - callback that fence can be freed
>   *
> - * @fence: fence
> + * @f: fence
>   *
>   * This function is called when the reference count becomes zero.
>   * It just RCU schedules freeing up the fence.
> @@ -740,7 +741,7 @@ static int amdgpu_debugfs_fence_info(struct seq_file =
*m, void *data)
>         return 0;
>  }
>
> -/**
> +/*
>   * amdgpu_debugfs_gpu_recover - manually trigger a gpu reset & recover
>   *
>   * Manually trigger a gpu reset at the next fence wait.
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
