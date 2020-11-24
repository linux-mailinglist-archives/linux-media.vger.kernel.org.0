Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F265C2C2C4D
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 17:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390144AbgKXQHE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 11:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbgKXQHE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 11:07:04 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A92AC0613D6;
        Tue, 24 Nov 2020 08:07:04 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id w24so3436234wmi.0;
        Tue, 24 Nov 2020 08:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ge9h/mtxkI31lIiz0Hna6pKHgTbT6SelL7loWpKAIng=;
        b=UOlchSB/uXHMRDXoi/KN4SsZplSYz103+AAZ5kJTN0gk+TYQIjauMjXQGLRdajKTtt
         XlRlGVKC8I5dn9lCWwayPYXw0g5rGdVRf6YX7wSbH3cHk/IcIL/kXFjLdt0OXrQjPpTB
         Xc63+C3sw67u0UMES+R9p6iypR/WXnBut194Q5Wj+7B8Pbd329GWG/0qV7KyQ+JeTE1A
         Bij90rxCdRl47viF8bNTaGNkWoZwPOIkv6lt8VeQKm6zG3Tkuhv0zVnmzCz7qmfWM4rv
         3Xx0KMcpFSC8Ib7K8HQqK2OK3TBoR+1U/XsZD7+wK3+hXC/I1rJoupjjfo4daVl/vEAg
         CYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ge9h/mtxkI31lIiz0Hna6pKHgTbT6SelL7loWpKAIng=;
        b=TYcqPRY0MKwaMZ5h2tVlgJsciKHy7Ty6eEwvKvt7W6GPssEkBnYMSepu1L53D9Lvoy
         rWZFDdWK/itjStuCRtwwn6mJ25JTea4ShaSFAyGhlrTyjNiEPx0xkhFIWCxajSurnq5i
         OQ2YP0jDTfXRrWPe1SdgoY9NGgfGphnKVcImj4Gj/gNtzwmF/uN/Ew+F4N+CJCZiIhks
         UpVeMERfp07JQ3dvomJWRWlm2ernhCoiOnndd7+YsVj1QzFhN+bd9Yeyacs0PAm1QgpE
         fTPI+FEzCoObD6tAupwZJhNpF0Xf4bDaEwze7W+Q5fa0ip5Z9hLqsVemtku4GlaOjreN
         LsFA==
X-Gm-Message-State: AOAM531FFIWq2jnAqhpUj8cpxJXoTuFBNhB+5v7yieDTl4OyLyMnqp2T
        RwbURx8kPOG5Uasvh8UtfkNCkIqKndquo0yjMWs=
X-Google-Smtp-Source: ABdhPJybXX4MSAnTO1ZZrJJAhLEdGXMBahD6wzaRcXsJHf6Ffk1bxdr13+MFFqwOJJUkeq0jIJACKa+iZQwrYpyYbt4=
X-Received: by 2002:a7b:c015:: with SMTP id c21mr5256561wmb.79.1606234022988;
 Tue, 24 Nov 2020 08:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org> <20201123111919.233376-17-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-17-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 24 Nov 2020 11:06:51 -0500
Message-ID: <CADnq5_OdDL=dEa6N1TLyAYJ+Po1CTA0FWBALTF-mo46H1gZhYw@mail.gmail.com>
Subject: Re: [PATCH 16/40] drm/amd/amdgpu/si_dma: Fix a bunch of function
 documentation issues
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
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:92: warning: Function parameter or m=
ember 'addr' not described in 'si_dma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:92: warning: Function parameter or m=
ember 'seq' not described in 'si_dma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:92: warning: Function parameter or m=
ember 'flags' not described in 'si_dma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:92: warning: Excess function paramet=
er 'fence' description in 'si_dma_ring_emit_fence'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:252: warning: Function parameter or =
member 'timeout' not described in 'si_dma_ring_test_ib'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:408: warning: Function parameter or =
member 'ring' not described in 'si_dma_ring_pad_ib'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:446: warning: Function parameter or =
member 'vmid' not described in 'si_dma_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:446: warning: Function parameter or =
member 'pd_addr' not described in 'si_dma_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:446: warning: Excess function parame=
ter 'vm' description in 'si_dma_ring_emit_vm_flush'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:781: warning: Function parameter or =
member 'ib' not described in 'si_dma_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:781: warning: Function parameter or =
member 'tmz' not described in 'si_dma_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:781: warning: Excess function parame=
ter 'ring' description in 'si_dma_emit_copy_buffer'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:804: warning: Function parameter or =
member 'ib' not described in 'si_dma_emit_fill_buffer'
>  drivers/gpu/drm/amd/amdgpu/si_dma.c:804: warning: Excess function parame=
ter 'ring' description in 'si_dma_emit_fill_buffer'
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
>  drivers/gpu/drm/amd/amdgpu/si_dma.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/am=
dgpu/si_dma.c
> index 7d2bbcbe547b2..540dced190f33 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -81,7 +81,9 @@ static void si_dma_ring_emit_ib(struct amdgpu_ring *rin=
g,
>   * si_dma_ring_emit_fence - emit a fence on the DMA ring
>   *
>   * @ring: amdgpu ring pointer
> - * @fence: amdgpu fence object
> + * @addr: address
> + * @seq: sequence number
> + * @flags: fence related flags
>   *
>   * Add a DMA fence packet to the ring to write
>   * the fence seq number and DMA trap packet to generate
> @@ -244,6 +246,7 @@ static int si_dma_ring_test_ring(struct amdgpu_ring *=
ring)
>   * si_dma_ring_test_ib - test an IB on the DMA engine
>   *
>   * @ring: amdgpu_ring structure holding ring information
> + * @timeout: timeout value in jiffies, or MAX_SCHEDULE_TIMEOUT
>   *
>   * Test a simple IB in the DMA ring (VI).
>   * Returns 0 on success, error on failure.
> @@ -401,6 +404,7 @@ static void si_dma_vm_set_pte_pde(struct amdgpu_ib *i=
b,
>  /**
>   * si_dma_pad_ib - pad the IB to the required number of dw
>   *
> + * @ring: amdgpu_ring pointer
>   * @ib: indirect buffer to fill with padding
>   *
>   */
> @@ -436,7 +440,8 @@ static void si_dma_ring_emit_pipeline_sync(struct amd=
gpu_ring *ring)
>   * si_dma_ring_emit_vm_flush - cik vm flush using sDMA
>   *
>   * @ring: amdgpu_ring pointer
> - * @vm: amdgpu_vm pointer
> + * @vmid: vmid number to use
> + * @pd_addr: address
>   *
>   * Update the page table base and flush the VM TLB
>   * using sDMA (VI).
> @@ -764,10 +769,11 @@ static void si_dma_set_irq_funcs(struct amdgpu_devi=
ce *adev)
>  /**
>   * si_dma_emit_copy_buffer - copy buffer using the sDMA engine
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
> @@ -790,7 +796,7 @@ static void si_dma_emit_copy_buffer(struct amdgpu_ib =
*ib,
>  /**
>   * si_dma_emit_fill_buffer - fill buffer using the sDMA engine
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
