Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA9A2AC558
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 20:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730789AbgKITsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 14:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730520AbgKITsI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 14:48:08 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2875C0613CF;
        Mon,  9 Nov 2020 11:48:06 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w24so652699wmi.0;
        Mon, 09 Nov 2020 11:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3WLOB+DsIhONnbyWJDNWa6PF7p/j2odAKBqntDd2Dp8=;
        b=pK6s3U8rxkkI9GRUcNoYaW3rN/BVR3BCnxKwl0+MbtErM99Zio2pDgH0Ys6GGuT75u
         MGpvs/yX5Ph9khll6CptPTNr/XxaRmYvzKNbVSsgaxzNYHUwrpupY8CbzylKGsO0/7Pd
         9jqF/xAgOoYl6W3Ve/NqMnFcKXMfCRSbp/p3A/Jk2xBD+b7TvufHKLW9s+jaDAQEecsj
         yIlIPGRku43sjxftFcrjRIfmNGNRJ0FOspJoSmOVB/hxSIVZv5Opbu23c6IpwdGid/dg
         4F3qi5KSXPCiqsG84G8djs1IZTjNBHj9SUQ/6KLVT0Czu1TLJryXaI+y4KDf0uSxoaVm
         /2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3WLOB+DsIhONnbyWJDNWa6PF7p/j2odAKBqntDd2Dp8=;
        b=hSIK8FnA/n4L4vz3srpg/qc5JlrVIqs3Mr6ASYUdgvp97JTB1Aj/lS7u2bx/X/rU45
         fI8YoiKx+M0HPlUywLMKhBv0bw15+pkP2C50XS4JfYjG1ZehJ0KkVGbivWSY5r0gh4Uf
         gkrfjdkkVE6SfFiqY8RcNaW4zvgNPdQ9AQcDdv7YxN59qQ/maBrNH2KoNIchcH4mCJEf
         1tFqHuBhnBcGUqGHU1TCbM6UJMFwV3j5VfMGhMwbv69H+opOwAR5Y3Wlm0eMa/f1Ns71
         v++MAHJF1VqZqm2p7wpM9F44znHqooE8A9aonF4E83pw/k1FEcb565QgyKfUUV8D5QO+
         BM9Q==
X-Gm-Message-State: AOAM530gZoNp+ym4C8TxEeRgSeLhRFvtcpkYo1l5hAUPkTxRyj9qQyGZ
        lOaEs+W1/kRFMeKbZwNE6Cx1BFnkFrK5dV0X9x537rGk
X-Google-Smtp-Source: ABdhPJyKHv/hmDBOb9KR8vgX4EYpgNR+v0BD8Y47n9XpurORBE4ESC/uFvjcz4SC0hsXS9txtw0C628iOkCL9RwhChA=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr795848wmd.73.1604951285618;
 Mon, 09 Nov 2020 11:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20201109083824.14664-1-unixbhaskar@gmail.com>
In-Reply-To: <20201109083824.14664-1-unixbhaskar@gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 9 Nov 2020 14:47:54 -0500
Message-ID: <CADnq5_N3vCB4yBdwozt-04f5LLRVPk_SNm0s=z+u_Rf-C7S0gQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: amdgpu: amdgpu_display.c: Fix a spelling
 doens\'t to doesn\'t
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Huang Rui <ray.huang@amd.com>,
        "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
        Jean Delvare <jdelvare@suse.de>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 9, 2020 at 3:52 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> s/doens't/doesn't/p
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 7cc7af2a6822..a92cb137293a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -512,7 +512,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>          * to avoid hang caused by placement of scanout BO in GTT on certain
>          * APUs. So force the BO placement to VRAM in case this architecture
>          * will not allow USWC mappings.
> -        * Also, don't allow GTT domain if the BO doens't have USWC falg set.
> +        * Also, don't allow GTT domain if the BO doesn't have USWC falg set.

Applied. Care to send a patch to also fix the spelling of "flag"?

Thanks,

Alex


>          */
>         if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
>             amdgpu_bo_support_uswc(bo_flags) &&
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
