Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4092C9143
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbgK3Wgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:36:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgK3Wgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:36:54 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5820FC0613CF;
        Mon, 30 Nov 2020 14:36:14 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id z13so3070064ooa.5;
        Mon, 30 Nov 2020 14:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2hkKSZ7MgTmpR98LdQFBKc6bH1HMiPPL7sx2H+5Kgc0=;
        b=dItdnB4nCK4SKp6j5TDLCJ7A0YFRrhbaSql4ME2c88F4qFesT3c+QwwWb8ubQCo7Ym
         KI2tCmzYCUDdDBZFdW8ZhW54+Tawo4P4YvZCGzBGEEE0qiYv5yfMho3hoJ0P6tw6oKhR
         95wugzX7jULn/hof5tvQ27xudGeCAF96foFHBAMCXuiTNSuu2OKO5NHmIwUY7Kp+zuVj
         CwnF68LP4fB5h5+yvi/Nxt6gyS2NQAOb7/xgkymieQQo7lNfG/CJpOmtHADTRwaSJjWj
         80eWhJoHg4De80h7FYkN8jYRmY9oT3co97ajbvhGLvmjW1imRySmxWdLoiw5uiRb3oSd
         Hryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2hkKSZ7MgTmpR98LdQFBKc6bH1HMiPPL7sx2H+5Kgc0=;
        b=khoXQAkWyTiQQ8p0hTTA03Z32u5b1zGtiClcDYxQGrmJ2KhgEuoWdu8p1irSIFxAIo
         b6u1LXLemEMnCOghBK2g8W2EAiAnzi4nVL3EMnidH3yFfbUAx+mx7Gloo79/Jv4Yz+IK
         cjSCnDKHqAzsPBySZj1SaYJyZUIbQo9vH2MjJjVgrTc7h7gCQkTsN8Pmdvq4A2EO8amJ
         Bw+DT2b9l+pbySKju7RXTXajv5Np1yat9wf7Wea+e+EMP//hbueDIc8+LgAmeP9fs/WL
         vxw5p6gekvm8yUbGaPbrukTdB4uDDRdjix357zUy/A2+rE9LjjmL8jC/v51bT2JNUyxH
         6PRw==
X-Gm-Message-State: AOAM5331lIA8dkFPFRqPdSrB+nK65Xv4fl+aH83a9vjQV5RKRAn4ULzS
        +W37ITX1NTpVBzi2WgfSGcne4GIQU8Wm6eTZkus=
X-Google-Smtp-Source: ABdhPJyb+a3B1yzI38iiFCRcP1XfLEAD1ilXbwaTnGQd+h9Dteyp8uncFq5K9oyN7TMZJIxYrP9hyqudYz38V3hh6AM=
X-Received: by 2002:a4a:d5d3:: with SMTP id a19mr17136481oot.61.1606775773775;
 Mon, 30 Nov 2020 14:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-26-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-26-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:36:02 -0500
Message-ID: <CADnq5_MCOhY0UEQCkGNNQCNpGN6YJphOp=GJdFgpgow7DVcqHw@mail.gmail.com>
Subject: Re: [PATCH 25/40] drm/amd/amdgpu/amdgpu_vce: Provide some missing and
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:97: warning: Function parameter =
or member 'size' not described in 'amdgpu_vce_sw_init'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:441: warning: Function parameter=
 or member 'bo' not described in 'amdgpu_vce_get_create_msg'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:441: warning: Excess function pa=
rameter 'adev' description in 'amdgpu_vce_get_create_msg'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:521: warning: Function parameter=
 or member 'direct' not described in 'amdgpu_vce_get_destroy_msg'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:521: warning: Excess function pa=
rameter 'adev' description in 'amdgpu_vce_get_destroy_msg'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:588: warning: Function parameter=
 or member 'ib_idx' not described in 'amdgpu_vce_validate_bo'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:636: warning: Function parameter=
 or member 'ib_idx' not described in 'amdgpu_vce_cs_reloc'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:636: warning: Function parameter=
 or member 'index' not described in 'amdgpu_vce_cs_reloc'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:720: warning: Function parameter=
 or member 'ib_idx' not described in 'amdgpu_vce_ring_parse_cs'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:956: warning: Function parameter=
 or member 'ib_idx' not described in 'amdgpu_vce_ring_parse_cs_vm'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1050: warning: Function paramete=
