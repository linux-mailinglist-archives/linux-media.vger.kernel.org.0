Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4902C2C41
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 17:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390102AbgKXQFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 11:05:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbgKXQFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 11:05:04 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECCDC0613D6;
        Tue, 24 Nov 2020 08:05:04 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id w24so3429447wmi.0;
        Tue, 24 Nov 2020 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eAGr3DQcsKhWlLHEgJKNqKCG/NqAg2PxBv3X0YMYqME=;
        b=cIr5RA23loi+Mj1hkEQvitpASDHKtNsWTeejme8wYgnd4gIKBufCKHhgZihsKX3q+g
         iDb3jixa4XkOJrzErD4bZ+EtZTi/9mbiTYQdgVuCZ4R1sLp7/ADkRAWH8Hr/SoBjOJp8
         QlXc9NkUqT2IetHB1Fd9xqn32fs6tMZX54eX2hiJ10kSiNAQXG6TPlwqlCV9uwDx56Lz
         +vOGtTqssEQ+443S64V5yTo/yrd+LzpVPVsoOruyaWCMLEv686OwbYz4kdScw/Mpv/Le
         Ed9eWKSA4NCXlY6wxDV46QrFafU247liwAaMqJYimTO2VY3jCFpu2tRDcgyGc+zI3y2v
         dDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eAGr3DQcsKhWlLHEgJKNqKCG/NqAg2PxBv3X0YMYqME=;
        b=XIcFBOrqJCQe4M03PSjGILYM13g1+o2HRgtDe/7fFNzRHPWQ8rvTt72OZX9ryD4OJ6
         QRk+XQFWxxtq0w0jZYsF7tkDhMqOKDrDFipaspTZW38gJOOSPWkV2fhRobKrxy6YaCd0
         J5yOVf5dp0o6R8sMYKRULiGnt2MdiBfhRJa5WqC9QcwxiMU8RtpYuJBqUg8zOhtXXBHt
         Rr7iAeyJd/owbzXaOLp6CeMn2NClJomvonIuvzCFXPcTn4zMtHwWVnZ7uiKI7A0FmNqr
         kLzCueXHC4xKuUwGyvGvErhk+QXNFIXFi/EmmeB9hLDqaRCKM14pIIHMYwg5/8UYe0jB
         H6Iw==
X-Gm-Message-State: AOAM530Kz4mOPClqR28FjFCRl35dUiWI3r1OT6i2TTkjS+VnGwaeQaD8
        WCrdMbCjln/dr8sFMARRmfTQilWtwsiqQ1b/n0w=
X-Google-Smtp-Source: ABdhPJw1kkh7TErhGfvIQBDmmJXpFzI3W8FKtUHQ/hInHFM+OR6eR/JkQrIlESBR1s/17xkOhJYyirdg1+6Vv4bXWQY=
X-Received: by 2002:a1c:2dc8:: with SMTP id t191mr5167167wmt.73.1606233902789;
 Tue, 24 Nov 2020 08:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org> <20201123111919.233376-10-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-10-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 24 Nov 2020 11:04:51 -0500
