Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42AD32C90EE
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730599AbgK3WYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbgK3WYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:24:05 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EB9C0613CF;
        Mon, 30 Nov 2020 14:23:25 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id t23so3064555oov.4;
        Mon, 30 Nov 2020 14:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eO3myOm8MSK3jyKjYE6sMfesyVv9C6pfY7cNZHqo3js=;
        b=Ft9qg+NfmRqwqdcs5nYKUDh3oSYc2N6RMyX7+xwnOd3+9n5wk9Q1UeHrDWNhiyMGRU
         ouXJHJ7yKdq9U+kVaDwpk9VxxuredEmDVoprLf5VqOkMG5oCB9LJ6XNWQcOn4zcXFHP+
         Fyfa2vwVD/EEkZbd8RZqC0xb1k/l9W5RjAeQKGBWvDmcqijedH6S4/2itEu+dNW+2dpc
         2vjHWiS15vMS6HxbH9HIjcpMDCiRpiq2Qd9iRtE97KzYaFBqiaEn/nCd/EypEy/DZUv8
         nTkBuqCbUQbtTgekaj5/ZkV2dyUG1Sgqdj0PMy0kDmDcoJiV08rHNwXboy82oxoYKKM7
         jEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eO3myOm8MSK3jyKjYE6sMfesyVv9C6pfY7cNZHqo3js=;
        b=iUlDf2nv+MHe9gcshyzKJaP2gCQQ1zILtQRenovgYMutivlf1ZSi/0amTXNt4ILODT
         YTCBs9Wel5ggq4qdrakYd2Wy7zXw+xhYOTOS9HZi9fnWJM0uH6uqUXh9g0lsId1R/iGX
         vzfXfEsasF5blt4GBgoJVM/FGg5f1AGF8uTgN4dJ6mTRjKXyevYnLTPK/4gOUagkoUD7
         ErDwvudJ/ZCa+wINRKNJAy0lt5aKtVsUBDO+yGNPIK/Jl/V/wfwS6kkAKbwcUBIKroSZ
         GEhgJSE9Ik4ZshiTxia3/6hJ9qzqEQpUcDrFPPoyV5hET3IauMjRHlgLj2KprlskZp/R
         PpIw==
X-Gm-Message-State: AOAM530RJuH2woqj28vXh6qJofPPDAtnofOO5vv9Vg5k+rWJMBfgdNYH
        echvfBQKuzRwNLmwVmK26r75n4+0KX4/2Z3rjqE=
X-Google-Smtp-Source: ABdhPJzVdhBlTUgUdyyDNnM14tXyglwuSBoZd0E/nOy3jW8VWLdw5+Ne9wYwVvIqLAw7C1sBBjdC0BqMeyn8uZCcoQE=
X-Received: by 2002:a4a:d5d3:: with SMTP id a19mr17099613oot.61.1606775004742;
 Mon, 30 Nov 2020 14:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-18-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-18-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:23:13 -0500
Message-ID: <CADnq5_MZjZ69XPTmDgkpqTF-P7oWsgQDzWcGeaw4kWsU9uakyw@mail.gmail.com>
Subject: Re: [PATCH 17/40] drm/amd/amdgpu/sdma_v2_4: Fix a bunch of kernel-doc
 function documentation issues
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:254: warning: Function parameter =
or member 'job' not described in 'sdma_v2_4_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:254: warning: Function parameter =
or member 'flags' not described in 'sdma_v2_4_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:310: warning: Function parameter =
or member 'addr' not described in 'sdma_v2_4_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:310: warning: Function parameter =
or member 'seq' not described in 'sdma_v2_4_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:310: warning: Function parameter =
or member 'flags' not described in 'sdma_v2_4_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:310: warning: Excess function par=
ameter 'fence' description in 'sdma_v2_4_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:598: warning: Function parameter =
or member 'timeout' not described in 'sdma_v2_4_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:747: warning: Function parameter =
or member 'ring' not described in 'sdma_v2_4_ring_pad_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:799: warning: Function parameter =
or member 'vmid' not described in 'sdma_v2_4_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:799: warning: Function parameter =
or member 'pd_addr' not described in 'sdma_v2_4_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:799: warning: Excess function par=
ameter 'vm' description in 'sdma_v2_4_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1205: warning: Function parameter=
 or member 'ib' not described in 'sdma_v2_4_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1205: warning: Function parameter=
 or member 'tmz' not described in 'sdma_v2_4_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1205: warning: Excess function pa=
rameter 'ring' description in 'sdma_v2_4_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1230: warning: Function parameter=
 or member 'ib' not described in 'sdma_v2_4_emit_fill_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c:1230: warning: Excess function pa=
rameter 'ring' description in 'sdma_v2_4_emit_fill_buffer'
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v2_4.c
> index 5f304d61999eb..22e9e4fe561d9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -243,7 +243,9 @@ static void sdma_v2_4_ring_insert_nop(struct amdgpu_r=
ing *ring, uint32_t count)
>   * sdma_v2_4_ring_emit_ib - Schedule an IB on the DMA engine
>   *
>   * @ring: amdgpu ring pointer
> + * @job: job to retrive vmid from
>   * @ib: IB object to schedule
> + * @flags: unused
>   *
>   * Schedule an IB in the DMA ring (VI).
>   */
> @@ -299,7 +301,9 @@ static void sdma_v2_4_ring_emit_hdp_flush(struct amdg=
pu_ring *ring)
>   * sdma_v2_4_ring_emit_fence - emit a fence on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
> - * @fence: amdgpu fence object
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Add a DMA fence packet to the ring to write
>   * the fence seq number and DMA trap packet to generate
> @@ -590,6 +594,7 @@ static int sdma_v2_4_ring_test_ring(struct amdgpu_rin=
g *ring)
>   * sdma_v2_4_ring_test_ib - test an IB on the DMA engine
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Test a simple IB in the DMA ring (VI).
>   * Returns 0 on success, error on failure.
> @@ -740,6 +745,7 @@ static void sdma_v2_4_vm_set_pte_pde(struct amdgpu_ib=
 *ib, uint64_t pe,
>  /**
>   * sdma_v2_4_ring_pad_ib - pad the IB to the required number of dw
>   *
> + * @ring: amdgpu_ring structure holding ring information
>   * @ib: indirect buffer to fill with padding
>   *
>   */
> @@ -789,7 +795,8 @@ static void sdma_v2_4_ring_emit_pipeline_sync(struct =
amdgpu_ring *ring)
>   * sdma_v2_4_ring_emit_vm_flush - cik vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> - * @vm: amdgpu_vm pointer
> + * @vmid: vmid number to use
> + * @pd_addr: address
>   *
>   * Update the page table base and flush the VM TLB
>   * using sDMA (VI).
> @@ -1188,10 +1195,11 @@ static void sdma_v2_4_set_irq_funcs(struct amdgpu=
_device *adev)
>  /**
>   * sdma_v2_4_emit_copy_buffer - copy buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to copy to
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> + * @tmz: unused
>   *
>   * Copy GPU buffers using the DMA engine (VI).
>   * Used by the amdgpu ttm implementation to move pages if
> @@ -1216,7 +1224,7 @@ static void sdma_v2_4_emit_copy_buffer(struct amdgp=
u_ib *ib,
>  /**
>   * sdma_v2_4_emit_fill_buffer - fill buffer using the sDMA engine
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
