Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB7D2C911F
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbgK3Wai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbgK3Wah (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:30:37 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF95C0613CF;
        Mon, 30 Nov 2020 14:29:51 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id c80so16034191oib.2;
        Mon, 30 Nov 2020 14:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qG6138h9UZ39YH1AsAGVwRtortq5ikL6M0D+h0AZLqE=;
        b=j6BaO4OQcWINYjtLOEq74VZNu+n82gqhdbHOU5jcgmE/ProLJMvGZRaMpxI+y/pTze
         3VUIRNPbK8SJbTXGpsbgl5rye3K7Q/fNV7q3NAzNpfSXMmLkwALIMGvaGzZ2qdGcPsKu
         9cWEy/6HHZHoOZ5+Wwy0hnEQm6p36QeDCrlc8IedTiza0rn/MnfDfIQSUop2uYRFQdOr
         gEEidYUdqBT/WKfBJqy0Pjf74Yr3/S5aLLJgWkExkzPWLYxjfumSsPT5c8kguAyK1CkE
         8TnnegHu5zSp1h00bAeuyN5xCuxRoMxvXi81iAgN1Tdr239FOGfn7qI50bDbXzA2molz
         GMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qG6138h9UZ39YH1AsAGVwRtortq5ikL6M0D+h0AZLqE=;
        b=nqqopmFtyjG8cLcoLJByTJ0fxtuatRdtFdaWW65b9snCnJYy9Qh9xtA+C62oR1gy+3
         MiBT/TdGywTi1/0JFqNa1k9TWCKKh/hlIGisoup+BqmX7fm9FIw8FTiygOu46MpjOKia
         K+bP66wTPxEeURmWRnOHe4xar6frRf8UhpUMjF+wnoMXzBPy8wjSSn4rUq8n5z3tZEww
         ifLxzxHuYJaHMBDENfjSCX34Zo9TeQVPxYFwgpPlB8nRPOfSGAcKmp9aIP5ZBkexb/r0
         A+oPDGuJUPpsl1WXLJVsaXDUR32RxcSlE9pVLr9bzpkYEvDXA6L0u5q3Dc/KFRX9lBjH
         LjYg==
X-Gm-Message-State: AOAM532NLeSr2iMWv9lb7yYJVpk1b8oEqNiiAWUprXCTE+YK9V72PZ7G
        zwZutLpb0YW+VX9bEkeyDgByqaVIshdxM5qxVGM=
X-Google-Smtp-Source: ABdhPJxeHIvB0gNNwXashA2LdbkiDewJidUl8UliKlLPpi9qJuJj6nY7In9Hr7Ysf1Q/NKBSY+kQEVqqT7it3ti0Hsw=
X-Received: by 2002:aca:4f53:: with SMTP id d80mr927634oib.120.1606775390989;
 Mon, 30 Nov 2020 14:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-22-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-22-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:29:39 -0500
Message-ID: <CADnq5_PXWgnQ11ZSxqwa122w8cAYGL476uc65nddhQGsnYYUOA@mail.gmail.com>
Subject: Re: [PATCH 21/40] drm/amd/amdgpu/sdma_v4_0: Repair a bunch of
 kernel-doc problems
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

On Tue, Nov 24, 2020 at 2:45 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:848: warning: Function parameter =
or member 'job' not described in 'sdma_v4_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:848: warning: Function parameter =
or member 'flags' not described in 'sdma_v4_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:923: warning: Function parameter =
or member 'addr' not described in 'sdma_v4_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:923: warning: Function parameter =
or member 'seq' not described in 'sdma_v4_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:923: warning: Function parameter =
or member 'flags' not described in 'sdma_v4_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:923: warning: Excess function par=
ameter 'fence' description in 'sdma_v4_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1117: warning: Function parameter=
 or member 'ring' not described in 'sdma_v4_0_rb_cntl'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1117: warning: Function parameter=
 or member 'rb_cntl' not described in 'sdma_v4_0_rb_cntl'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1581: warning: Function parameter=
 or member 'timeout' not described in 'sdma_v4_0_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1682: warning: Function parameter=
 or member 'value' not described in 'sdma_v4_0_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1682: warning: Excess function pa=
rameter 'addr' description in 'sdma_v4_0_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1682: warning: Excess function pa=
rameter 'flags' description in 'sdma_v4_0_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1734: warning: Function parameter=
 or member 'ring' not described in 'sdma_v4_0_ring_pad_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1782: warning: Function parameter=
 or member 'vmid' not described in 'sdma_v4_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1782: warning: Function parameter=
 or member 'pd_addr' not described in 'sdma_v4_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1782: warning: Excess function pa=
rameter 'vm' description in 'sdma_v4_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2508: warning: Function parameter=
 or member 'ib' not described in 'sdma_v4_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2508: warning: Function parameter=
 or member 'tmz' not described in 'sdma_v4_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2508: warning: Excess function pa=
rameter 'ring' description in 'sdma_v4_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2534: warning: Function parameter=
 or member 'ib' not described in 'sdma_v4_0_emit_fill_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:2534: warning: Excess function pa=
rameter 'ring' description in 'sdma_v4_0_emit_fill_buffer'
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

Applied with minor fixes.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v4_0.c
> index dc74ca2aa8926..512efb31cc9fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -837,7 +837,9 @@ static void sdma_v4_0_ring_insert_nop(struct amdgpu_r=
ing *ring, uint32_t count)
>   * sdma_v4_0_ring_emit_ib - Schedule an IB on the DMA engine
>   *
>   * @ring: amdgpu ring pointer
> + * @job: job to retrive vmid from
>   * @ib: IB object to schedule
> + * @flags: unused
>   *
>   * Schedule an IB in the DMA ring (VEGA10).
>   */
> @@ -912,7 +914,9 @@ static void sdma_v4_0_ring_emit_hdp_flush(struct amdg=
pu_ring *ring)
>   * sdma_v4_0_ring_emit_fence - emit a fence on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
> - * @fence: amdgpu fence object
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Add a DMA fence packet to the ring to write
>   * the fence seq number and DMA trap packet to generate
> @@ -1110,7 +1114,7 @@ static void sdma_v4_0_enable(struct amdgpu_device *=
adev, bool enable)
>         }
>  }
>
> -/**
> +/*
>   * sdma_v4_0_rb_cntl - get parameters for rb_cntl
>   */
>  static uint32_t sdma_v4_0_rb_cntl(struct amdgpu_ring *ring, uint32_t rb_=
cntl)
> @@ -1573,6 +1577,7 @@ static int sdma_v4_0_ring_test_ring(struct amdgpu_r=
ing *ring)
>   * sdma_v4_0_ring_test_ib - test an IB on the DMA engine
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Test a simple IB in the DMA ring (VEGA10).
>   * Returns 0 on success, error on failure.
> @@ -1669,10 +1674,9 @@ static void sdma_v4_0_vm_copy_pte(struct amdgpu_ib=
 *ib,
>   *
>   * @ib: indirect buffer to fill with commands
>   * @pe: addr of the page entry
> - * @addr: dst addr to write into pe
> + * @value: dst addr to write into pe
>   * @count: number of page entries to update
>   * @incr: increase next addr by incr bytes
> - * @flags: access flags
>   *
>   * Update PTEs by writing them manually using sDMA (VEGA10).
>   */
> @@ -1727,8 +1731,8 @@ static void sdma_v4_0_vm_set_pte_pde(struct amdgpu_=
ib *ib,
>  /**
>   * sdma_v4_0_ring_pad_ib - pad the IB to the required number of dw
>   *
> + * @ring: amdgpu_ring structure holding ring information
>   * @ib: indirect buffer to fill with padding
> - *
>   */
>  static void sdma_v4_0_ring_pad_ib(struct amdgpu_ring *ring, struct amdgp=
u_ib *ib)
>  {
> @@ -1772,7 +1776,8 @@ static void sdma_v4_0_ring_emit_pipeline_sync(struc=
t amdgpu_ring *ring)
>   * sdma_v4_0_ring_emit_vm_flush - vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> - * @vm: amdgpu_vm pointer
> + * @vmid: vmid number to use
> + * @pd_addr: address
>   *
>   * Update the page table base and flush the VM TLB
>   * using sDMA (VEGA10).
> @@ -2491,10 +2496,11 @@ static void sdma_v4_0_set_irq_funcs(struct amdgpu=
_device *adev)
>  /**
>   * sdma_v4_0_emit_copy_buffer - copy buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to copy to
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> + * @tmz: if a secure copy should be used
>   *
>   * Copy GPU buffers using the DMA engine (VEGA10/12).
>   * Used by the amdgpu ttm implementation to move pages if
> @@ -2520,7 +2526,7 @@ static void sdma_v4_0_emit_copy_buffer(struct amdgp=
u_ib *ib,
>  /**
>   * sdma_v4_0_emit_fill_buffer - fill buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to copy to
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
