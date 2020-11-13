Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BF62B21E3
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 18:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgKMRSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 12:18:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgKMRSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 12:18:49 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8CBC0613D1;
        Fri, 13 Nov 2020 09:19:03 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h62so9224465wme.3;
        Fri, 13 Nov 2020 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Odh9S4GXnjRv304GJfgc5XVM032BtmrndNkaL6PWoQQ=;
        b=dqygrZ/7I0MeF6Ka1mhBuF0NzD/2dnGxkk/WTlSrEEOIvguKpPTJBZDqLC8jLJfGmz
         EVAStBt3qg27yKw2w1Evwiql94xjLxNxiy42VRxMemRbWkwZ4Qu3C9Uy2PnMWhfZeeEz
         t2HMTPLlinMl0+bN6lh5JJSxojtIjUyLLm6UmBZSs0acFBqae27wst1O8RLSGLS+h503
         XPR2pccjzGWAEONrr+OsEvbgSvScNsAYdX9WsVksKIAEkErcP+nYMhp7JUvgNwLsB384
         c9Qh3/DeGojEtsP8DIP+fboxRjd5CPU+tc15b1ZlMtxWyw5kZKhspxW6j4l8JJdz89SJ
         ZYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Odh9S4GXnjRv304GJfgc5XVM032BtmrndNkaL6PWoQQ=;
        b=DJHGPLP79Ze0I8WD3bJBkwF7Rq4inYLNs6n4/RhEPY94Jvj9VE/QrhCfaun8qhCtSD
         y0Q2yfS85CQL2GXfb10dmwQEL8L4W9XfH5PIVnJnSJro/xteMWHlg7R2U9divUk36IiY
         2FKevFRreM240FVBtpSsgNzd4w61hegjemLqIq02vpiBLYkBrhOvSJy/rymoMvOD1jRR
         zFUjWMEPbvsoGpX8pgWJLInYt4OBAyh7D/2W1OluSLvwFPKk+x/cMVIHKG7UZltms4RE
         JlV4bdAE4chNOrhpHVWtuVVvwsIehVSew5ikQrxyLAQwEZzYB3XOZND+YhEDfeTZVxyD
         sHRw==
X-Gm-Message-State: AOAM530IIZshEGZT1pVRbqn3EEfdw0MVU2bNcJN+YjypK4I2iPqIkwQO
        Bp054wd59XO+MWH+qjcFEKHvUOwjwNcqlcl7dyQ=
X-Google-Smtp-Source: ABdhPJw8aLTjdYh+1Z4YbylQ6OFrhzAqpIztbxmRHRPTy2NG/itvTCYemARbosA+4Fk6pXGQV6PdsyqChDTsqfogCyo=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr3502636wmi.70.1605287936955;
 Fri, 13 Nov 2020 09:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-17-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-17-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Nov 2020 12:18:45 -0500
Message-ID: <CADnq5_PUE3Hiv6dngNwEgZ_3hX=RQaZxiFtudt6-zesYbuLYQQ@mail.gmail.com>
Subject: Re: [PATCH 16/40] drm/amd/amdgpu/amdgpu_sync: Fix misnamed, missing
 and extra param descriptions
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:86: warning: Function parameter=
 or member 'f' not described in 'amdgpu_sync_get_owner'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:86: warning: Excess function pa=
rameter 'fence' description in 'amdgpu_sync_get_owner'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:182: warning: Excess function p=
arameter 'adev' description in 'amdgpu_sync_vm_fence'
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c:203: warning: Function paramete=
r or member 'adev' not described in 'amdgpu_sync_resv'
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sync.c
> index 8ea6c49529e7d..4e558632a5d2b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -78,7 +78,7 @@ static bool amdgpu_sync_same_dev(struct amdgpu_device *=
adev,
>  /**
>   * amdgpu_sync_get_owner - extract the owner of a fence
>   *
> - * @fence: fence get the owner from
> + * @f: fence get the owner from
>   *
>   * Extract who originally created the fence.
>   */
> @@ -172,7 +172,6 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struc=
t dma_fence *f)
>  /**
>   * amdgpu_sync_vm_fence - remember to sync to this VM fence
>   *
> - * @adev: amdgpu device
>   * @sync: sync object to add fence to
>   * @fence: the VM fence to add
>   *
> @@ -190,6 +189,7 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, st=
ruct dma_fence *fence)
>  /**
>   * amdgpu_sync_resv - sync to a reservation object
>   *
> + * @adev: amdgpu device
>   * @sync: sync object to add fences from reservation object to
>   * @resv: reservation object with embedded fence
>   * @mode: how owner affects which fences we sync to
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
