Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F422AC716
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730528AbgKIVV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729451AbgKIVV3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:21:29 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178D5C0613CF;
        Mon,  9 Nov 2020 13:21:29 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d142so946241wmd.4;
        Mon, 09 Nov 2020 13:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GDp8yb+Sw0EolRsci9v+WvLZ9nSbjiU3CL4VUAU4p3U=;
        b=Eyj0wf9PKyzvgsvHQsyfgZxgGn5vIq16Y8gMdbnhJB78VNyMq8Mwjq0OGH9NFWYzqP
         Jp6UuxRGSSt/WnTSuor53OoHOFjky9QEJ6mPUsUGscEyfMjbWSca3qO2SBpywYqVQzxx
         BM493YCgTJ/d53de+QhRi2qbmgbsOr0/olWozoAeGnkl8EBuG7iZwkq5Qbvhl3u7+IL9
         8YezRO3SLYsejT1YmFbagEQmv40oewW9JRsdViPZ6rQDcyvsRr3o+AVNMa3JTg2QMwHO
         T6vopTIYAcQCly1h+WlGfDjczNUBTzqzsE5GrfocbjClUg5sdUd0PtV9pCrNHcQaE2+W
         2HWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GDp8yb+Sw0EolRsci9v+WvLZ9nSbjiU3CL4VUAU4p3U=;
        b=o0iCcHhYx3Aam+IgnEUOcNE9KzE3TTvfsPqzvQNpedE+XCK2nBZv59dCVpBNOJc7LY
         SS5NinN/6UScvM2dwzhAE2n6bZfC3HeQKVLf0kWwDk6aT2XC3OMMnP4kL4zMCdMqtXRk
         07bD0nalBE/OrATU3db2oyPTO5NNUkfxc4H+iaAlRu64izStcduJ7toBX2wFPONLb03I
         BThmxYm3oLoTblXggG8a/RmZ5xpT1VWkpgzNOLMrYhWMoQjDBoHixJekdtDptKVCbwyU
         YYOr4mhzIKyJ2pkArHWAC0faB1DRm+YM/bZgMRghDjkq1JHCME44jA/LKQyPsgSYbfrr
         ZAjQ==
X-Gm-Message-State: AOAM533e/gk/AtwZAztlRVL0Ycs5bmQ2piuRNRZT2fKh7DnWxhwcZ+3T
        f54v0IWvkwzrV4uBcuFPdrntIAUReKTUj9vqGTU=
X-Google-Smtp-Source: ABdhPJyIn9jY/EM3NsfRCWQKiTNIKSQPUd00zlTTnc7nT1mAHIfsQMOpQ0BCDXxFJdSy6q+gIIZeHW6pK4msqPWqZAo=
X-Received: by 2002:a1c:46c6:: with SMTP id t189mr1159422wma.79.1604956887879;
 Mon, 09 Nov 2020 13:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20201109210725.24668-1-unixbhaskar@gmail.com>
In-Reply-To: <20201109210725.24668-1-unixbhaskar@gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 9 Nov 2020 16:21:16 -0500
Message-ID: <CADnq5_NOmgYM0_0fTQaYr+qn7M_Vrbo1E=mPmuoATQNjRRHTqg@mail.gmail.com>
Subject: Re: [PATCH] drivers: amdgpu: amdgpu_display: Fixed the spelling of
 falg to flag
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     "Deucher, Alexander" <alexander.deucher@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jean Delvare <jdelvare@suse.de>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 9, 2020 at 4:16 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> s/falg/flag/p
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 2e8a8b57639f..9223502c1e5b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -509,7 +509,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>          * to avoid hang caused by placement of scanout BO in GTT on certain
>          * APUs. So force the BO placement to VRAM in case this architecture
>          * will not allow USWC mappings.
> -        * Also, don't allow GTT domain if the BO doens't have USWC falg set.
> +        * Also, don't allow GTT domain if the BO doens't have USWC flag set.
>          */
>         if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
>             amdgpu_bo_support_uswc(bo_flags) &&
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
