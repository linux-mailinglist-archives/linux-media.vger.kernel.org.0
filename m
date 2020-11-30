Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0342C90F7
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbgK3WZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgK3WZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:25:50 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B991C0613CF;
        Mon, 30 Nov 2020 14:25:10 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id y24so12945464otk.3;
        Mon, 30 Nov 2020 14:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mdmHpBC1mZ2ZTUTInIyhxSGqs4PVC6GNokIyybMLyWY=;
        b=RmJ3dfurwpzv+yEZ+/chvFK0/wryVYSAGUQLVnmlfROiCd43ugT2fC48Zzr2UOjtTX
         uVGL56C/ZV19iKwLWZ7NWRmX1VnNhe+k3UUXkXm3GFk2W3LiZRQPLUV40tecda90gfuh
         EAUFe2hvytA1BTF89ZlS+YLDxbQ3m72r8k1hCRQX+jfqb8L1ThBptY3kviS1nNBdX+7Z
         J2FZ79dAw3DYzttXhYF4jEM4rqwdcvA58Iq40qxe0jdrV5gsYaKstC+uhoWPlKlOTnNQ
         cddbZfEZQCoHfF4y7iPE9o+W4d4QcWIwrlclBx3futXgDcFOTBGNuDGDORFgvRIYdOuJ
         x6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mdmHpBC1mZ2ZTUTInIyhxSGqs4PVC6GNokIyybMLyWY=;
        b=UPI9fh6xeQ0XIr9hLJdfwtDLhInE8SA8SfcVvQUSR1/I84+HlGvpXw8s7rZqj8zyPY
         H/OgQvUhsixhl4vJYWFOSsHpe8NYQkcB0AMYxn72SFb9FMmli2Ofc/yGUfOJz9Hl/IbI
         lNK66YpUmRNsZq/JTxmDYo+VghpMYLObVkM1m5aR+T5TtmqjURMBxlF8DNxPACNH7X6w
         ZyiDvDykO7l59RDxwKjY8EcqMNCb2CnPK+iErQqjOVLnZEW8OttTneVQhUzcthGy/Pr1
         jcC8xGWR/Xjvvm+wkmS1I+dMeB2w/RddkukTmQry+Rubml7sjaurnyxMbbGxGOPNfzhH
         esLA==
X-Gm-Message-State: AOAM532VrKuu5ZOrq8OB5eXdRf7h826HX+RmxVZID/aukqHf/kMNyB5Z
        BNvJmdcKUVHo7PQr+WWFsm8+P+V2DFjwTiRh6us=
X-Google-Smtp-Source: ABdhPJx7YuYc6XOEoAJ2l7l+3ARfA4DgeBxr4AM4YSynh7zqKJ7SC7AjFJcXVy4iVNhgU7695PUhFnE79P3wFKjnijI=
X-Received: by 2002:a05:6830:22e4:: with SMTP id t4mr19011073otc.23.1606775109874;
 Mon, 30 Nov 2020 14:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-19-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-19-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:24:58 -0500
Message-ID: <CADnq5_MA9b52rWgFtF8uqxWUcNBceBYSpa9fJc-YGnBjDN=N=Q@mail.gmail.com>
Subject: Re: [PATCH 18/40] drm/amd/amdgpu/sdma_v3_0: Fix a bunch of kernel-doc
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

On Tue, Nov 24, 2020 at 2:44 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:428: warning: Function parameter =
or member 'job' not described in 'sdma_v3_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:428: warning: Function parameter =
or member 'flags' not described in 'sdma_v3_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:484: warning: Function parameter =
or member 'addr' not described in 'sdma_v3_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:484: warning: Function parameter =
or member 'seq' not described in 'sdma_v3_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:484: warning: Function parameter =
or member 'flags' not described in 'sdma_v3_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:484: warning: Excess function par=
ameter 'fence' description in 'sdma_v3_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:870: warning: Function parameter =
or member 'timeout' not described in 'sdma_v3_0_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1018: warning: Function parameter=
 or member 'ring' not described in 'sdma_v3_0_ring_pad_ib'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1070: warning: Function parameter=
 or member 'vmid' not described in 'sdma_v3_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1070: warning: Function parameter=
 or member 'pd_addr' not described in 'sdma_v3_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1070: warning: Excess function pa=
rameter 'vm' description in 'sdma_v3_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1643: warning: Function parameter=
 or member 'ib' not described in 'sdma_v3_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1643: warning: Function parameter=
 or member 'tmz' not described in 'sdma_v3_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1643: warning: Excess function pa=
rameter 'ring' description in 'sdma_v3_0_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1668: warning: Function parameter=
 or member 'ib' not described in 'sdma_v3_0_emit_fill_buffer'
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c:1668: warning: Excess function pa=
rameter 'ring' description in 'sdma_v3_0_emit_fill_buffer'
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
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v3_0.c
> index c59f6f6f4c091..43410a7bccc25 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -417,7 +417,9 @@ static void sdma_v3_0_ring_insert_nop(struct amdgpu_r=
ing *ring, uint32_t count)
>   * sdma_v3_0_ring_emit_ib - Schedule an IB on the DMA engine
>   *
>   * @ring: amdgpu ring pointer
> + * @job: job to retrive vmid from
>   * @ib: IB object to schedule
> + * @flags: unused
>   *
>   * Schedule an IB in the DMA ring (VI).
>   */
> @@ -473,7 +475,9 @@ static void sdma_v3_0_ring_emit_hdp_flush(struct amdg=
pu_ring *ring)
>   * sdma_v3_0_ring_emit_fence - emit a fence on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
> - * @fence: amdgpu fence object
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Add a DMA fence packet to the ring to write
>   * the fence seq number and DMA trap packet to generate
> @@ -862,6 +866,7 @@ static int sdma_v3_0_ring_test_ring(struct amdgpu_rin=
g *ring)
>   * sdma_v3_0_ring_test_ib - test an IB on the DMA engine
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Test a simple IB in the DMA ring (VI).
>   * Returns 0 on success, error on failure.
> @@ -1011,6 +1016,7 @@ static void sdma_v3_0_vm_set_pte_pde(struct amdgpu_=
ib *ib, uint64_t pe,
>  /**
>   * sdma_v3_0_ring_pad_ib - pad the IB to the required number of dw
>   *
> + * @ring: amdgpu_ring structure holding ring information
>   * @ib: indirect buffer to fill with padding
>   *
>   */
> @@ -1060,7 +1066,8 @@ static void sdma_v3_0_ring_emit_pipeline_sync(struc=
t amdgpu_ring *ring)
>   * sdma_v3_0_ring_emit_vm_flush - cik vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> - * @vm: amdgpu_vm pointer
> + * @vmid: vmid number to use
> + * @pd_addr: address
>   *
>   * Update the page table base and flush the VM TLB
>   * using sDMA (VI).
> @@ -1630,6 +1637,7 @@ static void sdma_v3_0_set_irq_funcs(struct amdgpu_d=
evice *adev)
>   * @src_offset: src GPU address
>   * @dst_offset: dst GPU address
>   * @byte_count: number of bytes to xfer
> + * @tmz: unused
>   *
>   * Copy GPU buffers using the DMA engine (VI).
>   * Used by the amdgpu ttm implementation to move pages if
> @@ -1654,7 +1662,7 @@ static void sdma_v3_0_emit_copy_buffer(struct amdgp=
u_ib *ib,
>  /**
>   * sdma_v3_0_emit_fill_buffer - fill buffer using the sDMA engine
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
