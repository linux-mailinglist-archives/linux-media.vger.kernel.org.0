Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB4A2C2C38
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 17:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389900AbgKXQDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 11:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbgKXQDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 11:03:44 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED3FC0613D6;
        Tue, 24 Nov 2020 08:03:44 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so22827894wrb.9;
        Tue, 24 Nov 2020 08:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+WgNCMw+FNVg6++cSxRSVLflzp+gBvU9V7//cGxl2dg=;
        b=GDWYCIYHTk1YxHXKuu4EPgqgJrZ8YSJVGIxNzER9SkK2Ds19NOuyoXGBhVvMO6W7QA
         Nslm8jyZNfeQAayvbrW+TNeOHQhKqbiqmM5RBN0uD0ZpABwRxxmkCpBMm1yRm78fZlQ5
         3achHXMOo03z+KOwLHIYRZuUwXp/h2F/s2KCw/dVDW2tsRaIpjuel3M4wuRV0YT5f76c
         2YBCOEr9fSu+a+XPJiOUnbf1YhyeGzjBMT87o5F1BaNElLXRwh3a1k9UBPHmgAbm/ouC
         3aoZY+OkSW8c64lt7i4zHHQ3EEDovrobdLq1ouHXkRB4opN/kkypSgH+BE3Le2In2rrS
         64sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+WgNCMw+FNVg6++cSxRSVLflzp+gBvU9V7//cGxl2dg=;
        b=rDEGSKkDWxwYnO6AzzYXFm5d2brE8YhMukDTGjdiyA5WgXky6ljai2/m7At6ArvsRr
         4ZF1R0VsiwYkxO2Md0VHCIhHOZhtaR14dwP4i0d9MLSladGyAMuM1nWWGbyQ7Gt1CcaP
         qOrdYLsQ58xl4+nDXBWq+asOGgkJ7nTnZamkPH3HkW4UvVliAQJiEWPYjuVdwEp0f4d3
         MGYRr24AbN070NmxFG0xByOwACI7jSVxiGEI4kyeFVC8nM7l4qDLmGsz3EO4LzLNBA3O
         TpVukffRzv3s8DjJt/Jie3D64/N+0VnMiKI1GfkWJKb/Wy+ZoDS26M7k2GQ/ikFO/h3W
         ZwIA==
X-Gm-Message-State: AOAM532DcZwdxL0rTicmbjkjxmJzpmGD001zgnKg6nnMVFzDaLqTZy1m
        6S5PqyhBFVrOLlRq2HdddasB/FcM7yE+hOtcbkw=
X-Google-Smtp-Source: ABdhPJxGFyGMDXN21iMutA9B1LzeIss3+7anfsorpX/9okzh9f7v7sqbmHHdslmiL1sdby3VOWqRByaO61PfMH9Nr6g=
X-Received: by 2002:adf:8028:: with SMTP id 37mr6093399wrk.111.1606233822883;
 Tue, 24 Nov 2020 08:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org> <20201123111919.233376-9-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-9-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 24 Nov 2020 11:03:31 -0500
Message-ID: <CADnq5_MdzDQVu+BZ=HJxN_Ba-Zct7dQ=hC_=yfu5Ru-SOG_dFQ@mail.gmail.com>
Subject: Re: [PATCH 08/40] drm/amd/amdgpu/cik_sdma: Supply some missing
 function param descriptions
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

On Mon, Nov 23, 2020 at 6:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:226: warning: Function parameter o=
r member 'job' not described in 'cik_sdma_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:226: warning: Function parameter o=
r member 'flags' not described in 'cik_sdma_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:278: warning: Function parameter o=
r member 'addr' not described in 'cik_sdma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:278: warning: Function parameter o=
r member 'seq' not described in 'cik_sdma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:278: warning: Function parameter o=
r member 'flags' not described in 'cik_sdma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:278: warning: Excess function para=
meter 'fence' description in 'cik_sdma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:663: warning: Function parameter o=
r member 'timeout' not described in 'cik_sdma_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:808: warning: Function parameter o=
r member 'ring' not described in 'cik_sdma_ring_pad_ib'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:859: warning: Function parameter o=
r member 'vmid' not described in 'cik_sdma_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:859: warning: Function parameter o=
r member 'pd_addr' not described in 'cik_sdma_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:859: warning: Excess function para=
meter 'vm' description in 'cik_sdma_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1315: warning: Function parameter =
or member 'ib' not described in 'cik_sdma_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1315: warning: Function parameter =
or member 'tmz' not described in 'cik_sdma_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1315: warning: Excess function par=
ameter 'ring' description in 'cik_sdma_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1339: warning: Function parameter =
or member 'ib' not described in 'cik_sdma_emit_fill_buffer'
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c:1339: warning: Excess function par=
ameter 'ring' description in 'cik_sdma_emit_fill_buffer'
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
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/=
amdgpu/cik_sdma.c
> index 1a6494ea50912..f1e9966e7244e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -215,7 +215,9 @@ static void cik_sdma_ring_insert_nop(struct amdgpu_ri=
ng *ring, uint32_t count)
>   * cik_sdma_ring_emit_ib - Schedule an IB on the DMA engine
>   *
>   * @ring: amdgpu ring pointer
> + * @job: job to retrive vmid from
>   * @ib: IB object to schedule
> + * @flags: unused
>   *
>   * Schedule an IB in the DMA ring (CIK).
>   */
> @@ -267,6 +269,8 @@ static void cik_sdma_ring_emit_hdp_flush(struct amdgp=
u_ring *ring)
>   * cik_sdma_ring_emit_fence - emit a fence on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
> + * @addr: address
> + * @seq: sequence number
>   * @fence: amdgpu fence object
>   *
>   * Add a DMA fence packet to the ring to write
> @@ -655,6 +659,7 @@ static int cik_sdma_ring_test_ring(struct amdgpu_ring=
 *ring)
>   * cik_sdma_ring_test_ib - test an IB on the DMA engine
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Test a simple IB in the DMA ring (CIK).
>   * Returns 0 on success, error on failure.
> @@ -801,6 +806,7 @@ static void cik_sdma_vm_set_pte_pde(struct amdgpu_ib =
*ib, uint64_t pe,
>  /**
>   * cik_sdma_vm_pad_ib - pad the IB to the required number of dw
>   *
> + * @ring: amdgpu_ring structure holding ring information
>   * @ib: indirect buffer to fill with padding
>   *
>   */
> @@ -849,7 +855,8 @@ static void cik_sdma_ring_emit_pipeline_sync(struct a=
mdgpu_ring *ring)
>   * cik_sdma_ring_emit_vm_flush - cik vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> - * @vm: amdgpu_vm pointer
> + * @vmid: vmid number to use
> + * @pd_addr: address
>   *
>   * Update the page table base and flush the VM TLB
>   * using sDMA (CIK).
> @@ -1298,10 +1305,11 @@ static void cik_sdma_set_irq_funcs(struct amdgpu_=
device *adev)
>  /**
>   * cik_sdma_emit_copy_buffer - copy buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to copy to
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> + * @tmz: unused
>   *
>   * Copy GPU buffers using the DMA engine (CIK).
>   * Used by the amdgpu ttm implementation to move pages if
> @@ -1325,7 +1333,7 @@ static void cik_sdma_emit_copy_buffer(struct amdgpu=
_ib *ib,
>  /**
>   * cik_sdma_emit_fill_buffer - fill buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to fill
>   * @src_data: value to write to buffer
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
