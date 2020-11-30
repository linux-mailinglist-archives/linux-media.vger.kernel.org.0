Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BD52C914D
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387443AbgK3WkC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbgK3WkC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:40:02 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BF6C0613CF;
        Mon, 30 Nov 2020 14:39:21 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id j15so16036262oih.4;
        Mon, 30 Nov 2020 14:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MxABukxJKSzZI340VjbNc9Ii2tgyylZzcn8ZL6AhLdI=;
        b=VZ4agc69NkvYxtnQaNscYZ2k6HDMKZ44lv7cJ2FtleqUNoyxMvv24RwOYvEpxw7XgF
         facl5qPuZ68UJOA4g17HP4PtSri8AY4Dhu5ZUU5WcTL8wCi4huZ1RYoGimqcURDMy+Tv
         RAx0aqRo+TknBsZ3jPtEjrglA9K6eNUZW/5pCqdWryuvHNez9IZqWVK6lpSFVHrg70Ve
         epuD1ATKfbX+eUvpJzgUG3YPAx94uvpvjugU+ggwdmEQ9Rj3nLGM66dUUwzxcPB4fiV7
         FP7Syb9AK5/pb3rlRCTjUU4+kvM8so2YV5BuP1ZeE+tB+Qouulmvd3fNkOdpOT39ie9y
         aG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MxABukxJKSzZI340VjbNc9Ii2tgyylZzcn8ZL6AhLdI=;
        b=RJHCzicBlVLPuTT4Qlo38me3EAmiCV5mm0WSqliPgiLCOui0cIBYeLFdYibjsf9aEh
         D+65Ai9PRxVwszjuZY+6chRllrrqezvwqFc7Gx8LP6S5MWYKgbnOErl1z9Dx75OzAsRV
         8WYw94mMC4toPaxdgJntEMZss0qekaBluw5OVr1M9Qe4wkvGWkahk1UznHCAWiWWEmy5
         +MAyWjBnDVC644ISZKkdStTT/jYcYOQxiOc5Xn8Zbz/pzXdRX4+cMdSPnAtE75KOt7NC
         qliXWbVkoIkDR+TNk1vYq/Z8vfiYGRbkUfwrI+c/0JWHG9ksXTXb4M4qo2iX6imZ/nnq
         qlGA==
X-Gm-Message-State: AOAM531IzdzWf+YCSHoDKqcRAlR4tIbDYUHLqvDicxBJbx0Kfv2i2mIm
        88x0kNvXRo40uoIRGbFxE6a1xz7j7MjvMjh8mB4=
X-Google-Smtp-Source: ABdhPJxzgCheXo+Y0lVeXQ/bE+mi6xlmVc8k7awdoairIJSV52e48OhrTeeF90gNqqkydocuN3qCLBg994pn9rnvFjU=
X-Received: by 2002:a54:4608:: with SMTP id p8mr1997oip.5.1606775961133; Mon,
 30 Nov 2020 14:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-28-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-28-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:39:09 -0500
