Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C8E2C9178
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387411AbgK3Wsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:48:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728184AbgK3Wsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:48:52 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5322C0613D3;
        Mon, 30 Nov 2020 14:48:11 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id 11so12964822oty.9;
        Mon, 30 Nov 2020 14:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zkkc8pfsxlB6UM27SRcUb/R8YddNwGtvKYi9fD74k5s=;
        b=uszyjEjyB+e7gWFkZeFANQNsE7RO1O1cIm9RXAOZGoccIVzkqC6uDg+RFjbD5Dz0Gx
         iSApk18QO8fTrhxXJdoe6YrhGMPEeAR6kqOXUPKXOrB/5kIHrRUEt97AfvzV0irfgzmC
         5H7AlWXeq7ke3DmR6w1kYYkHeTAZDYD6EqlM1oh7Xl8koL05qNooS+r1Peei31YP4Ys4
         99n23i4Shyiby452e+5psljDKdSARz3Fp40Gta2Hl9eLPP3J2VaZ1xTWohyi1g5+Hp+o
         XJf+Js7pMOYlM6GjPZOinxYPp1yZyLPgKyOvAA5bbnXjfCARHYlXrSv1vneEn10XZEes
         R6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zkkc8pfsxlB6UM27SRcUb/R8YddNwGtvKYi9fD74k5s=;
        b=nS7vqq55/x5hYDymRlAOVOIWAax8R1/JwWZ58RHNLE1Y4RgmQOsDMkmMt+jp5MH70K
         uQw98A1wc2LX/aSwfwmS7wN++tvJ6kjJi+ty+KUzmaXnJXCV+GelazVVK9LkFW4qPVWv
         UlXvswXqaoHxhkbeFvDTJG1+MKicr/A2kH3pDEovLBlFqMcEeV5dDM9AXXXBnl+ixllm
         DhYg91BM3KMUq6X/zrLZgS8sioKOP6zEMQhKz1juBXG/YSzQ992gZvR1ha0eQamtdmXq
         dJwiZCO4wtqBJqgA2quGz1CzG81scMClnPCbJ6EKpQeTWhTY6A6lLsbTj17pSAbMQR3G
         znag==
X-Gm-Message-State: AOAM533udKDTc1Ll0xSYddGXoeahPGKLBmg8B/S/Msjw4QNhWN/hyX7h
        5rms6pmv8dkjqj26Z1lHubgX03l4AFE09W1yKHA=
X-Google-Smtp-Source: ABdhPJykMIhvG+RXVv/eoCBrII0g7U11g7bTv+8Ci179QNLETDVQVnJ3NSK2UbE4R0ApR5IoKwUG9m6XuDo9P+tOtJM=
X-Received: by 2002:a9d:5388:: with SMTP id w8mr18820422otg.311.1606776491321;
 Mon, 30 Nov 2020 14:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-24-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-24-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:48:00 -0500
Message-ID: <CADnq5_M_wiSQpUqzf_KHX6Fqw+gcTcDTv89CN+J-T5nF82X2jA@mail.gmail.com>
Subject: Re: [PATCH 23/40] drm/amd/amdgpu/sdma_v5_0: Provide some missing and
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

On Tue, Nov 24, 2020 at 2:45 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:403: warning: Function parameter =
or member 'job' not described in 'sdma_v5_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:403: warning: Function parameter =
or member 'flags' not described in 'sdma_v5_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:480: warning: Function parameter =
or member 'addr' not described in 'sdma_v5_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:480: warning: Function parameter =
or member 'seq' not described in 'sdma_v5_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:480: warning: Function parameter =
or member 'flags' not described in 'sdma_v5_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:480: warning: Excess function par=
ameter 'fence' description in 'sdma_v5_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:967: warning: Function parameter =
or member 'timeout' not described in 'sdma_v5_0_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1074: warning: Function parameter=
 or member 'value' not described in 'sdma_v5_0_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1074: warning: Excess function pa=
