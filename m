Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADB72B21D4
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgKMRQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgKMRQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:16:52 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39AC3C0613D1;
        Fri, 13 Nov 2020 09:17:05 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a3so9197327wmb.5;
        Fri, 13 Nov 2020 09:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8MYRJgCahvIIjHbmvpXlCqJXMSfFVlQgoNN3oalTAH0=;
        b=olLX5w8U2inNBK9YcmPVqqiPvxYz7ys7/lfEEDPMOtQ6nKZe8N7o+WH6DkHI5+3wie
         YXhhh6fT0+LQWh4jnk2hFp5D+3PuFqWLkhlqBfHrl2P9f6tkAt0VM5rXPYkOGhM7xbjx
         vKzzmEBQNkCUlm4W+OKPngbo85QRXz+KxwMU69Hk22rgpNnETbLnWL6V3pZYOIMkTHDi
         BxS4UmU0rvMwSWfkHbhb8faKt8Hk20xufWm2IdYBKmXOW1Xy/Kg3lj6QmmddJPRS3N0a
         KBbo7qQMtOI/kDpjkxOg79wy+OD/HEKNParPaCn1FoGU+MPUsEW4oTbL/Cr81J3cNjkU
         aftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8MYRJgCahvIIjHbmvpXlCqJXMSfFVlQgoNN3oalTAH0=;
        b=PVrFNRZkCfzPneHPy8EjUZqsecvdGRZMHwfWxpRyB/9JcSaZz+CeAnmE5ej7GfRyP9
         BejHSTPw0/JPzBy110qqxZjZXjEgk0RTuFJTc6DFX3b91NZf75PYkKcx3Vs1C7S3sMG4
         +Bysp49AsVVn1Unj11ZSBDL/6Jy8WkEZsiB4fcxWbPuA2msM9pd8Yqwq04gj6V8miTwd
         UPYfBOEgNPcCiIRp7/o5zvMBRzQhzKkE8IrDkU01OJRBl/hJel9+7VH6I436t49ErUg5
         ZQuEkSvdsm61yVrkuDB1edQvDMC2/tNWpOj54hSmtQhLxX8YiMwbiinOVBnhLUIEGaVN
         eO2A==
X-Gm-Message-State: AOAM530oqkUGh43tSO0oS6Gxei/7by/6a8mjnNbFh0Hz9jcuZcGKvNof
        X+91nVzngT7szOKWv631FmFc383bxt3Q9XdypPQ=
X-Google-Smtp-Source: ABdhPJxDWvPyzSPU2aP0/uCsckO5leH1AQ/fcwWETiHKRMBBGJqXONQ6+CzQmXw8cqOl1kS5Ua3r6ioJNxVioBk2akw=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr3494772wmi.70.1605287819058;
 Fri, 13 Nov 2020 09:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-9-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-9-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 12:16:47 -0500
Message-ID: <CADnq5_Mx-3E7GPHR11FAMAw=UNDEt1zBx6f6X04A0jrC84wDrg@mail.gmail.com>
Subject: Re: [PATCH 08/40] drm/amd/amdgpu/amdgpu_ib: Fix some
 incorrect/incomplete function documentation
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

On Fri, Nov 13, 2020 at 8:50 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:66: warning: Function parameter o=
r member 'adev' not described in 'amdgpu_ib_get'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:66: warning: Function parameter o=
r member 'vm' not described in 'amdgpu_ib_get'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:66: warning: Function parameter o=
r member 'pool_type' not described in 'amdgpu_ib_get'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:66: warning: Excess function para=
meter 'ring' description in 'amdgpu_ib_get'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:125: warning: Function parameter =
or member 'ring' not described in 'amdgpu_ib_schedule'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:125: warning: Function parameter =
or member 'job' not described in 'amdgpu_ib_schedule'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:125: warning: Excess function par=
ameter 'adev' description in 'amdgpu_ib_schedule'
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

Applied. Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ib.c
> index 2f53fa0ae9a62..c69af9b86cc60 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> @@ -52,8 +52,10 @@
>  /**
>   * amdgpu_ib_get - request an IB (Indirect Buffer)
>   *
> - * @ring: ring index the IB is associated with
> + * @adev: amdgpu_device pointer
> + * @vm: amdgpu_vm pointer
>   * @size: requested IB size
> + * @pool_type: IB pool type (delayed, immediate, direct)
>   * @ib: IB object returned
>   *
>   * Request an IB (all asics).  IBs are allocated using the
> @@ -101,7 +103,7 @@ void amdgpu_ib_free(struct amdgpu_device *adev, struc=
t amdgpu_ib *ib,
>  /**
>   * amdgpu_ib_schedule - schedule an IB (Indirect Buffer) on the ring
>   *
> - * @adev: amdgpu_device pointer
> + * @ring: ring index the IB is associated with
>   * @num_ibs: number of IBs to schedule
>   * @ibs: IB objects to schedule
>   * @f: fence created during this submission
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