Message-ID: <CADnq5_PmcHRsiFQOxJZO98MQNjEu7U76ychjJgKdRLWZZLVUqQ@mail.gmail.com>
Subject: Re: [PATCH 27/40] drm/amd/amdgpu/uvd_v7_0: Fix a bunch of kernel-doc
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
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:219: warning: Function parameter o=
r member 'bo' not described in 'uvd_v7_0_enc_get_create_msg'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:219: warning: Excess function para=
meter 'adev' description in 'uvd_v7_0_enc_get_create_msg'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:282: warning: Function parameter o=
r member 'bo' not described in 'uvd_v7_0_enc_get_destroy_msg'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:282: warning: Excess function para=
meter 'adev' description in 'uvd_v7_0_enc_get_destroy_msg'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:339: warning: Function parameter o=
r member 'timeout' not described in 'uvd_v7_0_enc_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:527: warning: Function parameter o=
r member 'handle' not described in 'uvd_v7_0_hw_init'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:527: warning: Excess function para=
meter 'adev' description in 'uvd_v7_0_hw_init'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:605: warning: Function parameter o=
r member 'handle' not described in 'uvd_v7_0_hw_fini'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:605: warning: Excess function para=
meter 'adev' description in 'uvd_v7_0_hw_fini'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1156: warning: Function parameter =
or member 'addr' not described in 'uvd_v7_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1156: warning: Function parameter =
or member 'seq' not described in 'uvd_v7_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1156: warning: Function parameter =
or member 'flags' not described in 'uvd_v7_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1156: warning: Excess function par=
ameter 'fence' description in 'uvd_v7_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1195: warning: Function parameter =
or member 'addr' not described in 'uvd_v7_0_enc_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1195: warning: Function parameter =
or member 'seq' not described in 'uvd_v7_0_enc_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1195: warning: Function parameter =
or member 'flags' not described in 'uvd_v7_0_enc_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1195: warning: Excess function par=
ameter 'fence' description in 'uvd_v7_0_enc_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1293: warning: Function parameter =
or member 'job' not described in 'uvd_v7_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1293: warning: Function parameter =
or member 'flags' not described in 'uvd_v7_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1324: warning: Function parameter =
or member 'job' not described in 'uvd_v7_0_enc_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c:1324: warning: Function parameter =
or member 'flags' not described in 'uvd_v7_0_enc_ring_emit_ib'
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
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/uvd_v7_0.c
> index b44c8677ce8d5..9911ff80a6776 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -206,9 +206,9 @@ static int uvd_v7_0_enc_ring_test_ring(struct amdgpu_=
ring *ring)
>  /**
>   * uvd_v7_0_enc_get_create_msg - generate a UVD ENC create msg
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: ring we should submit the msg to
>   * @handle: session handle to use
> + * @bo: amdgpu object for which we query the offset
>   * @fence: optional fence to return
>   *
>   * Open up a stream for HW test
> @@ -269,9 +269,9 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_=
ring *ring, uint32_t handle
>  /**
>   * uvd_v7_0_enc_get_destroy_msg - generate a UVD ENC destroy msg
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: ring we should submit the msg to
>   * @handle: session handle to use
> + * @bo: amdgpu object for which we query the offset
>   * @fence: optional fence to return
>   *
>   * Close up a stream for HW test or if userspace failed to do so
> @@ -333,6 +333,7 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu=
_ring *ring, uint32_t handl
>   * uvd_v7_0_enc_ring_test_ib - test if UVD ENC IBs are working
>   *
>   * @ring: the engine to test on
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   */
>  static int uvd_v7_0_enc_ring_test_ib(struct amdgpu_ring *ring, long time=
out)
> @@ -519,7 +520,7 @@ static int uvd_v7_0_sw_fini(void *handle)
>  /**
>   * uvd_v7_0_hw_init - start and test UVD block
>   *
> - * @adev: amdgpu_device pointer
> + * @handle: handle used to pass amdgpu_device pointer
>   *
>   * Initialize the hardware, boot up the VCPU and do some testing
>   */
> @@ -597,7 +598,7 @@ static int uvd_v7_0_hw_init(void *handle)
>  /**
>   * uvd_v7_0_hw_fini - stop the hardware block
>   *
> - * @adev: amdgpu_device pointer
> + * @handle: handle used to pass amdgpu_device pointer
>   *
>   * Stop the UVD block, mark ring as not ready any more
>   */
> @@ -1147,7 +1148,9 @@ static void uvd_v7_0_stop(struct amdgpu_device *ade=
v)
>   * uvd_v7_0_ring_emit_fence - emit an fence & trap command
>   *
>   * @ring: amdgpu_ring pointer
> - * @fence: fence to emit
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Write a fence and a trap command to the ring.
>   */
> @@ -1186,7 +1189,9 @@ static void uvd_v7_0_ring_emit_fence(struct amdgpu_=
ring *ring, u64 addr, u64 seq
>   * uvd_v7_0_enc_ring_emit_fence - emit an enc fence & trap command
>   *
>   * @ring: amdgpu_ring pointer
> - * @fence: fence to emit
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Write enc a fence and a trap command to the ring.
>   */
> @@ -1282,7 +1287,9 @@ static int uvd_v7_0_ring_patch_cs_in_place(struct a=
mdgpu_cs_parser *p,
>   * uvd_v7_0_ring_emit_ib - execute indirect buffer
>   *
>   * @ring: amdgpu_ring pointer
> + * @job: job to retrive vmid from
>   * @ib: indirect buffer to execute
> + * @flags: unused
>   *
>   * Write ring commands to execute the indirect buffer
>   */
> @@ -1313,7 +1320,9 @@ static void uvd_v7_0_ring_emit_ib(struct amdgpu_rin=
g *ring,
>   * uvd_v7_0_enc_ring_emit_ib - enc execute indirect buffer
>   *
>   * @ring: amdgpu_ring pointer
> + * @job: job to retrive vmid from
>   * @ib: indirect buffer to execute
> + * @flags: unused
>   *
>   * Write enc ring commands to execute the indirect buffer
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
