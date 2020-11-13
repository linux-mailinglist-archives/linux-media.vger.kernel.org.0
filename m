Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC692B227D
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgKMRbj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:31:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgKMRbj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:31:39 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C51C0613D1;
        Fri, 13 Nov 2020 09:31:38 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id o15so10781267wru.6;
        Fri, 13 Nov 2020 09:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+G+14q8YUvn+nruogBy+Fa8GXZYTPJ311fBa+8TxG4c=;
        b=dLz0dUSglk70LgwaLtsTdNr0UcSubDx/QFF+F42FELFOFWVwito1w+srckTdXvWa1b
         9PuhrbzweAyjV3nkp5pbYt4eHhqrMfqmclGzTIOPbgMSXVen2j+HxfYG5aGea0yzeape
         JSPtRbLOvcxUeSD7IJkzNtyFclrel5ZVqITBanoazCE63IxocyjsKjSuRTrUoW/SYpjp
         BcMk5QbexXsgAImApDe+fw54aB7THChiHIR/IQQbDPMy3/+24lAmlgZhPB10z2Nb2fIj
         kXl4aq3UVQukLch3zLRz4U9Wog2BJ+xVVI3cQFJ0el9I1SMuCAe8aDKsF/HNHqBkCRBK
         JaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+G+14q8YUvn+nruogBy+Fa8GXZYTPJ311fBa+8TxG4c=;
        b=U+92gXM8r2D8biQnd392AiZzSZQq0d9/sTAU3m9eC3eO6j2yyIrpHCZa75aR9iWmuI
         m7y0zhmlSdlh6JCrmwGNPVa2UrGxxcTU1d6jOQkr7GPjyg0hUIq7zDpLoRJlAf3CUPG1
         gVXip1H1s6iutYyC8+EcBG4rM0eVq4F/viN69xRxEZE35x41LdmK5wCsYSfIwvu8hpEt
         lTdgALXRyBtZu0uni2/0L0IozztJzEmsc332UIPOzJ/MuXZ767eq94M3i1vYMfE46M+9
         PXf6YopqhZGi96GK+C7GGiwGECV76IpsCz46/EFjR5u0OdZ62m7sHB1rCrYhjvyYqGa+
         YvaQ==
X-Gm-Message-State: AOAM533kUXWbmn8BQnZg/PyxBPv/N/xxTAeNkJfxqkZxzJvvHSxVLpay
        EJQOx5O7mnIcZbwNYoGqMKQbAoI2dMYiYnx651E=
X-Google-Smtp-Source: ABdhPJxieS2jBm9uX3ulJWqz1FwN7GdeITsiOeyV4/OGv+n//yk+djKhaADCQOXe7MnngwXK1i4XVzQp5ThOct8A5V0=
X-Received: by 2002:adf:8028:: with SMTP id 37mr4704368wrk.111.1605288692175;
 Fri, 13 Nov 2020 09:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-31-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-31-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 12:31:20 -0500
Message-ID: <CADnq5_MbwDAwXXzVC-FOcLwzDNXzS4SzYiEUYbBw2Kh8u+6oEw@mail.gmail.com>
Subject: Re: [PATCH 30/40] drm/amd/amdgpu/amdgpu_vm_cpu: Fix
 'amdgpu_vm_cpu_prepare()'s doc-rot
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
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

On Fri, Nov 13, 2020 at 8:50 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Function paramet=
er or member 'resv' not described in 'amdgpu_vm_cpu_prepare'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Function paramet=
er or member 'sync_mode' not described in 'amdgpu_vm_cpu_prepare'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Excess function =
parameter 'owner' description in 'amdgpu_vm_cpu_prepare'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Excess function =
parameter 'exclusive' description in 'amdgpu_vm_cpu_prepare'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vm_cpu.c
> index 0786e7555554b..ac45d9c7a4e94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> @@ -38,8 +38,8 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo *ta=
ble)
>   * amdgpu_vm_cpu_prepare - prepare page table update with the CPU
>   *
>   * @p: see amdgpu_vm_update_params definition
> - * @owner: owner we need to sync to
> - * @exclusive: exclusive move fence we need to sync to
> + * @resv: reservation object with embedded fence
> + * @sync_mode: synchronization mode
>   *
>   * Returns:
>   * Negativ errno, 0 for success.
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
