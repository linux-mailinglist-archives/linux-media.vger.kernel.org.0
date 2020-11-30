Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B354E2C9134
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730781AbgK3Wep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730767AbgK3Wen (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:34:43 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D471C0613CF;
        Mon, 30 Nov 2020 14:34:03 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id f48so4450210otf.8;
        Mon, 30 Nov 2020 14:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gyYY5a12MV/o4gurmUhmG00sR9wI5XmwUyfOMATusZg=;
        b=np6tc4z0D4AAJjPoyIVs23Ca3f0yq6rne+n5UEzlDQ627NDtJR8mm1vde3qrFvKvSF
         ipDwIOvgDVkfTlyPSGyusMgYtxmznK8SD5DQcyyh5lj4ibyCOnZR/aO7BMBSBaaEnWov
         TkFTYCc3xcyWrQtg+1iA9eVnFtHGhx+ZrAj/WBFzihj3gzwSxVzH98hnaiuv/GUmA3Ip
         4JN7XJw7WmqNLhy+j9idzrxSMcn+gELnc2rp4Uvju7Rav+ScYtbEMmooJrHopUg1g2v3
         akYlpbEvHWw0kkfrcRpafRSCTrYAEFZvTKpyhIXyesfx3UJJrU77QHu5H/jKN8jAqq9d
         z5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gyYY5a12MV/o4gurmUhmG00sR9wI5XmwUyfOMATusZg=;
        b=F+HAdewHNyIkLjiYnMN1A9AMwAPB7OHzYzxl1JavRz3mcNIMFmDs4KbINX5mLylOQc
         RRlNT/gsSp/1cXwKKW24zksvGaEkws3s1PCgJJ8lnlsE60grtd0ERnfVel07SCPw2ofr
         lHslGKsohictVT8jkJP6/mANBjmkSTPaHV5gWKtjYpdpR6xTuATNPC9pRAAf7QhZEwdF
         N0j25WAunlllNfNkru/RnkSqieaec2HdE3YEuJWOUCzjDA8+VjOs/+BFxNlwPPsr4Gc+
         S2aNQOfiiHsNT6ofr7+41OjCZXeMewVENjs/nx6flKu3NFT6l3RsjI/yDxrl1jkT/syu
         bxvw==
X-Gm-Message-State: AOAM532cP+m6Ktxo8GyIYRFpVDj5INgh5fjNTKoML0BDIaSd7yPP5sJv
        b9OU+oDyDvjUpqGPUagq4iIKb9Ff9q39KMLzWc33l8Ng
X-Google-Smtp-Source: ABdhPJw6vZpQGLxonZK8/CNO8aOSU/066f18GDqWNMDqCFthRDjjDFHzEqbrpTLZ16jnhjS8XZndr63XaCcynZMeJdY=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19217386otf.132.1606775642635;
 Mon, 30 Nov 2020 14:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-25-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-25-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:33:51 -0500
Message-ID: <CADnq5_PJeb7QnmBVZWY6o8O_mYN+u5E8hp7U8BJ+srE+WhBr=A@mail.gmail.com>
Subject: Re: [PATCH 24/40] drm/amd/amdgpu/sdma_v5_2: Provide some missing and
 repair other function params
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:367: warning: Function parameter =
or member 'job' not described in 'sdma_v5_2_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:367: warning: Function parameter =
or member 'flags' not described in 'sdma_v5_2_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:429: warning: Function parameter =
or member 'addr' not described in 'sdma_v5_2_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:429: warning: Function parameter =
or member 'seq' not described in 'sdma_v5_2_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:429: warning: Function parameter =
or member 'flags' not described in 'sdma_v5_2_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:429: warning: Excess function par=
ameter 'fence' description in 'sdma_v5_2_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:924: warning: Function parameter =
or member 'timeout' not described in 'sdma_v5_2_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1030: warning: Function parameter=
 or member 'value' not described in 'sdma_v5_2_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1030: warning: Excess function pa=
rameter 'addr' description in 'sdma_v5_2_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1030: warning: Excess function pa=
rameter 'flags' description in 'sdma_v5_2_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1083: warning: Function parameter=
 or member 'ring' not described in 'sdma_v5_2_ring_pad_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1137: warning: Function parameter=
 or member 'vmid' not described in 'sdma_v5_2_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1137: warning: Function parameter=
 or member 'pd_addr' not described in 'sdma_v5_2_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1137: warning: Excess function pa=
rameter 'vm' description in 'sdma_v5_2_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1717: warning: Function parameter=
 or member 'ib' not described in 'sdma_v5_2_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1717: warning: Function parameter=
 or member 'tmz' not described in 'sdma_v5_2_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1717: warning: Excess function pa=
rameter 'ring' description in 'sdma_v5_2_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1743: warning: Function parameter=
 or member 'ib' not described in 'sdma_v5_2_emit_fill_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1743: warning: Excess function pa=
rameter 'ring' description in 'sdma_v5_2_emit_fill_buffer'
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v5_2.c
> index cb5a6f1437f81..e8736360d1a9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -356,7 +356,9 @@ static void sdma_v5_2_ring_insert_nop(struct amdgpu_r=
ing *ring, uint32_t count)
>   * sdma_v5_2_ring_emit_ib - Schedule an IB on the DMA engine
>   *
>   * @ring: amdgpu ring pointer
> + * @job: job to retrive vmid from
>   * @ib: IB object to schedule
> + * @flags: unused
>   *
>   * Schedule an IB in the DMA ring.
>   */
> @@ -418,7 +420,9 @@ static void sdma_v5_2_ring_emit_hdp_flush(struct amdg=
pu_ring *ring)
>   * sdma_v5_2_ring_emit_fence - emit a fence on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
> - * @fence: amdgpu fence object
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Add a DMA fence packet to the ring to write
>   * the fence seq number and DMA trap packet to generate
> @@ -916,6 +920,7 @@ static int sdma_v5_2_ring_test_ring(struct amdgpu_rin=
g *ring)
>   * sdma_v5_2_ring_test_ib - test an IB on the DMA engine
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Test a simple IB in the DMA ring.
>   * Returns 0 on success, error on failure.
> @@ -1017,10 +1022,9 @@ static void sdma_v5_2_vm_copy_pte(struct amdgpu_ib=
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
>   * Update PTEs by writing them manually using sDMA.
>   */
> @@ -1076,6 +1080,7 @@ static void sdma_v5_2_vm_set_pte_pde(struct amdgpu_=
ib *ib,
>   * sdma_v5_2_ring_pad_ib - pad the IB
>   *
>   * @ib: indirect buffer to fill with padding
> + * @ring: amdgpu_ring structure holding ring information
>   *
>   * Pad the IB with NOPs to a boundary multiple of 8.
>   */
> @@ -1127,7 +1132,8 @@ static void sdma_v5_2_ring_emit_pipeline_sync(struc=
t amdgpu_ring *ring)
>   * sdma_v5_2_ring_emit_vm_flush - vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> - * @vm: amdgpu_vm pointer
> + * @vmid: vmid number to use
> + * @pd_addr: address
>   *
>   * Update the page table base and flush the VM TLB
>   * using sDMA.
> @@ -1700,10 +1706,11 @@ static void sdma_v5_2_set_irq_funcs(struct amdgpu=
_device *adev)
>  /**
>   * sdma_v5_2_emit_copy_buffer - copy buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to copy to
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> + * @tmz: if a secure copy should be used
>   *
>   * Copy GPU buffers using the DMA engine.
>   * Used by the amdgpu ttm implementation to move pages if
> @@ -1729,7 +1736,7 @@ static void sdma_v5_2_emit_copy_buffer(struct amdgp=
u_ib *ib,
>  /**
>   * sdma_v5_2_emit_fill_buffer - fill buffer using the sDMA engine
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
