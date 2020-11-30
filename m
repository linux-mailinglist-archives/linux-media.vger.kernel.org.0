Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5B32C9091
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730364AbgK3WFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730359AbgK3WFi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:05:38 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB335C0613D2;
        Mon, 30 Nov 2020 14:04:57 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id y3so3055034ooq.2;
        Mon, 30 Nov 2020 14:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5jOvGDqYf8zwrULgytMiBGj6XTmbLQAdGK6UJTFHbSU=;
        b=PAQIbC+HD7aZnMbhp9k94L+xvj5VCnYs1qRBegTa8+NGGphW9fIvh7QjHswN/vqJ+N
         VEL1PZMabbMQ2vN40BSrZeXTlduFD5Z9sEPpE4HxLbduzIFROwjBoxoLn6BtlS9CXQ8W
         JNlSchueWOcpR4KeIyvY4O8H2djoxCOkzsR4ypvdn3PwmNjW7yBaKIzyA1JhYBT5JhQH
         atdvQ0gUclZI1PECyNBcCBQrB7FM3UO/m8gc+fQ09O7+0zQj/bIPNKKw/gtxb0M6wLOd
         e2ntyVrhLyCQdKfkzcxpGzMhZunlkHjBRba540/jUu1kAZEDgohbsptCDrZB0qO/2gBk
         klQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5jOvGDqYf8zwrULgytMiBGj6XTmbLQAdGK6UJTFHbSU=;
        b=g4y65RZdSvyWoJc21xvCHMyz+q6TSGEAFXa9lX5FtEtimJeQEYmhvAZx6oHUUJCyqr
         X2xX/uQuRTycZwbXqhTMQ12he5AySghovo5eGCh8TraWx/lx7a+gyu4m4vm4v0421Gyi
         WQuVd+WVjtGbUg1ge4pqVej2BpPHEdc40qRKewWpAvKbLr0E4KGXcAAoGWOiggOjmDDA
         Ll1yW3z3gpcfCi9t7c7DZE/awJFyXxcFY5RhU+ofKPge+LRwmtUQJE5RKwSsh1mWroqs
         llcvxOSCGvMYi058hkxSu7Z60Kix8PdV1dRvdi4UKUjdutZaDvVG3RdPFnTZhnSgtKVH
         Q9yg==
X-Gm-Message-State: AOAM532J3uRV70CTb+bOn0CNyo9I+m5FcqtDN5/R3sQz7ZujQMCRilHE
        IKBOTgu2KW/CemwOgGhA2mk6yVuNOdx2AyIVzwdNOI4S
X-Google-Smtp-Source: ABdhPJzdjixBlHwXzStQhUKKU6mUgnrY3S88+jIZBk29S2eq07JyrKnnbnUAJiA6e8+nCQCMloGuHeuHFCBlQgu31eE=
X-Received: by 2002:a4a:3e91:: with SMTP id t139mr16906483oot.90.1606773897183;
 Mon, 30 Nov 2020 14:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org> <20201124193824.1118741-3-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-3-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 30 Nov 2020 17:04:45 -0500
Message-ID: <CADnq5_OURGRBDONuMy9Bee2Jo+e6pfCaKyk8z6Fn60F2PcF_Ag@mail.gmail.com>
Subject: Re: [PATCH 02/40] drm/amd/amdgpu/gmc_v10_0: Suppy some missing
 function doc descriptions
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
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:278: warning: Function parameter =
or member 'vmhub' not described in 'gmc_v10_0_flush_gpu_tlb'
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:278: warning: Function parameter =
or member 'flush_type' not described in 'gmc_v10_0_flush_gpu_tlb'
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:371: warning: Function parameter =
or member 'flush_type' not described in 'gmc_v10_0_flush_gpu_tlb_pasid'
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:371: warning: Function parameter =
or member 'all_hub' not described in 'gmc_v10_0_flush_gpu_tlb_pasid'
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
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gmc_v10_0.c
> index d9399324be474..4887b0e66e975 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -270,6 +270,8 @@ static void gmc_v10_0_flush_vm_hub(struct amdgpu_devi=
ce *adev, uint32_t vmid,
>   *
>   * @adev: amdgpu_device pointer
>   * @vmid: vm instance to flush
> + * @vmhub: vmhub type
> + * @flush_type: the flush type
>   *
>   * Flush the TLB for the requested page table.
>   */
> @@ -362,6 +364,8 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_dev=
ice *adev, uint32_t vmid,
>   *
>   * @adev: amdgpu_device pointer
>   * @pasid: pasid to be flush
> + * @flush_type: the flush type
> + * @all_hub: Used with PACKET3_INVALIDATE_TLBS_ALL_HUB()
>   *
>   * Flush the TLB for the requested pasid.
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