r or member 'job' not described in 'amdgpu_vce_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1050: warning: Function paramete=
r or member 'flags' not described in 'amdgpu_vce_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1066: warning: Function paramete=
r or member 'addr' not described in 'amdgpu_vce_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1066: warning: Function paramete=
r or member 'seq' not described in 'amdgpu_vce_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1066: warning: Function paramete=
r or member 'flags' not described in 'amdgpu_vce_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1066: warning: Excess function p=
arameter 'fence' description in 'amdgpu_vce_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1122: warning: Function paramete=
r or member 'timeout' not described in 'amdgpu_vce_ring_test_ib'
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vce.c
> index ecaa2d7483b20..1d8db318b0758 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -90,6 +90,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_rin=
g *ring, uint32_t handle,
>   * amdgpu_vce_init - allocate memory, load vce firmware
>   *
>   * @adev: amdgpu_device pointer
> + * @size: size for the new BO
>   *
>   * First step to get VCE online, allocate memory and load the firmware
>   */
> @@ -428,9 +429,9 @@ void amdgpu_vce_free_handles(struct amdgpu_device *ad=
ev, struct drm_file *filp)
>  /**
>   * amdgpu_vce_get_create_msg - generate a VCE create msg
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: ring we should submit the msg to
>   * @handle: VCE session handle to use
> + * @bo: amdgpu object for which we query the offset
>   * @fence: optional fence to return
>   *
>   * Open up a stream for HW test
> @@ -509,9 +510,9 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ri=
ng *ring, uint32_t handle,
>  /**
>   * amdgpu_vce_get_destroy_msg - generate a VCE destroy msg
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: ring we should submit the msg to
>   * @handle: VCE session handle to use
> + * @direct: direct or delayed pool
>   * @fence: optional fence to return
>   *
>   * Close up a stream for HW test or if userspace failed to do so
> @@ -576,6 +577,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_r=
ing *ring, uint32_t handle,
>   * amdgpu_vce_cs_validate_bo - make sure not to cross 4GB boundary
>   *
>   * @p: parser context
> + * @ib_idx: indirect buffer to use
>   * @lo: address of lower dword
>   * @hi: address of higher dword
>   * @size: minimum size
> @@ -625,9 +627,11 @@ static int amdgpu_vce_validate_bo(struct amdgpu_cs_p=
arser *p, uint32_t ib_idx,
>   * amdgpu_vce_cs_reloc - command submission relocation
>   *
>   * @p: parser context
> + * @ib_idx: indirect buffer to use
>   * @lo: address of lower dword
>   * @hi: address of higher dword
>   * @size: minimum size
> + * @index: bs/fb index
>   *
>   * Patch relocation inside command stream with real buffer address
>   */
> @@ -714,7 +718,7 @@ static int amdgpu_vce_validate_handle(struct amdgpu_c=
s_parser *p,
>   * amdgpu_vce_cs_parse - parse and validate the command stream
>   *
>   * @p: parser context
> - *
> + * @ib_idx: indirect buffer to use
>   */
>  int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, uint32_t ib_idx=
)
>  {
> @@ -950,7 +954,7 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser =
*p, uint32_t ib_idx)
>   * amdgpu_vce_cs_parse_vm - parse the command stream in VM mode
>   *
>   * @p: parser context
> - *
> + * @ib_idx: indirect buffer to use
>   */
>  int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p, uint32_t ib_=
idx)
>  {
> @@ -1040,7 +1044,9 @@ int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_pa=
rser *p, uint32_t ib_idx)
>   * amdgpu_vce_ring_emit_ib - execute indirect buffer
>   *
>   * @ring: engine to use
> + * @job: job to retrive vmid from
>   * @ib: the IB to execute
> + * @flags: unused
>   *
>   */
>  void amdgpu_vce_ring_emit_ib(struct amdgpu_ring *ring,
> @@ -1058,7 +1064,9 @@ void amdgpu_vce_ring_emit_ib(struct amdgpu_ring *ri=
ng,
>   * amdgpu_vce_ring_emit_fence - add a fence command to the ring
>   *
>   * @ring: engine to use
> - * @fence: the fence
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   */
>  void amdgpu_vce_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 =
seq,
> @@ -1116,6 +1124,7 @@ int amdgpu_vce_ring_test_ring(struct amdgpu_ring *r=
ing)
>   * amdgpu_vce_ring_test_ib - test if VCE IBs are working
>   *
>   * @ring: the engine to test on
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   */
>  int amdgpu_vce_ring_test_ib(struct amdgpu_ring *ring, long timeout)
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