rameter 'addr' description in 'sdma_v5_0_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1074: warning: Excess function pa=
rameter 'flags' description in 'sdma_v5_0_vm_write_pte'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1126: warning: Function parameter=
 or member 'ring' not described in 'sdma_v5_0_ring_pad_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1180: warning: Function parameter=
 or member 'vmid' not described in 'sdma_v5_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1180: warning: Function parameter=
 or member 'pd_addr' not described in 'sdma_v5_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1180: warning: Excess function pa=
rameter 'vm' description in 'sdma_v5_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1703: warning: Function parameter=
 or member 'ib' not described in 'sdma_v5_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1703: warning: Function parameter=
 or member 'tmz' not described in 'sdma_v5_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1703: warning: Excess function pa=
rameter 'ring' description in 'sdma_v5_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1729: warning: Function parameter=
 or member 'ib' not described in 'sdma_v5_0_emit_fill_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1729: warning: Excess function pa=
rameter 'ring' description in 'sdma_v5_0_emit_fill_buffer'
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v5_0.c
> index 9c72b95b74639..5180a52a79a54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -392,7 +392,9 @@ static void sdma_v5_0_ring_insert_nop(struct amdgpu_r=
ing *ring, uint32_t count)
>   * sdma_v5_0_ring_emit_ib - Schedule an IB on the DMA engine
>   *
>   * @ring: amdgpu ring pointer
> + * @job: job to retrive vmid from
>   * @ib: IB object to schedule
> + * @flags: unused
>   *
>   * Schedule an IB in the DMA ring (NAVI10).
>   */
> @@ -469,7 +471,9 @@ static void sdma_v5_0_ring_emit_hdp_flush(struct amdg=
pu_ring *ring)
>   * sdma_v5_0_ring_emit_fence - emit a fence on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
> - * @fence: amdgpu fence object
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Add a DMA fence packet to the ring to write
>   * the fence seq number and DMA trap packet to generate
> @@ -959,6 +963,7 @@ static int sdma_v5_0_ring_test_ring(struct amdgpu_rin=
g *ring)
>   * sdma_v5_0_ring_test_ib - test an IB on the DMA engine
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Test a simple IB in the DMA ring (NAVI10).
>   * Returns 0 on success, error on failure.
> @@ -1061,10 +1066,9 @@ static void sdma_v5_0_vm_copy_pte(struct amdgpu_ib=
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
>   * Update PTEs by writing them manually using sDMA (NAVI10).
>   */
> @@ -1118,6 +1122,7 @@ static void sdma_v5_0_vm_set_pte_pde(struct amdgpu_=
ib *ib,
>
>  /**
>   * sdma_v5_0_ring_pad_ib - pad the IB
> + * @ring: amdgpu_ring structure holding ring information
>   * @ib: indirect buffer to fill with padding
>   *
>   * Pad the IB with NOPs to a boundary multiple of 8.
> @@ -1170,7 +1175,8 @@ static void sdma_v5_0_ring_emit_pipeline_sync(struc=
t amdgpu_ring *ring)
>   * sdma_v5_0_ring_emit_vm_flush - vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> - * @vm: amdgpu_vm pointer
> + * @vmid: vmid number to use
> + * @pd_addr: address
>   *
>   * Update the page table base and flush the VM TLB
>   * using sDMA (NAVI10).
> @@ -1686,10 +1692,11 @@ static void sdma_v5_0_set_irq_funcs(struct amdgpu=
_device *adev)
>  /**
>   * sdma_v5_0_emit_copy_buffer - copy buffer using the sDMA engine
>   *
> - * @ring: amdgpu_ring structure holding ring information
> + * @ib: indirect buffer to copy to
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> + * @tmz: if a secure copy should be used
>   *
>   * Copy GPU buffers using the DMA engine (NAVI10).
>   * Used by the amdgpu ttm implementation to move pages if
> @@ -1715,7 +1722,7 @@ static void sdma_v5_0_emit_copy_buffer(struct amdgp=
u_ib *ib,
>  /**
>   * sdma_v5_0_emit_fill_buffer - fill buffer using the sDMA engine
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
