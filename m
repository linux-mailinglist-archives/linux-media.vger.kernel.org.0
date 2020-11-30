Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974172C9148
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387421AbgK3Wib (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730731AbgK3Wib (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:38:31 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3563C0613CF;
        Mon, 30 Nov 2020 14:37:50 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id k3so12934350otp.12;
        Mon, 30 Nov 2020 14:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oVkPo84iN0T6Tq1i1vQyuiCYAsrjUSRl8eGvl22UljA=;
        b=R9jOdK2Q9lg671/bg+azb9JKv0JjOWwtwPAjo/UI5KhoQd2rzMEPy7Lz8C/TP6pWCl
         LvGSNuNgi5qEjrGXJGHEibW90vggyevIEA/R7hdpkeo/ckUFsyQod/dB/ddmQQL9HD26
         hylRJuLUyacLgHk4j5vCrIlMDZupGfdgOPOROPOUUZx33KJDxb+iku/784cj2EL+lQFa
         r9WncKsJwNOXCEvBiFLpy7OlhLJqTXVpiF9MXA7ItQlnhj+RIN7Z54W/0APSC8CjWnjB
         ra3ZlRUQC7Rsii96tuSyf1KBELfeJIwZgcDBjU3KjZAK+mBkrf0k0SQ1+pdffA/psKpz
         93Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oVkPo84iN0T6Tq1i1vQyuiCYAsrjUSRl8eGvl22UljA=;
        b=qfztUYSKpHgAFZCOgiFiKado3FdQhjshTHNywPiji8wWNifEAoTN9TQbodNInNQ9cr
         0OPoeANIr+alKVWCr+s+WGCgnZ2y6bqZ6zgxfzFTUdvVx2AaizK6gVTjNJAc4hNx4vE3
         2vvg0z1CU+WVCuWSusL7Ngtx4626ieAlNyAbS6EYxa2uEBbI0ZZ2MhXZh0JKd8A4svtq
         sDPXTJl3cshLdgJXAFqHrbvN2126eEM50JxLSOsw7wVGWiNNhQeQEmgi1AA7x86hSmIn
         9Q4XEVt+VuhRzFzpjQ6TpZufRiG4IQUyqKwQzlrbvcdaS6fElsZYv8/JoFJ+/H+Ml6Z6
         zaDg==
X-Gm-Message-State: AOAM531Od3WGTmsmFB5johjUgpTpUHdXL9XpNXrdk3Ex/RzujajGcu5w
        sWNH+VZF8LLR4Eg5LQOkX2ueBv8MM7UVBssEMtU=
X-Google-Smtp-Source: ABdhPJw/Nn5t2HFiwcvN1n5AzvnHV4mvRBSMID0JQ3a7vN9hOemJXgIKjFdASmrYoKmpeii2vB869asObyT2AuB4dSM=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr19228601otf.132.1606775870305;
 Mon, 30 Nov 2020 14:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-27-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-27-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:37:38 -0500
Message-ID: <CADnq5_Oz3icLetZ+DAvPmL9q6UiJct8k68qJYLgOkprLJmP7wg@mail.gmail.com>
Subject: Re: [PATCH 26/40] drm/amd/amdgpu/uvd_v6_0: Fix a bunch of kernel-doc
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
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:211: warning: Function parameter o=
r member 'bo' not described in 'uvd_v6_0_enc_get_create_msg'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:211: warning: Excess function para=
meter 'adev' description in 'uvd_v6_0_enc_get_create_msg'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:275: warning: Function parameter o=
r member 'bo' not described in 'uvd_v6_0_enc_get_destroy_msg'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:275: warning: Excess function para=
meter 'adev' description in 'uvd_v6_0_enc_get_destroy_msg'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:332: warning: Function parameter o=
r member 'timeout' not described in 'uvd_v6_0_enc_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:472: warning: Function parameter o=
r member 'handle' not described in 'uvd_v6_0_hw_init'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:472: warning: Excess function para=
meter 'adev' description in 'uvd_v6_0_hw_init'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:541: warning: Function parameter o=
r member 'handle' not described in 'uvd_v6_0_hw_fini'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:541: warning: Excess function para=
meter 'adev' description in 'uvd_v6_0_hw_fini'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:900: warning: Function parameter o=
r member 'addr' not described in 'uvd_v6_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:900: warning: Function parameter o=
r member 'seq' not described in 'uvd_v6_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:900: warning: Function parameter o=
r member 'flags' not described in 'uvd_v6_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:900: warning: Excess function para=
meter 'fence' description in 'uvd_v6_0_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:930: warning: Function parameter o=
r member 'addr' not described in 'uvd_v6_0_enc_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:930: warning: Function parameter o=
r member 'seq' not described in 'uvd_v6_0_enc_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:930: warning: Function parameter o=
r member 'flags' not described in 'uvd_v6_0_enc_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:930: warning: Excess function para=
meter 'fence' description in 'uvd_v6_0_enc_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:997: warning: Function parameter o=
r member 'job' not described in 'uvd_v6_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:997: warning: Function parameter o=
r member 'flags' not described in 'uvd_v6_0_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:1023: warning: Function parameter =
or member 'job' not described in 'uvd_v6_0_enc_ring_emit_ib'
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c:1023: warning: Function parameter =
or member 'flags' not described in 'uvd_v6_0_enc_ring_emit_ib'
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
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/uvd_v6_0.c
> index 666bfa4a0b8ea..69cf7edf4cc61 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -198,9 +198,9 @@ static int uvd_v6_0_enc_ring_test_ring(struct amdgpu_=
ring *ring)
>  /**
>   * uvd_v6_0_enc_get_create_msg - generate a UVD ENC create msg
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: ring we should submit the msg to
>   * @handle: session handle to use
> + * @bo: amdgpu object for which we query the offset
>   * @fence: optional fence to return
>   *
>   * Open up a stream for HW test
> @@ -261,9 +261,9 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_=
ring *ring, uint32_t handle
>  /**
>   * uvd_v6_0_enc_get_destroy_msg - generate a UVD ENC destroy msg
>   *
> - * @adev: amdgpu_device pointer
>   * @ring: ring we should submit the msg to
>   * @handle: session handle to use
> + * @bo: amdgpu object for which we query the offset
>   * @fence: optional fence to return
>   *
>   * Close up a stream for HW test or if userspace failed to do so
> @@ -326,6 +326,7 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu=
_ring *ring,
>   * uvd_v6_0_enc_ring_test_ib - test if UVD ENC IBs are working
>   *
>   * @ring: the engine to test on
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   */
>  static int uvd_v6_0_enc_ring_test_ib(struct amdgpu_ring *ring, long time=
out)
> @@ -464,7 +465,7 @@ static int uvd_v6_0_sw_fini(void *handle)
>  /**
>   * uvd_v6_0_hw_init - start and test UVD block
>   *
> - * @adev: amdgpu_device pointer
> + * @handle: handle used to pass amdgpu_device pointer
>   *
>   * Initialize the hardware, boot up the VCPU and do some testing
>   */
> @@ -533,7 +534,7 @@ static int uvd_v6_0_hw_init(void *handle)
>  /**
>   * uvd_v6_0_hw_fini - stop the hardware block
>   *
> - * @adev: amdgpu_device pointer
> + * @handle: handle used to pass amdgpu_device pointer
>   *
>   * Stop the UVD block, mark ring as not ready any more
>   */
> @@ -891,7 +892,9 @@ static void uvd_v6_0_stop(struct amdgpu_device *adev)
>   * uvd_v6_0_ring_emit_fence - emit an fence & trap command
>   *
>   * @ring: amdgpu_ring pointer
> - * @fence: fence to emit
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Write a fence and a trap command to the ring.
>   */
> @@ -921,7 +924,9 @@ static void uvd_v6_0_ring_emit_fence(struct amdgpu_ri=
ng *ring, u64 addr, u64 seq
>   * uvd_v6_0_enc_ring_emit_fence - emit an enc fence & trap command
>   *
>   * @ring: amdgpu_ring pointer
> - * @fence: fence to emit
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Write enc a fence and a trap command to the ring.
>   */
> @@ -986,7 +991,9 @@ static int uvd_v6_0_ring_test_ring(struct amdgpu_ring=
 *ring)
>   * uvd_v6_0_ring_emit_ib - execute indirect buffer
>   *
>   * @ring: amdgpu_ring pointer
> + * @job: job to retrive vmid from
>   * @ib: indirect buffer to execute
> + * @flags: unused
>   *
>   * Write ring commands to execute the indirect buffer
>   */
> @@ -1012,7 +1019,9 @@ static void uvd_v6_0_ring_emit_ib(struct amdgpu_rin=
g *ring,
>   * uvd_v6_0_enc_ring_emit_ib - enc execute indirect buffer
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
