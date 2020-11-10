Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB662AE436
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 00:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732370AbgKJXkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 18:40:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbgKJXkg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 18:40:36 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4086C0613D1;
        Tue, 10 Nov 2020 15:40:35 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so338735wrb.9;
        Tue, 10 Nov 2020 15:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7Kkc+sXRhJ1ZOnG2Idz2D/eyp50AaUEzxdbosWJCnfc=;
        b=sndifEs6IPBU1QcqULomDdKJbRO0B8RfN0xu255024by7JZYRljU0bAuVxa50FiNo6
         VowBpIAUU00RN8KYVwQHrt1gRpaAB+hBE5o5SM7p4Hs5shaY1jVHUtNXdSa59bi8V8kY
         KTq2thkxI4vpjMeDBz+m/lElBZhdALaGN2b2as/1SJ1zlFnVvmcWZ/cwGhWmk4nDg1lV
         omhGykiS/GkbbyTSIPLlYMVuLsQtq4S/4L1y/Y+kl3VhXuvoJDRo4vfJhgdbJ0zhmmdp
         3Eqtvo9bhVnNsfgz7XGwb2t982PyUj1M5sdmryLurJSSQsMM6TZy17jP37ZZ8aDLxp2Y
         gXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7Kkc+sXRhJ1ZOnG2Idz2D/eyp50AaUEzxdbosWJCnfc=;
        b=XKIy28cWRATBsR5pOFBgq+Ks5nA/ImP2ZOFDiAtgrQcWn3cLABRPI6rTMDcu6M8LIA
         iN2M7eMGrXDG+NWhxy+LaRlWnwZsH4j8lU36pgVCoBEKP2L6D0cOrnI8oDgHXIOmNs7W
         a4lIAErGlRP+sQlLDQLhMCxaUuPXQF2X7bmiL4dLjy/n9nDr/QJHU6eX3gsdvhnbhCNw
         5cGjJkAhkf1+EQguycpdNCzIXz3QJZ8heBJgRH6OK4rhe2sgz6HSHnXLsmY/LFZ/MBUt
         tpU7sBsBOZr8zF7PRqiBlgdUx8E1qp+0hzgFt+OEqfjSPYh3/q4qaSG9rv3HF0K9hWI8
         rDbQ==
X-Gm-Message-State: AOAM531nr67INBJ1Rvuh0sbqwV1qTETT2T0OW14yfItJzN4wksklNr/L
        jQ6UdfxZID4YXcPumD+mibqXypKG+9gqTFRLALA=
X-Google-Smtp-Source: ABdhPJwDpXAdtq2BWrkbbFcS4rEJ6TQP6GK4YglRDW4qrqj+0WgIyXJz/2t5rDQl8yv8FHy71t/uUQ6HD/bc1bwV47o=
X-Received: by 2002:adf:f246:: with SMTP id b6mr26172437wrp.111.1605051634647;
 Tue, 10 Nov 2020 15:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org> <20201110193112.988999-11-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-11-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 18:40:20 -0500
Message-ID: <CADnq5_NRMtfiuVtORwQC0_3wwXG9N9Hx7BrmO-atOfAOM1qwwA@mail.gmail.com>
Subject: Re: [PATCH 10/30] drm/radeon/radeon_sync: Add description for
 function param 'rdev'
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

On Tue, Nov 10, 2020 at 2:31 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/radeon/radeon_sync.c:92: warning: Function parameter or =
member 'rdev' not described in 'radeon_sync_resv'
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
>  drivers/gpu/drm/radeon/radeon_sync.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeo=
n/radeon_sync.c
> index 55cc77a73c7b7..5d3302945076b 100644
> --- a/drivers/gpu/drm/radeon/radeon_sync.c
> +++ b/drivers/gpu/drm/radeon/radeon_sync.c
> @@ -79,6 +79,7 @@ void radeon_sync_fence(struct radeon_sync *sync,
>  /**
>   * radeon_sync_resv - use the semaphores to sync to a reservation object
>   *
> + * @rdev: radeon_device pointer
>   * @sync: sync object to add fences from reservation object to
>   * @resv: reservation object with embedded fence
>   * @shared: true if we should only sync to the exclusive fence
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