Message-ID: <CADnq5_P3VD4RBFwj+8RX6yc1zOnkj2f2ikOv1xTxdOwJ2B=zTg@mail.gmail.com>
Subject: Re: [PATCH 09/40] drm/amd/amdgpu/gfx_v7_0: Clean-up a bunch of
 kernel-doc related issues
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:1590: warning: Function parameter =
or member 'instance' not described in 'gfx_v7_0_select_se_sh'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:1788: warning: Excess function par=
ameter 'se_num' description in 'gfx_v7_0_setup_rb'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:1788: warning: Excess function par=
ameter 'sh_per_se' description in 'gfx_v7_0_setup_rb'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:1852: warning: Excess function par=
ameter 'adev' description in 'DEFAULT_SH_MEM_BASES'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2086: warning: Excess function par=
ameter 'adev' description in 'gfx_v7_0_ring_test_ring'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2130: warning: Function parameter =
or member 'ring' not described in 'gfx_v7_0_ring_emit_hdp_flush'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2130: warning: Excess function par=
ameter 'adev' description in 'gfx_v7_0_ring_emit_hdp_flush'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2130: warning: Excess function par=
ameter 'ridx' description in 'gfx_v7_0_ring_emit_hdp_flush'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Function parameter =
or member 'ring' not described in 'gfx_v7_0_ring_emit_fence_gfx'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Function parameter =
or member 'addr' not described in 'gfx_v7_0_ring_emit_fence_gfx'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Function parameter =
or member 'seq' not described in 'gfx_v7_0_ring_emit_fence_gfx'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Function parameter =
or member 'flags' not described in 'gfx_v7_0_ring_emit_fence_gfx'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Excess function par=
ameter 'adev' description in 'gfx_v7_0_ring_emit_fence_gfx'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2182: warning: Excess function par=
ameter 'fence' description in 'gfx_v7_0_ring_emit_fence_gfx'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Function parameter =
or member 'ring' not described in 'gfx_v7_0_ring_emit_fence_compute'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Function parameter =
or member 'addr' not described in 'gfx_v7_0_ring_emit_fence_compute'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Function parameter =
or member 'seq' not described in 'gfx_v7_0_ring_emit_fence_compute'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Function parameter =
or member 'flags' not described in 'gfx_v7_0_ring_emit_fence_compute'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Excess function par=
ameter 'adev' description in 'gfx_v7_0_ring_emit_fence_compute'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2224: warning: Excess function par=
ameter 'fence' description in 'gfx_v7_0_ring_emit_fence_compute'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2260: warning: Function parameter =
or member 'job' not described in 'gfx_v7_0_ring_emit_ib_gfx'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2260: warning: Function parameter =
or member 'flags' not described in 'gfx_v7_0_ring_emit_ib_gfx'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2351: warning: Function parameter =
or member 'timeout' not described in 'gfx_v7_0_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3244: warning: Function parameter =
or member 'ring' not described in 'gfx_v7_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3244: warning: Function parameter =
or member 'vmid' not described in 'gfx_v7_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3244: warning: Function parameter =
or member 'pd_addr' not described in 'gfx_v7_0_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3244: warning: Excess function par=
ameter 'adev' description in 'gfx_v7_0_ring_emit_vm_flush'
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
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 33 +++++++++++++++------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v7_0.c
> index 04e1e92f5f3cf..f2490f915a8be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -1580,10 +1580,10 @@ static void gfx_v7_0_tiling_mode_table_init(struc=
t amdgpu_device *adev)
>   * @adev: amdgpu_device pointer
>   * @se_num: shader engine to address
>   * @sh_num: sh block to address
> + * @instance: Certain registers are instanced per SE or SH.
> + *            0xffffffff means broadcast to all SEs or SHs (CIK).
>   *
> - * Select which SE, SH combinations to address. Certain
> - * registers are instanced per SE or SH.  0xffffffff means
> - * broadcast to all SEs or SHs (CIK).
> + * Select which SE, SH combinations to address.
>   */
>  static void gfx_v7_0_select_se_sh(struct amdgpu_device *adev,
>                                   u32 se_num, u32 sh_num, u32 instance)
> @@ -1779,8 +1779,6 @@ gfx_v7_0_write_harvested_raster_configs(struct amdg=
pu_device *adev,
>   * gfx_v7_0_setup_rb - setup the RBs on the asic
>   *
>   * @adev: amdgpu_device pointer
> - * @se_num: number of SEs (shader engines) for the asic
> - * @sh_per_se: number of SH blocks per SE for the asic
>   *
>   * Configures per-SE/SH RB registers (CIK).
>   */
> @@ -1841,6 +1839,7 @@ static void gfx_v7_0_setup_rb(struct amdgpu_device =
*adev)
>         mutex_unlock(&adev->grbm_idx_mutex);
>  }
>
> +#define DEFAULT_SH_MEM_BASES   (0x6000)
>  /**
>   * gfx_v7_0_init_compute_vmid - gart enable
>   *
> @@ -1849,7 +1848,6 @@ static void gfx_v7_0_setup_rb(struct amdgpu_device =
*adev)
>   * Initialize compute vmid sh_mem registers
>   *
>   */
> -#define DEFAULT_SH_MEM_BASES   (0x6000)
>  static void gfx_v7_0_init_compute_vmid(struct amdgpu_device *adev)
>  {
>         int i;
> @@ -2074,7 +2072,6 @@ static void gfx_v7_0_scratch_init(struct amdgpu_dev=
ice *adev)
>  /**
>   * gfx_v7_0_ring_test_ring - basic gfx ring test
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: amdgpu_ring structure holding ring information
>   *
>   * Allocate a scratch register and write to it using the gfx ring (CIK).
> @@ -2121,8 +2118,7 @@ static int gfx_v7_0_ring_test_ring(struct amdgpu_ri=
ng *ring)
>  /**
>   * gfx_v7_0_ring_emit_hdp - emit an hdp flush on the cp
>   *
> - * @adev: amdgpu_device pointer
> - * @ridx: amdgpu ring index
> + * @ring: amdgpu_ring structure holding ring information
>   *
>   * Emits an hdp flush on the cp.
>   */
> @@ -2171,8 +2167,10 @@ static void gfx_v7_0_ring_emit_vgt_flush(struct am=
dgpu_ring *ring)
>  /**
>   * gfx_v7_0_ring_emit_fence_gfx - emit a fence on the gfx ring
>   *
> - * @adev: amdgpu_device pointer
> - * @fence: amdgpu fence object
> + * @ring: amdgpu_ring structure holding ring information
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Emits a fence sequnce number on the gfx ring and flushes
>   * GPU caches.
> @@ -2212,8 +2210,10 @@ static void gfx_v7_0_ring_emit_fence_gfx(struct am=
dgpu_ring *ring, u64 addr,
>  /**
>   * gfx_v7_0_ring_emit_fence_compute - emit a fence on the compute ring
>   *
> - * @adev: amdgpu_device pointer
> - * @fence: amdgpu fence object
> + * @ring: amdgpu_ring structure holding ring information
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Emits a fence sequnce number on the compute ring and flushes
>   * GPU caches.
> @@ -2245,7 +2245,9 @@ static void gfx_v7_0_ring_emit_fence_compute(struct=
 amdgpu_ring *ring,
>   * gfx_v7_0_ring_emit_ib - emit an IB (Indirect Buffer) on the ring
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @job: job to retrive vmid from
>   * @ib: amdgpu indirect buffer object
> + * @flags: options (AMDGPU_HAVE_CTX_SWITCH)
>   *
>   * Emits an DE (drawing engine) or CE (constant engine) IB
>   * on the gfx ring.  IBs are usually generated by userspace
> @@ -2342,6 +2344,7 @@ static void gfx_v7_ring_emit_cntxcntl(struct amdgpu=
_ring *ring, uint32_t flags)
>   * gfx_v7_0_ring_test_ib - basic ring IB test
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Allocate an IB and execute it on the gfx ring (CIK).
>   * Provides a basic gfx ring test to verify that IBs are working.
> @@ -3234,7 +3237,9 @@ static void gfx_v7_0_ring_emit_pipeline_sync(struct=
 amdgpu_ring *ring)
>  /**
>   * gfx_v7_0_ring_emit_vm_flush - cik vm flush using the CP
>   *
> - * @adev: amdgpu_device pointer
> + * @ring: amdgpu_ring pointer
> + * @vmid: vmid number to use
> + * @pd_addr: address
>   *
>   * Update the page table base and flush the VM TLB
>   * using the CP (CIK).
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
