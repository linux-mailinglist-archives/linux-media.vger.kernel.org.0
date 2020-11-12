Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B312B1035
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 22:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgKLVZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 16:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgKLVZ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 16:25:56 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2393C0613D1;
        Thu, 12 Nov 2020 13:25:56 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id h62so6726068wme.3;
        Thu, 12 Nov 2020 13:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hUyTNFSy+FKV2Opdiuolyr8HGiYLytnqVqPxhLY1PsU=;
        b=kD08hxSi7dEp2gX1wV+W3BVTsipcNzE87u1fHldICACt9NRM++rnO1Hd7tRRf5VAMQ
         rdqjZuDm5uJYSfj/vUMW0ONk7aMVuQD9N/ojEGkK9ExmtnsP+bgynZPXRyHYyQU62Tdu
         3Obpvs43rMIF+l85GBGeeAsgt+6Xybyc9BZ3oQxK+tuwKtJ4YX6JIBCzrNfeIeSAPMpp
         +dwBr8SrhSIPab60tdJzleMGRT5Ad2vGIl3U+hhcKR8GONvbwWUJW5I/xgRqUIOPMoaJ
         E5fn/rxPjEOALrsWwpiVkTbcE1UJyD7tMktb5o/YEX+1K6gmQjXlrgEtlgo6C5+9Lnyc
         1iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hUyTNFSy+FKV2Opdiuolyr8HGiYLytnqVqPxhLY1PsU=;
        b=pXC4BZuBmaTVKl2jQnnFo3e9hSxCS5GZhijR4jACb+saSKxliluzW+WlOQ5PbID4kj
         n6z7YaOBHw+fWT+jAjyidmHghX9IvVzZfP0HcS1wuwZZe/gJOZHkRpRvOFs1/DALAUJK
         6ACfPiyQeoLwSsYKiCaeMYCRfYPfEFYhe9yttkuEtf+JP4+WngtKyv18utCkjQNsRK6+
         +E+LzVcEqUVG2YOu8jmFyUAK3+yud/bqjHhkLfDgmt/vZO+1v1oOL1yNArozTz650nJS
         Yau8PiDH3+H5XljoRw68qN7jx9KVh4/zmERdYRw4gi4a/svKkwWcKSDlhbGmYOeqm/Jz
         RggA==
X-Gm-Message-State: AOAM5302DfwZnBiS2IKvujxznuUg1siLGbeP+gBqcPfwaBqA4fYd4b4d
        jOKCP9udcmk1XWbYHcqVb1SH7m2AQ7zj3jKHTpw=
X-Google-Smtp-Source: ABdhPJxip1JaKfSFfumui+igR6N8zzYdt0OgATgfFWedhqfU/YYwwC5bN0VbM2VvOmJUJ2cj4foLG4KTcR0Z4hdacpw=
X-Received: by 2002:a1c:8150:: with SMTP id c77mr1677726wmd.26.1605216345970;
 Thu, 12 Nov 2020 13:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org> <20201112190039.2785914-15-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-15-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 12 Nov 2020 16:25:33 -0500
Message-ID: <CADnq5_N0Dvw0LTZmV1TMPCqh6EW7u_1SSHuN4kyicNTux2pYrQ@mail.gmail.com>
Subject: Re: [PATCH 14/30] drm/amd/amdgpu/amdgpu_ring: Fix a bunch of function misdocumentation
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

On Thu, Nov 12, 2020 at 2:01 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:63: warning: Excess function pa=
rameter 'adev' description in 'amdgpu_ring_alloc'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:122: warning: Excess function p=
arameter 'adev' description in 'amdgpu_ring_commit'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Function paramete=
r or member 'max_dw' not described in 'amdgpu_ring_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Function paramete=
r or member 'irq_src' not described in 'amdgpu_ring_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Function paramete=
r or member 'irq_type' not described in 'amdgpu_ring_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Function paramete=
r or member 'hw_prio' not described in 'amdgpu_ring_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Excess function p=
arameter 'max_ndw' description in 'amdgpu_ring_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:167: warning: Excess function p=
arameter 'nop' description in 'amdgpu_ring_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:285: warning: Excess function p=
arameter 'adev' description in 'amdgpu_ring_fini'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:325: warning: Function paramete=
r or member 'ring' not described in 'amdgpu_ring_emit_reg_write_reg_wait_he=
lper'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:325: warning: Excess function p=
arameter 'adev' description in 'amdgpu_ring_emit_reg_write_reg_wait_helper'
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring.c
> index 2697b250dc326..a23b2079696a1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -52,7 +52,6 @@
>  /**
>   * amdgpu_ring_alloc - allocate space on the ring buffer
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: amdgpu_ring structure holding ring information
>   * @ndw: number of dwords to allocate in the ring buffer
>   *
> @@ -95,7 +94,8 @@ void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, u=
int32_t count)
>                 amdgpu_ring_write(ring, ring->funcs->nop);
>  }
>
> -/** amdgpu_ring_generic_pad_ib - pad IB with NOP packets
> +/**
> + * amdgpu_ring_generic_pad_ib - pad IB with NOP packets
>   *
>   * @ring: amdgpu_ring structure holding ring information
>   * @ib: IB to add NOP packets to
> @@ -112,7 +112,6 @@ void amdgpu_ring_generic_pad_ib(struct amdgpu_ring *r=
ing, struct amdgpu_ib *ib)
>   * amdgpu_ring_commit - tell the GPU to execute the new
>   * commands on the ring buffer
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: amdgpu_ring structure holding ring information
>   *
>   * Update the wptr (write pointer) to tell the GPU to
> @@ -156,7 +155,9 @@ void amdgpu_ring_undo(struct amdgpu_ring *ring)
>   * @adev: amdgpu_device pointer
>   * @ring: amdgpu_ring structure holding ring information
>   * @max_ndw: maximum number of dw for ring alloc
> - * @nop: nop packet for this ring
> + * @irq_src: interrupt source to use for this ring
> + * @irq_type: interrupt type to use for this ring
> + * @hw_prio: ring priority (NORMAL/HIGH)
>   *
>   * Initialize the driver information for the selected ring (all asics).
>   * Returns 0 on success, error on failure.
> @@ -276,7 +277,6 @@ int amdgpu_ring_init(struct amdgpu_device *adev, stru=
ct amdgpu_ring *ring,
>  /**
>   * amdgpu_ring_fini - tear down the driver ring struct.
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: amdgpu_ring structure holding ring information
>   *
>   * Tear down the driver information for the selected ring (all asics).
> @@ -310,7 +310,7 @@ void amdgpu_ring_fini(struct amdgpu_ring *ring)
>  /**
>   * amdgpu_ring_emit_reg_write_reg_wait_helper - ring helper
>   *
> - * @adev: amdgpu_device pointer
> + * @ring: ring to write to
>   * @reg0: register to write
>   * @reg1: register to wait on
>   * @ref: reference value to write/wait on
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
