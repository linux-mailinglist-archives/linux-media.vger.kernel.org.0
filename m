Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864E42C2BBD
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 16:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389906AbgKXPsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 10:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388538AbgKXPsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 10:48:54 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A69C0613D6;
        Tue, 24 Nov 2020 07:48:53 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 64so9387078wra.11;
        Tue, 24 Nov 2020 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YQEzzUsi3ECVy0o2bywn3sPnPcyWGDcKqLpYqiqy8k0=;
        b=dkuQovPHqgYmce+xjSlOvfhq/8tm/S7wmfsf45pnSCSDwQiLIkzbmZ56hywbMGm+MH
         fxlrqrTEUEzqyu1kJW4fqyewc3mGf99GkcNDkKe0UWcm6VGoMj1Lq1Bc6kRjUVUqrvVg
         7p0XZKRRVLw0u3uUo7jrdM7g2/+6J2oJnpVMxSBmiOnBEh3ZmghtDYFRC5JpwVkcff/n
         W8y8z/deyqJBnpFjobuBBemvIn7+Yx6n/09Y6fzctUws8SYbEzEoh7pRi97nvf3tBRcg
         IXAGaK4t9TTI3YHoFqUldMcuHN2gPt/Rx9IP2rmMOCvh1oOQYqoc42bI9H1XJxUXkyRd
         HxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YQEzzUsi3ECVy0o2bywn3sPnPcyWGDcKqLpYqiqy8k0=;
        b=j+OGlyzgNNwEJP1sMiRCE7kB5hnOc1b4hzs6Q6UmENJhQsieRbCOk/KHr9aeK9kke3
         KJnut9id6b1Ajnd6rFTS+PKfIquitH5y+zNP4KHQMgHWKhy/hiss/SLdVUlYs/WoSEF0
         X3Jq6n8yhkA+mwxBd7FPZTgMOV8fatyayegVIjBC7X8vHQPHuTbP3MaGwmk8xvr/Ux6E
         /fYUcdkHiv1GD3YQSwTJVflAeumNdBPwC8hARUiSTDkUJ+e5MORdmMShK8/P7ASaBi2Z
         qPtJQCnMMsvZV2iLHH6dtKX0kKu/n4vSQGvpBlomxirjfZ+riTC37/1fb1bpZeNuGFhk
         i65g==
X-Gm-Message-State: AOAM532pq1Wlk5F1yWZjPv3+jAaCJ2TDCGWoJmDp4v55sc2sAp0PiT90
        j8QT7tLQlT9Z3nZtkt2Ix56d923wg9PAENktc1M=
X-Google-Smtp-Source: ABdhPJwYgYr70cFFo0Y9krfbSn0C7YP63ewXVaD5K8+FsG7eicpQE/XYSITvz9BpjTRXjTOvgEAPxqqfmRX9vlrjQxU=
X-Received: by 2002:adf:8028:: with SMTP id 37mr6020956wrk.111.1606232932459;
 Tue, 24 Nov 2020 07:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org> <20201123111919.233376-3-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-3-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 24 Nov 2020 10:48:41 -0500
Message-ID: <CADnq5_PsVND-G1_z++kv+A9B0xOig5XHW0R2nQrb68kCAe1-yA@mail.gmail.com>
Subject: Re: [PATCH 02/40] drm/amd/amdgpu/amdgpu_ttm: Add description for 'page_flags'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
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
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1214: warning: Function paramete=
r or member 'page_flags' not described in 'amdgpu_ttm_tt_create'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Jerome Glisse <glisse@freedesktop.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 5fcdd67e5a913..debbcef961dd5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1199,6 +1199,7 @@ static void amdgpu_ttm_backend_destroy(struct ttm_b=
o_device *bdev,
>   * amdgpu_ttm_tt_create - Create a ttm_tt object for a given BO
>   *
>   * @bo: The buffer object to create a GTT ttm_tt object around
> + * @page_flags: Page flags to be added to the ttm_tt object
>   *
>   * Called by ttm_tt_create().
>   */
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
